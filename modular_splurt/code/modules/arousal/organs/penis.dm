/obj/item/organ/genital/penis/get_features(mob/living/carbon/human/H)
	. = ..()
	original_fluid_id = fluid_id
	fluid_max_volume += (length - initial(length))*2.5
	fluid_rate += (length - initial(length))/10

/obj/item/organ/genital/penis/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
	if(!(owner.client?.prefs.cit_toggles & PENIS_ENLARGEMENT))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable(partner)
	if(!fluid_source)
		return

	var/datum/reagents/target
	if(linked_organ)
		if(!linked_organ.climax_fluids)
			linked_organ.climax_fluids = new
			linked_organ.climax_fluids.maximum_volume = INFINITY
		target = linked_organ.climax_fluids
	else
		if(!climax_fluids)
			climax_fluids = new
			climax_fluids.maximum_volume = INFINITY
		target = climax_fluids

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(target, fluid_source.total_volume)

	if(target.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		modify_size(target.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The <b>[owner]</b>'s [pick(GLOB.dick_nouns)][linked_organ ? " and [pick(list("nuts", "balls", "testicles", "ballsack", "sack"))]" : ""] swell and grow bigger as they get pumped full of \the <b>[partner]</b>'s [lowertext(source_gen.get_fluid_name())]!</span>", ignored_mobs = owner.get_unconsenting())
			if(linked_organ)
				linked_organ.fluid_id = source_gen.get_fluid_id()
		target.clear_reagents()
