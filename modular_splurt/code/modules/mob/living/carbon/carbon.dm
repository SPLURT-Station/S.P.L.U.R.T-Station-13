/mob/living/carbon
	var/mob/living/hand_slide_target = null
	var/hand_slide_part = null

/mob/living/carbon/is_muzzled()
	return ..() || istype(wear_mask, /obj/item/clothing/mask/gas/sechailer/slut)

/mob/living/carbon/cuff_resist(obj/item/I, breakouttime = 600, cuff_break = 0)
	if(istype(I, /obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/rope = I
		cuff_break = rope.prepare_resist(src)
		if(cuff_break == -1)
			to_chat(src, "<span class='danger'>You are not able to reach the rope.</span>")
			return
	. = ..()

/mob/living/carbon/clear_cuffs(obj/item/I, cuff_break)
	if(istype(I, /obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/rope = I
		if(LAZYLEN(rope.rope_stack) > 1)
			visible_message("<span class='danger'>[src] manages to loosen up their rope!</span>")
			to_chat(src, "<span class='notice'>You successfully loosen up your rope.</span>")

			var/obj/item/restraints/bondage_rope/new_rope = new rope.type()
			new_rope.color = pop(rope.rope_stack)
			new_rope.forceMove(src.loc)
			return
	. = ..()
	
// Returns the piece of clothing blocking body part
// TODO: Best would be to have a list and pick the top layer one (so jumpsuit gets returned before boxers)
/mob/living/proc/get_clothing_blocking_part(body_part, ignore_skirts = FALSE)
	for(var/A in get_equipped_items())
		var/obj/item/I = A
		if(istype(I) && I.body_parts_covered & body_part)
			if(ignore_skirts && istype(I, /obj/item/clothing/under))
				var/obj/item/clothing/under/under = I
				if(!under.is_skirt)
					return under
			else
				return I
	return null

/mob/living/proc/get_target_part_exposed_visibility(can_hand_slide, mob/living/target, body_part)
	return REQUIRE_EXPOSED

// Allows up for exposed visibility changes between an user and a target
// Right now used for interactions with a hand slided under target's clothes (handjob, fingering) and skirt interactions (no longer needing to forcibly remove the skirt)
/mob/living/carbon/get_target_part_exposed_visibility(can_hand_slide, mob/living/target, body_part)
	if(hand_slide_target == target && hand_slide_part == body_part)
		if(body_part == GROIN && target.get_clothing_blocking_part(GROIN, TRUE) == null)
			return REQUIRE_ANY
		return can_hand_slide ? REQUIRE_ANY : REQUIRE_EXPOSED
	else
		return REQUIRE_EXPOSED

// Returns name of the clothing somebody is sliding under
/mob/living/carbon/proc/get_hand_slide_clothing_name(mob/living/target, body_part)
	var/obj/item/I = target.get_clothing_blocking_part(body_part)
	return I == null ? "none" : I.name
