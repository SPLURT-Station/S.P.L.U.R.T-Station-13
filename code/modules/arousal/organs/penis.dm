/obj/item/organ/genital/penis
	name = "penis"
	desc = "A male reproductive organ."
	icon_state = "penis"
	icon = 'icons/obj/genitals/penis.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	masturbation_verb = "stroke"
	arousal_verb = "You pop a boner"
	unarousal_verb = "Your boner goes down"
	genital_flags = CAN_MASTURBATE_WITH|CAN_CLIMAX_WITH|GENITAL_CAN_AROUSE|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|GENITAL_CAN_TAUR|CAN_CUM_INTO|HAS_EQUIPMENT
	linked_organ_slot = ORGAN_SLOT_TESTICLES
	fluid_transfer_factor = 0.5
	shape = DEF_COCK_SHAPE
	size = 2 //arbitrary value derived from length and diameter for sprites.
	layer_index = PENIS_LAYER_INDEX

	var/length = COCK_SIZE_DEF //inches
	var/max_length = null // NULLABLE!!
	var/min_length = null // NULLABLE!!
	var/prev_length = 6 //really should be renamed to prev_length
	var/diameter = 4.38
	var/diameter_ratio = COCK_DIAMETER_RATIO_DEF //0.25; check citadel_defines.dm
	var/ball_growth_affects_cock_growth = TRUE
	var/last_length_during_alert = COCK_SIZE_DEF

/obj/item/organ/genital/penis/get_min_size()
	return 0 // 0 is the one where the pp disappears

/obj/item/organ/genital/penis/get_max_size()
	return 5

/obj/item/organ/genital/penis/generic_adjust_size_float(adjust, min = -INFINITY, max = INFINITY)
	adjust_length_clamped(adjust, min, max)

/obj/item/organ/genital/penis/generic_set_size_clamped(new_size)
	var/diff = new_size - length
	adjust_length_clamped(diff)

/obj/item/organ/genital/penis/generic_set_size(new_size)
	set_length(new_size)

/obj/item/organ/genital/penis/get_fluid_size_bonus_multiplier()
	return clamp(length / 3, 1, INFINITY)

/obj/item/organ/genital/penis/on_size_update(previous_size, new_size)
	if(new_size <= 0)
		if(owner)
			to_chat(owner, "<span class='warning'>You feel your tallywacker shrinking away from your body as your groin flattens out!</b></span>")
		QDEL_IN(src, 1)
		if(linked_organ)
			QDEL_IN(linked_organ, 1)
		return

/obj/item/organ/genital/penis/proc/on_length_update(previous_length, new_length)
	var/diff = abs(new_length - last_length_during_alert)
	if(diff < 1)
		return
	last_length_during_alert = new_length
	if(owner)
		if (new_length > previous_length)
			to_chat(owner, "<span class='warning'>Your [pick(GLOB.dick_nouns)] [pick("swells up to", "flourishes into", "expands into", "bursts forth into", "grows eagerly into", "amplifys into")] a [uppertext(get_proper_length())] inch penis.</b></span>")
		else
			to_chat(owner, "<span class='warning'>Your [pick(GLOB.dick_nouns)] [pick("shrinks down to", "decreases into", "diminishes into", "deflates into", "shrivels regretfully into", "contracts into")] a [uppertext(get_proper_length())] inch penis.</b></span>")

/obj/item/organ/genital/penis/update_size()
	var/rounded_length = round(length)
	var/new_size = 1
	switch(rounded_length)
		if(-INFINITY to 0)
			new_size = 0
		if(1 to 6) //If modest size
			new_size = 1
		if(7 to 11) //If large
			new_size = 2
		if(12 to 36) //If massive
			new_size = 3
		if(37 to 48) //If comical
			new_size = 4 //no new sprites for anything larger yet //Now there is :3
		if(49 to INFINITY)
			new_size = 5

	set_size(new_size)

/obj/item/organ/genital/penis/update_appearance()
	. = ..()
	var/datum/sprite_accessory/S = GLOB.cock_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "human"
	icon_state = "penis_[icon_shape]_[size]"
	//icon_state = sanitize_text("penis_[shape]_[size]") //Which one is it supposed to be??? 2 pieces of code setting differnt icon states
	var/lowershape = lowertext(shape)

	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["cock_color"]]"
		if(genital_flags & GENITAL_CAN_TAUR && S?.taur_icon && (!S.feat_taur || owner.dna.features[S.feat_taur]) && owner.dna.species.mutant_bodyparts["taur"])
			var/datum/sprite_accessory/taur/T = GLOB.taur_list[owner.dna.features["taur"]]
			if(T.taur_mode & S.accepted_taurs) //looks out of place on those.
				lowershape = "taur, [lowershape]"

	var/proper_len = get_proper_length()
	var/proper_diam = get_proper_diameter()
	desc = "You see [aroused_state ? "an erect" : "a flaccid"] [lowershape] [name]. You estimate it's about [proper_len] inch[proper_len != 1 ? "es" : ""] long and [proper_diam] inch[proper_diam != 1 ? "es" : ""] in diameter."

