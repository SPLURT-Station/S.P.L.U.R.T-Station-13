/obj/machinery/vending/barkbox/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/neck/petcollar/spike = 5,
		/obj/item/clothing/neck/petcollar/holo = 5,
		/obj/item/clothing/neck/petcollar/casino = 5,
		/obj/item/clothing/neck/petcollar/handmade = 5,
		/obj/item/leash = 4
	)
	var/list/extra_contraband = list(
		/obj/item/clothing/neck/petcollar/locked/spike = 2,
		/obj/item/clothing/neck/petcollar/locked/holo = 2,
		/obj/item/clothing/neck/petcollar/locked/casino = 2
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	. = ..()

