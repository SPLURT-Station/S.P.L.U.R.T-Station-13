/******************************************
************ Furry Markings ***************
*******************************************/

// These are all color matrixed and applied per-limb by default. you MUST comply with this if you want to have your markings work --Pooj
// use the HumanScissors tool to break your sprite up into the zones easier.
// Although Byond supposedly doesn't have an icon limit anymore of 512 states after 512.1478, just be careful about too many additions.

/datum/sprite_accessory/mam_body_markings/eros
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

//Hyperstation markings
/datum/sprite_accessory/mam_body_markings/eros/abs
	name = "Abdominals"
	icon_state = "abs"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/eros/abstwo
	name = "Abdominals Two-Tones"
	icon_state = "absbelly"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/eros/absthree
	name = "Abdominals Three-Tones"
	icon_state = "absarms"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/eros/pigeon
	name = "Pigeon"
	icon_state = "pigeon"
	covered_limbs = list("Chest" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE)

/datum/sprite_accessory/mam_body_markings/eros/shrike
	name = "Shrike"
	icon_state = "shrike"
	covered_limbs = list("Head" = MATRIX_GREEN_BLUE, "Chest" = MATRIX_BLUE, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE)

/datum/sprite_accessory/mam_body_markings/eros/moth // sarcoph @ hyperstation, jan 2022
	name = "Moth (Hyper)"
	icon_state = "moth"
	recommended_species = list("insect")
	covered_limbs = list("Head" = MATRIX_BLUE, "Chest" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/eros/bee // sarcoph @ hyperstation, march 2022
	name = "Bee (Hyper)"
	icon_state = "bee"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_ALL, "Right Arm" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/eros/bee_fluff // sarcoph @ hyperstation, march 2022
	name = "Bee - Fluffy (Hyper)"
	icon_state = "bee_fluff"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_ALL, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE, "Right Leg" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/eros/bug3tone
	name = "Beetle - 3-tone (Hyper)"
	icon_state = "bug3tone"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_GREEN_BLUE)
