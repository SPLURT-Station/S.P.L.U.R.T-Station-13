///////////////
//Tools  Arms//
///////////////

/obj/item/organ/cyberimp/arm/toolset/advanced
	name = "advanced integrated toolset implant"
	desc = "A very advanced version of the regular toolset implant, has alien stuff!"
	contents = newlist(/obj/item/screwdriver/abductor,
					   /obj/item/wrench/abductor,
					   /obj/item/weldingtool/abductor,
					   /obj/item/crowbar/abductor,
					   /obj/item/wirecutters/abductor,
					   /obj/item/multitool/abductor,
					   /obj/item/analyzer/ranged)

/obj/item/organ/cyberimp/arm/toolset/advanced/emag_act()
	. = ..()
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	to_chat(usr, "<span class='notice'>You unlock [src]'s integrated dagger!</span>")
	items_list += new /obj/item/pen/edagger(src)
	return TRUE

/obj/item/organ/cyberimp/arm/surgery/advanced
	name = "advanced integrated surgical implant"
	desc = "A very advanced version of the regular surgical implant, has alien stuff!"
	contents = newlist(/obj/item/retractor/alien,
					   /obj/item/hemostat/alien,
					   /obj/item/cautery/alien,
					   /obj/item/surgicaldrill/alien,
					   /obj/item/scalpel/alien,
					   /obj/item/circular_saw/alien,
					   /obj/item/surgical_drapes)

/obj/item/organ/cyberimp/arm/surgery/emag_act()
	. = ..()
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	to_chat(usr, "<span class='notice'>You unlock [src]'s integrated dagger!</span>")
	items_list += new /obj/item/pen/edagger(src)
	return TRUE

//Hyper stuff
/obj/item/organ/cyberimp/arm/mblade
	name = "arm-mounted scytheblade"
	desc = "An extremely dangerous implant which can be used in a variety of ways. Mostly killing."
	contents = newlist(/obj/item/melee/mblade)

/obj/item/organ/cyberimp/arm/mblade/l
	zone = BODY_ZONE_L_ARM

/obj/item/melee/mblade
	name = "mounted scytheblade"
	desc = "An extremely dangerous implant which can be used in a variety of ways. Mostly killing."
	icon = 'modular_sand/icons/obj/items_and_weapons.dmi'
	icon_state = "mblade"
	item_state = "mblade"
	lefthand_file = 'modular_sand/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 45
	hitsound = 'sound/weapons/bladeslice.ogg'
	throwforce = 45
	block_chance = 70
	armour_penetration = 80
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_POINTY
	attack_verb = list("slashed", "cut")
