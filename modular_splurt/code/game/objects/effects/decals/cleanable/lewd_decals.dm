/datum/reagent/consumable/milk/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return

	var/obj/effect/decal/cleanable/milk/S = locate() in T
	if(!S)
		S = new(T)

/obj/effect/decal/cleanable/milk
	name = "milk"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/obj/genitals/effects.dmi'
	icon_state = "milk1"
	random_icon_states = list("milk1", "milk2", "milk3", "milk4")

/obj/effect/decal/cleanable/milk/New()
	. = ..()
	dir = pick(1,2,4,8)
	add_blood_DNA(list("Non-human DNA" = "A+"))

/obj/effect/decal/cleanable/milk/replace_decal(obj/effect/decal/cleanable/milk/S)
	if(S.blood_DNA)
		blood_DNA |= S.blood_DNA
	return ..()
