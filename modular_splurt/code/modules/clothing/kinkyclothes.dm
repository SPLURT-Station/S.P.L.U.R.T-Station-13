//From Hyper
/obj/item/clothing/gloves/latexsleeves
	name = "latex sleeves"
	desc = "A pair of shiny latex sleeves that covers ones arms."
	icon_state = "latex"
	item_state = "latex"
	icon = 'modular_splurt/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/gloves.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/gloves/latexsleeves/security
	name = "security sleeves"
	desc = "A pair of latex sleeves, with a band of red above the elbows denoting that the wearer is part of the security team."
	icon_state = "latexsec"
	item_state = "latexsec"

/obj/item/clothing/head/dominatrixcap
	name = "dominatrix cap"
	desc = "A sign of authority, over the body."
	icon_state = "dominatrix"
	item_state = "dominatrix"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/head.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/shoes/highheels
	name = "high heels"
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
	name = "white boa"
	desc = "Fluffy neck wear to keep you warm, and attract others."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
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
	name = "fluffy half-crop jacket"
	desc = "A fluffy synthetic fur half-cropped jacket, less about warmth, more about style!"
	icon_state = "fluffy"
	item_state = "fluffy"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	body_parts_covered = CHEST|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	mutantrace_variation = NONE

/obj/item/clothing/under/centcomdress
	name = "CentCom Dress Uniform"
	desc = "A stylish yet revealing dress uniform worn in extravagant black and gold, worthy of those who sit around and watch cameras all day in an office."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "ccdress"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	item_state = "r_suit"
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	//We will never know why CC can make their skimpy outfits tough as nails
	body_parts_covered = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST|GROIN|ARMS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 60, "bullet" = 80, "laser" = 80, "energy" = 90, "bomb" = 50, "bio" = 100, "rad" = 51, "fire" = 50, "acid" = 50)

/obj/item/clothing/under/centcomdress/vk
	name = "Virginkiller CentCom Dress Uniform"
	desc = "This black and gold beauty does not help paperwork get done, it seems."
	icon_state = "ccdressvk"

/obj/item/clothing/under/raccveralls
	name = "form fitting overalls"
	desc = "A tight form fitting pair of overalls."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "raccveralls"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	item_state = "raccveralls"
	can_adjust = FALSE

/obj/item/clothing/under/officesexy
	name = "Revealing office uniform"
	desc = "A sexy office uniform, that has a low cropped front to show off some chest, or bra. And a tall dress that covers the stomach, complete with a set of buttons."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "office_revealing"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	item_state = "office_revealing"
	can_adjust = FALSE
	mutantrace_variation = NONE


/obj/item/clothing/under/vaultsuit
	name = "vault suit"
	desc = "A tight form fitting Vault-Tec standard issue Vault Jumpsuit! Snazzy!"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "vaultsuit"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	item_state = "b_suit"
	item_state = "b_suit"
	can_adjust = FALSE
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_ALL_TAURIC
	var/firstpickup = TRUE
	var/pickupsound = TRUE

/obj/item/clothing/under/vaultsuit/no_sound
	pickupsound = FALSE

/obj/item/clothing/under/vaultsuit/equipped(mob/user, slot)
	. = ..()
	if(!pickupsound)
		return
	if(!ishuman(user))
		return
	if(slot == ITEM_SLOT_ICLOTHING)
		if(!firstpickup)
			SEND_SOUND(user, sound('modular_splurt/sound/effects/vaultsuit/FalloutEXPUp.ogg', volume = 50))
		else
			firstpickup = FALSE
			SEND_SOUND(user, sound('modular_splurt/sound/effects/vaultsuit/FalloutLevelUp.ogg', volume = 50))
			SEND_SOUND(user, sound('modular_splurt/sound/effects/vaultsuit/InkSpotsSting.ogg', volume = 60))
	return

/obj/item/clothing/suit/toggle/tunnelfox
	name = "tunnel fox jacket"
	desc = "Tunnel Foxes Rule!"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	icon_state = "tunnelfox"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	item_state = "tunnelfox"
	body_parts_covered = CHEST|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	togglename = "buttons"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
