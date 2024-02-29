/obj/machinery/vending/games/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/toy/cards/deck/tarot = 3
	)
	LAZYADD(products, extra_products)
	. = ..()
