/atom/var/CanAtmosPass = ATMOS_PASS_YES
/atom/var/CanAtmosPassVertical = ATMOS_PASS_YES

/atom/proc/CanAtmosPass(turf/T)
	switch (CanAtmosPass)
		if (ATMOS_PASS_PROC)
			return ATMOS_PASS_YES
		if (ATMOS_PASS_DENSITY)
			return !density
		else
			return CanAtmosPass

/turf/CanAtmosPass = ATMOS_PASS_NO
/turf/CanAtmosPassVertical = ATMOS_PASS_NO

/turf/open/CanAtmosPass = ATMOS_PASS_PROC
/turf/open/CanAtmosPassVertical = ATMOS_PASS_PROC

/turf/open/CanAtmosPass(turf/T, vertical = FALSE)
	var/dir = vertical? get_dir_multiz(src, T) : get_dir(src, T)
	var/opp = REVERSE_DIR(dir)
	. = TRUE
	if(vertical && !(zAirOut(dir, T) && T.zAirIn(dir, src)))
		. = FALSE
	if(blocks_air || T.blocks_air)
		. = FALSE
	if (T == src)
		return .
	for(var/obj/O in contents+T.contents)
		var/turf/other = (O.loc == src ? T : src)
		if(!(vertical? (CANVERTICALATMOSPASS(O, other)) : (CANATMOSPASS(O, other))))
			. = FALSE
		if(O.BlockThermalConductivity()) 	//the direction and open/closed are already checked on CanAtmosPass() so there are no arguments
			conductivity_blocked_directions |= dir
			T.conductivity_blocked_directions |= opp
			if(!.)
				return .

/atom/movable/proc/BlockThermalConductivity() // Objects that don't let heat through.
	return FALSE

/// This proc is a more deeply optimized version of immediate_calculate_adjacent_turfs
/// It contains dumbshit, and also stuff I just can't do at runtime
/// If you're not editing behavior, just read that proc. It's less bad
/turf/proc/init_immediate_calculate_adjacent_turfs()
	//Basic optimization, if we can't share why bother asking other people ya feel?
	// You know it's gonna be stupid when they include a unit test in the atmos code
	// Yes, inlining the string concat does save 0.1 seconds
	#ifdef UNIT_TESTS
	ASSERT(UP == 16)
	ASSERT(DOWN == 32)
	#endif
	LAZYINITLIST(src.atmos_adjacent_turfs)
	var/list/atmos_adjacent_turfs = src.atmos_adjacent_turfs
	var/blocks_air = src.blocks_air
	var/canpass = CANATMOSPASS(src, src)
	var/canvpass = CANVERTICALATMOSPASS(src, src)
	// I am essentially inlineing two get_dir_multizs here, because they're way too slow on their own. I'm sorry brother
	var/list/z_traits = SSmapping.multiz_levels[z]
	for(var/direction in GLOB.cardinals_multiz)
		// Yes this is a reimplementation of get_step_multiz. It's faster tho. fuck you
		var/turf/current_turf = (direction & (UP|DOWN)) ? \
			(direction & UP) ? \
				(z_traits["16"]) ? \
					(get_step(locate(x, y, z + z_traits["16"]), NONE)) : \
				(null) : \
				(z_traits["32"]) ? \
					(get_step(locate(x, y, z + z_traits["32"]), NONE)) : \
				(null) : \
			(get_step(src, direction))

		if(!isopenturf(current_turf)) // not interested in you brother
			continue

		//Can you and me form a deeper relationship, or is this just a passing wind
		// (direction & (UP | DOWN)) is just "is this vertical" by the by
		if((direction & (UP|DOWN) ? (canvpass && CANVERTICALATMOSPASS(current_turf, src)) : (canpass && CANATMOSPASS(current_turf, src))) && !(blocks_air || current_turf.blocks_air))
			LAZYINITLIST(current_turf.atmos_adjacent_turfs)
			atmos_adjacent_turfs[current_turf] = TRUE
			current_turf.atmos_adjacent_turfs[src] = TRUE
		else
			atmos_adjacent_turfs -= current_turf
			if (current_turf.atmos_adjacent_turfs)
				current_turf.atmos_adjacent_turfs -= src
			UNSETEMPTY(current_turf.atmos_adjacent_turfs)
			current_turf.set_sleeping(current_turf.blocks_air)
		// This was originally (isspaceturf(T.get_z_base_turf()), -1), but we don't have space, so
		// we just pass FALSE to save time.
		current_turf?.__update_auxtools_turf_adjacency_info(FALSE, -1)

	UNSETEMPTY(atmos_adjacent_turfs)
	src.atmos_adjacent_turfs = atmos_adjacent_turfs
	set_sleeping(blocks_air)
	__update_auxtools_turf_adjacency_info(FALSE)

