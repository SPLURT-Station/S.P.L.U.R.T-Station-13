/mob/living/Logout()
	. = ..()

	// Check for BORIS AI borgs
	if(src in GLOB.available_ai_shells)
		return

	// Check for the AI
	if(isAI(src))
		return

	// Check for VR mob
	if(src.GetComponent(/datum/component/virtual_reality))
		return

	// Check if mob is in a VR pod
	// This is not an ideal solution
	if(istype(src.loc, /obj/machinery/vr_sleeper))
		return

	// Add to SSD list
	GLOB.ssd_mob_list |= src

	// Log mob SSD status
	log_game("[src] was added to the SSD list.")
