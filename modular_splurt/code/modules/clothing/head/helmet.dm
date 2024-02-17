// GWTB-inspired stuff wooo
/obj/item/clothing/head/helmet
	is_edible = 0

/obj/item/clothing/head/helmet/goner
	name = "trencher helmet"
	desc = "A No Man's Land-type helmet with purple paint applied."
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "goner_helmet"
	flags_inv = HIDEHAIR
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 5, RAD = 5, FIRE = 50, ACID = 50) // Normal helmet's + BIO&RAD

/obj/item/clothing/head/helmet/goner/fake
	name = "trencher helmet replica"
	desc = "A plastic helmet with purple paint applied. Protects as best as cardboard box labeled 'Bomb Shelter'."
	armor = 0

/obj/item/clothing/head/helmet/goner/fake/poly
	name = "polychromic trencher helmet"
	desc = "A plastic helmet with polychromic spot. Protects as best as cardboard box labeled 'Bomb Shelter'."
	var/list/poly_colors = list("#D9D9D9")

/obj/item/clothing/head/helmet/goner/fake/poly/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)

/obj/item/clothing/head/helmet/goner/red
	name = "red trencher helmet"
	desc = "A No Man's Land-type helmet with red paint applied."
	icon_state = "goner_helmet_r"

/obj/item/clothing/head/helmet/goner/green
	name = "green trencher helmet"
	desc = "A No Man's Land-type helmet with green paint applied."
	icon_state = "goner_helmet_g"

/obj/item/clothing/head/helmet/goner/blue
	name = "blue trencher helmet"
	desc = "A No Man's Land-type helmet with blue paint applied."
	icon_state = "goner_helmet_b"

/obj/item/clothing/head/helmet/goner/yellow
	name = "yellow trencher helmet"
	desc = "A No Man's Land-type helmet with yellow paint applied."
	icon_state = "goner_helmet_y"

/obj/item/clothing/head/helmet/goner/officer
	name = "trencher officer cap"
	desc = "An army officer cap with purple pin."
	icon_state = "goner_offcap"
	dynamic_hair_suffix = ""
	flags_inv = 0

/obj/item/clothing/head/helmet/goner/officer/fake
	name = "trencher officer cap replica"
	desc = "A cheap officer cap. Great for people with Napoleon complex."
	armor = 0

/obj/item/clothing/head/helmet/goner/officer/fake/poly
	name = "polychromic trencher officer cap"
	desc = "A cheap officer cap with polychromic pin."
	var/list/poly_colors = list("#F2F2F2")

/obj/item/clothing/head/helmet/goner/officer/fake/poly/classic
	name = "polychromic trencher old cap"
	icon_state = "goner_offcap_old"

/obj/item/clothing/head/helmet/goner/officer/fake/poly/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)

/obj/item/clothing/head/helmet/goner/officer/red
	name = "red trencher officer cap"
	desc = "An army officer cap with red pin."
	icon_state = "goner_offcap_r"

/obj/item/clothing/head/helmet/goner/officer/green
	name = "green trencher officer cap"
	desc = "An army officer cap with green pin."
	icon_state = "goner_offcap_g"

/obj/item/clothing/head/helmet/goner/officer/blue
	name = "blue trencher officer cap"
	desc = "An army officer cap with blue pin."
	icon_state = "goner_offcap_b"

/obj/item/clothing/head/helmet/goner/officer/yellow
	name = "yellow trencher officer cap"
	desc = "An army officer cap with yellow pin."
	icon_state = "goner_offcap_y"
