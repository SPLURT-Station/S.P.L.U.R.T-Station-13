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

/obj/structure/flora/tree/pine/xmas/presents
	gift_type = /obj/item/a_gift/balanced //this is a modular nerf to christmas trees to limit what they hand out


/obj/structure/flora/biolumi
	name = "glowing plants"
	desc = "Several sticks with bulbous, bioluminescent tips."
	icon = 'modular_splurt/icons/obj/flora/jungleflora.dmi'
	icon_state = "stick"
	gender = PLURAL
	light_range = 1.5
	light_power = 0.5
	max_integrity = 50
	var/variants = 9
	var/chosen_light
	var/base_icon
	var/list/random_light = list("#6AFF00","#00FFEE", "#D9FF00", "#FFC800")

/obj/structure/flora/biolumi/Initialize()
	. = ..()
	base_icon = "[initial(icon_state)][rand(1,variants)]"
	icon_state = base_icon
	chosen_light = pick(random_light)
	light_color = chosen_light
	update_icon()

/obj/structure/flora/biolumi/update_overlays()
	. = ..()
	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)
	SSvis_overlays.add_vis_overlay(src, icon, "[base_icon]_light", ABOVE_LIGHTING_LAYER, ABOVE_LIGHTING_PLANE)
	if(chosen_light)
		var/obj/effect/overlay/vis/overlay = managed_vis_overlays[1]
		overlay.color = chosen_light

/obj/structure/flora/biolumi/mine
	name = "glowing plant"
	desc = "Glowing sphere encased in jungle leaves."
	icon_state = "mine"
	variants = 4
	random_light = list("#FF0066","#00FFEE", "#D9FF00", "#FFC800")

/obj/structure/flora/biolumi/flower
	name = "glowing flower"
	desc = "Beautiful, bioluminescent flower."
	icon_state = "flower"
	variants = 2
	random_light = list("#6F00FF","#00FFEE", "#D9FF00", "#FF73D5")

/obj/structure/flora/biolumi/lamp
	name = "plant lamp"
	desc = "Bioluminescent plant much in a shape of a street lamp."
	icon_state = "lamp"
	variants = 2
	random_light = list("#6AFF00","#00FFEE", "#D9FF00", "#FFC800")

