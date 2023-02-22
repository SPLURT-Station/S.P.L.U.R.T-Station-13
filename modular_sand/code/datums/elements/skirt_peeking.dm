/datum/element/skirt_peeking
	element_flags = ELEMENT_DETACH

/datum/element/skirt_peeking/Attach(datum/peeked)
	. = ..()
	if(!ishuman(peeked))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(peeked, COMSIG_PARENT_EXAMINE, .proc/on_examine)
	RegisterSignal(peeked, COMSIG_PARENT_EXAMINE_MORE, .proc/on_closer_look)

/datum/element/skirt_peeking/proc/can_skirt_peek(mob/living/carbon/human/peeked, mob/peeker)
	var/mob/living/living_peeker = peeker
	var/obj/item/clothing/under/worn_uniform = peeked.get_item_by_slot(ITEM_SLOT_ICLOTHING)

	// Unfortunately, you can't see it
	var/obj/item/clothing/suit/outer_clothing = peeked.get_item_by_slot(ITEM_SLOT_OCLOTHING)
	if(outer_clothing && CHECK_MULTIPLE_BITFIELDS(outer_clothing.body_parts_covered, CHEST | GROIN | LEGS | FEET))
		return FALSE
	//

	// Valid clothing section
	if(worn_uniform && is_type_in_typecache(worn_uniform.type, GLOB.skirt_peekable))
		// We are being peeked by a spooky ghost who sees all?
		if(isobserver(peeker))
			return TRUE
		// Are you a living creature (and not us)?
		if(istype(living_peeker) && (living_peeker != peeked))
			// And are you under us while we're standing up?
			if(!(CHECK_BITFIELD(living_peeker.mobility_flags, MOBILITY_STAND)) && (CHECK_BITFIELD(peeked.mobility_flags, MOBILITY_STAND)) && (peeked.loc == living_peeker.loc))
				return TRUE
			// Or are you nearby and we are up high
			// to-do SOMEONE PLEASE PORT /datum/element/climbable
			var/obj/structure/high_ground = locate(/obj/structure) in get_turf(peeked)
			if(high_ground && high_ground.climbable && CHECK_BITFIELD(peeked.mobility_flags, MOBILITY_STAND) && \
				peeked.Adjacent(peeker))
				return TRUE
	return FALSE

/datum/element/skirt_peeking/proc/on_examine(mob/living/carbon/human/peeked, mob/peeker, list/examine_list)
	if(can_skirt_peek(peeked, peeker))
		examine_list += span_purple("[peeked.p_theyre(TRUE)] wearing a skirt! I can probably give it a little peek <b>looking closer</b>.")

/datum/element/skirt_peeking/proc/on_closer_look(mob/living/carbon/human/peeked, mob/peeker, list/examine_content)
	if(can_skirt_peek(peeked, peeker))
		var/obj/item/clothing/under/worn_uniform = peeked.get_item_by_slot(ITEM_SLOT_ICLOTHING)
		var/string = "Peeking under [peeked]'s [worn_uniform.name], you can see "
		var/obj/item/clothing/underwear/worn_underwear = peeked.get_item_by_slot(ITEM_SLOT_UNDERWEAR)
		if(worn_underwear)
			string += "a "
			if(!is_type_in_typecache(worn_underwear.type, GLOB.pairless_panties)) //a pair of thong
				string += "pair of "
			if(worn_underwear.color)
				string += "<font color='[worn_underwear.color]'>[worn_underwear.name]</font>."
			else
				string += "[worn_underwear.name]."

			var/obj/item/organ/genital/penis/penis = peeked.getorganslot(ORGAN_SLOT_PENIS)
			var/obj/item/organ/genital/vagina/vagina = peeked.getorganslot(ORGAN_SLOT_VAGINA)
			if(penis?.aroused_state)
				string += span_love(" There's a visible bulge on [peeked.p_their()] front.")
			else if(vagina?.aroused_state)
				string += span_love(" [peeked.p_theyre(TRUE)] wet with arousal.")

		else
			string += "[peeked.p_theyre()] not wearing anything!\n[peeked.p_their(TRUE)]"
			var/list/genitals = list()
			for(var/obj/item/organ/genital/genital in peeked.internal_organs)
				if(CHECK_BITFIELD(genital.genital_flags, (GENITAL_INTERNAL|GENITAL_HIDDEN)))
					continue

				var/appended
				switch(genital.type)
					if(/obj/item/organ/genital/vagina)
						if(genital.aroused_state)
							appended += " wet"
						if(lowertext(genital.shape) != "human")
							appended += " [lowertext(genital.shape)]"
						if(lowertext(genital.shape) != "cloaca") //their wet cloaca vagina
							appended += " [lowertext(genital.name)]" // goodbye pussy

					if(/obj/item/organ/genital/testicles)
						var/obj/item/organ/genital/testicles/nuts = genital
						appended += " [lowertext(nuts.size_name)] [lowertext(nuts.name)]"
					if(/obj/item/organ/genital/penis)
						if(genital.aroused_state)
							appended += " fully erect"
						if(lowertext(genital.shape) != "human")
							appended += " [lowertext(genital.shape)]"
						appended += " [lowertext(genital.name)]" // Name it something funny, i dare you.
					if(/obj/item/organ/genital/butt)
						var/obj/item/organ/genital/butt/booty = genital
						appended += " [booty.size_name] [lowertext(booty.name)]" // Maybe " average butt pair" isn't the best for now
					else
						continue
				genitals += appended

			string += english_list(genitals, " featureless groin", " and", ",")
			string += " on full display."

		examine_content += span_purple(string)
