/obj/effect/decal/cleanable/semendrip
	name = "semen"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'modular_sand/icons/obj/genitals/effects.dmi'
	icon_state = "drip1"
	random_icon_states = list("drip1", "drip2", "drip3", "drip4")
	var/total_amount = 1

/obj/effect/decal/cleanable/semendrip/replace_decal(obj/effect/decal/cleanable/semendrip/C)
	. = ..()
	C.total_amount++
	C.transfer_blood_dna(src.blood_DNA)
	if(C.total_amount >= 10)
		var/obj/effect/decal/cleanable/semen/S = new(loc)
		S.transfer_blood_dna(C.blood_DNA)
		qdel(C)

	return TRUE
