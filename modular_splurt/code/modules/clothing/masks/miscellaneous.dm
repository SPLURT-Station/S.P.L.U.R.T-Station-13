//Main code edits
/obj/item/clothing/mask/muzzle/attack_hand(mob/user, act_intent, attackchain_flags)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.wear_mask)
			to_chat(user, "<span class='warning'>You need help taking this off!</span>")
			return
	..()

//Own stuff
/obj/item/clothing/mask/rat/kitsune
	name = "kitsune mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a mythical kitsune."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	icon_state = "kitsune"
	item_state = "kitsune"


/obj/item/clothing/glasses/hud/blueshield
	name = "blueshield HUD glasses"
	desc = "A hud with multiple functions."
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
	desc = "A hud with multiple functions. More stylish."
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
	desc = "A hud with multiple functions. More stylish. Equipped with prescription lenses."
	vision_correction = 1

/obj/item/clothing/glasses/hud/blueshield/prescription
	name = "prescription blueshield HUD"
	desc = "A hud with multiple functions. Equipped with prescription lenses."
	vision_correction = 1

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

/obj/item/clothing/glasses/hud/security/sunglasses/aviators
	name = "secuirity HUD aviators"
	desc = "aviators with a security HUD."
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	icon_state = "aviator_sec"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'


/obj/item/clothing/glasses/hud/security/sunglasses/aviators/prescription
	name = "prescription secuirity HUD aviators"
	desc = "aviators with a security HUD with prescription lenses."
	vision_correction = 1

/obj/item/clothing/glasses/aviators
	name = "aviators"
	desc = "Strangely fasionable ancient technology used to help provide rudimentary eye cover. Enhanced shielding blocks flashes."
	icon = 'modular_splurt/icons/obj/clothing/glasses.dmi'
	icon_state = "aviator"
	mob_overlay_icon = 'modular_splurt/icons/mobs/eyes.dmi'
	darkness_view = 1
	flash_protect = 1
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray


/obj/item/clothing/mask/gas/cbrn
	name = "CBRN gas mask"
	desc = "Chemical, Biological, Radiological and Nuclear. A heavy duty gas mask design to be worn in hazardus enviorments. Acutally works like a gas mask as well as can be connected to intenral air supply."
	item_state = "gas_cbrn"
	icon_state = "gas_cbrn"
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	gas_transfer_coefficient = 0.5
	permeability_coefficient = 0.5
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = ACID_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	mutantrace_variation = STYLE_MUZZLE
	visor_flags_inv = 0
	flavor_adjust = FALSE
	armor = list("melee" = 5, "bullet" = 0, "laser" = 5,"energy" = 5, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100)

/obj/item/clothing/mask/gas/cbrn/mopp
	name = "MOPP gas mask"
	desc = "Mission Oriented Protective Posture. A heavy duty gas mask design to be worn in hazardus combat enviorments. Acutally works like a gas mask as well as can be connected to intenral air supply."
	item_state = "gas_mopp"
	icon_state = "gas_mopp"
	armor = list("melee" = 10, "bullet" = 5, "laser" = 10,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100)

/obj/item/clothing/mask/gas/cbrn/mopp/advance
	name = "advance MOPP gas mask"
	desc = "Mission Oriented Protective Posture. A heavy duty gas mask design to be worn in hazardus combat enviorments. Acutally works like a gas mask as well as can be connected to intenral air supply. Used by Centcom Staff and ERT teams."
	armor = list("melee" = 20, "bullet" = 10, "laser" = 20,"energy" = 20, "bomb" = 20, "bio" = 110, "rad" = 110, "fire" = 50, "acid" = 110)



//research nods

/datum/design/cbrn/cbrnmask
	name = "CBRN Mask"
	desc = "A CBRN mask."
	id = "cbrn_mask"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/mask/gas/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cbrn/moppmask
	name = "MOPP Mask"
	desc = "A MOPP mask."
	id = "mopp_mask"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/mask/gas/cbrn/mopp
	category = list("Armor")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/clothing/mask/muzzle/ballgag
	name = "ball gag"
	desc = "To stop that awful noise, but lewder."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "ballgag"
	item_state = "ballgag"
