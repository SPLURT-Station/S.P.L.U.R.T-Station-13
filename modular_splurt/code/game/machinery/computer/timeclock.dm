/// Timeclock terminal, ported from VOREStation
/obj/machinery/computer/timeclock
	name = "timeclock terminal"
	icon = 'modular_splurt/icons/obj/machinery/timeclock.dmi'
	icon_state = "timeclock"
	icon_keyboard = null
	light_color = "#0099ff"						   						// TODO: Adjust this
	light_power = 0.5
	layer = ABOVE_WINDOW_LAYER
	density = FALSE
	circuit = /obj/item/weapon/circuitboard/timeclock

	var/obj/item/card/id/card											// Inserted ID card

/obj/machinery/computer/timeclock/New()
	..()																// Let's do this just to be safe.

/obj/machinery/computer/timeclock/Destroy()
	if (card)															// If we're holding an ID and get destroyed
		card.forceMove(get_turf(src))									// Get rid of the fucker
		card = null														// And make sure we know it's gone
	. = ..()															// Someone's gonna ask later, refer them here.
																		// This shit just sets our return value to our parent proc's return value.

/obj/machinery/computer/timeclock/update_icon()
	if (!process())														// If we can't process
		icon_state = "[initial(icon_state)]_off"						// we must be offline.
	else if (card)														// If we have an ID
		icon_state = "[initial(icon_state)]_card"						// display it!
	else																// All else fails?
		icon_state = "[initial(icon_state)]"							// We're just a clock.

/// Allows the timeclock to update its icon and lighting on power change, should power go out
/obj/machinery/computer/timeclock/power_change()
	var/old_stat = stat													// Save our old stats for later
	..()																// Call the parent proc to handle the actual powernet shit
	if (old_stat != stat)												// If our stat changed
		update_icon()													// update our icon
	if (stat & NOPOWER)													// If we no longer have power
		set_light(0)													// turn off our lights
	else																// Otherwise
		set_light(brightness_on)										// turn on our lights

/// Handle clicking with an object
/obj/machinery/computer/timeclock/attackby(obj/I, mob/user)
	if (istype(I, /obj/item/card/id))									// If the user clicked with an ID in hand
		if (!card && user.canUnEquip(I))								// Check if we already have an ID and that the user can drop the ID
			I.forceMove(src)											// Move the ID into our own location
			card = I													// Set our card to the ID
			SStgui.update_uis(src)										// Update all open UIs for us
			update_icon()												// Update our icon to reflect the new ID
		else if (card)													// There must've already been an ID inserted
			to_chat(user, "<span class='warning'>There is already an ID card inside.</span>")
		return															// Quit doing shit so we don't hit the timeclock
	. = ..()															// Set our return value to that of the parent proc

/// Handle user clicking
/obj/machinery/computer/timeclock/attack_hand(var/mob/user as mob)
	if (..())															// If for some reason the parent proc returns true
		return															// We won't do anything
	user.set_machine(src)												// Otherwise, set the mob's machine to us
	ui_interact(user)													// Provide a UI to the user

/// Handle UI interactions with this arcane shit known as tee gee yew eye
/obj/machinery/computer/timeclock/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)							// Attempt to update the UI
	if (!ui)															// If the UI doesn't exist
		ui = new(user, src, "TimeClock", name)							// Make a new one
		ui.open()														// And open it for the user

/// Handle UI data
/obj/machinery/computer/timeclock/ui_data(mob/user)
	var/list/data = ..()												// Call the parent object's data proc and assign that to the data list

	// Data for showing user's own PTO
	if (user.client)													// If the client exists
		data["department_hours"] = \
			SANITIZE_LIST(user.client.department_hours)					// Add the department hours list into data
	data["user_name"] = "[user]"										// Set the username to the user

	// Data about the card we put into the timeclock
	data["card"]			 = null										// Add card data,
	data["assignment"]		 = null										// Assignment data,
	data["job_datum"] 		 = null										// The job datum,
	data["allow_change_job"] = null										// Whether or not we can change jobs,
	data["job_choices"]		 = null										// And the possible jobs
	if (card)															// If we have a card
		data["card"]		 = "[card]"									// Set card data,
		data["assignment"]	 = card.assignment							// Assignment data,
		var/datum/job/job = \
			SSjob.GetJob(SSjob.get_job_name(card.assignment))			// Create a new job datum,
		if (job)														// If the job exists
			data["job_datum"] = list(									// Set job datum to a list with
				"title" = job.title,									// The job title,
				"departments" = \
					flags_to_english(job.department_flag, job.flag),	// The job department,
				"selection_color" = job.selection_color,				// The selection color,
				"timeoff_factor" = job.timeoff_factor,					// The timeoff factor,
				"pto_department" = job.pto_type							// And the PTO type
			)
		if (CONFIG_GET(flag/time_off) \
			&& CONFIG_GET(flag/pto_job_change))							// If we allow timeoff and job changing
			data["allow_change_job"] = TRUE								// Add that to the data
			if (job && job.timeoff_factor < 0)							// They're off duty so we have to lookup available jobs
				data["job_choices"] = \
					get_open_on_duty_jobs(user, job.pto_type)			// Set the job choices

	return data															// Give back the data list for subprocs

