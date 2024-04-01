/mob/living/Logout()
	. = ..()

	// Check for BORIS AI borgs
	if(src in GLOB.available_ai_shells)
		// Log event and return
		log_game("[src] ignored auto-cryo by being: An AI shell.")
		return

	// Check for the AI
	if(isAI(src))
		// Log event and return
		log_game("[src] ignored auto-cryo by being: The AI.")
		return

	// Check if dead
	if(stat == DEAD)
		// Log event and return
		log_game("[src] ignored auto-cryo by being: Dead.")
		return

	// Check for VR mob
	if(src.GetComponent(/datum/component/virtual_reality))
		// Log event and return
		log_game("[src] ignored auto-cryo by being: A VR avatar.")
		return

	// Check if mob is in a VR pod
	// This is not an ideal solution
	if(istype(src.loc, /obj/machinery/vr_sleeper))
		// Log event and return
		log_game("[src] ignored auto-cryo by being: In a VR sleeper.")
		return

	// Avoid adding deleted mobs to the list
	if(!QDELETED(src))
		// Add to SSD list
		GLOB.ssd_mob_list |= src

	// Log mob SSD status
	log_game("[src] was added to the SSD list.")
