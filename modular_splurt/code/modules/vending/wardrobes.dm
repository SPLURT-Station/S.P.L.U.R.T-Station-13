/obj/machinery/vending/wardrobe/bar_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/neck/petcollar/handmade = 3
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/det_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/suit/det_suit/lanyard = 1
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/curator_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/suit/fakearmor/press = 1,
			/obj/item/clothing/head/press_helmet = 1
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/engi_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/under/radkini = 2,
		/obj/item/clothing/mask/gas/radmask = 2
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/law_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_blue = 3,
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_red = 3,
		/obj/item/clothing/under/suit/black_really_collared = 3,
		/obj/item/clothing/under/suit/black_really_collared/skirt = 3,
		/obj/item/clothing/under/suit/inferno = 3,
		/obj/item/clothing/under/suit/inferno/skirt = 3,
		/obj/item/clothing/under/suit/inferno/beeze
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/hydro_wardrobe/Initialize(mapload)
	var/list/extra_contraband = list(
		/obj/item/clothing/under/suit/scarface = 2,
	)
	LAZYADD(contraband, extra_contraband)
	. = ..()

/obj/machinery/vending/wardrobe/cargo_wardrobe/Initialize(mapload)
	var/list/extra_contraband = list(
		/obj/item/clothing/under/suit/scarface = 2,
	)
	LAZYADD(contraband, extra_contraband)
	. = ..()

/obj/machinery/vending/wardrobe/blueshield_wardrobe
	name = "\improper BlueDrobe"
	desc = "A vending machine for blueshield and blueshield-related clothing!"
	icon_state = "commdrobe"
	icon = 'modular_splurt/icons/obj/objects.dmi'
	product_ads = "Protect and Serve!;Feel good while keeping people alive!;"
	vend_reply = "Thank you for using the BlueDrobe!"
	products = list(/obj/item/clothing/under/rank/blueshield = 1,
					/obj/item/clothing/under/rank/blueshield/formal = 1,
					/obj/item/clothing/under/rank/blueshield/skirt = 1,
					/obj/item/storage/backpack/blueshield = 1,
					/obj/item/storage/backpack/satchel/blueshield = 1,
					/obj/item/storage/backpack/duffelbag/blueshield = 1,
					/obj/item/clothing/shoes/jackboots = 2,
					/obj/item/clothing/head/soft/blueshield  =1,
					/obj/item/clothing/head/blueshield = 1,
					/obj/item/clothing/head/blueshield/formal = 1,
					/obj/item/clothing/head/blueshield/officercap = 1,
					/obj/item/clothing/neck/tie/blue = 1,
					/obj/item/clothing/under/rank/blueshield/formal/skirt = 1,
					/obj/item/clothing/shoes/jackboots/tall = 2)
	refill_canister = /obj/item/vending_refill/wardrobe/blueshield_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_STRONG_BLUE

/obj/item/vending_refill/wardrobe/blueshield_wardrobe
	machine_name = "BlueDrobe"

/obj/machinery/vending/wardrobe/bridgeofficer_wardrobe
	name = "\improper CommDrobe"
	desc = "A vending machine for bridge officers and officer-related clothing!"
	icon_state = "commdrobe"
	icon = 'modular_splurt/icons/obj/objects.dmi'
	product_ads = "Make yourself feel important!;Feel good while serving command!;"
	vend_reply = "Thank you for using the BlueDrobe!"
	products = list(/obj/item/clothing/under/rank/bridgeofficer = 2,
					/obj/item/clothing/under/rank/bridgeofficer/skirt = 2,
					/obj/item/clothing/under/rank/bridgeofficer/formal = 2,
					/obj/item/clothing/head/bridgeofficer = 2,
					/obj/item/clothing/head/bridgeofficer/beret = 2,
					/obj/item/clothing/suit/toggle/brigdesec = 2,
					/obj/item/storage/backpack = 2,
					/obj/item/storage/backpack/satchel = 2,
					/obj/item/storage/backpack/duffelbag = 2,
					/obj/item/clothing/gloves/color/black = 2,
					/obj/item/clothing/shoes/sneakers/brown  =2,
					/obj/item/clothing/shoes/sneakers/black = 2,
					/obj/item/clothing/shoes/sneakers/blue = 2,
					/obj/item/clothing/neck/tie/blue = 2,
					/obj/item/clothing/neck/tie/red = 2,
					/obj/item/clothing/neck/tie/black =2)
	refill_canister = /obj/item/vending_refill/wardrobe/blueshield_wardrobe
	payment_department = ACCOUNT_CIV
	light_color = COLOR_STRONG_BLUE

/obj/item/vending_refill/wardrobe/blueshield_wardrobe
	machine_name = "BlueDrobe"

/obj/machinery/vending/wardrobe/hos_wardrobe
	name = "\improper HOSDrobe"
	desc = "A vending machine for the head of security and security-related clothing!"
	icon_state = "secdrobe"
	product_ads = "Beat perps in style!;It's red so you can't see the blood!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Thank you for using the SecDrobe!"
	products = list(/obj/item/clothing/neck/cloak/hos = 1,
					/obj/item/storage/backpack/security = 1,
					/obj/item/storage/backpack/satchel/sec = 1,
					/obj/item/storage/backpack/duffelbag/sec = 1,
					/obj/item/clothing/suit/toggle/armor/hos/hos_formal = 1,
					/obj/item/clothing/shoes/jackboots = 1,
					/obj/item/clothing/under/rank/security/head_of_security/parade/female = 1,
					/obj/item/clothing/under/rank/security/head_of_security/parade = 1,
					/obj/item/clothing/under/rank/security/officer/blueshirt/seccorp/hoscorp = 1,
					/obj/item/clothing/under/rank/security/head_of_security/skirt = 1,
					/obj/item/clothing/under/rank/security/head_of_security/alt = 1,
					/obj/item/clothing/under/rank/security/head_of_security/alt/skirt = 1,
					/obj/item/clothing/head/HoS = 1,
					/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch = 1,
					/obj/item/clothing/glasses/hud/security/sunglasses/gars/supergars = 1,
					/obj/item/clothing/under/rank/security/head_of_security/grey = 1,
					/obj/item/clothing/suit/hooded/wintercoat/hos = 1,
					/obj/item/clothing/suit/armor/vest/leather = 1,
					/obj/item/clothing/suit/armor/hos = 1,
					/obj/item/clothing/under/rank/security/head_of_security/peacekeeper = 1,
					/obj/item/clothing/head/beret/sec/peacekeeper/hos = 1,
					/obj/item/clothing/head/HoS/peacekeeper = 1,
					/obj/item/clothing/suit/armor/hos/peacekeeper = 1
					)
	refill_canister = /obj/item/vending_refill/wardrobe/sec_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_MOSTLY_PURE_RED

/obj/item/vending_refill/wardrobe/hos_wardrobe
	machine_name = "HOSDrobe"
