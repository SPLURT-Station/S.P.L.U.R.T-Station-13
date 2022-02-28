/obj/item/ammo_box/g4570
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/c45
	name = "ammo box (.45 Rubber)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'

obj/item/ammo_box/c45/taser
	name = "ammo box (.45 Taser)"
	icon_state = "45box-y"
	ammo_type = /obj/item/ammo_casing/c45/taser

obj/item/ammo_box/c45/lethal
	name = "ammo box (.45 Lethal)"
	icon_state = "45box-r"
	ammo_type = /obj/item/ammo_casing/c45/lethal

obj/item/ammo_box/c45/stun
	name = "ammo box (.45 Stun)"
	icon_state = "45box-c"
	ammo_type = /obj/item/ammo_casing/c45/stun

obj/item/ammo_box/c45/laser
	name = "ammo box (.45 Laser)"
	icon_state = "45box-o"
	ammo_type = /obj/item/ammo_casing/c45/laser

obj/item/ammo_box/c45/hydra
	name = "ammo box (.45 Hydra-shock)"
	icon_state = "45box-g"
	ammo_type = /obj/item/ammo_casing/c45/hydra

obj/item/ammo_box/c45/hotshot
	name = "ammo box (.45 Hotshot)"
	icon_state = "45box-o"
	ammo_type = /obj/item/ammo_casing/c45/hotshot

obj/item/ammo_box/c45/ion
	name = "ammo box (.45 Ion)"
	icon_state = "45box-c"
	ammo_type = /obj/item/ammo_casing/c45/ion

obj/item/ammo_box/c45/trac
	name = "ammo box (.45 Trac)"
	ammo_type = /obj/item/ammo_casing/c45/trac

/obj/item/ammo_box/c22lr
	name = "ammo box (.22)"
	icon_state = "22box"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/c22lr
	max_ammo = 24

/datum/design/c45/c45r
	name = "Box of ammo (.45 Rubber)"
	desc = "A box of .45 Rubber"
	id = "c45r"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45leath
	name = "Box of ammo (.45 Lethal)"
	desc = "A box of .45 Lethal"
	id = "c45leath"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/lethal
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45t
	name = "Box of ammo (.45 Taser)"
	desc = "A box of .45 Taser"
	id = "c45t"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/taser
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45hydra
	name = "Box of ammo (.45 Hydra-Shock)"
	desc = "A box of .45 Hydra-shock"
	id = "c45hydra"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/hydra
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45hot
	name = "Box of ammo (.45 Hotshot)"
	desc = "A box of .45 Hotshot"
	id = "c45hot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/hotshot
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45trac
	name = "Box of ammo (.45 Trac)"
	desc = "A box of .45 Trac"
	id = "c45trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c45/trac
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45stun
	name = "Box of ammo (.45 Stun)"
	desc = "A box of .45 Stun"
	id = "c45stun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/uranium = 150)
	build_path = /obj/item/ammo_box/c45/trac
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45las
	name = "Box of ammo (.45 Laser)"
	desc = "A box of .45 Laser"
	id = "c45las"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/uranium = 150)
	build_path = /obj/item/ammo_box/c45/laser
	category = list("ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c45/c45ion
	name = "Box of ammo (.45 Ion)"
	desc = "A box of .45 Ion"
	id = "c45ion"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/uranium = 150)
	build_path = /obj/item/ammo_box/c45/ion
	category = list("ammo")
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


