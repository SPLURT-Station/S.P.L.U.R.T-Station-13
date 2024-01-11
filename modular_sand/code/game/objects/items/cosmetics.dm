/obj/item/razor
	var/extended = 1

/obj/item/razor/proc/new_hairstyle(mob/living/carbon/human/H, mob/user, mirror)
	var/location = user.zone_selected
	if (H == user && !mirror)
		to_chat(user, span_warning("You need a mirror to properly style your own hair!"))
		balloon_alert(user, "need mirror!")
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	var/new_style = input(user, "Select a hair style", "Grooming")  as null|anything in GLOB.hair_styles_list
	if(!new_style)
		return
	if(!get_location_accessible(H, location))
		to_chat(user, span_warning("The headgear is in the way!"))
		balloon_alert(user, "headgear in the way!")
		return
	user.visible_message(span_notice("[user] tries to change [H]'s hairstyle using [src]."), span_notice("You try to change [H]'s hairstyle using [src]."))
	if(new_style && do_after(user, 6 SECONDS, H))
		user.visible_message(span_notice("[user] successfully changes [H]'s hairstyle using [src]."), span_notice("You successfully change [H]'s hairstyle using [src]."))
		H.balloon_alert(user, "changed hairstyle")
		H.hair_style = new_style
		H.update_hair()

/obj/item/razor/proc/new_facial_hairstyle(mob/living/carbon/human/H, mob/user, var/mirror)
	var/location = user.zone_selected
	if(H == user && !mirror)
		to_chat(user, span_warning("You need a mirror to properly style your own facial hair!"))
		balloon_alert(user, "need mirror!")
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	var/new_style = input(user, "Select a facial hair style", "Grooming")  as null|anything in GLOB.facial_hair_styles_list
	if(!new_style)
		return
	if(!get_location_accessible(H, location))
		to_chat(user, span_warning("The mask is in the way!"))
		balloon_alert(user, "mask in the way!")
		return
	user.visible_message(span_notice("[user] tries to change [H]'s facial hair style using [src]."), span_notice("You try to change [H]'s facial hair style using [src]."))
	if(new_style && do_after(user, 6 SECONDS, H))
		user.visible_message(span_notice("[user] successfully changes [H]'s facial hair style using [src]."), span_notice("You successfully change [H]'s facial hair style using [src]."))
		H.balloon_alert(user, "changed facial hair style")
		H.facial_hair_style = new_style
		H.update_hair()

/obj/item/razor/straightrazor
	name = "straight razor"
	icon = 'modular_sand/icons/obj/items_and_weapons.dmi'
	icon_state = "straightrazor"
	desc = "An incredibly sharp razor used to shave chins, make surgical incisions, and slit the throats of unpaying customers"
	flags_1 = CONDUCT_1
	force = 3
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 6
	hitsound = 'sound/weapons/genhit.ogg'
	attack_verb = list("stubbed", "poked")
	extended = 0
	var/extended_force = 17 //I decided to not add bleeding but because of that, but increased damage, wounds will kill the guy pretty quickly anyways
	var/extended_throwforce = 10
	var/extended_icon_state = "straightrazor_open"

/obj/item/razor/straightrazor/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] is slitting [user.p_their()] own throat with [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	return (BRUTELOSS)

/obj/item/razor/straightrazor/attack_self(mob/user)
	extended = !extended
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, 1)
	if(extended)
		force = extended_force
		w_class = WEIGHT_CLASS_SMALL //if it becomes normal you can decapitate a guy with a straight razor
		throwforce = extended_throwforce
		icon_state = extended_icon_state
		attack_verb = list("slashed", "stabbed", "sliced", "slit", "shaved", "diced", "cut")
		hitsound = 'sound/weapons/bladeslice.ogg'
		sharpness = SHARP_EDGED
		tool_behaviour = TOOL_SCALPEL
	else
		force = initial(force)
		w_class = WEIGHT_CLASS_TINY
		throwforce = initial(throwforce)
		icon_state = initial(icon_state)
		attack_verb = list("stubbed", "poked")
		hitsound = 'sound/weapons/genhit.ogg'
		sharpness = SHARP_NONE
		tool_behaviour = null

/obj/item/handmirror
	name = "hand mirror"
	desc = "A cheap plastic hand mirror. Useful for shaving and self-diagnoses"
	icon = 'modular_sand/icons/obj/items_and_weapons.dmi'
	icon_state = "handmirror"
	w_class = WEIGHT_CLASS_SMALL
	force = 2
	throwforce = 2
	throw_speed = 3
	throw_range = 6

/obj/item/handmirror/attack_self(mob/user)
	ADD_TRAIT(user, TRAIT_SELF_AWARE, "mirror_trait")
	to_chat(user, span_notice("You look into the mirror"))
	sleep(15 SECONDS)
	REMOVE_TRAIT(user, TRAIT_SELF_AWARE, "mirror_trait")
