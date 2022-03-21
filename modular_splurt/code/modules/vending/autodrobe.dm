/obj/machinery/vending/autodrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/hooded/corpus = 1,
		/obj/item/clothing/suit/hooded/corpus/c = 1
	)
	LAZYADD(products, extra_products)
	. = ..()

