//From Hyper
/obj/item/clothing/gloves/latexsleeves
	name = "latex sleeves (Hyper)"
	desc = "A pair of shiny latex sleeves that covers ones arms."
	icon_state = "latex"
	item_state = "latex"
	icon = 'modular_splurt/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/gloves.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/gloves/latexsleeves/security
	name = "security sleeves (Hyper)"
	desc = "A pair of latex sleeves, with a band of red above the elbows denoting that the wearer is part of the security team."
	icon_state = "latexsec"
	item_state = "latexsec"

/obj/item/clothing/head/dominatrixcap
	name = "dominatrix cap (Hyper)"
	desc = "A sign of authority, over the body."
	icon_state = "dominatrix"
	item_state = "dominatrix"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/head.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/shoes/highheels
	name = "high heels (Hyper)"
	desc = "They make the wearer appear taller, and more noisey!"
	icon_state = "highheels"
	item_state = "highheels"
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/feet.dmi'


/obj/item/clothing/shoes/highheels/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/effects/footstep/highheel1.ogg' = 1,'modular_splurt/sound/effects/footstep/highheel2.ogg' = 1), 20)
//the classic click clack

/obj/item/clothing/neck/stole
	name = "white boa (Hyper)"
	desc = "Fluffy neck wear to keep you warm, and attract others."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "stole"
	item_state = ""	//no inhands

/obj/item/clothing/neck/stole/black
	name = "black boa"
	desc = "Fluffy neck wear to keep you warm, and attract others."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "stole"
	item_state = ""	//no inhands
	color = "#3d3d3d"

/obj/item/clothing/suit/fluffyhalfcrop
	name = "fluffy half-crop jacket (Hyper)"
	desc = "A fluffy synthetic fur half-cropped jacket, less about warmth, more about style!"
	icon_state = "fluffy"
	item_state = "fluffy"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	body_parts_covered = CHEST|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	mutantrace_variation = NONE

/obj/item/clothing/under/centcomdress
	name = "Centcom Dress Uniform (Hyper)"
	desc = "A stylish yet revealing dress uniform worn in extravagent black and gold, worthy of those who sit around and watch cameras all day in an office."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	icon_state = "ccdress"
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	item_state = "r_suit"
	can_adjust = FALSE
	//We will never know why CC can make their skimpy outfits tough as nails
	body_parts_covered = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST|GROIN|ARMS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 60, "bullet" = 80, "laser" = 80, "energy" = 90, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 50)

/obj/item/clothing/under/centcomdressvk
	name = "Virginkiller Centcom Dress Uniform (Hyper)"
	desc = "This black and gold beauty does not help paperwork get done, it seems."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	icon_state = "ccdressvk"
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	item_state = "r_suit"
	can_adjust = FALSE
	//We will never know why CC can make their skimpy outfits tough as nails
	body_parts_covered = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST|GROIN|ARMS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 60, "bullet" = 80, "laser" = 80, "energy" = 90, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 50)
