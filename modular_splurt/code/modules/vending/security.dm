/obj/machinery/vending/security/Initialize()
	var/list/extra_products = list(
		/obj/item/ammo_box/magazine/e45/taser = 10,
		/obj/item/device/hailer = 10,
		/obj/item/clothing/suit/armor/vest/metrocop = 2,
		/obj/item/clothing/head/helmet/metrocop = 2
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/sec_wardrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/under/rank/security/officer/metrocop = 2,
		/obj/item/clothing/under/rank/security/skirt/slut = 5,
		/obj/item/clothing/under/rank/security/skirt/slut/pink = 5,
		/obj/item/clothing/under/rank/security/stripper = 5
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/structure/closet/secure_closet/brigdoc
	name = "brig physician's locker"
	req_access = list(ACCESS_BRIGDOC)
	icon_state = "brigdoc"
	icon = 'modular_splurt/icons/obj/closet.dmi'

/obj/structure/closet/secure_closet/brigdoc/PopulateContents()
	..()
	new /obj/item/clothing/under/rank/brigdoc(src)
	new /obj/item/clothing/under/rank/brigdoc/skirt(src)
	new /obj/item/radio/headset/headset_brigdoc(src)
	new /obj/item/radio/headset/headset_brigdoc/alt(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/head/brigdoc(src)
	new /obj/item/defibrillator(src)
	new /obj/item/clothing/suit/brigdoc(src)
	new /obj/item/clothing/suit/brigdoc/labcoat(src)

/obj/structure/closet/secure_closet/blueshield
	name = "blueshield's locker"
	req_access = list(ACCESS_BLUESHIELD)
	icon_state = "bs"
	icon = 'modular_splurt/icons/obj/closet.dmi'

/obj/structure/closet/secure_closet/blueshield/PopulateContents()
	..()
	new /obj/item/clothing/head/helmet/sec/blueshield(src)
	new /obj/item/radio/headset/headset_blueshield(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/storage/belt/security/bs(src)
	new /obj/item/storage/firstaid/brute(src)
	new /obj/item/storage/firstaid/fire(src)
	new /obj/item/storage/firstaid/o2(src)
	new /obj/item/storage/firstaid/toxin(src)

/obj/structure/closet/secure_closet/bridgesec
	name = "bridge officer's locker"
	req_access = list(ACCESS_BRIDGE_OFFICER)
	icon_state = "bridge"
	icon = 'modular_splurt/icons/obj/closet.dmi'

/obj/structure/closet/secure_closet/bridgesec/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_bo(src)
	new /obj/item/radio/headset/headset_bo(src)
	new /obj/item/radio/headset/headset_bo/bowman(src)
	new /obj/item/radio/headset/headset_bo/bowman(src)
	new /obj/item/clipboard(src)
	new /obj/item/clipboard(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/clothing/neck/petcollar(src)

//do not map these in anywhere but if you do, Central command only!!! These are for Admin spawn only!!!!

/obj/structure/closet/secure_closet/mopp
	name = "advance MOPP locker"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/mopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/commandmopp
	name = "advance MOPP locker 'Commander'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/commandmopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/commander(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/secmopp
	name = "advance MOPP locker 'secuirity'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/secmopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/security(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/medmopp
	name = "advance MOPP locker 'medical'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/medmopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/medical(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/engimopp
	name = "advance MOPP locker 'engineering'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/engimopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/engi(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)


/obj/structure/closet/secure_closet/hosnew //ITS LOCKER CLEAN OUT DAY! -Radar
	name = "\proper head of security's locker"
	req_access = list(ACCESS_HOS)
	icon_state = "hos"

/obj/structure/closet/secure_closet/hosnew/PopulateContents()
	..()
	new /obj/item/storage/bag/ammo(src)
	new /obj/item/cartridge/hos(src)
	new /obj/item/radio/headset/heads/hos(src)
	new /obj/item/storage/lockbox/medal/sec(src)
	new /obj/item/megaphone/sec(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/lockbox/loyalty(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/shield/riot/tele(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/choice_beacon/hosgun(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/pinpointer/nuke(src)
	new /obj/item/circuitboard/machine/techfab/department/security(src)
	new /obj/item/storage/photo_album/HoS(src)
	new /obj/item/card/id/departmental_budget/sec(src)

/obj/structure/closet/secure_closet/correctional
	name = "correctional officer's locker"
	req_access = list(ACCESS_CORRECTIONS)
	icon_state = "sec"

/obj/structure/closet/secure_closet/correctional/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_correctional/alt(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/storage/belt/security/corrections(src)
	new /obj/item/storage/backpack/corrections(src)
	new /obj/item/storage/backpack/satchel/corrections(src)
	new /obj/item/storage/backpack/duffelbag/corrections(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/clothing/gloves/correctional(src)
	new /obj/item/clothing/head/beret/sec/peacekeeper/cap(src)
	new /obj/item/clothing/head/beret/sec/peacekeeper(src)
	new /obj/item/clothing/suit/armor/vest/stabvest(src)
	new /obj/item/clothing/under/rank/security/officer/correctional(src)

/obj/machinery/vending/corrections
	name = "\improper CorTech"
	desc = "A correctional equipment vendor."
	product_ads = "Crack communist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	light_mask = "sec-light-mask"
	req_access = list(ACCESS_CORRECTIONS)
	products = list(/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/chem_grenade/teargas = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/flashlight/seclite = 4,
					/obj/item/electropack/shockcollar/security = 5,
					/obj/item/clothing/neck/petcollar/locked/security = 5)
	refill_canister = /obj/item/vending_refill/security
	default_price = PRICE_ALMOST_EXPENSIVE
	extra_price = PRICE_REALLY_EXPENSIVE
	payment_department = ACCOUNT_COR

/obj/machinery/vending/blueshield
	name = "\improper BlueTech"
	desc = "A blueshield equipment vendor."
	product_ads = "Crack communist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	light_mask = "sec-light-mask"
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/restraints/handcuffs = 8,
					/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/flashbang = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/flashlight/seclite = 4,
					/obj/item/restraints/legcuffs/bola/energy = 6,
					/obj/item/storage/fancy/donut_box = 2,
					/obj/item/electropack/shockcollar/security = 5,
					/obj/item/clothing/neck/petcollar/locked/security = 5,
					/obj/item/storage/belt/slut = 5,
					/obj/item/clothing/mask/gas/sechailer/slut = 5,
					/obj/item/bdsm_whip/ridingcrop = 3,
					/obj/item/grenade/secbed = 3)
	premium = list(/obj/item/coin/antagtoken = 1,
					/obj/item/grenade/stingbang = 3,
					/obj/item/storage/bag/ammo = 3)
	refill_canister = /obj/item/vending_refill/security
	default_price = PRICE_ALMOST_EXPENSIVE
	extra_price = PRICE_REALLY_EXPENSIVE
	payment_department = ACCOUNT_SEC
