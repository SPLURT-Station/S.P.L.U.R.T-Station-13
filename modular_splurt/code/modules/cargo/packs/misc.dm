/datum/supply_pack/misc/cap_e45 // I am mad I even have to do this. -Radar
	name = "Captain's Enforcer .45"
	desc = "A gold handgun meant for the Captain."
	access = ACCESS_CAPTAIN
	cost = 6000
	contains = list(/obj/item/gun/ballistic/automatic/pistol/enforcergold,
    /obj/item/ammo_box/magazine/e45/lethal,
    /obj/item/ammo_box/magazine/e45/lethal,
    /obj/item/ammo_box/magazine/e45,
    /obj/item/ammo_box/magazine/e45,
    /obj/item/ammo_box/magazine/e45,
    /obj/item/ammo_box/magazine/e45/taser,
    /obj/item/ammo_box/magazine/e45/taser,
    /obj/item/ammo_box/magazine/e45/taser)
	crate_name = "captain's .45"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/m1911s
	name = "M1911s"
	desc = "A pack of 3 M1911s with 9 mags of rubber."
	access = ACCESS_QM
	cost = 2800
	contains = list(/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag,
					/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag,
					/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber,
					/obj/item/ammo_box/magazine/m45/rubber)
	crate_name = ".45 pistols"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/m22pistols
	name = ".22 Pistols"
	desc = "A pack of .22 Pistols with 6 spare magazines."
	access = ACCESS_QM
	cost = 1700
	contains = list(/obj/item/gun/ballistic/automatic/pistol/m22pistol,
					/obj/item/gun/ballistic/automatic/pistol/m22pistol,
					/obj/item/gun/ballistic/automatic/pistol/m22pistol,
					/obj/item/ammo_box/magazine/m22,
					/obj/item/ammo_box/magazine/m22,
					/obj/item/ammo_box/magazine/m22,
					/obj/item/ammo_box/magazine/m22,
					/obj/item/ammo_box/magazine/m22,
					/obj/item/ammo_box/magazine/m22)
	crate_name = ".22 pistols"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/r22revolvers
	name = ".22 Revolvers"
	desc = "A pack of .22 Pistols with 3 spare boxes of ammo."
	access = ACCESS_QM
	cost = 1700
	contains = list(/obj/item/gun/ballistic/revolver/r22lr,
					/obj/item/gun/ballistic/revolver/r22lr,
					/obj/item/gun/ballistic/revolver/r22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr)
	crate_name = ".22 Revolvers"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/m22pistols
	name = "9mm Pistols"
	desc = "A pack of 9mm Pistols with 6 spare magazines."
	access = ACCESS_QM
	cost = 2800
	contains = list(/obj/item/gun/ballistic/automatic/pistol/m9mmpistol,
					/obj/item/gun/ballistic/automatic/pistol/m9mmpistol,
					/obj/item/gun/ballistic/automatic/pistol/m9mmpistol,
					/obj/item/ammo_box/magazine/m9,
					/obj/item/ammo_box/magazine/m9,
					/obj/item/ammo_box/magazine/m9,
					/obj/item/ammo_box/magazine/m9,
					/obj/item/ammo_box/magazine/m9,
					/obj/item/ammo_box/magazine/m9)
	crate_name = "9mm pistols"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/c22lrammo
	name = ".22 ammo boxes"
	desc = "A pack of 6 boxes of .22 ammo."
	access = ACCESS_QM
	cost = 900
	contains = list(/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr)
	crate_name = ".22 ammo"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/varmintrifles
	name = "Varmint Rifles"
	desc = "A pack of varmint rifles with 3 spare boxes of ammo."
	access = ACCESS_QM
	cost = 1700
	contains = list(/obj/item/gun/ballistic/shotgun/varmintrifle,
					/obj/item/gun/ballistic/shotgun/varmintrifle,
					/obj/item/gun/ballistic/shotgun/varmintrifle,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr,
					/obj/item/ammo_box/c22lr)
	crate_name = "Varmint Rifles"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/huntingrifles
	name = "Hunting Rifles"
	desc = "A pack of hunting rifles with 9 stripper clips."
	access = ACCESS_QM
	cost = 2500
	contains = list(/obj/item/gun/ballistic/shotgun/huntingrifle,
					/obj/item/gun/ballistic/shotgun/huntingrifle,
					/obj/item/gun/ballistic/shotgun/huntingrifle,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762)
	crate_name = "Hunting Rifles"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/misc/civlianlasers
	name = "Civilian Energy Pistols"
	desc = "A pack of civlian energy pistols."
	access = ACCESS_QM
	cost = 1700
	contains = list(/obj/item/gun/energy/civilian,
					/obj/item/gun/energy/civilian,
					/obj/item/gun/energy/civilian)
	crate_name = "Civilian Energy Pistols"
	crate_type = /obj/structure/closet/crate/secure/weapon
