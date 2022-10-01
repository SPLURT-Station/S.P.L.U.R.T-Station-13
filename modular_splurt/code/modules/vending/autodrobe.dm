/obj/machinery/vending/autodrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/hooded/corpus = 1,
		/obj/item/clothing/suit/hooded/corpus/c = 1,
		/obj/item/clothing/under/vaultsuit = 3,
		/obj/item/clothing/neck/cloak/binary = 3,
		/obj/item/clothing/under/rank/civilian/janitor/maid/formal = 3,
		/obj/item/clothing/suit/hooded/pyramidhead = 1
	)
	LAZYADD(products, extra_products)
	. = ..()

