/mob/living/Login()
	. = ..()

	// Check if mob is in SSD list
	if(src in GLOB.ssd_mob_list)
		// Remove from SSD list
		GLOB.ssd_mob_list -= src

		// Log mob SSD removal
		log_game("[src] was removed from the SSD list.")
