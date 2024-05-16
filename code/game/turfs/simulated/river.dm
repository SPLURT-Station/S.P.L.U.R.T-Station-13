#define RANDOM_UPPER_X 200
#define RANDOM_UPPER_Y 200

#define RANDOM_LOWER_X 50
#define RANDOM_LOWER_Y 50

#define RIVERGEN_SAFETY_LOCK 1000000

/proc/spawn_rivers(target_z, nodes = 4, turf_type = /turf/open/lava/smooth/lava_land_surface, whitelist_area = /area/lavaland/surface/outdoors/unexplored, min_x = RANDOM_LOWER_X, min_y = RANDOM_LOWER_Y, max_x = RANDOM_UPPER_X, max_y = RANDOM_UPPER_Y, new_baseturfs)
	var/list/river_nodes = list()
	var/num_spawned = 0
	var/list/possible_locs = block(locate(min_x, min_y, target_z), locate(max_x, max_y, target_z))
	var/safety = 0
	while(num_spawned < nodes && possible_locs.len && (safety++ < RIVERGEN_SAFETY_LOCK))
		var/turf/T = pick(possible_locs)
		var/area/A = get_area(T)
		if(!istype(A, whitelist_area) || (T.flags_1 & NO_LAVA_GEN_1))
			possible_locs -= T
		else
			river_nodes += new /obj/effect/landmark/river_waypoint(T)
			num_spawned++

	safety = 0
	//make some randomly pathing rivers
	for(var/A in river_nodes)
		var/obj/effect/landmark/river_waypoint/W = A
		if (W.z != target_z || W.connected)
			continue
		W.connected = 1
		var/turf/cur_turf = get_turf(W)
		cur_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_IGNORE_AIR)
		var/turf/target_turf = get_turf(pick(river_nodes - W))
		if(!target_turf)
			break
		var/detouring = 0
		var/cur_dir = get_dir(cur_turf, target_turf)
		while(cur_turf != target_turf && (safety++ < RIVERGEN_SAFETY_LOCK))

			if(detouring) //randomly snake around a bit
				if(prob(20))
					detouring = 0
					cur_dir = get_dir(cur_turf, target_turf)
			else if(prob(20))
				detouring = 1
				if(prob(50))
					cur_dir = turn(cur_dir, 45)
				else
					cur_dir = turn(cur_dir, -45)
			else
				cur_dir = get_dir(cur_turf, target_turf)

			cur_turf = get_step(cur_turf, cur_dir)
			var/area/new_area = get_area(cur_turf)
			if(!istype(new_area, whitelist_area) || (cur_turf.flags_1 & NO_LAVA_GEN_1)) //Rivers will skip ruins
				detouring = 0
				cur_dir = get_dir(cur_turf, target_turf)
				cur_turf = get_step(cur_turf, cur_dir)
				continue
			else
				var/turf/river_turf = cur_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_IGNORE_AIR)
				river_turf.Spread(25, 11, whitelist_area)

	for(var/WP in river_nodes)
		qdel(WP)


/obj/effect/landmark/river_waypoint
	name = "river waypoint"
	var/connected = 0
	invisibility = INVISIBILITY_ABSTRACT


/turf/proc/Spread(probability = 30, prob_loss = 25, whitelisted_area)
	if(probability <= 0)
		return
	var/logged_turf_type
	for(var/turf/T in orange(1, src))
		var/area/new_area = get_area(T)
		if((T.density && !ismineralturf(T)) || istype(T, /turf/open/indestructible) || (whitelisted_area && !istype(new_area, whitelisted_area)) || (T.flags_1 & NO_LAVA_GEN_1) )
			continue

		if(!logged_turf_type && ismineralturf(T))
			var/turf/closed/mineral/M = T
			logged_turf_type = M.turf_type

	for(var/turf/T in orange(1, src))
		var/area/new_area = get_area(T)
		if((T.density && !ismineralturf(T)) || istype(T, /turf/open/indestructible) || (whitelisted_area && !istype(new_area, whitelisted_area)) || (T.flags_1 & NO_LAVA_GEN_1) )
			continue
		var/opponent_dir = get_dir(src, T) // Use some clever bitmath to check if the direction is diagonal.
		if(opponent_dir & (opponent_dir - 1)) //diagonal turfs only sometimes change, but will always spread if changed
			// NOTE: WE ARE SKIPPING CHANGETURF HERE
			// The calls in this proc only serve to provide a satisfactory (if it's not ALREADY this) check. They do not actually call changeturf
			// This is safe because this proc can only be run during mapload, and nothing has initialized by now so there's nothing to inherit or delete
			if(!istype(T, logged_turf_type) && !istype(T, type) && prob(probability) && T.ChangeTurf(type, baseturfs, CHANGETURF_SKIP))
				T.Spread(probability - prob_loss, prob_loss, whitelisted_area)
			else if(ismineralturf(T))
				var/turf/closed/mineral/M = T
				// SEE ABOVE, THIS IS ONLY VERY RARELY SAFE
				M.ChangeTurf(M.turf_type, M.baseturfs, CHANGETURF_SKIP)
		else //cardinal turfs are always changed but don't always spread
			// Important NOTE: SEE ABOVE
			if(!istype(T, logged_turf_type) && !istype(T, type) && T.ChangeTurf(type, baseturfs, CHANGETURF_SKIP) && prob(probability))
				T.Spread(probability - prob_loss, prob_loss, whitelisted_area)


#undef RANDOM_UPPER_X
#undef RANDOM_UPPER_Y

#undef RANDOM_LOWER_X
#undef RANDOM_LOWER_Y
