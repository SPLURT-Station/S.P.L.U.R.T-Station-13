/obj/item/ammo_box/g4570
	icon_state = "4570box"
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/g45l
	name = "ammo box (.45 Long Rubber)"
	desc = "Brought to you at great expense,this box contains .45 Long Rubber cartridges."
	ammo_type = /obj/item/ammo_casing/g45l
	icon_state = "45lbox"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	max_ammo = 24

/obj/item/ammo_box/g45l/lethal
	name = "ammo box (.45 Long Lethal)"
	desc = "Brought to you at great expense,this box contains .45 Long Lethal cartridges."
	ammo_type = /obj/item/ammo_casing/g45l/lehtal

/obj/item/ammo_box/c45
	name = "ammo box (.45 Rubber)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/c45/taser
	name = "ammo box (.45 Taser)"
	icon_state = "45box-y"
	ammo_type = /obj/item/ammo_casing/c45/taser

/obj/item/ammo_box/c45/lethal
	name = "ammo box (.45 Lethal)"
	icon_state = "45box-r"
	ammo_type = /obj/item/ammo_casing/c45/lethal

/obj/item/ammo_box/c45/stun
	name = "ammo box (.45 Stun)"
	icon_state = "45box-c"
	ammo_type = /obj/item/ammo_casing/c45/stun

/obj/item/ammo_box/c45/laser
	name = "ammo box (.45 Laser)"
	icon_state = "45box-o"
	ammo_type = /obj/item/ammo_casing/c45/laser

/obj/item/ammo_box/c45/hydra
	name = "ammo box (.45 Hydra-shock)"
	icon_state = "45box-g"
	ammo_type = /obj/item/ammo_casing/c45/hydra

/obj/item/ammo_box/c45/hotshot
	name = "ammo box (.45 Hotshot)"
	icon_state = "45box-o"
	ammo_type = /obj/item/ammo_casing/c45/hotshot

/obj/item/ammo_box/c45/ion
	name = "ammo box (.45 Ion)"
	icon_state = "45box-c"
	ammo_type = /obj/item/ammo_casing/c45/ion

/obj/item/ammo_box/c45/trac
	name = "ammo box (.45 Trac)"
	ammo_type = /obj/item/ammo_casing/c45/trac

/obj/item/ammo_box/c22lr
	name = "ammo box (.22)"
	icon_state = "22box"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/c22lr
	max_ammo = 24

/obj/item/ammo_box/c9mm/rubber
	name = "ammo box (9mm Rubber)"
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

/obj/item/ammo_box/kaiju
	name = "ammo box (Kaiju Bullets)"
	icon_state = "kaijubox"
	ammo_type = /obj/item/ammo_casing/kaiju
	max_ammo = 40

/obj/item/ammo_box/kaiju/lethal
	name = "ammo box (Kaiju Bullets)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/a543/lethal
	name = "ammo box (.5x43mm Lethal)"
	icon_state = "543box"
	ammo_type = /obj/item/ammo_casing/a543
	max_ammo = 40
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/a543/rubber
	name = "ammo box (.5x43mm Rubber)"
	icon_state = "543box"
	ammo_type = /obj/item/ammo_casing/a543/rubber
	max_ammo = 40
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/a308
	name = "stripper clip (.308)"
	desc = "A stripper clip."
	icon_state = "762"
	ammo_type = /obj/item/ammo_casing/a308
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_box/c308
	name = "ammo box (.308)"
	icon_state = "308box"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/a308
	max_ammo = 30

