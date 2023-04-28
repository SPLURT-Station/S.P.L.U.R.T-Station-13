/obj/item/organ/genital/butt
	name = "butt"
	desc = "You see a pair of asscheeks."
	icon_state = "butt"
	icon = 'icons/obj/genitals/butt.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_BUTT
	w_class = 3
	size  = 0
	max_size = BUTT_SIZE_MAX
	shape = "Pair" //turn this into a default constant if for some inexplicable reason we get more than one butt type but I doubt it.
	genital_flags = UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	masturbation_verb = "massage"
	layer_index = BUTT_LAYER_INDEX
	linked_organ_slot = ORGAN_SLOT_ANUS

/obj/item/organ/genital/butt/get_min_size()
	return -1 // -1 is used to remove the butt and 0 is a flat butt

/obj/item/organ/genital/butt/get_max_size()
	return BUTT_SIZE_MAX

/obj/item/organ/genital/butt/on_size_update(previous_size, new_size)
	if(previous_size < 0)
		if(owner)
			to_chat(owner, "<span class='warning'>You feel your asscheeks shrink down to an ordinary size.</span>")
		QDEL_IN(src, 1)
		return

	if(owner)
		if (new_size > previous_size)
			to_chat(owner, "<span class='warning'>Your buttcheeks [pick("swell up to", "flourish into", "expand into", "plump up into", "grow eagerly into", "amplify into")] a larger pair.</span>")
		else
			to_chat(owner, "<span class='warning'>Your buttcheeks [pick("shrink down to", "decrease into", "wobble down into", "diminish into", "deflate into", "contracts into")] a smaller pair.</span>")

/obj/item/organ/genital/butt/update_appearance()
	var/lowershape = lowertext(shape)

	//Reflect the size of dat ass on examine.
	var/size_name = get_butt_size_string()

	desc = "You see a [lowershape] of [size_name] asscheeks."

	var/icon_size = size
	icon_state = "butt_[lowershape]_[icon_size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["butt_color"]]"


/obj/item/organ/genital/butt/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["butt_color"]]"
	set_size(D.features["butt_size"])
	max_size = D.features["butt_max_size"]
	min_size = D.features["butt_min_size"]
	toggle_visibility(D.features["butt_visibility"], FALSE)
	if(D.features["butt_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

/obj/item/organ/genital/butt/proc/get_butt_size_string()
	var/size_name
	switch(round(size))
		if(-INFINITY to 0)
			size_name = "nonexistent"
		if(1)
			size_name = "average"
		if(2)
			size_name = "sizable"
		if(3)
			size_name = "squeezable"
		if(4)
			size_name = "hefty"
		if(5)
			size_name = pick("massive", "very generous")
		if(6)
			size_name = pick("gigantic", "big bubbly", "enormous")
		if(7)
			size_name = pick("unfathomably large", "extreme")
		if(8 to INFINITY)
			size_name = pick("absolute dumptruck", "humongous", "dummy thicc")
	return size_name

/obj/item/organ/genital/butt/update_size()
	if(linked_organ)
		linked_organ.update()

/obj/item/organ/genital/butt/toggle_visibility(visibility, update)
	. = ..()
	var/obj/item/organ/genital/anus/butthole = linked_organ
	if(!butthole?.is_exposed() || is_exposed())
		return .
	linked_organ.toggle_visibility(visibility)

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
		generic_adjust_size_float(growth_amount)
		if(size != previous)
			owner.visible_message(span_lewd("\The <b>[owner]</b>'s [pick(GLOB.butt_nouns + asscheeks)] bounce\s outwards lewdly as [owner.p_they()] get[owner.p_s()] pumped full of [lowertext(source_gen.get_fluid_name())] from behind!"), ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()
