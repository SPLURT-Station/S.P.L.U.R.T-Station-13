/obj/effect/decal
	name = "decal"
	plane = FLOOR_PLANE
	anchored = TRUE
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/turf_loc_check = TRUE

/obj/effect/decal/Initialize(mapload)
	. = ..()
	if(turf_loc_check && (!isturf(loc) || NeverShouldHaveComeHere(loc)))
		return INITIALIZE_HINT_QDEL

/obj/effect/decal/blob_act(obj/structure/blob/B)
	if(B && B.loc == loc)
		qdel(src)

/obj/effect/decal/proc/NeverShouldHaveComeHere(turf/T)
	return isclosedturf(T) || isgroundlessturf(T)

/obj/effect/decal/ex_act(severity, target, origin)
	qdel(src)

/obj/effect/decal/fire_act(exposed_temperature, exposed_volume)
	if(!(resistance_flags & FIRE_PROOF)) //non fire proof decal or being burned by lava
		qdel(src)

/obj/effect/decal/HandleTurfChange(turf/T)
	..()
	if(T == loc && NeverShouldHaveComeHere(T))
		qdel(src)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/turf_decal
	icon = 'icons/turf/decals.dmi'
	icon_state = "warningline"
	layer = TURF_DECAL_LAYER
	plane = ABOVE_WALL_PLANE

/obj/effect/turf_decal/Initialize(mapload)
	..()
	return INITIALIZE_HINT_QDEL

// This is with the intent of optimizing mapload
// See spawners for more details since we use the same pattern
// Basically rather then creating and deleting ourselves, why not just do the bare minimum?
/obj/effect/turf_decal/Initialize(mapload)
	SHOULD_CALL_PARENT(FALSE)
	if(flags_1 & INITIALIZED_1)
		stack_trace("Warning: [src]([type]) initialized multiple times!")
	flags_1 |= INITIALIZED_1

	var/turf/T = loc
	if(!istype(T)) //you know this will happen somehow
		CRASH("Turf decal initialized in an object/nullspace")
	var/turn_dir = 180 - dir2angle(T.dir) //Turning a dir by 0 results in a roulette of random dirs.
	T.AddElement(/datum/element/decal, icon, icon_state, turn_dir ? turn(dir, turn_dir) : dir, CLEAN_GOD, color, null, null, alpha, FALSE)

/obj/effect/turf_decal/Destroy(force)
	SHOULD_CALL_PARENT(FALSE)
	#ifdef UNIT_TESTS
	// If we don't do this, turf decals will end up stacking up on a tile, and break the overlay limit
	// I hate it too bestie
	if(GLOB.running_create_and_destroy)
		var/turf/T = loc
		var/turn_dir = 180 - dir2angle(T.dir) //Turning a dir by 0 results in a roulette of random dirs.
		T.RemoveElement(/datum/element/decal, icon, icon_state, turn_dir ? turn(dir, turn_dir) : dir, CLEAN_GOD, color, null, null, alpha)
	#endif
	// Intentionally used over moveToNullspace(), which calls doMove(), which fires
	// off an enormous amount of procs, signals, etc, that this temporary effect object
	// never needs or affects.
	loc = null
	return QDEL_HINT_QUEUE
