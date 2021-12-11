/obj/structure/flora/tree/shadow
	name = "shadow tree"
	desc = "A native lavaland tree, with a remarkable purple color."
	icon = 'modular_splurt/icons/obj/flora/lavaland.dmi'
	icon_state = "shadowtree_1"
	spawned_wood = /obj/item/grown/log/tree/shadow
	spawned_stump = /obj/structure/flora/stump/shadow
	var/static/list/icon_states = list("shadowtree_1", "shadowtree_2")

/obj/structure/flora/tree/shadow/Initialize()
	. = ..()
	if(islist(icon_states) && icon_states.len)
		icon_state = pick(icon_states)

/obj/structure/flora/stump/shadow
	name = "shadow tree stump"
	desc = "Hidden in the shadowns."
	icon = 'modular_splurt/icons/obj/flora/lavaland.dmi'
	icon_state = "shadowtree_stump"



/obj/structure/flora/tree/mushroom
	name = "giant mushroom"
	desc = "An impressive overgrown mushroom."
	icon = 'modular_splurt/icons/obj/flora/lavaland.dmi'
	icon_state = "gmushroom_1"
	spawned_wood = /obj/item/grown/log/tree/mushroom
	spawned_stump = /obj/structure/flora/stump/mushroom
	var/list/icon_states = list("gmushroom_1", "gmushroom_2")

/obj/structure/flora/tree/mushroom/Initialize()
	. = ..()

	if(islist(icon_states) && icon_states.len)
		icon_state = pick(icon_states)

/obj/structure/flora/stump/mushroom
	name = "giant mushroom stump"
	desc = "It will grow back. Maybe. One day."
	icon = 'modular_splurt/icons/obj/flora/lavaland.dmi'
	icon_state = "gmushroom_stump"



/obj/structure/flora/grass/red
	name = "tall grass"
	desc = "A patch of overgrown red grass."
	icon = 'modular_splurt/icons/obj/flora/lavaland.dmi'
	icon_state = "tallgrass1bb"
	gender = PLURAL
	layer = ABOVE_MOB_LAYER

/obj/structure/flora/grass/red/Initialize()
	icon_state = "tallgrass[rand(1, 4)]bb"
	return ..()


/obj/effect/spawner/grass_spawner
	name = "grass spawner"
	var/spawned_grass = /obj/structure/flora/grass

/obj/effect/spawner/grass_spawner/New()
	var/range = 2
	while(1==1)
		if(prob(90))
			break
		range++
	for(var/turf/T in view(range))
		if(!isopenturf(T) || locate(spawned_grass) in T)
			continue
		if(get_dist(T, src) == range && prob(60))
			continue
		new spawned_grass(T)
	qdel(src)

/obj/effect/spawner/grass_spawner/red
	name = "redgrass spawner"
	spawned_grass = /obj/structure/flora/grass/red
