/obj/item/ammo_box/magazine/m127x99mmbelt
	name = "ammo belt (.50)"
	icon_state = "762belt"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/p50
	caliber = ".50"
	max_ammo = 100


/obj/item/ammo_box/magazine/m127x99mmbelt/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),25)]"
