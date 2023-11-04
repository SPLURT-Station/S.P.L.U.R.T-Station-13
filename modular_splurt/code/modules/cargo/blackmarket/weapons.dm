/datum/blackmarket_item/syndi/weapon/gatling_laser
	price_min = 0
	price_max = 0
	stock_min = 0
	stock_max = 0
	availability_prob = 0 // Zeroing this out so it can't be used at all
//Standard

/datum/blackmarket_item/weapon/luger
	name = "P-08 Luger"
	desc = "A P-08 Luger modded to fire the standard 10mm rounds."
	item = /obj/item/gun/ballistic/automatic/pistol/luger/mag
	price_min = 30000
	price_max = 50000
	stock_min = 1
	stock_max = 8
	availability_prob = 85

/datum/blackmarket_item/weapon/saber
	name = "Old Nanotrasen Saber SMG"
	desc = "Old Prototype SMG. Has fallen out of use with old models ending up here. A rare find"
	item = /obj/item/gun/ballistic/automatic/proto/unrestricted
	price_min = 100000
	price_max = 200000
	stock_min = 1
	stock_max = 4
	availability_prob = 60

/datum/blackmarket_item/weapon/sabermag
	name = "Old Nanotrasen Saber magazines"
	desc = "Old Prototype SMG magazines. The mags are harder to find then the actual SMG"
	item = /obj/item/ammo_box/magazine/smgm9mm
	price_min = 150000
	price_max = 250000
	stock_min = 1
	stock_max = 4
	availability_prob = 55

/datum/blackmarket_item/weapon/miniuzi
	name = "Type U3 Uzi"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds"
	item = /obj/item/gun/ballistic/automatic/mini_uzi
	price_min = 300000
	price_max = 450000
	stock_min = 1
	stock_max = 4
	availability_prob = 50

/datum/blackmarket_item/weapon/miniuzimag
	name = "Type U3 Uzi magazine"
	desc = "Magazines for the Type U3 Uzi"
	item = /obj/item/ammo_box/magazine/uzim9mm
	price_min = 250000
	price_max = 350000
	stock_min = 1
	stock_max = 4
	availability_prob = 50

/datum/blackmarket_item/weapon/ar
	name = "NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by Nanotrasen fighting forces."
	item = /obj/item/gun/ballistic/automatic/ar
	price_min = 350000
	price_max = 450000
	stock_min = 1
	stock_max = 4
	availability_prob = 25

/datum/blackmarket_item/weapon/leveraction
	name = "lever-action rifle"
	desc = "While lever-actions have been horribly out of date for hundreds of years now, the reported potential versatility of .38 Special is worth paying attention to."
	item = /obj/item/gun/ballistic/shotgun/leveraction
	price_min = 200000
	price_max = 300000
	stock_min = 1
	stock_max = 4
	availability_prob = 70

/datum/blackmarket_item/weapon/brushgun4570
	name = "brush gun (.45-70 GOVT)"
	desc = "While lever-actions have been horribly out of date for hundreds of years now, putting a nicely sized hole in a man-sized target with a .45-70 round has stayed relatively timeless."
	item = /obj/item/gun/ballistic/shotgun/brush
	price_min = 300000
	price_max = 400000
	stock_min = 1
	stock_max = 4
	availability_prob = 50

/datum/blackmarket_item/weapon/armag
	name = "5.56 magazine"
	desc = "5.56 Magazines for the assault rifles"
	item = /obj/item/ammo_box/magazine/m556
	price_min = 250000
	price_max = 450000
	stock_min = 2
	stock_max = 12
	availability_prob = 25

/datum/blackmarket_item/weapon/oldshotgun
	name = "Pump action shotgun'"
	desc = "A traditional shotgun with wood furniture and a four-shell capacity underneath."
	item = /obj/item/gun/ballistic/shotgun
	price_min = 300000
	price_max = 400000
	stock_min = 1
	stock_max = 4
	availability_prob = 60

// Sydi items

//pistols

/datum/blackmarket_item/syndi/weapon/stechkin
	name = "Stechkin Pistol"
	desc = "A small, easily concealable 10mm handgun. Has a threaded barrel for suppressors."
	item = /obj/item/storage/box/syndie_kit/pistol
	price_min = 200000
	price_max = 400000
	stock_min = 1
	stock_max = 8
	availability_prob = 95

/datum/blackmarket_item/syndi/weapon/modular
	name = "Modular Pistol"
	desc = "A small, easily concealable 10mm handgun. Has a threaded barrel for suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol/modular
	price_min = 210500
	price_max = 410500
	stock_min = 1
	stock_max = 8
	availability_prob = 85

/datum/blackmarket_item/syndi/weapon/c10mmmags
	name = "10mm Pistol Mags"
	desc = "Spare magazines for 10mm handguns such as the Stechkin Pistol and the Modular pistol, weapons sold seperatly."
	item = /obj/item/ammo_box/magazine/m10mm
	price_min = 125000
	price_max = 150000
	stock_min = 5
	stock_max = 15
	availability_prob = 95

