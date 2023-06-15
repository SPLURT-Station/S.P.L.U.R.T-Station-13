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

/obj/item/ammo_box/magazine/tommygunm45
	ammo_type = /obj/item/ammo_casing/c45/lethal
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/magazine/tommygunm45/r30
	name = "stick magazine (.45)"
	icon_state = "grease"
	max_ammo = 30

/obj/item/ammo_box/magazine/tommygunm45/r30/update_icon()
	..()
	icon_state = "grease-[ammo_count() ? "30" : "0"]"

/obj/item/ammo_box/magazine/tommygunm45/r30/rubber
	name = "stick magazine (.45 Rubber)"
	ammo_type = /obj/item/ammo_casing/c45

/obj/item/ammo_box/magazine/smgm45
	ammo_type = /obj/item/ammo_casing/c45/lethal

/obj/item/ammo_box/magazine/garand
	name = "Enbloc clip (.308)"
	desc = "An enbloc clip for a Mars Service Rifle."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "enbloc"
	ammo_type = /obj/item/ammo_casing/a308
	caliber = ".308"
	max_ammo = 8

/obj/item/ammo_box/magazine/garand/update_icon()
	..()
	icon_state = "enbloc-[round(ammo_count())]"

/obj/item/ammo_box/magazine/garand/rubber
	name = "Enbloc clip (.308 Rubber)"
	ammo_type = /obj/item/ammo_casing/a308/rubber

/obj/item/ammo_box/magazine/garand/sleepy
	name = "Enbloc clip (.308 Soporific)"
	ammo_type = /obj/item/ammo_casing/a308/sleepy

/obj/item/ammo_box/magazine/regm4mag
	name = "STANLEY 20-Round Magazine"
	desc = "A magazine for the M46A1 Carbine"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "regm4mag"
	ammo_type = /obj/item/ammo_casing/a543
	caliber = ".543"
	max_ammo = 20

/obj/item/ammo_box/magazine/regm4mag/update_icon()
	..()
	icon_state = "regm4mag-[ammo_count() ? "20" : "0"]"

/obj/item/ammo_box/magazine/kaijumag
	name = "KAIJU 20-Round Magazine"
	desc = "Magazine used by the Kaiju SMG."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "kaijumag"
	ammo_type = /obj/item/ammo_casing/kaiju
	caliber = "kaiju"
	max_ammo = 20

/obj/item/ammo_box/magazine/kaijumag/update_icon()
	..()
	icon_state = "kaijumag-[ammo_count() ? "20" : "0"]"

/obj/item/ammo_box/magazine/aegismag
	name = "AEGIS 20-Round Magazine"
	desc = "A magazine for the Aegis Assault System"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "aegismag"
	ammo_type = /obj/item/ammo_casing/a543
	caliber = ".543"
	max_ammo = 20

/obj/item/ammo_box/magazine/aegismag/update_icon()
	..()
	icon_state = "aegismag-[ammo_count() ? "20" : "0"]"

/obj/item/ammo_box/magazine/rrcmag
	name = "RRC Shotgun 8-shells Magazine"
	desc = "A magazine for the RRC Shotgun, why not just make a internal one like the other shotguns? 'cuz no."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "rrcmag"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "12g"
	max_ammo = 8

/obj/item/ammo_box/magazine/rrcmag/update_icon()
	..()
	icon_state = "rrcmag-[ammo_count() ? "8" : "0"]"

/obj/item/ammo_box/magazine/caelusmag
	name = "CAELAI 100-Round Magazine"
	desc = "A magazine for the Caelus LMG"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "caelusmag"
	ammo_type = /obj/item/ammo_casing/a308
	caliber = ".308"
	max_ammo = 100

/obj/item/ammo_box/magazine/caelusmag/update_icon()
	..()
	icon_state = "caelusmag-[ammo_count() ? "100" : "0"]"

/obj/item/ammo_box/magazine/m9smgmag
	name = "M9SMG 10-Round Magazine"
	desc = "A magazine for the M9SMG"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "m9smgmag"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 10

/obj/item/ammo_box/magazine/m9smgmag/update_icon()
	..()
	icon_state = "m9smgmag-[ammo_count() ? "10" : "0"]"

/obj/item/ammo_box/magazine/fal
	name = "FTU 20 round magazine (.308)"
	desc = "A magazine for a FTU Rifle."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "r20"
	ammo_type = /obj/item/ammo_casing/a308
	caliber = ".308"
	max_ammo = 20

/obj/item/ammo_box/magazine/fal/update_icon()
	..()
	icon_state = "r20-[ammo_count() ? "20" : "0"]"

/obj/item/ammo_box/magazine/fal/rubber
	name = "FTU 20 round magazine (.308 Rubber)"
	ammo_type = /obj/item/ammo_casing/a308/rubber

/obj/item/ammo_box/magazine/fal/r10
	name = "FTU 10 round magazine (.308)"
	icon_state = "r10"
	max_ammo = 10

/obj/item/ammo_box/magazine/fal/r10/update_icon()
	..()
	icon_state = "r10-[ammo_count() ? "10" : "0"]"

/obj/item/ammo_box/magazine/fal/r10/rubber
	name = "FTU 10 round magazine (.308 rubber)"
	ammo_type = /obj/item/ammo_casing/a308/rubber

/obj/item/ammo_box/magazine/fal/r10/sleepy
	name = "FTU 10 round magazine (.308 Soporific)"
	ammo_type = /obj/item/ammo_casing/a308/sleepy

/obj/item/ammo_box/magazine/smg22
	name = "FTU SMG magazine (.22)"
	desc = "A magazine for a FTU SMG."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "smg22"
	ammo_type = /obj/item/ammo_casing/c22lr
	caliber = ".22"
	max_ammo = 180 //YEs really

/obj/item/ammo_box/magazine/smg22/update_icon()
	..()
	icon_state = "smg22-[ammo_count() ? "180" : "0"]"

/obj/item/ammo_box/magazine/smg22/rubber
	name = "FTU SMG magazine (.22 Rubber)"
	ammo_type = /obj/item/ammo_casing/c22lr/rubber