/// The user interacted with me? owo!
/obj/machinery/computer/timeclock/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if (..())															// Check if the parent UI had anything to say
		return TRUE														// If so, we don't care to do anything

	add_fingerprint(usr)												// Add the user's fingerprint to the list so sec can find them

	switch (action)														// Check the action completed
		if ("id")														// If the ID slot was clicked
			if (card)													// Check if we have an ID already
				usr.put_in_hands(card)									// If so, give the user the card
				card = null												// And make sure we don't have it
			else														// Otherwise
				var/obj/item/I = usr.get_active_hand()					// Get the item in their active hand
				if (istype(I, /obj/item/card/id) && usr.canUnEquip(I))	// Check if it's an ID and they can unequip the ID
					I.forceMove(src)									// If so, move it into us
					card = I											// And make sure we know we have it
			update_icon()												// Update our icon too because we did something
			return TRUE													// And stop handling any UI in this run
		if ("switch-to-on-duty-rank")									// If they switched to on-duty
			if (check_face())											// Check that their face is visible
				if (check_card_cooldown())								// And their card isn't on cooldown
					make_on_duty(params["switch-to-on-duty-rank"], \
						params["switch-to-on-duty-assignment"])			// Finally make them on-duty with the requested rank+assignment
					usr.put_in_hands(card)								// Give them their new card
					card = null											// And get it out of us
			update_icon()												// Update our icon in case the card was removed
			return TRUE													// And stop handling UI in this run
		if ("switch-to-off-duty")										// If they switched to off-duty
			if (check_face())											// Check that their face is visible
				if (check_card_cooldown())								// And that their card isn't on cooldown
					make_off_duty()										// Finally make them off-duty
					usr.put_in_hands(card)								// Shit out their ID into their hand
					card = null											// And get rid of that card
			update_icon()												// Update our icon in case the card was removed
			return TRUE													// And stop handling any UI in this run

/// Gets the open on-duty jobs available to a user in a specified department
/obj/machinery/computer/timeclock/proc/get_open_on_duty_jobs(var/mob/user, var/department)
	var/list/available_jobs = list()									// Make a list of available jobs
	for (var/datum/job/job in SSjob.occupations)						// For all jobs in existing occupations
		if (is_open_onduty_job(user, department, job))					// Check if the job is open and on-duty for a user and given department
			available_jobs[job.title] = list(job.title)					// If it is, add it to the list of available jobs
			if (job.alt_titles)											// If the job has alt-titles (Like Station Engineer->Mechanic)
				for (var/alt_job in job.alt_titles)						// Go through all the alt titles
					if (alt_job != job.title)							// And if it isn't the current job's title (Station Engineer's alt title of Station Engineer)
						available_jobs[job.title] += alt_job			// Add it to the list under that job title
	return available_jobs												// Return the newly-filled list of available jobs

/// How does xenobio work again? Oh right, we're checking the user's face here to allow access and prevent ne'er-do-wells from using someone's PTO
/obj/machinery/computer/timeclock/proc/check_face()
	if (!card)															// If no card is inserted (why are we checking their face?)
		to_chat(usr, "<span class='notice'>No ID is inserted.</span>")
		return FALSE													// Face check failed
	var/mob/living/carbon/human/H = usr									// Get the usr as a human data type
	if (!(istype(H)))													// If they somehow aren't a human??
		to_chat(usr, "<span class='warning'>Invalid user detected. Access denied.</span>")
		return FALSE													// Face check failed
	else if ((H.wear_mask && (H.wear_mask.flags_inv & HIDEFACE)) \
			|| (H.head && (H.head.flags_inv & HIDEFACE)))				// No, you can't hide your face
		to_chat(usr, "<span class='warning'>Facial recognition scan failed due to physical obstruction. Access denied.</span>")
		return FALSE													// Face check failed
	else if (H.get_face_name() == "Unknown" \
			|| !(H.real_name == card.registered_name))					// If they're unknown or their real name isn't the name on the ID
		to_chat(usr, "<span class='warning'>Facial recognition scan failed. Access denied.</span>")
		return FALSE													// Face check failed
	else																// Otherwise
		return TRUE														// Face check success!