/datum/blackmarket_item/syndi/weapon/deagle
	name = "Desert Eagle (.50AE)"
	desc = "A robust 50 AE pistol."
	item = /obj/item/gun/ballistic/automatic/pistol/deagle
	price_min = 300000
	price_max = 500000
	stock_min = 1
	stock_max = 5
	availability_prob = 30

/datum/blackmarket_item/syndi/weapon/deaglemags
	name = "Desert Eagle Magazine (50AE)"
	desc = "A magazine for Desert Eagles (50AE)"
	item = /obj/item/ammo_box/magazine/m50
	price_min = 250000
	price_max = 400000
	stock_min = 2
	stock_max = 10
	availability_prob = 30

/datum/blackmarket_item/syndi/weapon/aps
	name = "Stechkin APS pistol"
	desc = "The original Russian version of a widely used Syndicate sidearm. Uses 9mm ammo. Has a threaded barrel for suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol/APS
	price_min = 250000
	price_max = 450000
	stock_min = 1
	stock_max = 5
	availability_prob = 75

/datum/blackmarket_item/syndi/weapon/apsmags
	name = "Stechkin APS magazine"
	desc = "15 round 9mm magazines for the APS."
	item = /obj/item/ammo_box/magazine/pistolm9mm
	price_min = 150000
	price_max = 350000
	stock_min = 2
	stock_max = 10
	availability_prob = 80

/datum/blackmarket_item/syndi/weapon/deagle2
	name = "Desert Eagle (.357)"
	desc = "A robust .357 pistol."
	item = /obj/item/gun/ballistic/automatic/pistol/deagle2
	price_min = 300000
	price_max = 400000
	stock_min = 2
	stock_max = 10
	availability_prob = 40

/datum/blackmarket_item/syndi/weapon/deagle2mags
	name = "Desert Eagle Magazine (.357)"
	desc = "A magazine for Desert Eagles (357)"
	item = /obj/item/ammo_box/magazine/m357
	price_min = 250000
	price_max = 350000
	stock_min = 2
	stock_max = 10
	availability_prob = 40

//Revolvers

/datum/blackmarket_item/syndi/weapon/mateba
	name = "Unica 6 auto-revolver"
	desc = "A retro high-powered autorevolver typically used by officers of the New Russia military. Uses .357 ammo"
	item = /obj/item/gun/ballistic/revolver/mateba
	price_min = 300000
	price_max = 400000
	stock_min = 2
	stock_max = 10
	availability_prob = 35

/datum/blackmarket_item/weapon/golden
	name = "Golden revolver"
	desc = "This ain't no game, ain't never been no show, And I'll gladly gun down the oldest lady you know. Uses .357 ammo."
	item = /obj/item/gun/ballistic/revolver/golden
	price_min = 350000
	price_max = 450000
	stock_min = 2
	stock_max = 10
	availability_prob = 35

//SMGs

/datum/blackmarket_item/syndi/weapon/c20r
	name = "Scarborough Arms C-20r SMG"
	desc = "A bullpup two-round burst .45 SMG"
	item = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	price_min = 450000
	price_max = 650000
	stock_min = 1
	stock_max = 4
	availability_prob = 60

/datum/blackmarket_item/syndi/weapon/c20rmag
	name = "C-20r magazines"
	desc = "Magazines for the C-20r"
	item = /obj/item/ammo_box/magazine/smgm45
	price_min = 250000
	price_max = 350000
	stock_min = 2
	stock_max = 4
	availability_prob = 60

/datum/blackmarket_item/syndi/weapon/tommygun
	name = "Tommy gun"
	desc = "A a clone of the classic Auto Ordnance Thompson SMG"
	item = /obj/item/gun/ballistic/automatic/tommygun
	price_min = 500000
	price_max = 700000
	stock_min = 1
	stock_max = 6
	availability_prob = 25

/datum/blackmarket_item/syndi/weapon/tommygunmag
	name = "Tommy gun drum magazine"
	desc = "Drum magazines for the Tommy gun"
	item = /obj/item/ammo_box/magazine/tommygunm45
	price_min = 275000
	price_max = 375000
	stock_min = 2
	stock_max = 6
	availability_prob = 25

/datum/blackmarket_item/syndi/weapon/tommygunmag30
	name = "Tommy gun stick magazine"
	desc = "Stick magazines for the Tommy gun"
	item = /obj/item/ammo_box/magazine/tommygunm45/r30
	price_min = 252500
	price_max = 352500
	stock_min = 2
	stock_max = 6
	availability_prob = 25

/datum/blackmarket_item/syndi/weapon/smg22
	name = "Old FTU SMG"
	desc = "The left arm of the FTU"
	item = /obj/item/gun/ballistic/automatic/smg22
	price_min = 450000
	price_max = 650000
	stock_min = 1
	stock_max = 2
	availability_prob = 60

/datum/blackmarket_item/syndi/weapon/smg22mag
	name = "Old FTU SMG drum magazine"
	desc = "Magazines for the FTU SMG"
	item = /obj/item/ammo_box/magazine/smg22
	price_min = 250000
	price_max = 350000
	stock_min = 2
	stock_max = 4
	availability_prob = 60

