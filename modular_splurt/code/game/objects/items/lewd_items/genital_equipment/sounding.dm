/obj/item/genital_equipment/sounding //TODO probably fix this shit as well
	name 				= "sounding rod"
	desc 				= "Dont be silly, stuff your willy!"
	icon 				= 'modular_splurt/icons/obj/sounding.dmi'
	throwforce			= 0
	icon_state 			= "sounding_wrapped"
	var/unwrapped		= 0
	w_class 			= WEIGHT_CLASS_TINY
	genital_slot 		= ORGAN_SLOT_PENIS

/obj/item/genital_equipment/sounding/attack_self(mob/user)
	if(!istype(user))
		return
	if(isliving(user))
		if(unwrapped == 0)
			icon_state 	= "sounding_rod"
			unwrapped = 1
			to_chat(user, span_notice("You unwrap the rod."))
			playsound(user, 'sound/items/poster_ripped.ogg', 50, 1, -1)
			return

/obj/item/genital_equipment/sounding/item_inserting(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	if(!(G.owner.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	if(!unwrapped)
		to_chat(user, span_notice("You must remove the rod from the package first!"))
		return FALSE

	if(!G.owner.has_penis() == HAS_EXPOSED_GENITAL)
		to_chat(user, span_notice("You can't find anywhere to put the rod!"))
		return

	if(locate(src.type) in G.contents)
		if(user == G.owner)
			to_chat(user, span_notice("You already have a rod inside your [G]!"))
		else
			to_chat(user, span_notice("\The <b>[G.owner]</b>'s [G] already has a rod inside!"))
		return FALSE

	if(user == G.owner)
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert a rod inside themselves!"),\
						span_warning("You try to insert a rod inside yourself!"))
	else
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert a rod inside \the <b>[G.owner]</b>!"),\
						span_warning("\The <b>[user]</b> is trying to insert a rod inside you!"))

	if(!do_mob(user, G.owner, 4 SECONDS))
		return FALSE


/obj/item/genital_equipment/sounding/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	to_chat(G.owner, span_userlove("Your penis feels stuffed and stretched!"))
