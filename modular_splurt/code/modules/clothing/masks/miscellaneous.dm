//Main code edits
/obj/item/clothing/mask/muzzle/attack_hand(mob/user, act_intent, attackchain_flags)
    if(iscarbon(user))
        var/mob/living/carbon/C = user
        if(src == C.wear_mask)
            if(seamless)
                to_chat(user, span_warning("You need help taking this off!"))
                return
            else
                if(!do_after(C, 60, target = src))
                    return
    ..()

//Own stuff

/* I'm sorry nuke but cit added their own
/obj/item/clothing/mask/rat/kitsune
	name = "kitsune mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a mythical kitsune."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	icon_state = "kitsune"
	item_state = "kitsune"
*/

/obj/item/clothing/mask/gas/cbrn
	name = "CBRN gas mask"
	desc = "Chemical, Biological, Radiological and Nuclear. A heavy duty gas mask design to be worn in hazardous environments. Actually works like a gas mask as well as can be connected to internal air supply."
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
	is_edible = 0

/obj/item/clothing/mask/gas/cbrn/mopp
	name = "MOPP gas mask"
	desc = "Mission Oriented Protective Posture. A heavy duty gas mask design to be worn in hazardous combat environments. Actually works like a gas mask as well as can be connected to internal air supply."
	item_state = "gas_mopp"
	icon_state = "gas_mopp"
	armor = list("melee" = 10, "bullet" = 5, "laser" = 10,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100)

/obj/item/clothing/mask/gas/cbrn/mopp/advance
	name = "advance MOPP gas mask"
	desc = "Mission Oriented Protective Posture. A heavy duty gas mask design to be worn in hazardous combat environments. Actually works like a gas mask as well as can be connected to internal air supply. Used by CentCom Staff and ERT teams."
	armor = list("melee" = 20, "bullet" = 10, "laser" = 20,"energy" = 20, "bomb" = 20, "bio" = 110, "rad" = 110, "fire" = 50, "acid" = 110)

//broken huds for loot

/obj/item/clothing/glasses/brokenhud/security
	name = "broken security HUD"
	desc = "A former heads-up display that scans the humans in view and provides accurate data about their ID status and security records. At least it did. Now its just shorted out"
	icon_state = "securityhud"
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/brokenhud/security/sunglasses
	name = "broken security HUDSunglasses"
	desc = "Sunglasses with a broken security HUD."
	icon_state = "sunhudsec"
	flash_protect = 1
	glass_colour_type = /datum/client_colour/glass_colour/darkred

/obj/item/clothing/glasses/brokenhud/security/night
	name = "broken night vision security HUD"
	desc = "An advanced heads-up display which provides id data and vision in complete darkness. However the electronics seem to no longer work."
	icon_state = "securityhudnight"
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/brokenhud/health
	name = "borken health scanner HUD"
	desc = "A former heads-up display that scans the humans in view and provides accurate data about their health status. At least it did. Now its just shorted out."
	icon_state = "healthhud"
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/obj/item/clothing/glasses/brokenhud/health/night
	name = "broken night vision health scanner HUD"
	desc = "An advanced medical heads-up display that allows doctors to find patients in complete darkness. However the electronics seem to no longer work"
	icon_state = "healthhudnight"
	item_state = "glasses"
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/brokenhud/health/sunglasses
	name = "broken medical HUDSunglasses"
	desc = "Sunglasses with a broken medical HUD."
	icon_state = "sunhudmed"
	flash_protect = 1
	glass_colour_type = /datum/client_colour/glass_colour/blue

/obj/effect/spawner/lootdrop/brokenhuds
	lootcount = 1
	loot = list(
				/obj/item/clothing/glasses/brokenhud/health/sunglasses = 16,
				/obj/item/clothing/glasses/brokenhud/health/night = 16,
				/obj/item/clothing/glasses/brokenhud/health = 16,
				/obj/item/clothing/glasses/brokenhud/security/night = 16,
				/obj/item/clothing/glasses/brokenhud/security/sunglasses = 16,
				/obj/item/clothing/glasses/brokenhud/security = 16,
				)
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
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/clothing/mask/muzzle/ballgag
	name = "ball gag"
	desc = "To stop that awful noise, but lewder."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "ballgag"
	item_state = "ballgag"

/obj/item/clothing/mask/ninja_replica
	name = "Replica Ninja Mask"
	desc = "It's a ninja mask! But this one seems like it's breathable."
	icon_state = "s-ninja"
	item_state = "s-ninja_mask"
	flags_inv = HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
