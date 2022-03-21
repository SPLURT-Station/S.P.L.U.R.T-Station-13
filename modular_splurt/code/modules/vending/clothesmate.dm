/obj/machinery/vending/clothing/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/assu_suit = 16,
		/obj/item/clothing/head/assu_helmet = 16,
		/obj/item/clothing/glasses/aviators = 10,
		/obj/item/clothing/glasses/sunglasses = 10,
		/obj/item/clothing/suit/toggle/rp_jacket = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/orange = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/purple = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/red = 3,
		/obj/item/clothing/suit/toggle/rp_jacket/white = 3
	)
	var/list/extra_contraband = list(
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_red = 3
	)
	var/list/extra_premium = list(
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_blue = 3
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
