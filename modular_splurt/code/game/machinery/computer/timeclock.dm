/**
 * Time Clock Terminal
 *
 * Ported from VOREStation
 */

/**
 * The terminal itself
 */
/obj/machinery/computer/timeclock
	name = "timeclock terminal"
	// Temporarily has no icon or icon state
	// icon = 'icons/obj/machines/timeclock.dmi'
	// icon_state = "timeclock"
	// icon_keyboard = null
	light_color = "#0099ff"						   // TODO: Adjust this
	light_power = 0.5
	layer = ABOVE_WINDOW_LAYER
	density = FALSE
	// circuit = /obj/item/weapon/circuitboard/timeclock	// TODO: Actually make this

	var/obj/item/card/id/card							// Inserted ID card

/obj/machinery/computer/timeclock/New()
	..()	// Let's do this just to be safe.

/obj/machinery/computer/timeclock/Destroy()
	if (card)							// If we're holding an ID and get destroyed
		card.forceMove(get_turf(src))	// Get rid of the fucker
		card = null						// And make sure we know it's gone
	. = ..()

/obj/machinery/computer/timeclock/update_icon()
	if (!process())
		icon_state = "[initial(icon_state)]_off"
	else if (card)
		icon_state = "[initial(icon_state)]_card"
	else
		icon_state = "[initial(icon_state)]"

/obj/machinery/computer/timeclock/power_change()
	var/old_stat = stat
	..()
	if (old_stat != stat)
		update_icon()
	if (stat & NOPOWER)
		set_light(0)
	else
		set_light(brightness_on)

/obj/machinery/computer/timeclock/attackby(obj/I, mob/user)
	if (istype(I, /obj/item/card/id))
		if (!card && user.canUnEquip(I))
			I.forceMove(src)
			card = I
			SStgui.update_uis(src)
			update_icon()
		else if (card)
			to_chat(user, "<span class='warning'>There is already an ID card inside.</span>")
		return
	. = ..()

/obj/machinery/computer/timeclock/attack_hand(var/mob/user as mob)
	if (..())
		return
	user.set_machine(src)
	ui_interact(user)

/obj/machinery/computer/timeclock/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "TimeClock", name)
		ui.open()

/obj/machinery/computer/timeclock/ui_data(mob/user)
	var/list/data = ..()

	// Data for showing user's own PTO
	if (user.client)
		data["department_hours"] = SANITIZE_LIST(user.client.department_hours)
	data["user_name"] = "[user]"

	// Data about the card we put into the timeclock
	data["card"]			 = null
	data["assignment"]		 = null
	data["job_datum"] 		 = null
	data["allow_change_job"] = null
	data["job_choices"]		 = null
	if (card)
		if (card)
			data["card"]		 = "[card]"
			data["assignment"]	 = card.assignment
			var/datum/job/job = SSjob.GetJob(SSjob.get_job_name(card.assignment))
			if (job)
				data["job_datum"] = list(
					"title" = job.title,
					"departments" = flags_to_english(job.department_flag, job.flag),
					"selection_color" = job.selection_color,
					"timeoff_factor" = job.timeoff_factor,
					"pto_department" = job.pto_type
				)
			if (CONFIG_GET(flag/time_off) && CONFIG_GET(flag/pto_job_change))
				data["allow_change_job"] = TRUE
				if (job && job.timeoff_factor < 0)	// They're off duty so we have to lookup available jobs
					data["job_choices"] = get_open_onduty_jobs(user, job.pto_type)

	return data

/obj/machinery/computer/timeclock/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if (..())
		return TRUE

	add_fingerprint(usr)

	switch (action)
		if ("id")
			if (card)
				usr.put_in_hands(card)
				card = null
			else
				var/obj/item/I = usr.get_active_hand()
				if (istype(I, /obj/item/card/id) && usr.canUnEquip(I))
					I.forceMove(src)
					card = I
			update_icon()
			return TRUE
		if ("switch-to-onduty-rank")
			if (check_face())
				if (check_card_cooldown())
					make_on_duty(params["switch-to-onduty-rank"], params["switch-to-onduty-assignment"])
					usr.put_in_hands(card)
					card = null
			update_icon()
			return TRUE
		if ("switch-to-offduty")
			if (check_face())
				if (check_card_cooldown())
					make_off_duty()
					usr.put_in_hands(card)
					card = null
			update_icon()
			return TRUE

/obj/machinery/computer/timeclock/proc/get_open_onduty_jobs(var/mob/user, var/department)
	var/list/available_jobs = list()
	for (var/datum/job/job in SSjob.occupations)
		if (is_open_onduty_job(user, department, job))
			available_jobs[job.title] = list(job.title)
			if (job.alt_titles)
				for (var/alt_job in job.alt_titles)
					if (alt_job != job.title)
						available_jobs[job.title] += alt_job
	return available_jobs



/**
 * HELPER FOR DEPARTMENT FLAGS
 */
/obj/machinery/computer/timeclock/proc/flags_to_english(var/department,var/flag)
	switch (department)
		if (ENGSEC)
			switch (flag)
				if (CAPTAIN | HOS | WARDEN | CHIEF)
					return "Command"
				if (DETECTIVE | OFFICER)
					return "Security"
				if (BRIGDOC)
					return "Medsec"
				if (BLUESHIELD)
					return "Blueshield"
				if (ENGINEER | ATMOSTECH)
					return "Engineering"
				if (ROBOTICIST)
					return "Science"
				else					// Technically this won't always be silicon
					return "Silicon"	//  but we're listing your ass as silicon anyways. Cope.
		if (MEDSCI)
			switch (flag)
				if (RD_JF | CMO_JF)
					return "Command"
				if (SCIENTIST)
					return "Science"
				if (CHEMIST | DOCTOR | VIROLOGIST | PARAMEDIC)
					return "Medical"
				if (GENETICIST)
					return "Medsci"
				else							// If you're landing here you're fucked
					return "What the fuck?"
		if (CIVILIAN)
			switch (flag)
				if (HOP)
					return "Command"
				if (PRISONER)
					return "Prisoner"
				if (CARGOTECH | QUARTERMASTER | MINER)
					return "Cargo"
				else
					return "Civilian"
		else									// New department combo? Wack.
			return "What the fuck?"
