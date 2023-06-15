/obj/item/proc/insert_item_organ(mob/living/carbon/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	to_chat(user, span_warning("You can't insert this item!"))
	return

/obj/item/genital_equipment/condom/insert_item_organ(mob/living/carbon/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	if(!(target.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return

	if(!unwrapped)
		to_chat(user, span_notice("You must remove the condom from the package first!"))
		return

	var/obj/item/organ/genital/penis/ween = target_organ
	if(!istype(ween))
		to_chat(user, span_notice("You can't put the condom on this genital!"))
		return

	if(!target.has_penis(REQUIRE_EXPOSED))
		to_chat(user, span_notice("You can't find anywhere to put the condom!"))
		return

	if(locate(src.type) in target_organ.contents)
		to_chat(user, span_notice("\The <b>[target]</b> is already wearing a condom!"))
		return

	target.visible_message(span_warning("\The <b>[user]</b> is trying to put a condom on \the <b>[target]</b>!"),\
						span_warning("\The <b>[user]</b> is trying to put a condom on you!"))

	if(!do_mob(user, target, 4 SECONDS))
		return

	if(!user.transferItemToLoc(src, target_organ))
		return

	playsound(target, 'modular_sand/sound/lewd/latex.ogg', 50, 1, -1)
	to_chat(target, span_userlove("Your penis feels more safe!"))

/obj/item/genital_equipment/sounding/insert_item_organ(mob/living/carbon/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	if(!(target.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return

	if(!unwrapped)
		to_chat(user, span_notice("You must remove the rod from the package first!"))
		return

	var/obj/item/organ/genital/penis/ween = target_organ
	if(!istype(ween))
		to_chat(user, span_notice("You can't put the rod inside this genital!"))
		return

	if(!target.has_penis(REQUIRE_EXPOSED))
		to_chat(user, span_notice("You can't find anywhere to put the rod!"))
		return

	if(locate(src.type) in target_organ.contents)
		if(user == target)
			to_chat(user, span_notice("You already have a rod inside your [target_organ]!"))
		else
			to_chat(user, span_notice("\The <b>[target]</b>'s [target_organ] already has a rod inside!"))
		return

	if(user == target)
		target.visible_message(span_warning("\The <b>[user]</b> is trying to insert a rod inside themselves!"),\
						span_warning("You try to insert a rod inside yourself!"))
	else
		target.visible_message(span_warning("\The <b>[user]</b> is trying to insert a rod inside \the <b>[target]</b>!"),\
						span_warning("\The <b>[user]</b> is trying to insert a rod inside you!"))

	if(!do_mob(user, target, 4 SECONDS))
		return

	if(!user.transferItemToLoc(src, target_organ))
		return

	playsound(target, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	to_chat(target, span_userlove("Your penis feels stuffed and stretched!"))
	owner = target

/obj/item/electropack/vibrator/insert_item_organ(mob/living/carbon/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	if(!(target.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return

	if(style == "long" && !(istype(target_organ, /obj/item/organ/genital/vagina))) //long vibrators dont fit on anything but vaginas, but small ones fit everywhere
		to_chat(user, span_warning("[src] is too big to fit there, use a smaller version."))
		return

	if(locate(src.type) in target_organ.contents)
		if(user == target)
			to_chat(user, span_notice("You already have a vibrator inside your [target_organ]!"))
		else
			to_chat(user, span_notice("\The <b>[target]</b>'s [target_organ] already has a vibrator inside!"))
		return

	if(user == target)
		target.visible_message(span_warning("\The <b>[user]</b> is trying to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] themselves!"),\
			span_warning("You try to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] yourself!"))
	else
		target.visible_message(span_warning("\The <b>[user]</b> is trying to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] \the <b>[target]</b>!"),\
			span_warning("\The <b>[user]</b> is trying to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] you!"))

	if(!do_mob(user, target, 5 SECONDS))
		return

	if(!user.transferItemToLoc(src, target_organ))
		return

	if(style == "long")
		to_chat(user, span_userlove("You attach [src] to <b>\The [target]</b>'s [target_organ]."))
	else
		to_chat(user, span_userlove("You attach [src] to <b>\The [target]</b>'s [target_organ]."))

	playsound(target, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = TRUE


/obj/item/oviposition_egg/insert_item_organ(mob/living/carbon/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	if(!(target.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return

	if(!(CHECK_BITFIELD(target_organ.genital_flags, GENITAL_CAN_STUFF)))
		to_chat(user, span_warning("This genital can't be stuffed!"))
		return

	if(user == target)
		target.visible_message(span_warning("\The <b>[user]</b> is trying to insert an egg inside themselves!"),\
					span_warning("You try to insert an egg inside yourself!"))
	else
		target.visible_message(span_warning("\The <b>[user]</b> is trying to insert an egg inside \the <b>[target]</b>!"),\
					span_warning("\The <b>[user]</b> is trying to insert an egg inside you!"))

	if(!do_mob(user, target, 5 SECONDS))
		return

	if(!user.transferItemToLoc(src, target_organ))
		return

	to_chat(target, span_userlove("Your [target_organ] feels stuffed and stretched!"))

	playsound(target, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
