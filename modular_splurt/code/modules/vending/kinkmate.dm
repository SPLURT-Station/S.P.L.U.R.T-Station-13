/obj/machinery/vending/kink/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/head/helmet/space/deprivation_helmet = 5,
		/obj/item/clothing/under/misc/latex_catsuit = 10,
		/obj/item/clothing/shoes/latex_socks = 10,
		/obj/item/clothing/shoes/latexheels = 10,
		/obj/item/clothing/shoes/dominaheels = 10,
		/obj/item/clothing/gloves/latex_gloves = 10,
		/obj/item/electropack/vibrator/small = 2,
		/obj/item/electropack/vibrator = 2,
		/obj/item/leash = 3,
		/obj/item/milking_machine = 5,
		/obj/item/milking_machine/penis = 5,
		/obj/item/clothing/neck/petcollar/spike = 5,
		/obj/item/clothing/neck/petcollar/holo = 5,
		/obj/item/clothing/neck/petcollar/casino = 5
	)
	var/list/extra_contraband = list(
		//Lewd-Clothes
		/obj/item/dildo/flared/huge = 3,
		/obj/item/clothing/glasses/hypno = 3,
		/obj/item/clothing/neck/mind_collar = 3,
		/obj/item/key/latex = 5,
		/obj/item/clothing/head/dominatrixcap = 3,
		/obj/item/mesmetron = 3,
		/obj/item/dildo/flared/huge = 3,
		/obj/item/clothing/neck/petcollar/locked/holo = 2
	)
	var/list/extra_premium = list(
		/obj/item/clothing/mask/muzzle/ballgag = 3
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
