//Radiation
/obj/item/clothing/head/helmet/space/rad
	unique_reskin = list(
		"Default" = list(
			"name" = "radiation voidsuit helmet",
			"desc" = "A special helmet that protects against radiation and space. Not much else unfortunately.",
			"icon" = 'icons/obj/clothing/hats.dmi',
			"icon_state" = "cespace_helmet",
			"mob_overlay_icon" = null,
			"anthro_mob_worn_overlay" = null
		),
		"Hazard" = list(
			"name" = "Hazard helmet",
			"desc" = "The helmet that completes the hazard suit, stop looking at this and bring the company profits.",
			"icon" = 'modular_sand/icons/obj/clothing/hats.dmi',
			"icon_state" = "lethalhelmet",
			"mob_overlay_icon" = 'modular_sand/icons/mob/clothing/head.dmi',
			"anthro_mob_worn_overlay" = 'modular_sand/icons/mob/clothing/head_muzzled.dmi'
		)
	)

/obj/item/clothing/head/helmet/space/rad/reskin_obj(mob/user)
	. = ..()
	if(user.get_item_by_slot(ITEM_SLOT_HEAD) == src)
		user.update_inv_head()

/obj/item/clothing/suit/space/rad
	unique_reskin = list(
		"Default" = list(
			"name" = "radiation voidsuit",
			"desc" = "A special suit that protects against radiation and space. Not much else unfortunately.",
			"icon" = 'icons/obj/clothing/suits.dmi',
			"icon_state" = "hardsuit-rad",
			"mob_overlay_icon" = null,
			"anthro_mob_worn_overlay" = null,
			"mutantrace_variation" = NONE
		),
		"Hazard" = list(
			"name" = "Hazard suit",
			"desc" = "A suit fit for the company workers, radiation and space-proof, now get moving before you get fired for your laziness.",
			"icon" = 'modular_sand/icons/obj/clothing/suits.dmi',
			"icon_state" = "lethalsuit",
			"mob_overlay_icon" = 'modular_sand/icons/mob/clothing/suit.dmi',
			"anthro_mob_worn_overlay" = 'modular_sand/icons/mob/clothing/suit_digi.dmi',
			"mutantrace_variation" = STYLE_DIGITIGRADE
		)
	)

/obj/item/clothing/suit/space/rad/reskin_obj(mob/user)
	. = ..()
	if(user.get_item_by_slot(ITEM_SLOT_OCLOTHING) == src)
		user.update_inv_wear_suit()
