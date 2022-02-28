/obj/item/organ/genital/butt/get_features(mob/living/carbon/human/H)
	. = ..()
	original_fluid_id = fluid_id
	fluid_max_volume += (size - initial(size))*2.5
	fluid_rate += (size - initial(size))/10

/obj/item/organ/genital/butt/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen, from_belly = FALSE)
	if(!(owner.client?.prefs.cit_toggles & BUTT_ENLARGEMENT))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable()
	if(!fluid_source)
		return

	if(!climax_fluids)
		climax_fluids = new
		climax_fluids.maximum_volume = INFINITY

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(climax_fluids, fluid_source.total_volume)

	if(climax_fluids.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		var/growth_amount = (from_belly ? min(climax_fluids.total_volume, 1) : climax_fluids.total_volume)
		var/list/asscheeks = list("asscheeks", "buttcheeks", "ass buns", "booty pillows", "dumptruck spheres", "[pick(list("jiggly", "bouncy", "wobbly"))] buttocks")
		modify_size(growth_amount)
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The <b>[owner]</b>'s [pick(GLOB.butt_nouns + asscheeks)] bounce\s outwards lewdly as [owner.p_they()] get[owner.p_s()] pumped full of [lowertext(source_gen.get_fluid_name())] from behind!</span>", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()
