/obj/machinery/vending/clothing/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/assu_suit = 16,
		/obj/item/clothing/head/assu_helmet = 16,
		/obj/item/clothing/glasses/aviators = 10,
		/obj/item/clothing/glasses/sunglasses = 10,
		/obj/item/clothing/underwear/briefs/panties/panties_cow = 16,
		/obj/item/clothing/underwear/shirt/top/bra_cow = 16,
		/obj/item/clothing/underwear/socks/thigh/thigh_cow = 16
	)
	LAZYADD(products, extra_products)
	. = ..()
