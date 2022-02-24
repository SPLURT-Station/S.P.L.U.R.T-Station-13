/// Timeclock terminal, ported from VOREStation
/obj/machinery/computer/timeclock
	name = "timeclock terminal"											// Name of the object
	icon = 'modular_splurt/icons/obj/machinery/timeclock.dmi'			// Spritesheet for the object's icon
	icon_state = "timeclock"											// Icon state from the spritesheet
	icon_keyboard = null												// Keyboard state because this is a computer and we need to tell it to not have a keyboard
	light_color = "#0099ff"						   						// TODO: Adjust this // Color for the light coming from the object
	light_power = 0.5													// Brightness of the light coming from the object
	layer = ABOVE_WINDOW_LAYER											// Layer for the object
	density = FALSE														// Density of the object, so we can walk through it
	circuit = /obj/item/circuitboard/computer/timeclock					// Circuitboard for the object in case it gets destroyed

	var/obj/item/card/id/card											// Inserted ID card

/// For when we create a new timeclock
/obj/machinery/computer/timeclock/New()
	..()																// Let's do this just to be safe.

// For when a timeclock is destroyed
/obj/machinery/computer/timeclock/Destroy()
	if (card)															// If we're holding an ID and get destroyed
		card.forceMove(get_turf(src))									// Get rid of the fucker
		card = null														// And make sure we know it's gone
	. = ..()															// Someone's gonna ask later, refer them here.
																		// This shit just sets our return value to our parent proc's return value.

// Determines what icon to used based on a couple factors
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
	if (!card)															// If we don't have a card
		return FALSE													// We can't check cooldown, fail the check
	var/time_left = 10 MINUTES - (world.time - card.last_job_switch)	// Determine how much time is left before the next switch
	if (time_left > 0)													// If there's any time left at all
		to_chat(usr, "You need to wait another [round((time_left / 10) / 60, 1)] minute\s before you can switch.")
		return FALSE													// Fail the check
	return TRUE															// Otherwise pass the check

/// Makes the active card on-duty with a set rank and assignment
/obj/machinery/computer/timeclock/proc/make_on_duty(var/new_rank, var/new_assignment)
	var/datum/job/old_job = \
			SSjob.GetJob(SSjob.get_job_name(card.assignment))			// Get their old job from the card
	var/datum/job/new_job = SSjob.GetJob(new_rank)						// And their new job from the rank

	if (!old_job \
			|| !is_open_onduty_job(usr, old_job.pto_type, new_job))		// If there's no old job or it's not an open and on-duty job
		return															// Do nothing
	if (new_assignment != new_job.title \
			&& !(new_assignment in new_job.alt_titles))					// If the new assignment isn't the new job's title or alt-title
		return															// Do nothing
	if (new_job)														// As long as there's a new job
		card.access = new_job.get_access()								// Set the card's access to the new job's access
		card.assignment = new_assignment								// And the card's assignment to the new assignment
		card.name = text(\
			"[card.registered_name]'s ID Card ([card.assignment])")		// And change the card's name
		GLOB.data_core.manifest_modify(card.registered_name, \
			card.assignment)											// Apply the changes to the crew manifest
		card.last_job_switch = world.time								// Set the last job switch on the card to the current world time
		new_job.current_positions++										// Add one to the current positions for the new job
		var/mob/living/carbon/human/H = usr								// Get the caller as a human data type
		H.mind.assigned_role = card.assignment							// Set the assigned role of the caller's mind to the assignment on the card
		if (GLOB.announcement_systems.len)								// If there are any announcement systems
			var/obj/machinery/announcement_system/announcer = \
				pick(GLOB.announcement_systems)							// Pick an announcer, any announcer!
			announcer.announce("ONDUTY", card.registered_name, \
				card.assignment, list())								// Make the announcement for now on-duty personnel

