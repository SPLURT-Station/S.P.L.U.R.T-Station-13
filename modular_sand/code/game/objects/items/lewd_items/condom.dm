//Made by quotefox
//Really needs some work, mainly because condoms should be a container for semen, but I dont know how that works yet. Feel free to improve upon.

/obj/item/condom //TODO: fucking fix whatever the shit this it
	name 				= "condom"
	desc 				= "Dont be silly, cover your willy!"
	icon 				= 'modular_sand/icons/obj/condom.dmi'
	throwforce			= 0
	icon_state 			= "b_condom_wrapped"
	var/unwrapped			= 0
	w_class = WEIGHT_CLASS_TINY
obj/item/condom/Initialize()
	create_reagents(300, DRAWABLE|NO_REACT)
	..()

obj/item/condom/update_icon()
	switch(reagents.total_volume)
		if(0 to 49)
			icon_state = "b_condom_inflated"
		if(50 to 100)
			icon_state = "b_condom_inflated_med"
		if(101 to 249)
			icon_state = "b_condom_inflated_large"
		if(250 to 300)
			icon_state = "b_condom_inflated_huge"
	..()

/obj/item/condom/attack_self(mob/user) //Unwrap The Condom in hands
	if(!istype(user))
		return
	if(isliving(user))
		if(unwrapped == 0)
			icon_state 	= "b_condom"
			unwrapped = 1
			to_chat(user, "<span class='notice'>You unwrap the condom.</span>")
			playsound(user, 'sound/items/poster_ripped.ogg', 50, 1, -1)
			return
//		if(unwrapped == 1)
//			new /obj/item/clothing/head/condom(usr.loc)
//			qdel(src)
//			to_chat(user, "<span class='notice'>You roll the condom out.</span>")
//			playsound(user, 'sound/lewd/latex.ogg', 50, 1, -1)
//			return

/obj/item/condom/attack(mob/living/carbon/C, mob/living/user) //apply the johnny on another person or yourself

	if(unwrapped == 0 )
		to_chat(user, "<span class='notice'>You must remove the condom from the package first!</span>")
		return
	var/obj/item/organ/genital/penis/P
	if(C.has_penis(REQUIRE_EXPOSED))
		P = C.getorganslot(ORGAN_SLOT_PENIS)
		if(P.condom)
			to_chat(user, "<span class='notice'>They already have a condom on!</span>")
			return
		if(isliving(C) && isliving(user) && unwrapped == 1)
			C.visible_message("<span class='warning'>[user] is trying to put a condom on [C]!</span>",\
						"<span class='warning'>[user] is trying to put a condom on you!</span>")
		if(!do_mob(user, C, 4 SECONDS))	//if Failed to put the condom on
			return
		//var/mob/living/carbon/human/L = C
		playsound(C, 'modular_sand/sound/lewd/latex.ogg', 50, 1, -1)
		P.condom = TRUE //apply condom
		/*P.colourtint = "87ceeb" //We'll do this later
		if(L)
			L.update_genitals() // apply the colour!
		*/
		to_chat(C, "<span class='userlove'>Your penis feels more safe!</span>")
		qdel(src)

		return
	to_chat(user, "<span class='notice'>You can't find anywhere to put the condom on.</span>") //Trying to put it on something without/or with a hidden

/obj/item/clothing/head/condom //p
	name = "condom"
	icon = 'modular_sand/icons/obj/condom.dmi'
	desc = "Looks like someone had abit of some fun!"
	mob_overlay_icon = 'modular_sand/icons/obj/clothing/head.dmi'
	icon_state = "b_condom_out"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 5, "rad" = 0, "fire" = 0, "acid" = 0)


/* Handled on lewd interactions
/mob/living/carbon/human/proc/removecondom()

	var/obj/item/organ/genital/penis/P = getorganslot("penis")
	if(P.condom)
		new /obj/item/clothing/head/condom(usr.loc)
		P.condom = FALSE
		/*P.colourtint = ""
		update_genitals()*/
*/

/obj/item/condom/filled
	name 				= "filled condom"
	icon_state 			= "b_condom_inflated"
	unwrapped			= 2
	w_class = WEIGHT_CLASS_TINY

/obj/item/condom/filled/throw_impact(atom/hit_atom)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/condom/filled/proc/splat(atom/movable/hit_atom)
	if(isliving(loc))
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/semen(T)
	playsound(T, "sound/misc/splort", 50, TRUE)
	qdel(src)

/mob/living/carbon/human/proc/condomclimax()
	var/obj/item/condom/filled/C = new
	var/obj/item/organ/genital/penis/P = getorganslot(ORGAN_SLOT_PENIS)
	P.condom = FALSE
	C.loc = loc
	return C

	/*
	var/obj/item/condom/filled/C = new
	P.linked_organ.reagents.trans_to(C, P.linked_organ.reagents.total_volume)
	C.loc = loc
	P.condom = FALSE
	//P.colourtint = ""
	update_genitals()
	C.update_icon()
	to_chat(src, "<span class='love'>The condom bubbles outwards and fills with your cum.</span>")
	SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "orgasm", /datum/mood_event/orgasm)
	setArousalLoss(0)
	*/
