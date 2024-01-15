//Made by quotefox
//Really needs some work, mainly because condoms should be a container for semen, but I dont know how that works yet. Feel free to improve upon.

/obj/item/genital_equipment/condom //TODO: fucking fix whatever the shit this it
	name 				= "condom"
	desc 				= "Dont be silly, cover your willy!"
	icon 				= 'modular_splurt/icons/obj/condom.dmi'
	throwforce			= 0
	icon_state 			= "b_condom_wrapped"
	var/unwrapped		= 0
	w_class 			= WEIGHT_CLASS_TINY
	custom_price		= PRICE_CHEAP_AS_FREE // 10 credits
	genital_slot 		= ORGAN_SLOT_PENIS

/obj/item/genital_equipment/condom/Initialize()
	create_reagents(300, DRAWABLE|NO_REACT)
	. = ..()

/obj/item/genital_equipment/condom/item_inserting(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	if(!(G.owner.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	if(!unwrapped)
		to_chat(user, span_notice("You must remove the condom from the package first!"))
		return FALSE

	if(!G.owner.has_penis() == HAS_EXPOSED_GENITAL)
		to_chat(user, span_notice("You can't find anywhere to put the condom!"))
		return FALSE

	if(locate(src.type) in G.contents)
		to_chat(user, span_notice("\The <b>[G.owner]</b> is already wearing a condom!"))
		return FALSE

	G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to put a condom on \the <b>[G.owner]</b>!"),\
						span_warning("\The <b>[user]</b> is trying to put a condom on you!"))

	if(!do_mob(user, G.owner, 4 SECONDS))
		return FALSE

/obj/item/genital_equipment/condom/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	playsound(G.owner, 'modular_sand/sound/lewd/latex.ogg', 50, 1, -1)
	to_chat(G.owner, span_userlove("Your penis feels more safe!"))

/obj/item/genital_equipment/condom/update_icon()
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

/obj/item/genital_equipment/condom/on_reagent_change()
	update_icon()

/obj/item/genital_equipment/condom/attack_self(mob/user) //Unwrap The Condom in hands
	if(!istype(user))
		return
	if(isliving(user))
		if(unwrapped == 0)
			icon_state 	= "b_condom"
			unwrapped = 1
			to_chat(user, span_notice("You unwrap the condom."))
			playsound(user, 'sound/items/poster_ripped.ogg', 50, 1, -1)
			return

/obj/item/genital_equipment/condom/throw_impact(atom/hit_atom)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/genital_equipment/condom/proc/splat(atom/movable/hit_atom)
	if(isliving(loc))
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/semen(T)
	playsound(T, 'sound/misc/splort.ogg', 50, TRUE)
	qdel(src)

/obj/item/clothing/head/condom //p
	name = "condom"
	icon = 'modular_splurt/icons/obj/condom.dmi'
	desc = "Looks like someone had abit of some fun!"
	mob_overlay_icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	icon_state = "b_condom_out"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 5, "rad" = 0, "fire" = 0, "acid" = 0)
