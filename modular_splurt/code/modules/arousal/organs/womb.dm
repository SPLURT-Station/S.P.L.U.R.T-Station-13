/obj/item/organ/genital/womb
	default_fluid_id = /datum/reagent/consumable/semen/femcum

/obj/item/organ/genital/womb/get_fluid()
	if(linked_organ)
		return clamp(linked_organ.fluid_rate * ((world.time - linked_organ.last_orgasmed) / (10 SECONDS)) * linked_organ.fluid_mult, 0, linked_organ.fluid_max_volume)
	else
		return 0

/obj/item/organ/genital/womb/get_fluid_fraction()
	if(linked_organ)
		return get_fluid() / linked_organ.fluid_max_volume
	else
		return 0

/obj/item/organ/genital/womb/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["womb_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["womb_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		if(fluid && ((fluid in GLOB.genital_fluids_list) || istype(fluid, H.get_blood_id())))
			fluid_id = D.features["womb_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()
