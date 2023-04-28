/obj/item/organ/genital/belly //I know, I know a belly aint a genital. but it is in the sake of code.
	name = "belly"
	desc = "You see a belly on their midsection."
	icon_state = "belly"
	icon = 'icons/obj/genitals/breasts.dmi' // I have no idea why it's set up like this on hyper
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BELLY
	w_class = WEIGHT_CLASS_NORMAL
	size = 0
	shape = "Pair" //Name doesn't matter unless we get more belly shapes
	genital_flags = UPDATE_OWNER_APPEARANCE | GENITAL_UNDIES_HIDDEN | CAN_CUM_INTO | HAS_EQUIPMENT
	masturbation_verb = "massage"
	layer_index = BELLY_LAYER_INDEX
	var/sent_full_message = TRUE //defaults to 1 since they're full to start
	var/statuscheck = FALSE

/obj/item/organ/genital/belly/get_min_size()
	return -1 // -1 is used to remove the belly and 0 is flat belly

/obj/item/organ/genital/belly/get_max_size()
	return BELLY_SIZE_MAX

/obj/item/organ/genital/belly/on_size_update(previous_size, new_size)
	var/list/belly_names = list("stomach", "belly", "gut", "midsection", "rolls")
	if(new_size < 0)//I don't actually know what round() does to negative numbers, so to be safe!!fixed
		if(owner)
			to_chat(owner, span_warning("You feel your [pick(belly_names)] go completely flat."))
		QDEL_IN(src, 1)
		return
	if(owner)
		if(new_size > previous_size)
			to_chat(owner, span_warning("Your guts [pick("swell up to", "gurgle into", "expand into", "plump up into", "grow eagerly into", "fatten up into", "distend into")] a larger midsection."))
		else
			to_chat(owner, span_warning("Your guts [pick("shrink down to", "decrease into", "wobble down into", "diminish into", "deflate into", "contracts into")] a smaller midsection."))

/obj/item/organ/genital/belly/update_appearance()
	var/lowershape = lowertext(shape)

	//Reflect the size of dat ass on examine.
	var/size_name = get_belly_size_string()

	desc = "You see a [size_name] [round(size) >= 4 ? "belly, it bounces around and gurgles as [owner] walks" : "belly in [owner?.p_their() ? owner?.p_their() : "their"] midsection"]."

	var/icon_size = size
	icon_state = "belly_[lowershape]_[icon_size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				//if(!H.dna.skin_tone_override)
				//	icon_state += "_s"
		else
			color = "#[owner.dna.features["belly_color"]]"

/obj/item/organ/genital/belly/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["belly_color"]]"
	set_size(D.features["belly_size"])
	max_size = D.features["belly_max_size"]
	min_size = D.features["belly_min_size"]
	original_fluid_id = fluid_id
	toggle_visibility(D.features["belly_visibility"], FALSE)
	if(D.features["belly_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

/obj/item/organ/genital/belly/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen, cum_hole)
	if(!(owner.client?.prefs.cit_toggles & BELLY_INFLATION))
		if(owner.has_anus(REQUIRE_EXPOSED) && (cum_hole == CUM_TARGET_ANUS) && (owner.client?.prefs.cit_toggles & BUTT_ENLARGEMENT))
			var/obj/item/organ/genital/butt/ass = owner.getorganslot(ORGAN_SLOT_BUTT)
			if(!ass)
				ass = new
				ass.Insert(owner)
			ass.climax_modify_size(partner, source_gen)
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
		var/growth_amount = climax_fluids.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		generic_adjust_size_float(growth_amount)
		if(size > round(previous))
			owner.visible_message(span_lewd("\The <b>[owner]</b>'s belly bloats outwards as it gets pumped full of[pick(" sweet", "")] [lowertext(source_gen.get_fluid_name())]!"), ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		if((growth_amount >= 3 || size >= 3) && (owner.client?.prefs.cit_toggles & BUTT_ENLARGEMENT))
			var/obj/item/organ/genital/butt/ass = owner.getorganslot(ORGAN_SLOT_BUTT)
			if(!ass)
				ass = new
				ass.Insert(owner)
			ass.climax_modify_size(partner, source_gen, TRUE)
		climax_fluids.clear_reagents()

/obj/item/organ/genital/belly/proc/get_belly_size_string()
	var/size_name
	switch(size)
		if(-INFINITY to 0)
			size_name = "nonexistent"
		if(1)
			size_name = "average"
		if(2)
			size_name = "round"
		if(3)
			size_name = "squishable"
		if(4)
			size_name = "fat"
		if(5)
			size_name = "sagging"
		if(6)
			size_name = "gigantic"
		if(7 to INFINITY)
			size_name = pick("massive","unfathomably bulging","enormous","very generous","humongous","big bubbly")
	return size_name
