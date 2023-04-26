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

	var/length = 6 //inches
	var/max_length = 9
	var/min_length = 2
	var/prev_length = 6 //really should be renamed to prev_length
	var/diameter = 4.38
	var/diameter_ratio = COCK_DIAMETER_RATIO_DEF //0.25; check citadel_defines.dm
	var/ball_growth_affects_cock_growth = TRUE

/obj/item/organ/genital/penis/get_fluid_size_bonus_multiplier()
	return clamp(length / 6, 1, INFINITY)

/obj/item/organ/genital/penis/update_size(modified = FALSE)
	if(length <= 0)//I don't actually know what round() does to negative numbers, so to be safe!!
		if(owner)
			to_chat(owner, "<span class='warning'>You feel your tallywacker shrinking away from your body as your groin flattens out!</b></span>")
		QDEL_IN(src, 1)
		if(linked_organ)
			QDEL_IN(linked_organ, 1)
		return
	var/rounded_length = round(length)
	var/new_size
	switch(rounded_length)
		if(0 to 6) //If modest size
			new_size = 1
		if(7 to 11) //If large
			new_size = 2
		if(12 to 36) //If massive
			new_size = 3
		if(37 to 48) //If comical
			new_size = 4 //no new sprites for anything larger yet //Now there is :3
		if(49 to INFINITY)
			new_size = 5

	size = new_size

	if(owner)
		if (round(length) > round(prev_length))
			to_chat(owner, "<span class='warning'>Your [pick(GLOB.dick_nouns)] [pick("swells up to", "flourishes into", "expands into", "bursts forth into", "grows eagerly into", "amplifys into")] a [uppertext(round(length*get_size(owner)))] inch penis.</b></span>")
		else if ((round(length) < round(prev_length)) && (length > 0.5))
			to_chat(owner, "<span class='warning'>Your [pick(GLOB.dick_nouns)] [pick("shrinks down to", "decreases into", "diminishes into", "deflates into", "shrivels regretfully into", "contracts into")] a [uppertext(round(length*get_size(owner)))] inch penis.</b></span>")
	icon_state = sanitize_text("penis_[shape]_[size]")
	diameter = (length * diameter_ratio)//Is it just me or is this ludicous, why not make it exponentially decay?


/obj/item/organ/genital/penis/update_appearance()
	. = ..()
	var/datum/sprite_accessory/S = GLOB.cock_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "human"
	icon_state = "penis_[icon_shape]_[size]"
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

	desc = "You see [aroused_state ? "an erect" : "a flaccid"] [lowershape] [name]. You estimate it's about [round(length*get_size(owner), 0.25)] inch[round(length*get_size(owner), 0.25) != 1 ? "es" : ""] long and [round(diameter*get_size(owner), 0.25)] inch[round(diameter*get_size(owner), 0.25) != 1 ? "es" : ""] in diameter."

/obj/item/organ/genital/penis/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["cock_color"]]"
	length = D.features["cock_length"]
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

/obj/item/organ/genital/penis/proc/adjust_linked_balls(adjust, min = 0, max = INFINITY)
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

// Unconditionally adjusts length by value
/obj/item/organ/genital/penis/proc/adjust_length(adjust)
	if(adjust == 0)
		return
	prev_length = length
	length += adjust
	update()

// Unconditionally sets length by value
/obj/item/organ/genital/penis/proc/set_length(value)
	var/diff = length - value
	adjust_length(diff)

// Adjusts length clamped to min and max arguments, and also to min_length and max_length
/obj/item/organ/genital/penis/proc/adjust_length_clamped(adjust, min = 0, max = INFINITY)
	// Clamp to arguments
	var/new_length = clamp(length + adjust, min, max)
	var/diff = new_length - length
	// Clamp to min/max sizes
	var/new_length2 = clamp(length + diff, min_length, max_length)
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
/obj/item/organ/genital/penis/proc/adjust_length_factor_balls(adjust, min = 0, max = INFINITY)
	adjust_linked_balls(adjust, min, max)
	adjust_length_clamped(adjust, min, max)

// Sets length and possibly updates ball size to that size
/obj/item/organ/genital/penis/proc/set_length_factor_balls(value)
	set_length(value)
	update_linked_balls()
