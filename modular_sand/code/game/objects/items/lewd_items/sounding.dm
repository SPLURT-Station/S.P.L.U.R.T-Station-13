/obj/item/sounding //TODO probably fix this shit as well
	name 				= "sounding rod"
	desc 				= "Dont be silly, stuff your willy!"
	icon 				= 'modular_sand/icons/obj/sounding.dmi'
	throwforce			= 0
	icon_state 			= "sounding_wrapped"
	var/unwrapped			= 0
	w_class = WEIGHT_CLASS_TINY

/obj/item/sounding/attack_self(mob/user)
	if(!istype(user))
		return
	if(isliving(user))
		if(unwrapped == 0)
			icon_state 	= "sounding_rod"
			unwrapped = 1
			to_chat(user, "<span class='notice'>You unwrap the rod.</span>")
			playsound(user, 'sound/items/poster_ripped.ogg', 50, 1, -1)
			return

/obj/item/sounding/attack(mob/living/carbon/C, mob/living/user)

	if(unwrapped == 0 )
		to_chat(user, "<span class='notice'>You must remove the rod from the package first!</span>")
		return
	var/obj/item/organ/genital/penis/P = C.getorganslot("penis")
	if(C.has_penis(REQUIRE_EXPOSED))
		if(P.sounding)
			to_chat(user, "<span class='notice'>They already have a rod inside!</span>")
			return
		if(isliving(C) && isliving(user) && unwrapped == 1)
			C.visible_message("<span class='warning'>[user] is trying to insert a rod inside [C]!</span>",\
						"<span class='warning'>[user] is trying to insert a rod inside you!</span>")
		if(!do_mob(user, C, 4 SECONDS))
			return
		playsound(C, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
		P.sounding = 1
		to_chat(C, "<span class='userlove'>Your penis feels stuffed and stretched!</span>")
		qdel(src)

		return
	to_chat(user, "<span class='notice'>You can't find anywhere to put the rod inside.</span>")

/mob/living/carbon/human/proc/removesounding()

	var/obj/item/organ/genital/penis/P = src.getorganslot("penis")
	if(P.sounding)
		new /obj/item/sounding/used_sounding(usr.loc)
		to_chat(src, "The rod falls off from your penis.")
		P.sounding = 0

/obj/item/sounding/used_sounding
	name 				= "sounding rod"
	icon_state 			= "sounding_rod"
	unwrapped			= 2
	w_class = WEIGHT_CLASS_TINY
/*
/mob/living/carbon/human/proc/soundingclimax()

	var/obj/item/organ/genital/penis/P = src.getorganslot("penis")
	if(P.sounding)
		new /obj/item/sounding/used_sounding(usr.loc)
		P.sounding = 0
*/
