// Sprites by Keila
/obj/item/clothing/wrists/armwarmer
	name = "Arm Warmers"
	desc = "A pair of arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer"
	item_state = "armwarmer"
	body_parts_covered = ARMS

/obj/item/clothing/wrists/armwarmer/long
	name = "Long Arm Warmers"
	desc = "A pair of long arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer_long"
	item_state = "armwarmer_long"
	body_parts_covered = ARMS

/obj/item/clothing/wrists/armwarmer_striped
	name = "Striped Arm Warmers"
	desc = "A pair of striped arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer_striped"
	item_state = "armwarmer_striped"
	body_parts_covered = ARMS
	var/list/poly_colors = list("#FFFFFF", "#FFFFFF")

/obj/item/clothing/wrists/armwarmer_striped/long
	name = "Long Striped Arm Warmers"
	desc = "A pair of long striped arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer_striped_long"
	item_state = "armwarmer_striped_long"
	body_parts_covered = ARMS

/obj/item/clothing/wrists/armwarmer_striped/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 2)
