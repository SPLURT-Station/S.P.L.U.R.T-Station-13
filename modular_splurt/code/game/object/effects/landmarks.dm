/obj/effect/landmark/start/slaver
	name = "slaver"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "sslaver_spawn"

/obj/effect/landmark/start/slaver/Initialize()
	..()
	GLOB.slaver_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/slaver_leader
	name = "slaver leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "sslaver_leader_spawn"

/obj/effect/landmark/start/slaver_leader/Initialize()
	..()
	GLOB.slaver_leader_start += loc
	return INITIALIZE_HINT_QDEL
