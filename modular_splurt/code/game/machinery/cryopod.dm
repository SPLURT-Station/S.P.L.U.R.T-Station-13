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
	var/spawner

/obj/machinery/cryopod/ghostrole/Destroy()
		var/obj/effect/mob_spawn/human/cryocapable/S = new spawner(drop_location())
		S.setDir(dir)
		return ..()

/obj/machinery/cryopod/ghostrole/hotel
	respawn_ghostrole = "Hotel Staff"
	spawner = /obj/effect/mob_spawn/human/cryocapable/hotel

/obj/machinery/cryopod/ghostrole/hotel/security
	respawn_ghostrole = "Hotel Staff"
	spawner = /obj/effect/mob_spawn/human/cryocapable/hotel/security

/obj/machinery/cryopod/ghostrole/hotel/manager
	respawn_ghostrole = "Hotel Manager"
	spawner = /obj/effect/mob_spawn/human/cryocapable/hotel/manager

/obj/machinery/cryopod/ghostrole/lavaland_syndicate
	respawn_ghostrole = "Lavaland Syndicate"
	spawner = /obj/effect/mob_spawn/human/cryocapable/lavaland_syndicate

/obj/machinery/cryopod/ghostrole/lavaland_syndicate/comms
	respawn_ghostrole = "Space Syndicate"
	spawner = /obj/effect/mob_spawn/human/cryocapable/lavaland_syndicate/comms