/// Makes the active card off-duty
/obj/machinery/computer/timeclock/proc/make_off_duty()
	var/datum/job/found_job = \
			SSjob.GetJob(SSjob.get_job_name(card.assignment))			// Get the current job from the inserted card
	if (!found_job)														// If the card somehow doesn't have a job
		return															// https://www.youtube.com/watch?v=2k0SmqbBIpQ
	var/new_dept = found_job.pto_type || PTO_CIVILIAN					// New department is either the department's PTO type or civilian PTO
	var/datum/job/pto_job = null										// Create a new PTO job
	for (var/datum/job/job in SSjob.occupations)						// For all jobs in the list of occupations
		if (job.pto_type == new_dept \
				&& job.timeoff_factor < 0)								// If the job is the department's PTO type and has a negative timeoff factor
			pto_job = job												// That's the new PTO job
			break														// And stop looking
	if (pto_job)														// If a PTO job was found
		// Apparently we aren't using this? I don't fucking know
		// var/old_title = card.assignment
		card.access = pto_job.get_access()								// Assign the PTO job's access to the ID
		card.assignment = pto_job.title									// And the PTO job's title to the ID
		card.name = text(\
			"[card.registered_name]'s ID Card ([card.assignment])")		// Set the card's new name
		GLOB.data_core.manifest_modify(card.registered_name, \
			card.assignment)											// And apply that change to the crew manifest
		card.last_job_switch = world.time								// Set the last job switch on the card to the world's current time
		var/mob/living/carbon/human/H = usr								// Get the caller as a human data type
		H.mind.assigned_role = pto_job.title							// Set their mind's assigned role to the PTO job's title
		found_job.current_positions--									// Remove one from the found job's position count since they no longer have that job
		if (GLOB.announcement_systems.len)								// If there are any announcement systems
			var/obj/machinery/announcement_system/announcer = \
				pick(GLOB.announcement_systems)							// Pick an announcement system, any announcement system!
			announcer.announce("OFFDUTY", card.registered_name, \
				card.assignment, list())								// Make an off-duty announcement with that system
	return																// I really don't know why this return exists we always return anyways lol

/// Check if a job is open and on-duty for a given user and department
/obj/machinery/computer/timeclock/proc/is_open_onduty_job(var/mob/user, var/department, var/datum/job/job)
	return job \
		   && job.current_positions <= job.total_positions \
		   && !jobban_isbanned(user, SSjob.get_job_name(job.title)) \
		   && job.player_old_enough(user.client) \
		   && job.pto_type == department \
		   && job.timeoff_factor > 0									// I feel like this requires some HEAVY explanation so here we go.
		   																// First we check if the job exists
																		// Then we check that there are enough open slots
																		// Then we check if the user is jobbanned or not and negate that because it'll return positive if they're banned
																		// Then we have to check that they have enough playtime to actually join as that job
																		// Then we have to check that the PTO type matches the department requested (can't join security with a PTO type of medical)
																		// Then we have to check that there's a timeoff value so you can actually accrue hours of PTO by playing as that role

/// Convert a department and job flag to an english phrase
/obj/machinery/computer/timeclock/proc/flags_to_english(var/department,var/flag)
	if (department == ENGSEC)											// If the department flag is engineering or security (or silicon apparently?)
		switch (flag)													// Switch based on the flag
			if (CAPTAIN, HOS, WARDEN, CHIEF)							// Captain, Head of Security, Warden or Chief Engineer
				return "Command"										// Are all command
			if (DETECTIVE, OFFICER)										// Detectives and Officers
				return "Security"										// Are all security
			if (BRIGDOC)												// Brig Docs
				return "Medsec"											// Are medical and science
			if (BLUESHIELD)												// Blueshield
				return "Blueshield"										// Are obviously blueshield. Dunno what you expected fam
			if (ENGINEER, ATMOSTECH)									// Engineers and Atmos Technicians
				return "Engineering"									// Are engineering
			if (ROBOTICIST)												// Roboticist is defined here but I think it was supposed to be with medsci? Just in case.
				return "Science"										// They're science
			else														// Technically this won't always be silicon
				return "Silicon"										// But we're listing your ass as silicon anyways. Cope.
	else if (department == MEDSCI)										// Otherwise, if the department flag is medical or science
		switch (flag)													// Switch based on the flag (again)
			if (RD_JF, CMO_JF)											// Research Director or Chief Medical Officer
				return "Command"										// Are both command
			if (SCIENTIST, ROBOTICIST)									// Scientists and Roboticists (this is where I think this was meant to be but it's still with ENGSEC just in case)
				return "Science"										// Are obviously science
			if (CHEMIST, DOCTOR, VIROLOGIST, PARAMEDIC)					// Chemists, Doctors, Virologists and Paramedics
				return "Medical"										// Are medical
			if (GENETICIST)												// Geneticists
				return "Medsci"											// Are kind of a special, middle of the road medical and science case
			else														// If you're landing here you're fucked
				return "What the fuck?"									// So what the fuck?
	else if (department == CIVILIAN)									// Otherwise you must be civilian, right? Right???
		switch (flag)													// Once again a switch based on the flag
			if (HOP, QUARTERMASTER)										// Head of Personnel and Quartermaster
				return "Command"										// Are command
			if (PRISONER)												// Prisoners
				return "Prisoner"										// Are... prisoners? They shouldn't be able to PTO but if they manage to break out they can access a console so no fuck you here
			if (CARGOTECH, MINER)										// Cargo Technicians and Miners
				return "Cargo"											// Are cargonians
			else														// Otherwise
				return "Civilian"										// You must be a civilian. You could be an assisstant or a clown or a bartender, I don't really care.
	else																// New department combo? Wack.
		return "What the fuck?"											// what the fuck?
