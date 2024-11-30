/datum/job/ai/after_spawn(mob/living/silicon/ai/AI, client/player_client, latejoin)
	. = ..()
	setup_silicon_law_prefs(AI, player_client)

	if(latejoin)
		return

	var/free_shells = CONFIG_GET(number/roundstart_ai_shells)
	if(!free_shells)
		return

	var/turf/open/turf = locate() in RANGE_TURFS(1, AI)

	// Why the fuck is the station AI completely blocked
	var/turf/where = turf || get_turf(AI)

	// Creating AI shells for the AI.
	for(var/iteration in 1 to free_shells)
		var/mob/living/silicon/robot/free_borg = new(where)
		free_borg.shell = TRUE
		free_borg.TryConnectToAI(AI)
