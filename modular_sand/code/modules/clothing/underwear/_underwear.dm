//Fuck it we making underwear actual items
/obj/item/clothing/underwear
	name = "Underwear"
	desc = "If you're reading this, something went wrong."
	icon = 'modular_sand/icons/mob/clothing/underwear.dmi' //if someone is willing to make proper inventory sprites that'd be very cash money
	mob_overlay_icon = 'modular_sand/icons/mob/clothing/underwear.dmi'
	anthro_mob_worn_overlay = 'modular_sand/icons/mob/clothing/underwear_digi.dmi'
	body_parts_covered = GROIN
	permeability_coefficient = 0.9
	block_priority = BLOCK_PRIORITY_UNDERWEAR
	slot_flags = ITEM_SLOT_UNDERWEAR
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	mutantrace_variation = STYLE_DIGITIGRADE
	w_class = WEIGHT_CLASS_SMALL
	var/under_type = /obj/item/clothing/underwear //i don't know what i'm gonna use this for
	var/fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/underwear/Move()
	..()
	setDir(SOUTH) //should prevent underwear from facing any direction but south while on the floor, uses same code as pipes, PLEASE, THIS IS A BAD SOLUTION, SOMEONE MAKE ME UNDERWEAR SPRITES ASAP

///Proc to check if undershirt is hidden.
/mob/living/carbon/human/proc/undershirt_hidden()
	for(var/obj/item/I in list(w_uniform, wear_suit))
		if(istype(I) && ((I.body_parts_covered & CHEST) || (I.flags_inv & HIDEUNDERWEAR)))
			return TRUE
	return FALSE

///Proc to check if underwear is hidden.
/mob/living/carbon/human/proc/underwear_hidden()
	for(var/obj/item/I in list(w_uniform, wear_suit))
		if(istype(I) && ((I.body_parts_covered & GROIN) || (I.flags_inv & HIDEUNDERWEAR)))
			return TRUE
	return FALSE

///Proc to check if socks are hidden.
/mob/living/carbon/human/proc/socks_hidden()
	for(var/obj/item/I in list(shoes, wear_suit))
		if(istype(I) && ((I.body_parts_covered & FEET) || (I.flags_inv & HIDEUNDERWEAR)))
			return TRUE
	return FALSE
