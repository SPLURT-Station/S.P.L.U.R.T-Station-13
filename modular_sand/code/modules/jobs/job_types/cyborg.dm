/datum/job/cyborg/after_spawn(mob/living/silicon/robot/R, client/player_client, latejoin)
	. = ..()
	if(!istype(R))
		return

	setup_silicon_law_prefs(R, player_client)
