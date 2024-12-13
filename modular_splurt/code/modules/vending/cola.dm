/obj/machinery/vending/cola/Initialize(mapload)
	var/list/extra_products = list(
			/obj/item/reagent_containers/glass/beaker/waterbottle/large = 5,
			/obj/item/reagent_containers/food/drinks/soda_cans/carbonatedcum = 5,
			/obj/item/reagent_containers/food/drinks/soda_cans/carbonatedfemcum = 5,
			/obj/item/reagent_containers/food/drinks/soda_cans/blood = 5,
			/obj/item/reagent_containers/food/drinks/soda_cans/blooddiscrete = 5
	)
	LAZYADD(products, extra_products)
	. = ..()
