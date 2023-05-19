/obj/item/clothing/neck
	is_edible = 1

/obj/item/clothing/neck/stethoscope
	is_edible = 2

/obj/item/clothing/neck/petcollar/locked/security
	name = "security collar"
	desc = "For when you need to show everyone who your pet belongs to."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	icon_state = "seccollar"
	poly_states = 0
	is_edible = 0

/obj/item/clothing/neck/petcollar/spike
	name = "Spiked Pet Collar"
	desc = "A collar with spikes that look as sharp as your teeth. Doesn't seem very good for neck cuddles."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar_spik"
	poly_states = 0
	is_edible = 0

/obj/item/clothing/neck/petcollar/locked/spike
	name = "Spiked Pet Collar"
	desc = "A collar with spikes that look as sharp as your teeth. Doesn't seem very good for neck cuddles."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar_spik"
	poly_states = 0

/obj/item/clothing/neck/petcollar/holo
	name = "Holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar_holo"
	poly_colors = list("#33FFFF")

/obj/item/clothing/neck/petcollar/locked/holo
	name = "Holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar_holo"
	poly_states = 0
	is_edible = 0

/obj/item/clothing/neck/petcollar/casino
	name = "Casino Collar"
	desc = "A fancy collar whose neon hue neatly changes with time. Once probably used to mark living prizes, but it only seems to be a cool item now."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "casinoslave"
	poly_states = 0

/obj/item/clothing/neck/petcollar/locked/casino
	name = "Casino Collar"
	desc = "A fancy collar whose neon hue neatly changes with time. Once probably used to mark living prizes."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "casinoslave_available"
	poly_states = 0
	is_edible = 0

/obj/item/clothing/neck/petcollar/locked/casino/attackby(obj/item/K, mob/user, params)
	. = ..()
	if(lock)
		icon_state = "casinoslave_owned"
	else
		icon_state = "casinoslave_available"

/obj/item/clothing/neck/petcollar/handmade
	name = "handmade collar"
	desc = "A collar made out of pliable material."
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar_handmade"
	poly_states = 0

/obj/item/clothing/neck/petcollar/poly
	name = "pet collar (poly)"
	icon = 'modular_splurt/icons/obj/clothing/neck/collars.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "petcollar"
	poly_states = 2
	poly_colors = list("#00bb70", "#FFC600")
