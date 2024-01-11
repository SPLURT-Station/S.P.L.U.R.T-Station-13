/obj/machinery/limbgrower/Initialize(mapload)
	var/list/extra_cat = list(
		"shadekin",
		"teshari",
		"vox"
	)
	LAZYADD(categories, extra_cat)
	. = ..()

/datum/species/mammal/shadekin
	limbs_id = SPECIES_SHADEKIN
	icon_limbs = 'modular_splurt/icons/mob/human_parts_greyscale.dmi'

/datum/species/mammal/teshari
	limbs_id = SPECIES_TESHARI
	icon_limbs = 'modular_splurt/icons/mob/teshari.dmi'
	icon_accessories = 'modular_splurt/icons/mob/clothing/species/teshari/accessories.dmi'
	icon_back = 'modular_splurt/icons/mob/clothing/species/teshari/back.dmi'
	icon_belt = 'modular_splurt/icons/mob/clothing/species/teshari/belt.dmi'
	icon_ears = 'modular_splurt/icons/mob/clothing/species/teshari/ears.dmi'
	icon_eyes = 'modular_splurt/icons/mob/clothing/species/teshari/eyes.dmi'
	icon_feet = 'modular_splurt/icons/mob/clothing/species/teshari/feet.dmi'
	icon_feet64 = 'modular_splurt/icons/mob/clothing/species/teshari/feet_64.dmi'
	icon_hands = 'modular_splurt/icons/mob/clothing/species/teshari/hands.dmi'
	icon_head = 'modular_splurt/icons/mob/clothing/species/teshari/head.dmi'
	icon_mask = 'modular_splurt/icons/mob/clothing/species/teshari/mask.dmi'
	icon_neck = 'modular_splurt/icons/mob/clothing/species/teshari/neck.dmi'
	icon_uniform = 'modular_splurt/icons/mob/clothing/species/teshari/uniform.dmi'
	icon_suit = 'modular_splurt/icons/mob/clothing/species/teshari/suit.dmi'

/datum/species/vox
	limbs_id = SPECIES_VOX
	icon_limbs = 'modular_splurt/icons/mob/vox.dmi'
	icon_back = 'modular_splurt/icons/mob/clothing/species/vox/back.dmi'
	icon_ears = 'modular_splurt/icons/mob/clothing/species/vox/ears.dmi'
	icon_eyes = 'modular_splurt/icons/mob/clothing/species/vox/eyes.dmi'
	icon_feet = 'modular_splurt/icons/mob/clothing/species/vox/feet.dmi'
	icon_feet64 = 'modular_splurt/icons/mob/clothing/species/vox/feet.dmi'
	icon_hands = 'modular_splurt/icons/mob/clothing/species/vox/hands.dmi'
	icon_head = 'modular_splurt/icons/mob/clothing/species/vox/head.dmi'
	icon_mask = 'modular_splurt/icons/mob/clothing/species/vox/face.dmi'
	icon_uniform = 'modular_splurt/icons/mob/clothing/species/vox/uniform.dmi'
	icon_suit = 'modular_splurt/icons/mob/clothing/species/vox/suit.dmi'
