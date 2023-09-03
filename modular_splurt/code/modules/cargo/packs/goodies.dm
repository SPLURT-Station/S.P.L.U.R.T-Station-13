/obj/item/switchblade/butterfly
	name = "butterfly knife"
	icon_state = "butterflyknife"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	item_state = "knife"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "A sharp, concealable, fodling knife. Also known as a Balisong fan knife."
	flags_1 = CONDUCT_1
	force = 3
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 5
	throw_speed = 3
	throw_range = 6
	custom_materials = list(/datum/material/iron=1200)
	hitsound = 'sound/weapons/genhit.ogg'
	attack_verb = list("stubbed", "poked")
	resistance_flags = FIRE_PROOF
	extended = 0

/obj/item/switchblade/butterfly/attack_self(mob/user)
	extended = !extended
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)
	if(extended)
		force = 20
		w_class = WEIGHT_CLASS_NORMAL
		throwforce = 23
		icon_state = "butterflyknife_open"
		attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
		hitsound = 'sound/weapons/bladeslice.ogg'
		sharpness = SHARP_EDGED
	else
		force = 3
		w_class = WEIGHT_CLASS_SMALL
		throwforce = 5
		icon_state = "butterflyknife"
		attack_verb = list("stubbed", "poked")
		hitsound = 'sound/weapons/genhit.ogg'
		sharpness = SHARP_NONE

/datum/supply_pack/goody/switchblade_single
	name = "Switch blade Single-Pack"
	desc = "Contains one sharpened switchblade. Guaranteed to fit snugly inside any Nanotrasen-standard boot."
	cost = 600
	contains = list(/obj/item/switchblade)

/datum/supply_pack/goody/butterfly_single
	name = "Butterfly Single-Pack"
	desc = "Contains one sharpened butterfly knife. Guaranteed to fit snugly inside any Nanotrasen-standard boot."
	cost = 600
	contains = list(/obj/item/switchblade/butterfly)

/datum/supply_pack/goody/varmint_single
	name = "Varmint Rifle Single-Pack"
	desc = "Contains a parts kit to assemble a varmint rifle."
	cost = 600
	contains = list(/obj/item/gunpart/riflevarmintsotck, /obj/item/gunpart/riflevarmintbarrel, /obj/item/ammo_box/c22lr)

/datum/supply_pack/goody/huntingrifle_single
	name = "Hunting Rifle Single-Pack"
	desc = "Contains a parts kit to assemble a hunting rifle."
	cost = 1000
	contains = list(/obj/item/gunpart/rifle308sotck, /obj/item/gunpart/rifle308barrel, /obj/item/ammo_box/a308, /obj/item/ammo_box/a308, /obj/item/ammo_box/a308)

/datum/supply_pack/goody/sawndbshotgun_single
	name = "Sawn-off Double Barrel Shotgun Single-Pack"
	desc = "Contains a parts kit to assemble a sawn off shotgun."
	cost = 700
	contains = list(/obj/item/gunpart/shotgunstock, /obj/item/gunpart/shotgunbarrelsawn, /obj/item/storage/box/rubbershot)

/datum/supply_pack/goody/dbshotgun_single
	name = "Double Barrel Shotgun Single-Pack"
	desc = "Contains a parts kit to assemble a double barrel shotgun."
	cost = 700
	contains = list(/obj/item/gunpart/shotgunstock, /obj/item/gunpart/shotgunbarrel, /obj/item/storage/box/rubbershot)

/datum/supply_pack/goody/pistol22_single
	name = ".22 Pistol Single-Pack"
	desc = "Contains a parts kit to assemble a .22 Pistol."
	cost = 500
	contains = list(/obj/item/gunpart/pistol22frame, /obj/item/gunpart/pistol22barrel, /obj/item/gunpart/pistol22bolt, /obj/item/ammo_box/magazine/m22, /obj/item/ammo_box/magazine/m22)

/datum/supply_pack/goody/revolver22_single
	name = ".22 Revolver Single-Pack"
	desc = "Contains a parts kit to assemble a .22 revolver."
	cost = 500
	contains = list(/obj/item/gunpart/revolver22frame, /obj/item/gunpart/revolver22cylinder, /obj/item/ammo_box/c22lr)

/datum/supply_pack/goody/pistol9_single
	name = "9mm Pistol Single-Pack"
	desc = "Contains a parts kit to assemble a 9mm Pistol. Comes with 9mm Rubber"
	cost = 900
	contains = list(/obj/item/gunpart/pistol9frame, /obj/item/gunpart/pistol9slide, /obj/item/ammo_box/magazine/m9/rubber, /obj/item/ammo_box/magazine/m9/rubber)

/datum/supply_pack/goody/pistol45_single
	name = ".45 Pistol Single-Pack"
	desc = "Contains a pre-assembled .45 caliber M1911. Comes with .45 Rubber."
	cost = 900
	contains = list(/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag, /obj/item/ammo_box/magazine/m45/rubber, /obj/item/ammo_box/magazine/m45/rubber, /obj/item/ammo_box/magazine/m45/rubber)

/datum/supply_pack/goody/lasercivlian_single
	name = "Civilian Energy Pistol Single-Pack"
	desc = "Contains a parts kit to assemble a civlian energy pistol."
	cost = 800
	contains = list(/obj/item/gunpart/civilianlaserframe, /obj/item/gunpart/civilianlaserbarrel)

/datum/supply_pack/goody/brushgun2_signle
	name = ".45 Brush Gun Single-Pack"
	desc = "Contains a parts kit to assemble a 45 Long Brush Gun. Comes with a box of .45 Long"
	cost = 1500
	contains = list( /obj/item/gunpart/riflebrush2stock, /obj/item/gunpart/riflebrush2barrel, /obj/item/ammo_box/g45l)

/datum/supply_pack/goody/revolver45_single
	name = ".45 Revolver Single-Pack"
	desc = "Contains a parts kit to assemble a 45 Revolver Gun. Comes with a box of .45 Long"
	cost = 800
	contains = list( /obj/item/gunpart/revolver45cylinder, /obj/item/gunpart/revolver45frame, /obj/item/ammo_box/g45l)

/datum/supply_pack/goody/huntingshotgun_single
	name = "Hunting Shotgun Single-Pack"
	desc = "Contains a parts kit to assemble a hunting shotgun."
	cost = 1700
	contains = list(/obj/item/gunpart/shotgunhutningstock, /obj/item/gunpart/shotgunhutningbarrel, /obj/item/storage/box/lethalshot)
