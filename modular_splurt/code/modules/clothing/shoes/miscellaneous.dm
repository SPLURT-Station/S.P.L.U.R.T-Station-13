/obj/item/clothing/shoes/footwraps
	name = "cloth footwraps"
	desc = "A roll of treated canvas used for wrapping claws or paws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "foot_wraps"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/jackboots/toeless
	name = "toe-less jackboots"
	desc = "Modified pair of jackboots, particularly friendly to those species whose toes hold claws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "jackboots-toeless"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/jackboots/tall
	name = "tall jackboots"
	desc = "A pair of knee-high jackboots, complete with heels. All style, all the time."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "jackboots-tall"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/jackboots/tall/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/effects/footstep/highheel1.ogg' = 1,'modular_splurt/sound/effects/footstep/highheel2.ogg' = 1), 20)

/obj/item/clothing/shoes/workboots/toeless
	name = "toe-less workboots"
	desc = "A pair of toeless work boots designed for use in industrial settings. Modified for species whose toes have claws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "workboots-toeless"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'
