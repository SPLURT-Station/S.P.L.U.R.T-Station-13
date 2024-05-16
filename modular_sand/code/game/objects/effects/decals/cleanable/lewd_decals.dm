/obj/effect/decal/cleanable/semendrip
	name = "semen"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'modular_sand/icons/obj/genitals/effects.dmi'
	icon_state = "drip1"
	random_icon_states = list("drip1", "drip2", "drip3", "drip4")

/obj/effect/decal/cleanable/semendrip/replace_decal(obj/effect/decal/cleanable/semendrip/C)
	. = ..()
	if(!. || QDELETED(src))
		return FALSE
	var/obj/effect/decal/cleanable/semen/S = (locate(/obj/effect/decal/cleanable/semen) in C.loc)
	if(S) // Merge ourselves into this puddle.
		reagents.trans_to(S, reagents.total_volume)
		S.transfer_blood_dna(blood_DNA)
		update_icon()
		return TRUE
	reagents.trans_to(C, reagents.total_volume)
	C.transfer_blood_dna(blood_DNA)
	if(C.reagents.total_volume >= 10) // Turn the drip into a puddle.
		S = new(C.loc)
		C.reagents.trans_to(S, C.reagents.total_volume)
		C.transfer_blood_dna(S.blood_DNA)
		S.update_icon()
		qdel(C)
	update_icon()

/obj/effect/decal/cleanable/semendrip/update_icon()
	. = ..()
	add_atom_colour(mix_color_from_reagents(reagents.reagent_list), FIXED_COLOUR_PRIORITY)

