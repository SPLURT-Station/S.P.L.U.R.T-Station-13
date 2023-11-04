// Blueshield HUDs

/obj/item/clothing/glasses/hud/blueshield
	name = "blueshield HUD glasses"
	desc = "A HUD with multiple functions."
	actions_types = list(/datum/action/item_action/switch_hud)
	icon_state = "sunhudmed"
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes.dmi'
	flash_protect = 1

/obj/item/clothing/glasses/hud/blueshield/attack_self(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src)
		return

	if (hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.remove_hud_from(user)

	if (hud_type == DATA_HUD_MEDICAL_ADVANCED)
		hud_type = null
		icon_state = "sun"
	else if (hud_type == DATA_HUD_SECURITY_ADVANCED)
		hud_type = DATA_HUD_MEDICAL_ADVANCED
		icon_state = "sunhudmed"
	else
		hud_type = DATA_HUD_SECURITY_ADVANCED
		icon_state = "sunhudsec"

	if (hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.add_hud_to(user)

/obj/item/clothing/glasses/hud/blueshield/aviators
	name = "blueshield HUD Aviators"
	desc = "A HUD with multiple functions. More stylish."
	actions_types = list(/datum/action/item_action/switch_hud)
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	icon_state = "aviator_med"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'
	flash_protect = 1

/obj/item/clothing/glasses/hud/blueshield/aviators/attack_self(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src)
		return

	if (hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.remove_hud_from(user)

	if (hud_type == DATA_HUD_MEDICAL_ADVANCED)
		hud_type = null
		icon_state = "aviator"
	else if (hud_type == DATA_HUD_SECURITY_ADVANCED)
		hud_type = DATA_HUD_MEDICAL_ADVANCED
		icon_state = "aviator_med"
		glass_colour_type = /datum/client_colour/glass_colour/blue
	else
		hud_type = DATA_HUD_SECURITY_ADVANCED
		icon_state = "aviator_sec"
		glass_colour_type = /datum/client_colour/glass_colour/red

	if (hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.add_hud_to(user)

/obj/item/clothing/glasses/hud/blueshield/aviators/prescription
	name = "prescription blueshield HUD Aviators"
	desc = "A HUD with multiple functions. More stylish. Equipped with prescription lenses."
	vision_correction = 1

/obj/item/clothing/glasses/hud/blueshield/prescription
	name = "prescription blueshield HUD"
	desc = "A HUD with multiple functions. Equipped with prescription lenses."
	vision_correction = 1

/obj/item/clothing/glasses/hud/blueshield/holo
	name = "holo blueshield HUD glasses"
	desc = "A HUD with multiple functions. Nearly invisible when worn. Still protects from flashes."
	actions_types = list(/datum/action/item_action/switch_hud)
	icon_state = "holohudmed"
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	item_state = "holo"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'
	flash_protect = 1

/obj/item/clothing/glasses/hud/blueshield/holo/attack_self(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src)
		return

	if (hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.remove_hud_from(user)

	if (hud_type == DATA_HUD_MEDICAL_ADVANCED)
		hud_type = null
		icon_state = "holohud"
	else if (hud_type == DATA_HUD_SECURITY_ADVANCED)
		hud_type = DATA_HUD_MEDICAL_ADVANCED
		icon_state = "holohudmed"
	else
		hud_type = DATA_HUD_SECURITY_ADVANCED
		icon_state = "holohudsec"

	if (hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.add_hud_to(user)

/obj/item/clothing/glasses/hud/blueshield/holo/prescription
	name = "prescription holo blueshield HUD glasses"
	desc = "A HUD with multiple functions. Nearly invisible when worn. Equipped with prescription lenses."
	vision_correction = 1

// Med HUDs

/obj/item/clothing/glasses/hud/health/sunglasses/aviators
	name = "medical HUDS aviators"
	desc = "Aviators with a medical HUD."
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	icon_state = "aviator_med"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'

/obj/item/clothing/glasses/hud/health/sunglasses/aviators/prescription
	name = "prescription medical HUDS aviators"
	desc = "Aviators with a medical HUD. Equipped with prescription lenses"
	vision_correction = 1

// Sec HUDs

/obj/item/clothing/glasses/hud/security/sunglasses/aviators
	name = "security HUD aviators"
	desc = "aviators with a security HUD."
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	icon_state = "aviator_sec"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'

/obj/item/clothing/glasses/hud/security/sunglasses/aviators/prescription
	name = "prescription security HUD aviators"
	desc = "aviators with a security HUD with prescription lenses."
	vision_correction = 1

/obj/item/clothing/glasses/hud/security/sunglasses/holo
	name = "holo security HUD glasses"
	desc = "Sunglasses with a security HUD. Nearly invisible when worn."
	icon_state = "holohudsec"
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	item_state = "holo"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'

/obj/item/clothing/glasses/hud/security/sunglasses/holo/prescription
	name = "prescription holo security HUD glasses"
	desc = "Sunglasses with a security HUD. Nearly invisible when worn. Equipped with prescription lenses."
	vision_correction = 1

// Diag HUDs

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators
	name = "diagnostic HUD aviators"
	desc = "aviators with a diagnostic HUD."
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	icon_state = "aviator_diag"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators/prescription
	name = "prescription diagnostic HUD aviators"
	desc = "aviators with a diagnostic HUD with prescription lenses."
	vision_correction = 1