//rifles

/datum/blackmarket_item/syndi/weapon/garand
	name = "Old Mars Service Rifle"
	desc = "A Mars copy of the greatest battle implement ever devised"
	item = /obj/item/gun/ballistic/automatic/m1garand
	price_min = 500000
	price_max = 700000
	stock_min = 1
	stock_max = 5
	availability_prob = 55

/datum/blackmarket_item/syndi/weapon/garandmag
	name = "Old Mars Enbloc clip"
	desc = "Enbloc clip for the Mars Service rifle"
	item = /obj/item/ammo_box/magazine/garand
	price_min = 300000
	price_max = 400000
	stock_min = 2
	stock_max = 10
	availability_prob = 55

/datum/blackmarket_item/weapon/m90 //Shares mags with the NT-ARG
	name = "M-90gl Carbine"
	desc = "A three-round burst 5.56 toploading carbine, designated 'M-90gl'. Has an attached underbarrel grenade launcher which can be toggled on and off"
	item = /obj/item/gun/ballistic/automatic/m90
	price_min = 600000
	price_max = 750000
	stock_min = 1
	stock_max = 4
	availability_prob = 40

/datum/blackmarket_item/weapon/fal
	name = "Old FTU Rifle"
	desc = "The right arm of the Free Trade Union "
	item = /obj/item/gun/ballistic/automatic/m1garand
	price_min = 750000
	price_max = 850000
	stock_min = 1
	stock_max = 5
	availability_prob = 50

/datum/blackmarket_item/weapon/falmag1
	name = "Old FTU Rifle 20 round magazine"
	desc = "20 round magazine for the FTU rifle"
	item = /obj/item/ammo_box/magazine/fal
	price_min = 400000
	price_max = 500000
	stock_min = 2
	stock_max = 10
	availability_prob = 40

/datum/blackmarket_item/weapon/falmag2
	name = "Old FTU Rifle 10 round magazine"
	desc = "10 round magazine for the FTU rifle"
	item = /obj/item/ammo_box/magazine/fal/r10
	price_min = 350000
	price_max = 450000
	stock_min = 2
	stock_max = 10
	availability_prob = 50

//shotguns

// /datum/blackmarket_item/weapon/cycler //Commiting out till I can fix
//	name = "cycler shotgun"
//	desc = "An advanced shotgun with two separate magazine tubes, allowing you to quickly toggle between ammo types."
//	item = /obj/item/gun/ballistic/shotgun/automatic/dual_tube
//	price_min = 800000
//	price_max = 900000
//	stock_min = 1
//	stock_max = 3
//	availability_prob = 35


/datum/blackmarket_item/syndi/weapon/bulldog
	name = "bulldog shotgun"
	desc = "A semi-auto, mag-fed shotgun for combat in narrow corridors, nicknamed 'Bulldog' by boarding parties. Compatible only with specialized 8-round drum magazines."
	item = /obj/item/gun/ballistic/shotgun/bulldog/unrestricted
	price_min = 10500000
	price_max = 11500000
	stock_min = 1
	stock_max = 3
	availability_prob = 40

/datum/blackmarket_item/syndi/weapon/bulldogmag
	name = "bulldog shotgun drum mags"
	desc = "A 8 round drum magazine for the Bulldog shotgun."
	item = /obj/item/ammo_box/magazine/m12g
	price_min = 8500000
	price_max = 9500000
	stock_min = 1
	stock_max = 3
	availability_prob = 40

//Heavy weapons

/datum/blackmarket_item/syndi/weapon/l6saw
	name = "L6 SAW"
	desc = "A heavily modified 1.95x129mm light machine gun, designated 'L6 SAW'. Has 'Aussec Armoury - 2531' engraved on the receiver below the designation."
	item = /obj/item/gun/ballistic/automatic/l6_saw/unrestricted
	price_min = 12000000
	price_max = 13000000
	stock_min = 1
	stock_max = 3
	availability_prob = 20

/datum/blackmarket_item/syndi/weapon/l6sawmag
	name = "L6 belts"
	desc = "A 50 round belt of 1.95x129mm for the L6 SAW"
	item = /obj/item/ammo_casing/mm712x82
	price_min = 8500000
	price_max = 9500000
	stock_min = 1
	stock_max = 3
	availability_prob = 20

/datum/blackmarket_item/syndi/weapon/pml9
	name = "PML-9"
	desc = "A reusable rocket propelled grenade launcher. The words \"NT this way\" and an arrow have been written near the barrel."
	item = /obj/item/gun/ballistic/rocketlauncher/unrestricted
	price_min = 15000000
	price_max = 20000000
	stock_min = 1
	stock_max = 3
	availability_prob = 10

/datum/blackmarket_item/syndi/weapon/pml9rocket
	name = "PM-9HE 84mm rocket"
	desc = "An 84mm High Explosive rocket. Fire at people and pray."
	item = /obj/item/ammo_casing/caseless/rocket
	price_min = 20000000
	price_max = 25000000
	stock_min = 1
	stock_max = 10
	availability_prob = 10
