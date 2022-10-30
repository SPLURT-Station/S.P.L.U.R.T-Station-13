/obj/item/clothing/glasses/sunglasses/blindfold/web
	name = "web blindfold"
	item_flags = DROPDEL

/obj/item/clothing/glasses/sunglasses/blindfold/web/attack_hand(mob/user, act_intent, attackchain_flags)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_item_by_slot(ITEM_SLOT_EYES) == src)
			H.visible_message("<span class='danger'>[H] is trying to tear off [H.p_their()] [name]!</span>")
			to_chat(H,"<span class='warning'>You try to tear off your [name].</span>")
			if(!do_after(H, 3 SECONDS, TRUE, src))
				to_chat(H,"<span class='warning'>You fail to tear off your [name].</span>")
				return
			H.visible_message("<span class='danger'>[H] tears off [H.p_their()] [name]!</span>")
			to_chat(H,"<span class='warning'>You tear off your [name].</span>")
			playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
			src.Destroy()
			return
	. = ..()

/obj/item/clothing/glasses/sunglasses/blindfold/web/doStrip(mob/stripper, mob/owner)
	. = ..()
	playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
	src.Destroy()

/obj/item/clothing/mask/muzzle/web
	name = "web gag"
	item_flags = DROPDEL

/obj/item/clothing/mask/muzzle/web/attack_hand(mob/user, act_intent, attackchain_flags)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_item_by_slot(ITEM_SLOT_MASK) == src)
			H.visible_message("<span class='danger'>[H] is trying to tear off [H.p_their()] [name]!</span>")
			to_chat(H,"<span class='warning'>You try to tear off your [name].</span>")
			if(!do_after(H, 3 SECONDS, TRUE, src))
				to_chat(H,"<span class='warning'>You fail to tear off your [name].</span>")
				return
			H.visible_message("<span class='danger'>[H] tears off [H.p_their()] [name]!</span>")
			to_chat(H,"<span class='warning'>You tear off your [name].</span>")
			playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
			src.Destroy()
			return
	. = ..()

/obj/item/clothing/mask/muzzle/web/doStrip(mob/stripper, mob/owner)
	. = ..()
	playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
	src.Destroy()

/obj/item/clothing/shoes/web
	name = "cocoon"
	desc = "Part of a cocoon, looks like this covers the feet and legs. Not easy to get around in."
	body_parts_covered = FEET|LEGS
	can_be_tied = FALSE
	slowdown = 7
	item_flags = DROPDEL

/obj/item/clothing/shoes/web/attack_hand(mob/user, act_intent, attackchain_flags)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_item_by_slot(ITEM_SLOT_FEET) == src)
			H.visible_message("<span class='danger'>[H] is trying to tear off the cocoon covering [H.p_their()] legs!</span>")
			to_chat(H,"<span class='warning'>You try to tear off the cocoon covering your legs.</span>")
			if(!do_after(H, 5 SECONDS, TRUE, src))
				to_chat(H,"<span class='warning'>You fail to tear off your cocoon.</span>")
				return
			H.visible_message("<span class='danger'>[H] tears off the cocoon covering [H.p_their()] legs!</span>")
			to_chat(H,"<span class='warning'>You tear off your cocoon.</span>")
			slowdown = 0
			playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
			src.Destroy()
			return
	. = ..()

/obj/item/clothing/shoes/web/doStrip(mob/stripper, mob/owner)
	. = ..()
	playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
	src.Destroy()

/mob/living/carbon/human/Move(NewLoc, direct)
	if(istype(get_item_by_slot(ITEM_SLOT_FEET),/obj/item/clothing/shoes/web) && lying)
		to_chat(src, "<span class='danger'>Your cocoon is preventing you from moving!</span>")
		return FALSE
	. = ..()

/obj/item/clothing/suit/straight_jacket/web
	name = "cocoon"
	desc = "Part of a cocoon, looks like this covers the arms and chest. Tight and restrictive."
	body_parts_covered = CHEST|GROIN|ARMS|HANDS
	equip_delay_self = 0
	strip_delay = 40
	breakouttime = 5 SECONDS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAUR
	item_flags = DROPDEL

/obj/item/clothing/suit/straight_jacket/web/doStrip(mob/stripper, mob/owner)
	. = ..()
	playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
	src.Destroy()

/mob/living/carbon/human/do_resist()
	if(istype(get_item_by_slot(ITEM_SLOT_OCLOTHING),/obj/item/clothing/suit/straight_jacket/web))
		var/obj/item/clothing/suit/straight_jacket/web/S = get_item_by_slot(ITEM_SLOT_OCLOTHING)
		visible_message("<span class='danger'>[src] is trying to tear out of the cocoon covering [src.p_their()] body!</span>")
		to_chat(src,"<span class='warning'>You try to tear out of the cocoon covering your body.</span>")
		if(!do_after(src, 5 SECONDS, TRUE, S, required_mobility_flags = NONE))
			to_chat(src,"<span class='warning'>You fail to tear out of your cocoon.</span>")
			return
		visible_message("<span class='danger'>[src] tears out of the cocoon covering [src.p_their()] body!</span>")
		to_chat(src,"<span class='warning'>You tear out of your cocoon.</span>")
		playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
		S.Destroy()
		return
	. = ..()

/mob/living/carbon/human/resist_a_rest(automatic, ignoretimer)
	if(istype(get_item_by_slot(ITEM_SLOT_OCLOTHING),/obj/item/clothing/suit/straight_jacket/web))
		mobility_flags &= ~MOBILITY_RESIST
	. = ..()

/obj/item/clothing/head/web
	name = "cocoon"
	desc = "Part of a cocoon, looks like this covers the head. Still able to see though it, but barely."
	icon_state = "dephelmet"
	item_state = "dephelmet"
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/head/lewd_hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_hats.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_hats.dmi'
	mutantrace_variation = STYLE_MUZZLE
	lefthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_left.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_right.dmi'
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES|HEADCOVERSMOUTH
	body_parts_covered = HEAD|NECK
	tint = 2
	item_flags = DROPDEL

/obj/item/clothing/head/web/attack_hand(mob/user, act_intent, attackchain_flags)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_item_by_slot(ITEM_SLOT_HEAD) == src)
			H.visible_message("<span class='danger'>[H] is trying to tear off the cocoon covering [H.p_their()] head!</span>")
			to_chat(H,"<span class='warning'>You try to tear off the cocoon covering your head.</span>")
			if(!do_after(H, 5 SECONDS, TRUE, src))
				to_chat(H,"<span class='warning'>You fail to tear off your cocoon.</span>")
				return
			H.visible_message("<span class='danger'>[H] tears off the cocoon covering [H.p_their()] head!</span>")
			to_chat(H,"<span class='warning'>You tear off your cocoon.</span>")
			playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
			src.Destroy()
			return
	. = ..()

/obj/item/clothing/head/web/doStrip(mob/stripper, mob/owner)
	. = ..()
	playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
	src.Destroy()

/obj/item/restraints/handcuffs/web
	name = "web handcuffs"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "handcuff"
	item_state = "handcuff"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	flags_1 = NONE
	slot_flags = ITEM_SLOT_HANDCUFFED
	custom_materials = null
	breakouttime = 3 SECONDS
	item_flags = DROPDEL

/obj/item/restraints/handcuffs/web/dropped(mob/user, silent)
	playsound(src, 'sound/items/poster_ripped.ogg', 70, 1)
	. = ..()
