/obj/machinery/vending/engineering/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/under/radkini = 2,
		/obj/item/clothing/mask/gas/radmask = 2
	)
	LAZYADD(products, extra_products)
	. = ..()

