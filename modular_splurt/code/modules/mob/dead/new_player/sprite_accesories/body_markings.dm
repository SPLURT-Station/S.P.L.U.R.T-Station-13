/******************************************
************ Furry Markings ***************
*******************************************/

// These are all color matrixed and applied per-limb by default. you MUST comply with this if you want to have your markings work --Pooj
// use the HumanScissors tool to break your sprite up into the zones easier.
// Although Byond supposedly doesn't have an icon limit anymore of 512 states after 512.1478, just be careful about too many additions.

//Hyperstation markings
/datum/sprite_accessory/mam_body_markings/abs
	name = "Abdominals"
	icon_state = "abs"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/abstwo
	name = "Abdominals Two-Tones"
	icon_state = "absbelly"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED_GREEN)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/absthree
	name = "Abdominals Three-Tones"
	icon_state = "absarms"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/pigeon
	name = "Pigeon"
	icon_state = "pigeon"
	covered_limbs = list("Chest" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/shrike
	name = "Shrike"
	icon_state = "shrike"
	covered_limbs = list("Head" = MATRIX_GREEN_BLUE, "Chest" = MATRIX_BLUE, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/moth // sarcoph @ hyperstation, jan 2022
	name = "Moth (Hyper)"
	icon_state = "moth"
	recommended_species = list("insect")
	covered_limbs = list("Head" = MATRIX_BLUE, "Chest" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/bee // sarcoph @ hyperstation, march 2022
	name = "Bee (Hyper)"
	icon_state = "bee"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_ALL, "Right Arm" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/bee_fluff // sarcoph @ hyperstation, march 2022
	name = "Bee - Fluffy (Hyper)"
	icon_state = "bee_fluff"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_ALL, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE, "Right Leg" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/bug3tone
	name = "Beetle - 3-tone (Hyper)"
	icon_state = "bug3tone"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_GREEN_BLUE)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/chemlight
	name = "RadDog"
	icon_state = "chemlight"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Right Arm" = MATRIX_RED_BLUE, "Left Arm" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE, "Left Leg" = MATRIX_RED_BLUE)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/easterndragon
	name = "Eastern Dragon"
	icon_state = "easternd"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

/datum/sprite_accessory/mam_body_markings/raccalt
	name = "RaccAlt (Hyper)"
	icon_state = "raccalt"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_ALL, "Left Leg" = MATRIX_ALL)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

//S.P.L.U.R.T Body Markings
/datum/sprite_accessory/mam_body_markings/gloss
	name = "Body Gloss"
	icon_state = "gloss"
	covered_limbs = list("Chest" = MATRIX_RED, "Right Arm" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED, "Head" = MATRIX_RED)
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
