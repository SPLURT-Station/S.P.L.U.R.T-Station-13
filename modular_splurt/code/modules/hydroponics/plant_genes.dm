/datum/plant_gene/trait/proc/after_harvest(obj/item/reagent_containers/food/snacks/grown/G, newloc)
	return

/datum/plant_gene/trait/proc/after_slip(obj/item/reagent_containers/food/snacks/grown/G, mob/living/carbon/target)
	return

/datum/plant_gene/trait/proc/on_flora_grow(obj/structure/flora/botany/BF)
	return

/datum/plant_gene/trait/proc/on_flora_harvest(obj/structure/flora/botany/BF, atom/target)
	return

/datum/plant_gene/trait/proc/on_flora_agitated(obj/structure/flora/botany/BF, atom/target)
	return

/datum/plant_gene/trait/glow/shadow
	//makes plant emit slightly purple shadows
	//adds -potency*(rate*0.2) light power to products
	name = "Shadow Emission"
	rate = 0.04
	glow_color = "#AAD84B"

/datum/plant_gene/trait/glow/shadow/glow_power(obj/item/seeds/S)
	return -max(S.potency*(rate*0.2), 0.2)

/datum/plant_gene/trait/foam
	// Makes plant spill a foam that carries reagents when squashed.
	name = "Expansive Decomposition"

/datum/plant_gene/trait/foam/on_squash(obj/item/reagent_containers/food/snacks/grown/G, atom/target)
	var/datum/effect_system/foam_spread/S = new
	var/splat_location = get_turf(G)
	if(isturf(splat_location))
		var/foam_amount = round(sqrt(G.seed.potency * 0.1), 1)
		S.set_up(foam_amount, splat_location, G.reagents)
		S.start()
		G.reagents.clear_reagents()

/* Messes with slippery and other quirky stuff
/datum/plant_gene/trait/thorns
	// Adds glass-like caltrops to a plant
	name = "Thorny"
/datum/plant_gene/trait/thorns/on_new(obj/item/reagent_containers/food/snacks/grown/G, newloc)
	. = ..()
	// min dmg 3, max dmg 6, prob(70)
	G.AddComponent(/datum/component/caltrop, 3, 6, 70)
*/

/datum/plant_gene/trait/spore_emission
	// Makes the plant create smoke-like spore gas that carry reagents every now and then (not produce)
	name = "Spore Emission"

/datum/plant_gene/trait/spore_emission/proc/do_emission(obj/item/seeds/S, loc)
	var/datum/reagents/R = new/datum/reagents(1000)
	for(var/rid in S.reagents_add)
		var/amount = 1 + round(S.potency * S.reagents_add[rid], 1)

		var/list/data = null
		if(rid == "blood") // Hack to make blood in plants always O-
			data = list("blood_type" = "O-")

		R.add_reagent(rid, amount, data)

	var/datum/effect_system/smoke_spread/chem/spore/Spore = new
	var/smoke_amount = round(sqrt(S.potency * 0.1), 1)
	Spore.attach(loc)
	Spore.set_up(R, smoke_amount, loc, 0)
	Spore.start()
	R.clear_reagents()

/*
/datum/plant_gene/trait/spore_emission/on_flora_grow(obj/structure/flora/botany/BF)
	var/turf/T = get_turf(BF)
	var/obj/item/seeds/S = BF.myseed
	if(S && T)
		do_emission(S, T)
*/

/datum/plant_gene/trait/spore_emission/on_flora_agitated(obj/structure/flora/botany/BF, atom/target)
	var/turf/T = get_turf(BF)
	var/obj/item/seeds/S = BF.myseed
	if(S && T)
		do_emission(S, T)

/datum/plant_gene/trait/spore_emission/on_grow(obj/machinery/hydroponics/H)
	var/turf/T = get_turf(H)
	var/obj/item/seeds/S = H.myseed
	if(S && T)
		do_emission(S, T)

/datum/plant_gene/trait/fragile
	// Adds a chance for the plant to squash on harvest
	name = "Fragile"

/datum/plant_gene/trait/fragile/after_harvest(obj/item/reagent_containers/food/snacks/grown/G, newloc)
	..()
	if(prob(35))
		G.squash()