/turf/proc/ImmediateCalculateAdjacentTurfs()
	var/list/atmos_adjacent_turfs = src.atmos_adjacent_turfs // save ourselves a bunch of datum var accesses
	var/canpass = CANATMOSPASS(src, src)
	var/canvpass = CANVERTICALATMOSPASS(src, src)
	for(var/direction in GLOB.cardinals_multiz)
		var/turf/T = get_step_multiz(src, direction)
		if(!T)
			continue
		if(isopenturf(T) && !(blocks_air || T.blocks_air) && ((direction & (UP|DOWN))? (canvpass && CANVERTICALATMOSPASS(T, src)) : (canpass && CANATMOSPASS(T, src))) )
			LAZYINITLIST(atmos_adjacent_turfs)
			LAZYINITLIST(T.atmos_adjacent_turfs)
			atmos_adjacent_turfs[T] = ATMOS_ADJACENT_ANY
			T.atmos_adjacent_turfs[src] = ATMOS_ADJACENT_ANY
		else
			if (atmos_adjacent_turfs)
				atmos_adjacent_turfs -= T
			if (T.atmos_adjacent_turfs)
				T.atmos_adjacent_turfs -= src
			UNSETEMPTY(T.atmos_adjacent_turfs)
			T.set_sleeping(T.blocks_air)
		T.__update_auxtools_turf_adjacency_info(isspaceturf(T.get_z_base_turf()), -1)
	UNSETEMPTY(atmos_adjacent_turfs)
	src.atmos_adjacent_turfs = atmos_adjacent_turfs
	for(var/t in atmos_adjacent_turfs)
		var/turf/open/T = t
		for(var/obj/machinery/door/firedoor/FD in T)
			FD.UpdateAdjacencyFlags()
	for(var/obj/machinery/door/firedoor/FD in src)
		FD.UpdateAdjacencyFlags()
	__update_auxtools_turf_adjacency_info(isspaceturf(get_z_base_turf()))

/turf/proc/set_sleeping(should_sleep)

/turf/proc/__update_auxtools_turf_adjacency_info()

//returns a list of adjacent turfs that can share air with this one.
//alldir includes adjacent diagonal tiles that can share
//	air with both of the related adjacent cardinal tiles
/turf/proc/GetAtmosAdjacentTurfs(alldir = 0)
	var/adjacent_turfs
	if (atmos_adjacent_turfs)
		adjacent_turfs = atmos_adjacent_turfs.Copy()
	else
		return list()		// don't bother checking diagonals, diagonals are going to be cardinal checks anyways.

	if (!alldir)
		return adjacent_turfs

	var/turf/other
	var/turf/mid
	for (var/d in GLOB.diagonals)
		other = get_step(src, d)
		if(!other)
			continue
		// NS step
		mid = get_step(src, NSCOMPONENT(d))
		if((mid in adjacent_turfs) && (get_step(mid, EWCOMPONENT(d)) in adjacent_turfs))
			adjacent_turfs += other
			continue
		// EW step
		mid = get_step(src, EWCOMPONENT(d))
		if((mid in adjacent_turfs) && (get_step(mid, NSCOMPONENT(d)) in adjacent_turfs))
			adjacent_turfs += other
			continue
	return adjacent_turfs

/atom/proc/air_update_turf(command = 0)
	if(!isturf(loc) && command)
		return
	var/turf/T = get_turf(loc)
	if(!istype(T))
		return

	T.air_update_turf(command)

/turf/air_update_turf(command = 0)
	if(command)
		ImmediateCalculateAdjacentTurfs()

/atom/movable/proc/move_update_air(turf/T)
    if(isturf(T))
        T.air_update_turf(1)
    air_update_turf(1)

/atom/proc/atmos_spawn_air(text) //because a lot of people loves to copy paste awful code lets just make an easy proc to spawn your plasma fires
	var/turf/open/T = get_turf(src)
	if(!istype(T))
		return
	T.atmos_spawn_air(text)

/turf/open/atmos_spawn_air(text)
	if(!text || !air)
		return

	var/datum/gas_mixture/G = new
	G.parse_gas_string(text)
	assume_air(G)
