/obj/machinery/vending/kink/Initialize()
	var/list/extra_products = list(
		/obj/item/storage/pill_bottle/belly_inflation = 10,
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
		/obj/item/clothing/neck/petcollar/casino = 5,
		/obj/item/clothing/gloves/latexsleeves = 3,
		/obj/item/genital_equipment/sounding = 4,
		/obj/item/clothing/accessory/ring/syntech = 4,
		/obj/item/clothing/wrists/syntech = 4,
		/obj/item/clothing/neck/syntech = 4,
		/obj/item/clothing/neck/syntech/choker = 4,
		/obj/item/clothing/neck/syntech/collar = 4,
		/obj/item/storage/fancy/jellybean_pack = 5,
		/obj/item/storage/box/aphrodisiac_pump = 5,
		/obj/item/storage/box/bulk_condoms = 10,
		/obj/item/strapon_strap = 5,
		/obj/item/restraints/bondage_rope = 5,
		/obj/item/clothing/under/domina = 5,
		/obj/item/clothing/under/performer = 3,
		/obj/item/clothing/under/bunnysuit = 3,
		/obj/item/clothing/under/bunnysuit/white = 3,
		/obj/item/storage/box/chastity_cage = 6,
		/obj/item/storage/box/chastity_cage/metal = 3,
		/obj/item/storage/box/chastity_cage/belt = 2,
		/obj/item/clothing/shoes/invisiboots = 10, // Added here to go with the Gear Harness
		/obj/item/clothing/shoes/highheel_sandals = 3,
		/obj/item/clothing/neck/petcollar/poly = 5,
		/obj/item/clothing/under/misc/stripper/black = 3,
		/obj/item/clothing/under/misc/stripper/white = 3,
		/obj/item/clothing/under/lewdmaid = 5,
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
		/obj/item/clothing/neck/petcollar/locked/holo = 2,
		/obj/item/storage/box/aphrodisiac_pump/plus = 3,
		/obj/item/storage/box/implant_disrobe = 3,
		/obj/item/storage/box/chastity_cage/estim = 2,
		/obj/item/reagent_containers/glass/bottle/camphor = 2,
		/obj/item/storage/pill_bottle/PEsmaller = 3,
		/obj/item/storage/pill_bottle/BEsmaller = 3,
		/obj/item/storage/pill_bottle/anal_allure = 3,
		/obj/item/storage/pill_bottle/breast_buzzer = 3,
		/obj/item/storage/pill_bottle/vaginal_vigour = 3,
		/obj/item/storage/pill_bottle/peen_pop = 3,
		/obj/item/chastity_hypno/magazine = 6,
		/obj/item/chastity_hypno/watch = 2
	)
	var/list/extra_premium = list(
		/obj/item/clothing/mask/muzzle/ballgag = 3
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
