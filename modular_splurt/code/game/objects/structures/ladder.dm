/obj/structure/ladder/teleport
	var/tag_teleport = null
	var/static/list/teleport_ladders = list()
	var/list/datum/weakref/uprefs = list()// list because it can be several...
	var/list/datum/weakref/downrefs = list()

/obj/structure/ladder/teleport/Initialize(mapload, obj/structure/ladder/up, obj/structure/ladder/down)
	..()
	teleport_ladders.Add(src)
	return INITIALIZE_HINT_LATELOAD

/obj/structure/ladder/teleport/Destroy(force)
	down = null
	up = null
	for(var/datum/weakref/ref in uprefs)
		var/obj/structure/ladder/teleport/lad = ref.resolve()
		lad.up = null
	for(var/datum/weakref/ref in downrefs)
		var/obj/structure/ladder/teleport/lad = ref.resolve()
		lad.down = null
	teleport_ladders.Remove(src)
	return ..()


/obj/structure/ladder/teleport/LateInitialize()
	if (!down)
		for(var/obj/structure/ladder/teleport/T in teleport_ladders)
			if(T.tag_teleport == src.tag_teleport && src.z > T.z)
				uprefs += WEAKREF(T)
				T.up = src
				src.down = T
				T.update_icon()

	if (!up)
		for(var/obj/structure/ladder/teleport/T in teleport_ladders)
			if(T.tag_teleport == src.tag_teleport && src.z < T.z)
				downrefs += WEAKREF(T)
				T.down = src
				src.up = T
				T.update_icon()
	update_icon()

/obj/structure/ladder/teleport/xenoarch
	tag_teleport = "xenoarch"