/datum/plant_gene/trait/fragile/after_slip(obj/item/reagent_containers/food/snacks/grown/G, mob/living/carbon/C)
	if(G.seed.get_gene(/datum/plant_gene/trait/squash))
		if(prob(50))
			G.squash()

/datum/plant_gene/trait/territorial
	// This will make the agitated flora have much violent effects
	name = "Territorial"

/datum/plant_gene/trait/anomaly
	// Fun???
	name = "Anomalous"

//Jungle glows down below
/datum/plant_gene/trait/glow/teal
	name = "Teal Bioluminescence"
	glow_color = "#00FFEE"

/datum/plant_gene/trait/glow/vivid_green
	name = "Vivid Green Bioluminescence"
	glow_color = "#6AFF00"

/datum/plant_gene/trait/glow/vivid_yellow
	name = "Vivid Yellow Bioluminescence"
	glow_color = "#D9FF00"

/datum/plant_gene/trait/glow/amber
	name = "Amber Bioluminescence"
	glow_color = "#FFC800"

/****Some extra modifiers to already existing traits****/

/datum/plant_gene/trait/cell_charge/on_slip(obj/item/reagent_containers/food/snacks/grown/G, mob/living/carbon/C)
	. = ..()
	do_sparks(3, FALSE, G)
	playsound(src, "sparks", 50, 1)

/datum/plant_gene/trait/cell_charge/on_squash(obj/item/reagent_containers/food/snacks/grown/G, atom/target)
	. = ..()
	do_sparks(3, FALSE, G)
	playsound(src, "sparks", 50, 1)

/datum/plant_gene/trait/cell_charge/on_flora_agitated(obj/structure/flora/botany/BF, atom/target)
	do_sparks(3, FALSE, BF)
	playsound(src, "sparks", 50, 1)
	if(BF.myseed.get_gene(/datum/plant_gene/trait/territorial) && BF.myseed.potency > 25)
		playsound(BF, 'sound/magic/lightningshock.ogg', 100, 1, extrarange = 5)
		tesla_zap(BF, 4, (BF.myseed.potency * 200), ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_MOB_STUN)
		for(var/mob/M in oview(BF, 4))
			BF.Beam(M, icon_state="nzcrentrs_power", time=5)

/datum/plant_gene/trait/smoke/on_squash(obj/item/reagent_containers/food/snacks/grown/G, atom/target)
	var/datum/effect_system/smoke_spread/chem/S = new
	var/splat_location = get_turf(G)
	if(isturf(splat_location))
		var/smoke_amount = round(sqrt(G.seed.potency * 0.1), 1)
		S.attach(splat_location)
		S.set_up(G.reagents, smoke_amount, splat_location, 0)
		S.start()
		G.reagents.clear_reagents()

/**** moved from core code ****/

/datum/plant_gene/trait/slip/handle_slip(obj/item/reagent_containers/food/snacks/grown/G, mob/M)
	. = ..()
	for(var/datum/plant_gene/trait/T in G.seed.genes)
		if(!QDELETED(G) && G)
			T.after_slip(G, M)

//Testing stuff
/*
/obj/item/seeds/test
	name = "pack of test seeds"
	desc = "These seeds grow into poppies."
	icon_state = "seed-poppy"
	species = "poppy"
	plantname = "Poppy Plants"
	product = /obj/item/reagent_containers/food/snacks/grown/poppy
	endurance = 100
	maturation = 1
	production = 1
	yield = 10
	potency = 50
	growthstages = 3
	growing_icon = 'icons/obj/hydroponics/growing_flowers.dmi'
	icon_grow = "poppy-grow"
	icon_dead = "poppy-dead"
	mutatelist = list(/obj/item/seeds/poppy/geranium, /obj/item/seeds/poppy/lily)
	reagents_add = list(/datum/reagent/drug/aphrodisiacplus = 0.2, /datum/reagent/drug/space_drugs = 0.05)
	genes = list(/datum/plant_gene/trait/plant_type/weed_hardy, /datum/plant_gene/trait/fragile, /datum/plant_gene/trait/foam, /datum/plant_gene/trait/squash, /datum/plant_gene/trait/spore_emission, /datum/plant_gene/trait/slip, /datum/plant_gene/trait/cell_charge, /datum/plant_gene/trait/territorial)
*/

