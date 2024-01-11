// Pistol Magazines

/obj/item/ammo_box/magazine/m45
	name = "M1911 magazine (.45 Lethal)"
	desc = "A M1911 magazine."
	ammo_type = /obj/item/ammo_casing/c45/lethal

/obj/item/ammo_box/magazine/m45/rubber
	name = "M1911 magazine (.45 Rubber)"
	ammo_type = /obj/item/ammo_casing/c45

/obj/item/ammo_box/magazine/e45
	name = "Enforcer magazine (.45 Rubber)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "enforcer"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	desc = "A Mk. 58 magazine. Loaded with rubber rounds."
	max_ammo = 8

/obj/item/ammo_box/magazine/e45/update_icon()
	..()
	icon_state = "enforcer-[round(ammo_count())]"

/obj/item/ammo_box/magazine/e45/lethal
	name = "Enforcer magazine (.45 Lethal)"
	desc = "A Mk. 58 magazine. Loaded with lethal rounds."
	ammo_type = /obj/item/ammo_casing/c45/lethal

/obj/item/ammo_box/magazine/e45/hydra
	name = "Enforcer magazine (.45 Hydra)"
	desc = "A Mk. 58 magazine. Loaded with Hydra-shock."
	ammo_type = /obj/item/ammo_casing/c45/hydra

/obj/item/ammo_box/magazine/e45/taser
	name = "Enforcer magazine (.45 Taser)"
	desc = "A Mk. 58 magazine. Loaded with taser rounds."
	ammo_type = /obj/item/ammo_casing/c45/taser

/obj/item/ammo_box/magazine/e45/trac
	name = "Enforcer magazine (.45 Tracking)"
	desc = "A Mk. 58 magazine. Loaded with trac rounds."
	ammo_type = /obj/item/ammo_casing/c45/trac

/obj/item/ammo_box/magazine/e45/hotshot
	name = "Enforcer magazine (.45 Hotshot)"
	desc = "A Mk. 58 magazine. Loaded with Hotshot rounds."
	ammo_type = /obj/item/ammo_casing/c45/hotshot

/obj/item/ammo_box/magazine/e45/ion
	name = "Enforcer magazine (.45 Ion)"
	desc = "A Mk. 58 magazine. Loaded with Ion rounds."
	ammo_type = /obj/item/ammo_casing/c45/ion

/obj/item/ammo_box/magazine/e45/laser
	name = "Enforcer magazine (.45 Laser)"
	desc = "A Mk. 58 magazine. Loaded with Laser rounds."
	ammo_type = /obj/item/ammo_casing/c45/laser

/obj/item/ammo_box/magazine/e45/stun
	name = "Enforcer magazine (.45 Stun)"
	desc = "A Mk. 58 magazine. Loaded with Stun rounds."
	ammo_type = /obj/item/ammo_casing/c45/stun

/obj/item/ammo_box/magazine/m9
	name = "Cheap handgun magazine (9mm Lethal)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "m9mmds"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	desc = "A cheap handgun magazine."
	max_ammo = 10

/obj/item/ammo_box/magazine/m9/update_icon()
	..()
	icon_state = "m9mmds-[ammo_count() ? "10" : "0"]"

/obj/item/ammo_box/magazine/m9/rubber
	name = "Cheap handgun magazine (9mm Rubber)"
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

/obj/item/ammo_box/magazine/m22
	name = "Cheap handgun magazine (.22LR)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "pistol22"
	ammo_type = /obj/item/ammo_casing/c22lr
	caliber = ".22"
	desc = "A cheap handgun magazine."
	max_ammo = 12

/obj/item/ammo_box/magazine/m22/update_icon()
	..()
	icon_state = "pistol22-[ammo_count() ? "12" : "0"]"


/obj/item/ammo_box/magazine/m357
	name = "handgun magazine (.357)"
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_box/magazine/m357/ap
	name = "handgun magazine (.357 AP)"
	ammo_type = /obj/item/ammo_casing/a357/ap

/obj/item/ammo_box/magazine/m357/match
	name = "handgun magazine (.357 Match)"
	ammo_type = /obj/item/ammo_casing/a357/match

/obj/item/ammo_box/magazine/m357/dumdum
	name = "handgun magazine (.357 DumDum)"
	ammo_type = /obj/item/ammo_casing/a357/dumdum

/obj/item/ammo_box/magazine/m357/rubber
	name = "handgun magazine (.357 Rubber)"
	ammo_type = /obj/item/ammo_casing/a357/rubber



// Pistol Magazines for the Sec Tecfab, yes its just easier to put it here for my own Sanity - Radar


/datum/design/e45/e45rubber
	name = "Enforcer magazine (.45 Rubber)"
	desc = "A magazine of .45 Rubber for the Mk. 58 Enforcer"
	id = "e45_rubber"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200)
	build_path = /obj/item/ammo_box/magazine/e45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/e45lethal
	name = "Enforcer magazine (.45 Lethal)"
	desc = "A magazine of .45 Lethal for the Mk. 58 Enforcer"
	id = "e45_lethal"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200)
	build_path = /obj/item/ammo_box/magazine/e45/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/e45taser
	name = "Enforcer magazine (.45 Taser)"
	desc = "A magazine of .45 Taser for the Mk. 58 Enforcer"
	id = "e45_taser"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200)
	build_path = /obj/item/ammo_box/magazine/e45/taser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/e45trac
	name = "Enforcer magazine (.45 Tracking)"
	desc = "A magazine of .45 Tracking for the Mk. 58 Enforcer"
	id = "e45_trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200)
	build_path = /obj/item/ammo_box/magazine/e45/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/hotshot
	name = "Enforcer magazine (.45 Hotshot)"
	desc = "A magazine of .45 Hotshot for the Mk. 58 Enforcer"
	id = "e45_hot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200)
	build_path = /obj/item/ammo_box/magazine/e45/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/hydra
	name = "Enforcer magazine (.45 Hydra)"
	desc = "A magazine of .45 Hydra-Shock for the Mk. 58 Enforcer"
	id = "e45_hydra"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200)
	build_path = /obj/item/ammo_box/magazine/e45/hydra
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/e45ion
	name = "Enforcer magazine (.45 Ion)"
	desc = "A magazine of .45 Ion for the Mk. 58 Enforcer"
	id = "e45_ion"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/uranium = 50)
	build_path = /obj/item/ammo_box/magazine/e45/ion
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e45/e45stun
	name = "Enforcer magazine (.45 Stun)"
	desc = "A magazine of .45 Stun for the Mk. 58 Enforcer"
	id = "e45_stun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/uranium = 50)
	build_path = /obj/item/ammo_box/magazine/e45/stun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/e45/e45laser
	name = "Enforcer magazine (.45 Laser)"
	desc = "A magazine of .45 Laser for the Mk. 58 Enforcer"
	id = "e45_laser"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/uranium = 50)
	build_path = /obj/item/ammo_box/magazine/e45/laser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
