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

/obj/item/organ/genital/penis/modify_size(modifier, min = -INFINITY, max = INFINITY)
	var/new_value = clamp(length + modifier, max(min, min_size ? min_size : -INFINITY), min(max_length ? max_length : INFINITY, max))
	if(new_value == length)
		return
	prev_length = length
	length = new_value
	update()
	..()

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

	if(linked_organ)
		linked_organ.size = clamp(size, BALLS_SIZE_MIN, BALLS_SIZE_MAX) //SPLURT Edit. No more randomly massive balls
		linked_organ.update()
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

	var/adjusted_length = round(length * (owner ? get_size(owner) : 1), 0.25)
	var/adjusted_diameter = round(diameter * (owner ? get_size(owner) : 1), 0.25)

	desc = "You see [aroused_state ? "an erect" : "a flaccid"] [lowershape] [name]. You estimate it's about [adjusted_length] inch[adjusted_length != 1 ? "es" : ""] long and [adjusted_diameter] inch[adjusted_diameter != 1 ? "es" : ""] in diameter."

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
	if(D.features["cock_accessible"])
		toggle_accessibility(TRUE)
