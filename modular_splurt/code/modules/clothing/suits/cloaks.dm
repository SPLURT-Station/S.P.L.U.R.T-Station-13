// Boatcloaks
/obj/item/clothing/neck/cloak/alt/boatcloak
	name = "boatcloak"
	desc = "A simple, short-ish boatcloak."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "boatcloak"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/neck/cloak/alt/boatcloak/command
	name = "command boatcloak"
	desc = "A boatcloak with gold ribbon."
	icon_state = "boatcloak_com"
	body_parts_covered = CHEST|LEGS|ARMS

/obj/item/clothing/neck/cloak/alt/boatcloak/polychromic
	name = "polychromic boatcloak"
	desc = "A polychromic, short-ish boatcloak."
	icon_state = "boatcloak"
	var/list/poly_colors = list("#FCFCFC", "#454F5C", "#CCCEE2")

/obj/item/clothing/neck/cloak/alt/boatcloak/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 3)

/obj/item/clothing/neck/cloak/centcom
	name = "central command's cloak"
	desc = "Worn by High-Ranking Central Command Personnel. I guess they needed one too."
	icon_state = "centcomcloak"
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	armor = list(MELEE = 35, BULLET = 40, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 20, RAD = 20, FIRE = 60, ACID = 60)
	body_parts_covered = CHEST|GROIN|ARMS
	is_edible = 0

/obj/item/clothing/neck/cloak/binary
	name = "Binary cloak"
	icon_state = "binarycloak"
	desc = "A fluffy dark cloak with hexagonal golden patterns covering its right side."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'

/* //doesn't work
/obj/item/clothing/neck/cloak/binary/equipped(mob/user, slot)
	if(slot != ITEM_SLOT_NECK || !isdullahan(user))
		icon_state = "binarycloak"
		return ..()

	icon_state = "binarycloak_dull"

	. = ..()
*/
