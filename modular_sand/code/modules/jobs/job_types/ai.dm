/datum/job/ai/after_spawn(mob/living/silicon/ai/AI, client/player_client, latejoin)
	. = ..()
	if(!istype(AI))
		return

	setup_silicon_law_prefs(AI, player_client)
