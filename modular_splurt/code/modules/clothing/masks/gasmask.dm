/obj/item/clothing/mask/gas
	is_edible = 0

/obj/item/clothing/mask/gas/radmask
	name = "radiation mask"
	desc = "An mask that somewhat protects the user from radiation. Not as effective like a radiation hood, but is better than nothing."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "radmask"
	item_state = "radmask"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 10, "acid" = 10)

/obj/item/clothing/mask/gas/mime //Smaaalll edit here by Yawet. Makes the mime mask only hide the facial hair of an individual. Allows them to be examined (to see flavor text), and stops it from hiding ears. On request of Jglitch.
	flags_inv = HIDEFACIALHAIR

/obj/item/clothing/mask/gas/clown_hat // Not requested, but changed to allow examining too.
	flags_inv = HIDEFACIALHAIR

/obj/item/clothing/mask/gas/clown_hat_polychromic //Ditto
	flags_inv = HIDEFACIALHAIR

// GWTB-inspired thing wooo
/obj/item/clothing/mask/gas/goner
	name = "operative trencher gas mask"
	desc = "A protective, head-covering mask. This gas mask model is made by mooks and romantically apocalyptic people. It even have proper filter on!"
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "goner_mask"
	flags_inv = HIDEEARS | HIDEEYES | HIDEFACE | HIDEHAIR | HIDEFACIALHAIR | HIDESNOUT
	armor = list("melee" = 10, "bullet" = 5, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100) // MOPP's

/obj/item/clothing/mask/gas/goner/basic
	name = "trencher gas mask"
	desc = "A head-covering mask. This gas mask model is made by mooks and romantically apocalyptic people. Still isn't good for blocking gas flow."
	armor = 0

// Cosmetic gas mask for Bane Syndrome (masked_mook)
/obj/item/clothing/mask/gas/cosmetic
	name = "aesthetic gas mask"
	desc = "A face-covering mask that resembles a traditional gas mask, but without the breathing functionality."
	clothing_flags = NONE
	gas_transfer_coefficient = 0
	permeability_coefficient = 0
