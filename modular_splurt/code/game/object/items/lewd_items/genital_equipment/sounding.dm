/obj/item/genital_equipment/sounding //TODO probably fix this shit as well
	name 				= "sounding rod"
	desc 				= "Dont be silly, stuff your willy!"
	icon 				= 'modular_splurt/icons/obj/sounding.dmi'
	throwforce			= 0
	icon_state 			= "sounding_wrapped"
	var/unwrapped		= 0
	equipment_slot 		= GENITAL_EQUIPMENT_SOUNDING
	w_class 			= WEIGHT_CLASS_TINY

/obj/item/genital_equipment/sounding/attack_self(mob/user)
	if(!istype(user))
		return
	if(isliving(user))
		if(unwrapped == 0)
			icon_state 	= "sounding_rod"
			unwrapped = 1
			to_chat(user, "<span class='notice'>You unwrap the rod.</span>")
			playsound(user, 'sound/items/poster_ripped.ogg', 50, 1, -1)
			return

/obj/item/genital_equipment/sounding/attack(mob/living/carbon/C, mob/living/user)

	if(unwrapped == 0 )
		to_chat(user, "<span class='notice'>You must remove the rod from the package first!</span>")
		return
	var/obj/item/organ/genital/penis/P = C.getorganslot(ORGAN_SLOT_PENIS)
	if(C.has_penis(REQUIRE_EXPOSED) && (P?.genital_flags & HAS_EQUIPMENT))
		if(P.equipment[GENITAL_EQUIPMENT_SOUNDING])
			to_chat(user, "<span class='notice'><b>\The [C]</b> already has a rod inside!</span>")
			return
		if(isliving(C) && isliving(user) && unwrapped == 1)
			C.visible_message("<span class='warning'><b>\The [user]</b> is trying to insert a rod inside <b>\The [C]</b>!</span>",\
						"<span class='warning'><b>\The [user]</b> is trying to insert a rod inside you!</span>")
		if(!do_mob(user, C, 4 SECONDS))
			return
		if(!user.transferItemToLoc(src, P)) //check if you can put it in
			return
		playsound(C, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
		P.equipment[GENITAL_EQUIPMENT_SOUNDING] = src

		to_chat(C, "<span class='userlove'>Your penis feels stuffed and stretched!</span>")
		owner = C

		return
	to_chat(user, "<span class='notice'>You can't find anywhere to put the rod inside.</span>")

/obj/item/genital_equipment/sounding/genital_remove_proccess(var/obj/item/organ/genital/G)
	if(!G.equipment[GENITAL_EQUIPMENT_SOUNDING])
		return
	new /obj/item/genital_equipment/sounding/used_sounding(owner.loc)
	G.equipment.Remove(GENITAL_EQUIPMENT_SOUNDING)
	. = ..()
	qdel(src)

/*
/mob/living/carbon/human/proc/removesounding()

	var/obj/item/organ/genital/penis/P = getorganslot("penis")
	if(P.equipment[GENITAL_EQUIPMENT_SOUNDING])
		P.equipment.Remove(GENITAL_EQUIPMENT_SOUNDING)
		new /obj/item/genital_equipment/sounding/used_sounding(loc)
		to_chat(src, "<span class='lewd'>The rod falls off from your penis.</span>")
*/
/obj/item/genital_equipment/sounding/used_sounding
	name 				= "sounding rod"
	icon_state 			= "sounding_rod"
	unwrapped			= 2
	w_class = WEIGHT_CLASS_TINY
/*
/mob/living/carbon/human/proc/soundingclimax()

	var/obj/item/organ/genital/penis/P = src.getorganslot("penis")
	if(P.sounding)
		new /obj/item/genital_equipment/sounding/used_sounding(usr.loc)
		P.sounding = 0
*/
