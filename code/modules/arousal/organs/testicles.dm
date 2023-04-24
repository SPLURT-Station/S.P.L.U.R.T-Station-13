/obj/item/organ/genital/testicles
	name = "testicles"
	desc = "A male reproductive organ."
	icon_state = "testicles"
	icon = 'icons/obj/genitals/testicles.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	size = BALLS_SIZE_MIN
	arousal_verb = "Your balls ache a little"
	unarousal_verb = "Your balls finally stop aching, again"
	linked_organ_slot = ORGAN_SLOT_PENIS
	genital_flags = CAN_MASTURBATE_WITH|MASTURBATE_LINKED_ORGAN|GENITAL_FUID_PRODUCTION|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	var/size_name = "average"
	shape = DEF_BALLS_SHAPE
	fluid_id = /datum/reagent/consumable/semen
	masturbation_verb = "massage"
	layer_index = TESTICLES_LAYER_INDEX
	var/ball_size = COCK_SIZE_DEF //Somewhat arbitrary, but relative to cock inches, because cock length adjustements may affect this
	var/cock_growth_affects_ball_growth = TRUE

/obj/item/organ/genital/testicles/generate_fluid()
	if(!linked_organ && !update_link())
		return FALSE
	return ..()
	// in memoriam "Your balls finally feel full, again." ??-2020

/obj/item/organ/genital/testicles/upon_link()
	update_size()
	update_appearance()

/obj/item/organ/genital/testicles/update_size(modified = FALSE)
	var/rounded_size = round(ball_size)
	switch(rounded_size)
		if(-INFINITY to 6)
			size = BALLS_SIZE_MIN
		if(7 to 11)
			size = BALLS_SIZE_DEF
		if(12 to 36)
			size = BALLS_SIZE_2
		if(37 to 48)
			size = BALLS_SIZE_3
		if(49 to INFINITY)
			size = BALLS_SIZE_MAX
	switch(size)
		if(BALLS_SIZE_MIN)
			size_name = "average"
		if(BALLS_SIZE_DEF)
			size_name = "enlarged"
		if(BALLS_SIZE_2)
			size_name = "engorged"
		if(BALLS_SIZE_3)
			size_name = "massive"
		if(BALLS_SIZE_MAX)
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
	fluid_rate = D.features["balls_cum_rate"]
	fluid_mult = D.features["balls_cum_mult"]
	fluid_efficiency = D.features["balls_efficiency"]
	toggle_visibility(D.features["balls_visibility"], FALSE)
	if(D.features["balls_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	if(D.features["inert_eggs"])
		AddComponent(/datum/component/ovipositor)
	if(!isnull(D.features["cock_growth_affects_balls_growth"]))
		cock_growth_affects_ball_growth = D.features["cock_growth_affects_balls_growth"]
	if(!isnull(D.features["balls_size"]))
		ball_size = D.features["balls_size"]

/obj/item/organ/genital/testicles/proc/on_cock_length_growth(length_growth)
	if(!cock_growth_affects_ball_growth)
		return
	adjust_ball_size(length_growth)

/obj/item/organ/genital/testicles/proc/adjust_ball_size(adjust)
	ball_size += adjust
	update()

/obj/item/organ/genital/testicles/proc/set_ball_size(value)
	var/diff = ball_size - value
	adjust_ball_size(diff)

/obj/item/organ/genital/testicles/proc/adjust_ball_size_clamped(adjust, min = 0, max = INFINITY)
	var/new_size = clamp(ball_size + adjust, min, max)
	var/diff = new_size - ball_size
	adjust_ball_size(diff)
