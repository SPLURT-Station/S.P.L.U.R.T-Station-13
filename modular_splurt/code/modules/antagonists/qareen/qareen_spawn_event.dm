#define QAREEN_SPAWN_THRESHOLD 20

/datum/round_event_control/qareen
	name = "Spawn Qareen"
	typepath = /datum/round_event/ghost_role/qareen
	weight = 7
	max_occurrences = 1
	min_players = 5


/datum/round_event/ghost_role/qareen
	var/ignore_mobcheck = FALSE
	role_name = "qareen"

/datum/round_event/ghost_role/qareen/New(my_processing = TRUE, new_ignore_mobcheck = FALSE)
	..()
	ignore_mobcheck = new_ignore_mobcheck

/datum/round_event/ghost_role/qareen/spawn_role()
	if(!ignore_mobcheck)
		var/deadMobs = 0
		for(var/mob/M in GLOB.dead_mob_list)
			deadMobs++
		if(deadMobs < QAREEN_SPAWN_THRESHOLD)
			message_admins("Event attempted to spawn a qareen, but there were only [deadMobs]/[QAREEN_SPAWN_THRESHOLD] dead mobs.")
			return WAITING_FOR_SOMETHING

	var/list/candidates = get_candidates(ROLE_QAREEN, null, ROLE_QAREEN)
	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/observer/selected = pick_n_take(candidates)

	var/list/spawn_locs = list()

	for(var/mob/living/L in GLOB.dead_mob_list) //look for any dead bodies
		var/turf/T = get_turf(L)
		if(T && is_station_level(T.z))
			spawn_locs += T
	if(!spawn_locs.len || spawn_locs.len < 15) //look for any morgue trays, crematoriums, ect if there weren't alot of dead bodies on the station to pick from
		for(var/obj/structure/bodycontainer/bc in GLOB.bodycontainers)
			var/turf/T = get_turf(bc)
			if(T && is_station_level(T.z))
				spawn_locs += T
	if(!spawn_locs.len) //If we can't find any valid spawnpoints, try the carp spawns
		for(var/obj/effect/landmark/carpspawn/L in GLOB.landmarks_list)
			if(isturf(L.loc))
				spawn_locs += L.loc
	if(!spawn_locs.len) //If we can't find either, just spawn the qareen at the player's location
		spawn_locs += get_turf(selected)
	if(!spawn_locs.len) //If we can't find THAT, then just give up and cry
		return MAP_ERROR

	var/mob/living/simple_animal/qareen/qareenie = new(pick(spawn_locs))
	selected.transfer_ckey(qareenie, FALSE)
	message_admins("[ADMIN_LOOKUPFLW(qareenie)] has been made into a qareen by an event.")
	log_game("[key_name(qareenie)] was spawned as a qareen by an event.")
	spawned_mobs += qareenie
	return SUCCESSFUL_SPAWN