/// Force users to wait 10 minutes between clocking in and out
/obj/machinery/computer/timeclock/proc/check_card_cooldown()
	if (!card)
		return FALSE
	var/time_left = 10 MINUTES - (world.time - card.last_job_switch)
	if (time_left > 0)
		to_chat(usr, "You need to wait another [round((time_left / 10) / 60, 1)] minute\s before you can switch.")
		return FALSE
	return TRUE

/obj/machinery/computer/timeclock/proc/make_on_duty(var/new_rank, var/new_assignment)
	var/datum/job/old_job = SSjob.GetJob(SSjob.get_job_name(card.assignment))
	var/datum/job/new_job = SSjob.GetJob(new_rank)

	if (!old_job || !is_open_onduty_job(usr, old_job.pto_type, new_job))
		return
	if (new_assignment != new_job.title && !(new_assignment in new_job.alt_titles))
		return
	if (new_job)
		card.access = new_job.get_access()
		card.assignment = new_assignment
		card.name = text("[card.registered_name]'s ID Card ([card.assignment])")
		GLOB.data_core.manifest_modify(card.registered_name, card.assignment)
		card.last_job_switch = world.time
		new_job.current_positions++
		var/mob/living/carbon/human/H = usr
		H.mind.assigned_role = card.assignment
		if (GLOB.announcement_systems.len)
			var/obj/machinery/announcement_system/announcer = pick(GLOB.announcement_systems)
			announcer.announce("ONDUTY", card.registered_name, card.assignment, list())

/obj/machinery/computer/timeclock/proc/make_off_duty()
	var/datum/job/found_job = SSjob.GetJob(SSjob.get_job_name(card.assignment))
	if (!found_job)
		return
	var/new_dept = found_job.pto_type || PTO_CIVILIAN
	var/datum/job/pto_job = null
	for (var/datum/job/job in SSjob.occupations)
		if (job.pto_type == new_dept && job.timeoff_factor < 0)
			pto_job = job
			break
	if (pto_job)
		// Apparently we aren't using this? I don't fucking know
		// var/old_title = card.assignment
		card.access = pto_job.get_access()
		card.assignment = pto_job.title
		card.name = text("[card.registered_name]'s ID Card ([card.assignment])")
		GLOB.data_core.manifest_modify(card.registered_name, card.assignment)
		card.last_job_switch = world.time
		var/mob/living/carbon/human/H = usr
		H.mind.assigned_role = pto_job.title
		found_job.current_positions--
		if (GLOB.announcement_systems.len)
			var/obj/machinery/announcement_system/announcer = pick(GLOB.announcement_systems)
			announcer.announce("OFFDUTY", card.registered_name, card.assignment, list())
	return

/obj/machinery/computer/timeclock/proc/is_open_onduty_job(var/mob/user, var/department, var/datum/job/job)
	return job \
		   && job.current_positions <= job.total_positions \
		   && !jobban_isbanned(user, SSjob.get_job_name(job.title)) \
		   && job.player_old_enough(user.client) \
		   && job.pto_type == department \
		   && job.timeoff_factor > 0

/**
 * HELPER FOR DEPARTMENT FLAGS
 */
/obj/machinery/computer/timeclock/proc/flags_to_english(var/department,var/flag)
	if (department == ENGSEC)
		switch (flag)
			if (CAPTAIN, HOS, WARDEN, CHIEF)
				return "Command"
			if (DETECTIVE, OFFICER)
				return "Security"
			if (BRIGDOC)
				return "Medsec"
			if (BLUESHIELD)
				return "Blueshield"
			if (ENGINEER, ATMOSTECH)
				return "Engineering"
			if (ROBOTICIST)
				return "Science"
			else					// Technically this won't always be silicon
				return "Silicon"	//  but we're listing your ass as silicon anyways. Cope.
	else if (department == MEDSCI)
		switch (flag)
			if (RD_JF, CMO_JF)
				return "Command"
			if (SCIENTIST, ROBOTICIST)
				return "Science"
			if (CHEMIST, DOCTOR, VIROLOGIST, PARAMEDIC)
				return "Medical"
			if (GENETICIST)
				return "Medsci"
			else							// If you're landing here you're fucked
				return "What the fuck?"
	else if (department == CIVILIAN)
		switch (flag)
			if (HOP, QUARTERMASTER)
				return "Command"
			if (PRISONER)
				return "Prisoner"
			if (CARGOTECH, MINER)
				return "Cargo"
			else
				return "Civilian"
	else									// New department combo? Wack.
		return "What the fuck?"
