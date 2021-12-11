/******************************************
************ Furry Markings ***************
*******************************************/

// These are all color matrixed and applied per-limb by default. you MUST comply with this if you want to have your markings work --Pooj
// use the HumanScissors tool to break your sprite up into the zones easier.
// Although Byond supposedly doesn't have an icon limit anymore of 512 states after 512.1478, just be careful about too many additions.

//Hyperstation markings

/datum/sprite_accessory/mam_body_markings/eros
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'

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
