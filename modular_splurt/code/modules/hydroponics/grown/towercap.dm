/obj/item/grown/log/tree/shadow
	seed = null
	name = "shadow log"
	desc = "A piece of dark log."
	icon = 'modular_splurt/icons/obj/hydroponics/harvest.dmi'
	icon_state = "shadow_log"
	plank_type = /obj/item/stack/sheet/mineral/wood/shadow
	plank_name = "shadow planks"

/obj/item/grown/log/tree/mushroom
	seed = null
	name = "mushroom log"
	desc = "Looks like candy! Do not eat it."
	icon = 'modular_splurt/icons/obj/hydroponics/harvest.dmi'
	icon_state = "mushroom_log"
	plank_type = /obj/item/stack/sheet/mineral/wood/mushroom
	plank_name = "mushroom planks"

/obj/item/reagent_containers/food/snacks/grown/Initialize(mapload, obj/item/seeds/new_seed)
	. = ..()
	if(seed)
		for(var/datum/plant_gene/trait/T in seed.genes)
			T.after_harvest(src, loc)


