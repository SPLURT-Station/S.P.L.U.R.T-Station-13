/obj/machinery/vending/cola/Initialize()
    var/list/extra_products = list(
        /obj/item/reagent_containers/glass/beaker/waterbottle/large = 5
    )
    LAZYADD(products, extra_products)
    . = ..()
