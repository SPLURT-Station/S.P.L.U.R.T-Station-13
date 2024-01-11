/******************************************
************ Furry Markings ***************
*******************************************/

// These are all color matrixed and applied per-limb by default. you MUST comply with this if you want to have your markings work --Pooj
// use the HumanScissors tool to break your sprite up into the zones easier.
// Although Byond supposedly doesn't have an icon limit anymore of 512 states after 512.1478, just be careful about too many additions.

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

/datum/sprite_accessory/mam_body_markings/floof
	name = "Belly Fur (Floof)"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "floof"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/noodledragon
	name = "Noodle Dragon"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "noodledragon"
	covered_limbs = list("Chest" = MATRIX_GREEN_BLUE)

/datum/sprite_accessory/mam_body_markings/owlbarn
	name = "Owl"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "owlbarn"
	covered_limbs = list("Head" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/owlhorned
	name = "Horned Owl"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "owlhorned"
	covered_limbs = list("Head" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/toeclaws
	name = "Toe Claws"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "toeclaws"
	covered_limbs = list("Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/deoxys
	name = "Deoxys"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "deoxys"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/sloog
	name = "Sloog"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "sloog"
	covered_limbs = list("Chest" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/pilot
	name = "Pilot"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "pilot"
	covered_limbs = list("Head" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/pilot_jaw
	name = "Pilot Jaw"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "pilotjaw"
	covered_limbs = list("Head" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/renamon
	name = "Renamon"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "renamon"
	covered_limbs = list("Head" = MATRIX_BLUE,  "Left Leg" = MATRIX_BLUE, "Right Leg" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/hearttattoo
	name = "Groin Heart Tattoo"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "succubustattoo"
	covered_limbs = list("Chest" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/foreheadmark
	name = "Forehead Mark"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "foreheadmark"
	covered_limbs = list("Head" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/colourednose
	name = "Coloured Nose"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "colourednose"
	covered_limbs = list("Head" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/colouredlips
	name = "Coloured Lips"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "colouredlips"
	covered_limbs = list("Head" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/blushnormal
	name = "Blush - Normal"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "blushnormal"
	covered_limbs = list("Head" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/blushsmall
	name = "Blush - Small"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "blushsmall"
	covered_limbs = list("Head" = MATRIX_BLUE)

/datum/sprite_accessory/mam_body_markings/blushsmallALT
	name = "Blush - Small (Alt)"
	icon = 'modular_splurt/icons/mob/mam_markings.dmi'
	icon_state = "blushsmallALT"
	covered_limbs = list("Head" = MATRIX_BLUE)

/******************************************
************* Insect Markings *************
*******************************************/

/datum/sprite_accessory/insect_fluff/hyena
	name = "Hyena"
	icon = 'modular_splurt/icons/mob/neck_fluff.dmi'
	icon_state = "hyena"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/insect_fluff/hyena/stripes
	name = "Hyena (Stripes)"
	icon_state = "hyenastripes"

/datum/sprite_accessory/insect_fluff/soft
	name = "Soft"
	icon = 'modular_splurt/icons/mob/neck_fluff.dmi'
	icon_state = "soft"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/insect_fluff/flat
	name = "Flat"
	icon = 'modular_splurt/icons/mob/neck_fluff.dmi'
	icon_state = "flat"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/insect_fluff/renamon
	name = "Renamon"
	icon = 'modular_splurt/icons/mob/neck_fluff.dmi'
	icon_state = "renamon"
	color_src = MATRIXED
	matrixed_sections = MATRIX_GREEN
