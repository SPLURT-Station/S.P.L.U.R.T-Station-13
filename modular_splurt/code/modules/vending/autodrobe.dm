/obj/machinery/vending/autodrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/hooded/corpus = 1,
		/obj/item/clothing/suit/hooded/corpus/c = 1,
		/obj/item/clothing/under/vaultsuit = 3,
		/obj/item/clothing/neck/cloak/binary = 3,
		/obj/item/clothing/suit/maid = 3,
		/obj/item/clothing/suit/hooded/pyramidhead = 1,
		/obj/item/clothing/suit/baroness = 3,
		/obj/item/clothing/suit/baroness/ladyballat = 3,
		/obj/item/clothing/suit/flatwoods = 3,
		/obj/item/clothing/under/dress/wedding = 1,
		/obj/item/clothing/under/suit/pencil = 3,
		/obj/item/clothing/under/suit/pencil/black_really = 3,
		/obj/item/clothing/under/suit/pencil/charcoal = 3,
		/obj/item/clothing/under/suit/pencil/navy = 3,
		/obj/item/clothing/under/suit/pencil/burgandy = 3,
		/obj/item/clothing/under/suit/pencil/checkered = 3,
		/obj/item/clothing/under/suit/pencil/tan = 3,
		/obj/item/clothing/under/suit/pencil/green = 3,
		/obj/item/clothing/under/suit/error = 1,
		/obj/item/clothing/under/rank/civilian/clown/clussy_outfit = 1,
		/obj/item/clothing/gloves/clussy_gloves = 1,
		/obj/item/clothing/head/clussy_wig = 1,
		/obj/item/clothing/shoes/clown_shoes/clussy_heels = 1
	)
	var/list/extra_premium = list(
		/obj/item/clothing/under/suit/tuxedo = 1,
		/obj/item/clothing/under/suit/carpskin = 1
	)
	LAZYADD(products, extra_products)
	LAZYADD(premium, extra_premium)
	. = ..()

