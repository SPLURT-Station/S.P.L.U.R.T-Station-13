/obj/item/clothing/under/suit/tuxedo
	name = "tuxedo"
	desc = "A formal black tuxedo. It exudes classiness."
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'
	icon_state = "tuxedo"
	can_adjust = FALSE

/obj/item/clothing/under/suit/carpskin
	name = "carpskin suit"
	desc = "An luxurious suit made with only the finest scales, perfect for conducting dodgy business deals."
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'
	icon_state = "carpskin_suit"

/obj/item/clothing/under/suit/pencil
	name = "black pencilskirt"
	desc = "A clean white shirt with a tight-fitting black pencilskirt."
	icon_state = "black_pencil"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'

/obj/item/clothing/under/suit/pencil/black_really
	name = "executive pencilskirt"
	desc = "A sleek suit with a tight-fitting black pencilskirt."
	icon_state = "really_black_pencil"

/obj/item/clothing/under/suit/pencil/charcoal
	name = "charcoal pencilskirt"
	desc = "A clean white shirt with a tight-fitting charcoal pencilskirt."
	icon_state = "charcoal_pencil"

/obj/item/clothing/under/suit/pencil/navy
	name = "navy pencilskirt"
	desc = "A clean white shirt with a tight-fitting navy-blue pencilskirt."
	icon_state = "navy_pencil"

/obj/item/clothing/under/suit/pencil/burgandy
	name = "burgandy pencilskirt"
	desc = "A clean white shirt with a tight-fitting burgandy-red pencilskirt."
	icon_state = "burgandy_pencil"

/obj/item/clothing/under/suit/pencil/checkered
	name = "checkered pencilskirt"
	desc = "A clean white shirt with a tight-fitting grey checkered pencilskirt."
	icon_state = "checkered_pencil"

/obj/item/clothing/under/suit/pencil/tan
	name = "tan pencilskirt"
	desc = "A clean white shirt with a tight-fitting tan pencilskirt."
	icon_state = "tan_pencil"

/obj/item/clothing/under/suit/pencil/green
	name = "green pencilskirt"
	desc = "A clean white shirt with a tight-fitting green pencilskirt."
	icon_state = "green_pencil"

/obj/item/clothing/under/suit/scarface
	name = "cuban suit"
	desc = "A yayo coloured silk suit with a crimson shirt. You just know how to hide, how to lie. Me, I don't have that problem. Me, I always tell the truth. Even when I lie."
	icon_state = "scarface"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'

/obj/item/clothing/under/suit/black_really_collared
	name = "wide-collared executive suit"
	desc = "A formal black suit with the collar worn wide, intended for the station's finest."
	icon_state = "really_black_suit_collar"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'

/obj/item/clothing/under/suit/black_really_collared/skirt
	name = "wide-collared executive suitskirt"
	desc = "A formal black suit with the collar worn wide, intended for the station's finest."
	icon_state = "really_black_suit_skirt_collar"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'
	body_parts_covered = CHEST|GROIN|ARMS
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/suit/inferno
	name = "inferno suit"
	desc = "Stylish enough to impress the devil."
	obj_flags = UNIQUE_RENAME
	icon_state = "lucifer"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'
	unique_reskin = list(
		"Pride" = list("icon_state" = "lucifer"),
		"Wrath" = list("icon_state" = "justice"),
		"Gluttony" = list("icon_state" = "malina"),
		"Envy" = list("icon_state" = "zdara"),
		"Vanity" = list("icon_state" = "cereberus"),
	)

/obj/item/clothing/under/suit/inferno/skirt
	name = "inferno suitskirt"
	icon_state = "modeus"
	unique_reskin = list(
		"Lust" = list("icon_state" = "modeus"),
		"Sloth" = list("icon_state" = "pande"),
	)

/obj/item/clothing/under/suit/inferno/beeze
	name = "designer inferno suit"
	desc = "A fancy tail-coated suit with a fluffy bow emblazoned on the chest, complete with an NT pin."
	icon_state = "beeze"
	obj_flags = NONE
	unique_reskin = null

/obj/item/clothing/under/suit/helltaker
	name = "red shirt with white pants"
	desc = "No time. Busy gathering girls."
	icon_state = "helltaker"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'

/obj/item/clothing/under/suit/helltaker/skirt
	name = "red shirt with white skirt"
	desc = "No time. Busy gathering boys."
	icon_state = "helltakerskirt"

/obj/item/clothing/under/suit/error
	name = "error suit"
	desc = "Oops! Seems whoever made this suit forgot to download the base cloth for it!"
	icon = 'modular_splurt/icons/obj/clothing/under/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/under/suits.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/under/suits_digi.dmi'
	icon_state = "error_suit"

