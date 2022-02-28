/obj/item/organ/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["breasts_fluid"])
		fluid_id = D.features["breasts_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()
	fluid_max_volume += (cached_size - breast_values[initial(size)])*2.5
	fluid_rate += (cached_size - breast_values[initial(size)])/10

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
