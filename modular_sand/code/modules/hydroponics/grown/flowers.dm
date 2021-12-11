/obj/item/seeds/rose
	name = "pack of rose seeds"
	desc = "These seeds grow into roses."
	icon_state = "seed-rose"
	species = "rose"
	plantname = "Rose Bush"
	product = /obj/item/grown/rose
	endurance = 12
	yield = 6
	potency = 15
	growthstages = 3
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	growing_icon = 'modular_sand/icons/obj/hydroponics/growing_flowers.dmi'
	icon_grow = "rose-grow"
	icon_dead = "rose-dead"
	mutatelist = list(/obj/item/seeds/carbon_rose)
	//Roses are commonly used as herbal medicines (diarrhodons) and for their 'rose oil'.
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.05, /datum/reagent/medicine/tricordrazine = 0.1, /datum/reagent/oil = 0.05)

/obj/item/grown/rose
	seed = /obj/item/seeds/rose
	name = "rose"
	desc = "The classic fleur d'amour - flower of love. Watch for its thorns!"
	icon_state = "rose"
	icon = 'modular_sand/icons/obj/hydroponics/harvest.dmi'
	lefthand_file = 'modular_sand/icons/mob/inhands/weapons/plants_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/weapons/plants_righthand.dmi'
	slot_flags = ITEM_SLOT_HEAD //|ITEM_SLOT_MASK // couldn't get this to work, revive another day

// Carbon Rose
/obj/item/seeds/carbon_rose
	name = "pack of carbon rose seeds"
	desc = "These seeds grow into carbon roses."
	icon_state = "seed-carbonrose"
	species = "carbonrose"
	plantname = "Carbon Rose Flower"
	product = /obj/item/grown/carbon_rose
	endurance = 12
	yield = 6
	potency = 15
	growthstages = 3
	growing_icon = 'modular_sand/icons/obj/hydroponics/growing_flowers.dmi'
	icon_grow = "carbonrose-grow"
	icon_dead = "carbonrose-dead"
	mutatelist = list(/obj/item/seeds/carbon_rose)
	reagents_add = list(/datum/reagent/plastic_polymers = 0.05)
	rarity = 10



/obj/item/grown/carbon_rose
	seed = /obj/item/seeds/carbon_rose
	name = "carbon rose"
	desc = "The all new fleur d'amour gris - the flower of love, modernized, with no harsh thorns."
	icon_state = "carbonrose"
	icon = 'modular_sand/icons/obj/hydroponics/harvest.dmi'
	lefthand_file = 'modular_sand/icons/mob/inhands/weapons/plants_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/weapons/plants_righthand.dmi'
	force = 0
	throwforce = 0
	slot_flags = ITEM_SLOT_HEAD
	throw_speed = 1
	throw_range = 3
