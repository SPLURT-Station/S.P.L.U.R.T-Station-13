/obj/machinery/vending/clothing/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/assu_suit = 16,
		/obj/item/clothing/head/assu_helmet = 16,
		/obj/item/clothing/head/hoodcowl = 4,
		/obj/item/clothing/glasses/aviators = 10,
		/obj/item/clothing/glasses/sunglasses = 10,
		/obj/item/clothing/suit/toggle/rp_jacket = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/orange = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/purple = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/red = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/white = 3,
		/obj/item/clothing/suit/jacket/runner/engi = 3,
		/obj/item/clothing/suit/jacket/runner/syndicate = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/white = 3,
		/obj/item/clothing/under/goner/fake/poly = 10,
		/obj/item/clothing/suit/goner/fake/poly = 10,
		/obj/item/clothing/head/helmet/goner/fake/poly = 10,
		/obj/item/clothing/under/raccveralls = 3,
		/obj/item/clothing/under/officesexy = 3,
		/obj/item/clothing/suit/toggle/tunnelfox = 3,
		/obj/item/clothing/under/performer = 2,
		/obj/item/clothing/under/bluedress = 3,
		/obj/item/clothing/accessory/shortcrop = 3,
		/obj/item/clothing/accessory/longcrop = 3,
		/obj/item/clothing/accessory/formalcrop = 3,
		/obj/item/clothing/under/misc/leia_outfit = 2,
		/obj/item/clothing/under/performer/polychromic = 2,
		/obj/item/clothing/under/suit/black_really_collared = 3,
		/obj/item/clothing/under/suit/black_really_collared/skirt = 3,
		/obj/item/clothing/under/suit/inferno = 3,
		/obj/item/clothing/under/suit/inferno/skirt = 3,
		/obj/item/clothing/under/suit/helltaker = 3,
		/obj/item/clothing/under/suit/helltaker/skirt = 3,
		/obj/item/clothing/suit/invisijacket = 3,
		/obj/item/clothing/head/invisihat = 3,
		/obj/item/clothing/under/pentatop = 3,
		/obj/item/clothing/wrists/armwarmer = 3,
		/obj/item/clothing/wrists/armwarmer/long = 3,
		/obj/item/clothing/wrists/armwarmer_striped = 3,
		/obj/item/clothing/wrists/armwarmer_striped/long = 3,
		/obj/item/clothing/glasses/contact = 3
	)
	var/list/extra_contraband = list(
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_red = 3,
		/obj/item/clothing/mask/gas/goner/basic = 10
	)
	var/list/extra_premium = list(
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_blue = 3,
		/obj/item/clothing/head/helmet/goner/officer/fake/poly = 10
	)

	if(SSevents.holidays && SSevents.holidays[CHRISTMAS])
		extra_products += list(
			/obj/item/clothing/accessory/sweater/uglyxmas = 3,
			/obj/item/clothing/under/costume/christmas = 3,
			/obj/item/clothing/under/costume/christmas/green = 3,
			/obj/item/clothing/under/costume/christmas/croptop = 3,
			/obj/item/clothing/under/costume/christmas/croptop/green = 3,
			/obj/item/clothing/suit/hooded/wintercoat/christmascoatr = 3,
			/obj/item/clothing/suit/hooded/wintercoat/christmascoatg = 3,
			/obj/item/clothing/suit/hooded/wintercoat/christmascoatrg = 3,
			/obj/item/clothing/head/christmashat = 3,
			/obj/item/clothing/head/christmashatg = 3,
			/obj/item/clothing/shoes/winterboots/christmasbootsr = 3,
			/obj/item/clothing/shoes/winterboots/christmasbootsg = 3,
			/obj/item/clothing/shoes/winterboots/santaboots = 3,
		)

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
