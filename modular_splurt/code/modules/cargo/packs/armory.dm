/datum/supply_pack/security/armory/ballistic
    desc = "For when the enemy absolutely needs to be replaced with lead. Contains three Aussec-designed Combat Shotguns, with three Shotgun Bandoliers, as well as seven buckshot and 12g shotgun slugs. Requires Armory access to open."

/datum/supply_pack/security/armory/riotshotgun
	name = "Riot Shotguns Crate"
	desc = "Peace is broken, time to quell a riot. Contains 3 NT made Riot control shotguns and assoiated ammo. Also comes with three shotgun bandoliers . Requires Armory access to open."
	cost = 8000
	contains = list(/obj/item/gun/ballistic/shotgun/riot,
					/obj/item/gun/ballistic/shotgun/riot,
					/obj/item/gun/ballistic/shotgun/riot,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/box/rubbershot,
					/obj/item/storage/box/rubbershot)
	crate_name = "riot shotguns crate"

/datum/supply_pack/security/armory/shortshotguns
	name = "Super Short Shotguns Crate"
	desc = "Contains 3 super short compact shotguns based on the riot shotgun and assoiated ammo. Also comes with three shotgun bandoliers . Requires Armory access to open."
	cost = 5000
	contains = list(/obj/item/gun/ballistic/shotgun/shorty,
					/obj/item/gun/ballistic/shotgun/shorty,
					/obj/item/gun/ballistic/shotgun/shorty,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/rubbershot)
	crate_name = "super short shotguns crate"

/datum/supply_pack/security/armory/e45ammo
	name = "Enforcer Non-lethal Ammo Crate"
	desc = "Contains 10 8-round magazines for the Mk. 58 Enforcer. Requires Armory access to open."
	cost = 900
	contains = list(/obj/item/ammo_box/magazine/e45,
					/obj/item/ammo_box/magazine/e45/taser,
					/obj/item/ammo_box/magazine/e45/trac,
					/obj/item/ammo_box/magazine/e45,
					/obj/item/ammo_box/magazine/e45/taser,
					/obj/item/ammo_box/magazine/e45/trac,
					/obj/item/ammo_box/magazine/e45,
					/obj/item/ammo_box/magazine/e45/taser,
					/obj/item/ammo_box/magazine/e45/trac,
					/obj/item/ammo_box/magazine/e45)
	crate_name = "pistol ammo crate"

/datum/supply_pack/security/armory/e45ammolethal
	name = "Enforcer Lethal Ammo Crate"
	desc = "Contains 10 8-round magazines for the Mk. 58 Enforcer. Requires Armory access to open."
	cost = 1200
	contains = list(/obj/item/ammo_box/magazine/e45/lethal,
					/obj/item/ammo_box/magazine/e45/hydra,
					/obj/item/ammo_box/magazine/e45/hotshot,
					/obj/item/ammo_box/magazine/e45/hydra,
					/obj/item/ammo_box/magazine/e45/lethal,
					/obj/item/ammo_box/magazine/e45/hydra,
					/obj/item/ammo_box/magazine/e45/hotshot,
					/obj/item/ammo_box/magazine/e45/hotshot,
					/obj/item/ammo_box/magazine/e45/lethal,
					/obj/item/ammo_box/magazine/e45/hydra)
	crate_name = "pistol ammo crate"

/datum/supply_pack/security/armory/riotgun
	name = "Riot Gun Crate"
	desc = "Contains 3 Riot Grenade launchers. Requires Armory access to open."
	cost = 1500
	contains = list(/obj/item/gun/grenadelauncher,
					/obj/item/gun/grenadelauncher,
					/obj/item/gun/grenadelauncher)
	crate_name = "riot gun crate"

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
