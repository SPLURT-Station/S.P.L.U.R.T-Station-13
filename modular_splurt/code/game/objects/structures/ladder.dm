/obj/structure/ladder/teleport
	var/tag_teleport = null
	var/static/list/teleport_ladders = list()

/obj/structure/ladder/teleport/Initialize(mapload, obj/structure/ladder/up, obj/structure/ladder/down)
	..()
	teleport_ladders.Add(src)
	return INITIALIZE_HINT_LATELOAD

/obj/structure/ladder/teleport/LateInitialize()
	if (!down)

		for(var/obj/structure/ladder/teleport/T in teleport_ladders)
			if(T.tag_teleport == src.tag_teleport && src.z > T.z)
				T.up = src
				src.down = T
				T.update_icon()

	if (!up)
		for(var/obj/structure/ladder/teleport/T in teleport_ladders)
			if(T.tag_teleport == src.tag_teleport && src.z < T.z)
				T.down = src
				src.up = T
				T.update_icon()
	update_icon()

/obj/structure/ladder/teleport/xenoarch
	tag_teleport = "xenoarch"

