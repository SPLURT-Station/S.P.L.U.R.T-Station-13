/obj/item/organ/genital/testicles
	default_fluid_id = /datum/reagent/consumable/semen

/obj/item/organ/genital/testicles/get_fluid()
	if(linked_organ)
		return clamp(linked_organ.fluid_rate * ((world.time - linked_organ.last_orgasmed) / (10 SECONDS)) * linked_organ.fluid_mult, 0, linked_organ.fluid_max_volume)
	else
		return 0

/obj/item/organ/genital/testicles/get_fluid_fraction()
	if(linked_organ)
		return get_fluid() / linked_organ.fluid_max_volume
	else
		return 0

/obj/item/organ/genital/testicles/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["balls_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["balls_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		if(fluid && ((fluid in GLOB.genital_fluids_list) || istype(fluid, H.get_blood_id())))
			fluid_id = D.features["balls_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()
