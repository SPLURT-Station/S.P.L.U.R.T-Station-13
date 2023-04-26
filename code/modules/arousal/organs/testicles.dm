/obj/item/organ/genital/testicles
	name = "testicles"
	desc = "A male reproductive organ."
	icon_state = "testicles"
	icon = 'icons/obj/genitals/testicles.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	size = BALLS_SPRITE_SIZE_MIN
	arousal_verb = "Your balls ache a little"
	unarousal_verb = "Your balls finally stop aching, again"
	linked_organ_slot = ORGAN_SLOT_PENIS
	genital_flags = CAN_MASTURBATE_WITH|MASTURBATE_LINKED_ORGAN|GENITAL_FUID_PRODUCTION|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	var/size_name = "average"
	shape = DEF_BALLS_SHAPE
	fluid_id = /datum/reagent/consumable/semen
	masturbation_verb = "massage"
	layer_index = TESTICLES_LAYER_INDEX
	var/ball_size = BALLS_SIZE_DEFAULT //It is analogous to cock length
	var/max_ball_size = 9
	var/min_ball_size = 2
	var/cock_growth_affects_ball_growth = TRUE

/obj/item/organ/genital/testicles/get_fluid_size_bonus_multiplier()
	return clamp(ball_size / 6, 1, INFINITY)

/obj/item/organ/genital/testicles/generate_fluid()
	if(!linked_organ && !update_link())
		return FALSE
	return ..()
	// in memoriam "Your balls finally feel full, again." ??-2020

/obj/item/organ/genital/testicles/update_size(modified = FALSE)
	var/rounded_size = round(ball_size)
	switch(rounded_size)
		if(-INFINITY to 6)
			size = BALLS_SPRITE_SIZE_ONE
		if(7 to 11)
			size = BALLS_SPRITE_SIZE_TWO
		if(12 to 36)
			size = BALLS_SPRITE_SIZE_THREE
		if(37 to 48)
			size = BALLS_SPRITE_SIZE_FOUR
		if(49 to INFINITY)
			size = BALLS_SPRITE_SIZE_FIVE
	switch(size)
		if(BALLS_SPRITE_SIZE_ONE)
			size_name = "average"
		if(BALLS_SPRITE_SIZE_TWO)
			size_name = "enlarged"
		if(BALLS_SPRITE_SIZE_THREE)
			size_name = "engorged"
		if(BALLS_SPRITE_SIZE_FOUR)
			size_name = "massive"
		if(BALLS_SPRITE_SIZE_FIVE)
			size_name = pick(list("gigantic", "ginormous", "humongous", "unfathomably immense"))
		else
			size_name = "nonexistant"

/obj/item/organ/genital/testicles/update_appearance()
	. = ..()
	desc = "You see an [size_name] pair of testicles."
	var/datum/sprite_accessory/S = GLOB.balls_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "single"
	icon_state = "testicles_[icon_shape]_[size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["balls_color"]]"

/obj/item/organ/genital/testicles/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["balls_color"]]"
	shape = D.features["balls_shape"]
	toggle_visibility(D.features["balls_visibility"], FALSE)
	if(D.features["balls_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	if(D.features["inert_eggs"])
		AddComponent(/datum/component/ovipositor)
	var/seperate_ball_size = D.features["seperate_ball_size"]
	if(seperate_ball_size == TRUE)
		ball_size = D.features["balls_size"]
		max_ball_size = D.features["balls_max_size"]
		min_ball_size = D.features["balls_min_size"]
		cock_growth_affects_ball_growth = D.features["linked_ball_cock_growth"]
	else
		ball_size = D.features["cock_length"]
		max_ball_size = D.features["cock_max_length"]
		min_ball_size = D.features["cock_min_length"]
		cock_growth_affects_ball_growth = TRUE

/obj/item/organ/genital/testicles/proc/on_cock_length_growth(adjust, min, max)
	if(!cock_growth_affects_ball_growth)
		return
	adjust_ball_size_clamped(adjust, min, max)

// If has linked growth with cock, this will update the balls size to match the cock
/obj/item/organ/genital/testicles/proc/update_ball_size()
	if(!cock_growth_affects_ball_growth)
		return
	if(!linked_organ)
		return
	var/obj/item/organ/genital/penis/pp = linked_organ
	set_ball_size(pp.length)

// Unconditionally adjusts the balls size
/obj/item/organ/genital/testicles/proc/adjust_ball_size(adjust)
	ball_size += adjust
	update()

// Unconditionall sets the balls size
/obj/item/organ/genital/testicles/proc/set_ball_size(value)
	var/diff = ball_size - value
	adjust_ball_size(diff)

// Sets the balls size clamping to arguments, and clamping to min/max size prefs
/obj/item/organ/genital/testicles/proc/adjust_ball_size_clamped(adjust, min = 0, max = INFINITY)
	// Clamp to arguments
	var/new_size = clamp(ball_size + adjust, min, max)
	var/diff = new_size - ball_size
	// Clamp to min/max sizes
	var/new_size2 = clamp(ball_size + diff, min_ball_size, max_ball_size)
	var/diff2 = new_size2 - ball_size
	// Finally, apply the difference
	adjust_ball_size(diff2)

// Tells the linked cock to growth by an amount
/obj/item/organ/genital/testicles/proc/adjust_linked_cock(adjust, min = 0, max = INFINITY)
	if(!linked_organ)
		return
	var/obj/item/organ/genital/penis/pp = linked_organ
	pp.on_ball_size_growth(adjust, min, max)

// Updates the linked cock length, potentially setting its length to match the balls size
/obj/item/organ/genital/testicles/proc/update_linked_cock()
	if(!linked_organ)
		return
	var/obj/item/organ/genital/penis/pp = linked_organ
	pp.update_cock_length()

// Adjusts the ball size with clamp, and adjusts the cock size if the pref for that is on
/obj/item/organ/genital/testicles/proc/adjust_ball_size_factor_cock(adjust, min = 0, max = INFINITY)
	adjust_ball_size_clamped(adjust, min, max)
	adjust_linked_cock(adjust, min, max)

// Sets the ball size unconditionally, and adjusts the cock size if the pref for that is on
/obj/item/organ/genital/testicles/proc/set_ball_size_factor_cock(value)
	set_ball_size(value)
	update_linked_cock()
