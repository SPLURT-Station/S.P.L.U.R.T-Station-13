// TEH DONUT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/obj/item/organ/genital/anus
	name = "anus"
	desc = "You see their squishy donut pucker parting their asscheeks"
	icon_state = "anus"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	size = 0
	arousal_verb = "Your donut quivers"
	unarousal_verb = "Your pucker stops twitching"
	linked_organ_slot = ORGAN_SLOT_BUTT
	genital_flags = UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	shape = "donut"
	layer_index = ANUS_LAYER_INDEX

/obj/item/organ/genital/anus/upon_link()
	. = ..()
	size = linked_organ.size
	update_size()
	update_appearance()

/obj/item/organ/genital/anus/update_appearance(updates)
	var/u_His = owner?.p_their() || "their"

	var/datum/sprite_accessory/anus/S = GLOB.anus_shapes_list[shape]
	var/lowershape = lowertext(S?.icon_state || DEF_ANUS_SHAPE)

	desc = "You see [u_His] squishy [lowershape] pucker parting [u_His] asscheeks"

	icon_state = "anus_[lowershape]_[size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["anus_color"]]"
	. = ..()

/obj/item/organ/genital/anus/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["anus_color"]]"
	shape = D.features["anus_shape"]
	toggle_visibility(D.features["anus_visibility"], FALSE)
	if(D.features["anus_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	if(D.features["anus_accessible"])
		toggle_accessibility(TRUE)
	. = ..()

/obj/item/organ/genital/anus/toggle_visibility(visibility, update = TRUE)
	var/previous_flags = genital_flags
	. = ..()
	var/obj/item/organ/genital/butt/tush = linked_organ
	if(!is_exposed() || tush?.is_exposed())
		return .
	genital_flags = previous_flags
	if(update && owner && ishuman(owner)) //recast to use update genitals proc
		var/mob/living/carbon/human/H = owner
		H.update_genitals()
