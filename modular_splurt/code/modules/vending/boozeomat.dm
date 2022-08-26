/obj/machinery/vending/boozeomat/Initialize()
	var/list/extra_products = list(
		/obj/item/reagent_containers/food/drinks/bottle/bitters = 6,
		/obj/item/reagent_containers/food/drinks/bottle/curacao = 3,
		/obj/item/reagent_containers/food/drinks/bottle/navy_rum = 3
	)
	LAZYADD(products, extra_products)
	. = ..()
