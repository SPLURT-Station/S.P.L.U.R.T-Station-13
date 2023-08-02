/obj/item/organ/genital/breasts
	default_fluid_id = /datum/reagent/consumable/milk

/obj/item/organ/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["breasts_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["breasts_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		else if(fluid && (fluid in GLOB.genital_fluids_list))
			fluid_id = D.features["breasts_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()
	fluid_max_volume += ((size - initial(size))*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((size - initial(size))/10)*(owner ? get_size(owner) : 1)

/obj/item/organ/genital/breasts/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
	if(!(owner.client?.prefs.cit_toggles & BREAST_ENLARGEMENT))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable(partner)
	if(!fluid_source)
		return

	if(!climax_fluids)
		climax_fluids = new
		climax_fluids.maximum_volume = INFINITY //Just in case

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(climax_fluids, fluid_source.total_volume)

	if(climax_fluids.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		modify_size(climax_fluids.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The <b>[owner]</b>'s [pick(GLOB.breast_nouns)] swell up with the surge of [lowertext(source_gen.get_fluid_name())] from \the <b>[partner]</b>'s [source_gen.name]", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()