/obj/item/organ/genital/penis/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["cock_color"]]"
	set_length(D.features["cock_length"])
	max_length = D.features["cock_max_length"]
	min_length = D.features["cock_min_length"]
	diameter_ratio = D.features["cock_diameter_ratio"]
	shape = D.features["cock_shape"]
	prev_length = length
	toggle_visibility(D.features["cock_visibility"], FALSE)
	if(D.features["cock_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	var/seperate_ball_size = D.features["seperate_ball_size"]
	if(seperate_ball_size == TRUE)
		ball_growth_affects_cock_growth = D.features["linked_ball_cock_growth"]
	else
		ball_growth_affects_cock_growth = TRUE

/obj/item/organ/genital/penis/proc/adjust_linked_balls(adjust, min = -INFINITY, max = INFINITY)
	if(!linked_organ)
		return
	var/obj/item/organ/genital/testicles/balls = linked_organ
	balls.on_cock_length_growth(adjust, min, max)

// Updates the linked balls size, possibly setting it to the cock size
/obj/item/organ/genital/penis/proc/update_linked_balls()
	if(!linked_organ)
		return
	var/obj/item/organ/genital/testicles/balls = linked_organ
	balls.update_ball_size()

// Adjusts length by value
/obj/item/organ/genital/penis/proc/adjust_length(adjust)
	if(adjust == 0)
		return
	set_length(length + adjust)

// Sets length by value
/obj/item/organ/genital/penis/proc/set_length(value)
	if(length == value)
		return
	var/prev_length = length
	length = value
	diameter = (length * diameter_ratio)//Is it just me or is this ludicous, why not make it exponentially decay?
	on_length_update(prev_length, length)
	update()

// Adjusts length clamped to min and max arguments, and also to min_length and max_length
/obj/item/organ/genital/penis/proc/adjust_length_clamped(adjust, min = -INFINITY, max = INFINITY)
	// Clamp to arguments
	var/new_length = clamp(length + adjust, min, max)
	var/diff = new_length - length
	// Clamp to min/max sizes
	var/min_check_value = min_length ? min_length : 0
	var/max_check_value = max_length ? max_length : INFINITY
	var/new_length2 = clamp(length + diff, min_check_value, max_check_value)
	var/diff2 = new_length2 - length
	// Finally, apply the difference
	adjust_length(diff2)

// Possibly grows the cock as balls grow
/obj/item/organ/genital/penis/proc/on_ball_size_growth(adjust, min, max)
	if(!ball_growth_affects_cock_growth)
		return
	adjust_length_clamped(adjust, min, max)

// If has linked growth with balls, this will update the length to match the balls size
/obj/item/organ/genital/penis/proc/update_cock_length()
	if(!ball_growth_affects_cock_growth)
		return
	if(!linked_organ)
		return
	var/obj/item/organ/genital/testicles/balls = linked_organ
	set_length(balls.ball_size)

// Adjusts length and possibly grows balls for that adjustement too
/obj/item/organ/genital/penis/proc/adjust_length_factor_balls(adjust, min = -INFINITY, max = INFINITY, ball_min = null, ball_max = null)
	if(isnull(ball_min))
		ball_min = min
	if(isnull(ball_max))
		ball_max = max
	adjust_length_clamped(adjust, min, max)
	adjust_linked_balls(adjust, ball_min, ball_max)

// Sets length and possibly updates ball size to that size
/obj/item/organ/genital/penis/proc/set_length_factor_balls(value)
	set_length(value)
	update_linked_balls()

// Gets the penis length factoring in an owner size, if any owner
/obj/item/organ/genital/penis/proc/get_proper_diameter()
	var/proper = diameter
	if(owner)
		proper *= get_size(owner)
	return round(proper, 0.25)

// Gets the penis diameter factoring in an owner size, if any owner
/obj/item/organ/genital/penis/proc/get_proper_length()
	var/proper = length
	if(owner)
		proper *= get_size(owner)
	return round(proper)

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
		generic_adjust_size_float(target.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message(span_lewd("\The <b>[owner]</b>'s [pick(GLOB.dick_nouns)][linked_organ ? " and [pick(list("nuts", "balls", "testicles", "ballsack", "sack"))]" : ""] swell and grow bigger as they get pumped full of \the <b>[partner]</b>'s [lowertext(source_gen.get_fluid_name())]!"), ignored_mobs = owner.get_unconsenting())
			if(linked_organ)
				linked_organ.fluid_id = source_gen.get_fluid_id()
		target.clear_reagents()
