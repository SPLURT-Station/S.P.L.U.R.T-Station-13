/obj/machinery/vending/boozeomat/Initialize()
	var/list/extra_products = list(
		/obj/item/reagent_containers/food/drinks/bottle/bitters = 6,
		/obj/item/reagent_containers/food/drinks/bottle/curacao = 3,
		/obj/item/reagent_containers/food/drinks/bottle/navy_rum = 3,
		/obj/item/reagent_containers/food/drinks/bottle/bloodwine = 3,
		/obj/item/reagent_containers/food/drinks/bottle/femcum_whiskey = 4,
		/obj/item/reagent_containers/food/drinks/bottle/cum_rum = 4
	)
	LAZYADD(products, extra_products)
	. = ..()
