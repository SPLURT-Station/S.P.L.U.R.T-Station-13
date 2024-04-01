
#define RANDOM_UPPER_X 220
#define RANDOM_UPPER_Y 220

#define RANDOM_LOWER_X 40
#define RANDOM_LOWER_Y 40

/proc/spawn_river_like_gen(target_z, nodes = 4, turf_type = /turf/open/water/lavaland_jungle, whitelist_area = /area/lavaland/surface/outdoors, min_x = RANDOM_LOWER_X, min_y = RANDOM_LOWER_Y, max_x = RANDOM_UPPER_X, max_y = RANDOM_UPPER_Y, new_baseturfs)
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
		cur_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_SKIP) // HEY! Don't use CHANGETURF_SKIP unless you're SURE it can only ever run prior to turf init!
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
				var/turf/river_turf = cur_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_SKIP) // HEY! Don't use CHANGETURF_SKIP unless you're SURE it can only ever run prior to turf init!
				river_turf.Spread(30, 11, whitelist_area)

	for(var/WP in river_nodes)
		qdel(WP)

/proc/spawn_patch_like_gen(target_z, turf_type = /turf/open/floor/plating/smooth/grass/lavaland_jungle, whitelist_area = /area/lavaland/surface/outdoors, min_x = RANDOM_LOWER_X, min_y = RANDOM_LOWER_Y, max_x = RANDOM_UPPER_X, max_y = RANDOM_UPPER_Y, new_baseturfs, required_distance = 0.4, min_radius = 3, max_radius = 5)
	var/list/affected = list()
	var/turf/cur_turf
	var/turf/target_turf
	var/passed = FALSE
	var/safety = 0
	var/x_len = (max_x - min_x)
	var/y_len = (max_y - min_y)
	var/reqdist = sqrt((x_len*x_len)+(y_len*y_len)) * required_distance
	while(passed == FALSE && (safety++ < RIVERGEN_SAFETY_LOCK))
		var/turf/T1 = locate(rand(min_x,max_x), rand(min_y,max_y), target_z)
		var/turf/T2 = locate(rand(min_x,max_x), rand(min_y,max_y), target_z)
		if(T1 && T2)
			x_len = abs(abs(T1.x) - abs(T2.x))
			y_len = abs(abs(T1.y) - abs(T2.y))
			var/gotdist = sqrt((x_len*x_len)+(y_len*y_len))
			if (gotdist>reqdist)
				cur_turf = T1
				target_turf = T2
				passed = TRUE

	if(passed)
		var/detouring = 0
		var/cur_dir = get_dir(cur_turf, target_turf)
		while(cur_turf != target_turf && (safety++ < RIVERGEN_SAFETY_LOCK))
			if(detouring) //randomly snake around a bit
				if(prob(20))
					detouring = 0
			else if(prob(20))
				detouring = 1
				if(prob(50))
					cur_dir = turn(cur_dir, 45)
				else
					cur_dir = turn(cur_dir, -45)

			if(!detouring)
				cur_dir = get_dir(cur_turf, target_turf)
			cur_turf = get_step(cur_turf, cur_dir)

			var/radius = rand(min_radius,max_radius)

			if(prob(15)) //15% for an accurate circular sweep
				for(var/turf/T in range(radius, cur_turf))
					var/dx = T.x - cur_turf.x
					var/dy = T.y - cur_turf.y
					var/Trange = sqrt((dx*dx)+(dy*dy))
					if(Trange <= radius + 0.5)
						var/circ_area = get_area(T)
						if(istype(circ_area, whitelist_area))
							T.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_SKIP) // HEY! Don't use CHANGETURF_SKIP unless you're SURE it can only ever run prior to turf init!
							affected |= T
							if(Trange > radius - 1)
								T.Spread(21, 11, whitelist_area)
			else
				var/list/directions = list()
				directions += turn(cur_dir, 90)
				directions += turn(cur_dir, -90)
				for(var/dir in directions)
					var/turf/dir_turf = cur_turf

					for(var/i in 1 to radius)
						dir_turf = get_step(dir_turf, dir)
						var/dir_area = get_area(dir_turf)
						if(istype(dir_area, whitelist_area))
							dir_turf = dir_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_SKIP) // HEY! Don't use CHANGETURF_SKIP unless you're SURE it can only ever run prior to turf init!
							affected |= dir_turf
							if(i == radius)
								dir_turf.Spread(21, 11, whitelist_area)
						//Fixes to diagional checker board
						if(dir & (dir-1))
							var/turf/diag_turf = locate(dir_turf.x,(dir_turf.y-1),target_z)
							var/diag_area = get_area(diag_turf)
							if(istype(diag_area, whitelist_area))
								diag_turf = diag_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_SKIP) // HEY! Don't use CHANGETURF_SKIP unless you're SURE it can only ever run prior to turf init!
								affected |= diag_turf

			var/area/new_area = get_area(cur_turf)
			if(istype(new_area, whitelist_area))
				cur_turf.ChangeTurf(turf_type, new_baseturfs, CHANGETURF_SKIP) // HEY! Don't use CHANGETURF_SKIP unless you're SURE it can only ever run prior to turf init!
				affected |= cur_turf
			else
				detouring = 0
				cur_dir = get_dir(cur_turf, target_turf)
				cur_turf = get_step(cur_turf, cur_dir)
	return affected

/proc/spawn_lavaland_jungle_flora(turf/T)
	var/static/list/jungle_flora_list = list(/obj/structure/flora/tree/jungle = 1,
	/obj/structure/flora/rock/pile/largejungle = 1,
	/obj/structure/flora/tree/jungle/small = 1,
	/obj/structure/flora/junglebush = 6,
	/obj/structure/flora/junglebush/b = 6,
	/obj/structure/flora/junglebush/c = 6,
	/obj/structure/flora/junglebush/large = 2,
	/obj/structure/flora/grass/jungle = 8,
	/obj/structure/flora/biolumi = 5,
	/obj/structure/flora/biolumi/mine = 1,
	/obj/structure/flora/biolumi/flower = 1,
	/obj/structure/flora/biolumi/lamp = 1)
	if(prob(60))
		var/flora_type = pickweight(jungle_flora_list)
		new flora_type(T)

#undef RANDOM_UPPER_X
#undef RANDOM_UPPER_Y

#undef RANDOM_LOWER_X
#undef RANDOM_LOWER_Y

/proc/generate_lavaland_jungle_environment(target_z)
	var/list/AFFECTED_TURFS = list()
	//Two big patch centered around the middle x-wise
	for(var/i in 1 to 2)
		AFFECTED_TURFS |= spawn_patch_like_gen(target_z, required_distance = 0.5, min_radius = 5, max_radius = 7)
	for(var/i in 1 to 5) //5 random, smaller patches
		AFFECTED_TURFS |= spawn_patch_like_gen(target_z)
	spawn_river_like_gen(target_z, 3, turf_type = /turf/open/floor/plating/smooth/dirt/lavaland_jungle)
	spawn_river_like_gen(target_z, 3)
	spawn_river_like_gen(target_z, 2, turf_type = /turf/open/lava/smooth/lava_land_surface)
	for(var/turf/T in AFFECTED_TURFS)
		if(istype(T, /turf/open/floor/plating/smooth/grass/lavaland_jungle))
			spawn_lavaland_jungle_flora(T)

