GLOBAL_VAR_INIT(cryo_next_admin_warning, 0) // The last time we told admins about a mapping / coding error because no cryo computer was found

/proc/cryo_find_control_computer(obj/machinery/cryopod/pod = null, urgent = FALSE)

	for(var/cryo_console as anything in GLOB.cryopod_computers)
		var/obj/machinery/computer/cryopod/console = cryo_console

		if(!pod) // No cryopod passed in, we will try to find the standard crew cryo computer instead.
			var/turf/console_turf = get_turf(console)
			if((console_turf.z == 2) && (!istype(get_area(console), /area/security/prison))) // If station Z-level and NOT the prison cryo computer. Should get the standard crew cryo computer.
				return WEAKREF(console)
		else
			if(get_area(console) == get_area(pod))
				return WEAKREF(console)

	// Don't send messages unless we *need* the computer, and less than five minutes have passed since last time we messaged
	if(urgent && (world.time > GLOB.cryo_next_admin_warning))
		log_admin("\The [pod] in [get_area(pod)] could not find control computer!")
		message_admins("\The [pod] in [get_area(pod)] could not find control computer!")
		GLOB.cryo_next_admin_warning = world.time + 5 MINUTES

/obj/machinery/cryopod/ghostrole
	var/refreshing = FALSE
	var/assignedrole
	var/spawner


/obj/machinery/cryopod/ghostrole/hotel
	assignedrole = "Hotel Staff"
	spawner = /obj/effect/mob_spawn/human/hotel_staff/splurt

/obj/machinery/cryopod/ghostrole/process()
	if(!occupant)
		return

	var/mob/living/mob_occupant = occupant
	if(mob_occupant.stat == DEAD)
		open_machine()

	if(!mob_occupant.client && COOLDOWN_FINISHED(src, despawn_world_time))
		if(!control_computer_weakref)
			control_computer_weakref = cryo_find_control_computer(src, urgent = TRUE)

		if(mob_occupant.mind)
			var/datum/mind/M = mob_occupant.mind
			if(M.assigned_role == assignedrole)
				refreshing = TRUE

		despawn_occupant()

		if(refreshing)
			qdel(src)


/obj/machinery/cryopod/ghostrole/Destroy()
	if(refreshing)
		var/obj/effect/mob_spawn/human/S = new spawner(drop_location())
		S.setDir(dir)
		return ..()