/datum/design/c45/c45r
	name = "Box of ammo (.45 Rubber)"
	desc = "A box of .45 Rubber"
	id = "c45r"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45leath
	name = "Box of ammo (.45 Lethal)"
	desc = "A box of .45 Lethal"
	id = "c45leath"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45t
	name = "Box of ammo (.45 Taser)"
	desc = "A box of .45 Taser"
	id = "c45t"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/taser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45hydra
	name = "Box of ammo (.45 Hydra-Shock)"
	desc = "A box of .45 Hydra-shock"
	id = "c45hydra"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/hydra
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45hot
	name = "Box of ammo (.45 Hotshot)"
	desc = "A box of .45 Hotshot"
	id = "c45hot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45trac
	name = "Box of ammo (.45 Trac)"
	desc = "A box of .45 Trac"
	id = "c45trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45stun
	name = "Box of ammo (.45 Stun)"
	desc = "A box of .45 Stun"
	id = "c45stun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/uranium = 150)
	build_path = /obj/item/ammo_box/c45/stun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45las
	name = "Box of ammo (.45 Laser)"
	desc = "A box of .45 Laser"
	id = "c45las"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/uranium = 150)
	build_path = /obj/item/ammo_box/c45/laser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45ion
	name = "Box of ammo (.45 Ion)"
	desc = "A box of .45 Ion"
	id = "c45ion"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/uranium = 150)
	build_path = /obj/item/ammo_box/c45/ion
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/techweb_node/c45ammo
	id = "c45_ammo"
	display_name = ".45 Ammunition"
	description = "Ammo for 45 Caliber pistols."
	prereq_ids = list("weaponry")
	design_ids = list("c45r", "c45leath", "c45t", "c45hydra", "c45trac", "e45_rubber", "e45_lethal", "e45_taser", "e45_trac", "e45_hydra")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/advc45ammo
	id = "advc45_ammo"
	display_name = "Advance .45 Ammunition"
	description = "Make .45 ammo your bitch and make it do crazy shit."
	prereq_ids = list("weaponry", "c45_ammo", "ballistic_weapons")
	design_ids = list("e45_ion", "e45_stun", "e45_laser","e45_hot", "c45hot","c45las", "c45ion","c45stun")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 4500)

/datum/design/c45
	name = "Ammo Box (.45 Rubber)"

/datum/design/c45lethal
	name = "Ammo Box (.45 Lethal)"
	id = "c45lehtal"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/c45/lethal
	category = list("hacked", "Security")

/datum/design/c22
	name = "Ammo Box (.22)"
	id = "c22"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c22lr
	category = list("hacked", "Security")

/datum/design/c9mmr
	name = "Ammo Box (9mm Rubber)"
	id = "c9mmr"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/c9mm/rubber
	category = list("hacked", "Security")

/datum/design/g45l
	name = "Ammo Box (.45 Long Rubber)"
	id = "g45l"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/g45l
	category = list("hacked", "Security")

/datum/design/g45lethal
	name = "Ammo Box (.45 Long)"
	id = "g45leath"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 35000)
	build_path = /obj/item/ammo_box/g45l/lethal
	category = list("hacked", "Security")

/datum/design/a308
	name = "Ammo Box (.308)"
	id = "a308"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 35000)
	build_path = /obj/item/ammo_box/a308
	category = list("hacked", "Security")

/datum/design/a543_lethal
	name = "Ammo box (.5x43mm Lethal)"
	desc = "A 40 round ammunition box that stores .5x43mm lethal bullets."
	id = "a543_lethal"
	materials = list(/datum/material/iron = 48000, /datum/material/silver = 12000)
	build_path = /obj/item/ammo_box/a543/lethal
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	category = list("Ammo")
	build_type = PROTOLATHE

/datum/design/a543_rubber
	name = "Ammo box (.5x43mm Rubber)"
	desc = "A 40 round ammunition box that stores .5x43mm rubber bullets."
	id = "a543_rubber"
	materials = list(/datum/material/iron = 36000, /datum/material/silver = 6000)
	build_path = /obj/item/ammo_box/a543/rubber
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	category = list("Ammo")
	build_type = PROTOLATHE

/datum/supply_pack/security/armory/ammo5x43mm
	name = ".5x43mm Ammunition Crate"
	desc = "Contains two boxes of .5x43mm rubber bullets and two boxes of .5x43mm lethal bullets. Requires Armory access to open."
	cost = 8500
	contains = list(/obj/item/ammo_box/a543/rubber,
					/obj/item/ammo_box/a543/rubber,
					/obj/item/ammo_box/a543/lethal,
					/obj/item/ammo_box/a543/lethal)
	crate_name = ".5x43mm ammunition crate"
