/datum/crafting_recipe/food/vegetariansushiroll
	name ="Vegetarian sushi roll"
	reqs = list(
		/datum/reagent/consumable/soysauce = 3,
		/obj/item/reagent_containers/food/snacks/sushi_rice = 1,
		/obj/item/reagent_containers/food/snacks/sea_weed = 3,
		/obj/item/reagent_containers/food/snacks/grown/carrot = 1,
		/obj/item/reagent_containers/food/snacks/grown/potato = 1
	)
	result = /obj/item/reagent_containers/food/snacks/vegetariansushiroll
	category = CAT_SEAFOOD

/datum/crafting_recipe/food/spicyfiletroll
	name ="Spicy filet sushi roll"
	reqs = list(
		/datum/reagent/consumable/soysauce = 3,
		/obj/item/reagent_containers/food/snacks/sushi_rice = 1,
		/obj/item/reagent_containers/food/snacks/sea_weed = 3,
		/obj/item/reagent_containers/food/snacks/carpmeat = 2,
		/obj/item/reagent_containers/food/snacks/grown/chili = 1,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1
	)
	result = /obj/item/reagent_containers/food/snacks/spicyfiletsushiroll
	category = CAT_SEAFOOD

/datum/crafting_recipe/food/meat_poke
	name ="Meat poke"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/sea_weed = 1,
		/obj/item/reagent_containers/food/snacks/sushi_rice = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 3,
		/obj/item/reagent_containers/food/snacks/grown/cabbage = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 1,
		/datum/reagent/consumable/soysauce = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/meat_poke
	category = CAT_SEAFOOD

/datum/crafting_recipe/food/fish_poke
	name ="Fish poke"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/sea_weed = 1,
		/obj/item/reagent_containers/food/snacks/sushi_rice = 1,
		/obj/item/reagent_containers/food/snacks/carpmeat = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 1,
		/datum/reagent/consumable/soysauce = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/fish_poke
	category = CAT_SEAFOOD

/datum/crafting_recipe/food/sushi_feline
	name = "Neko roll"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/sushi_rice = 1,
		/obj/item/reagent_containers/food/snacks/carpmeat = 1,
		/datum/reagent/consumable/soysauce = 2,
		/datum/reagent/consumable/sugar = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/sushi_feline
	category = CAT_SEAFOOD

/datum/crafting_recipe/food/sushi_feline/nekobara
	name = "Nekobara roll"
	reqs = list(
		/datum/reagent/consumable/soysauce = 5,
		/datum/reagent/consumable/sugar = 2,
		/obj/item/reagent_containers/food/snacks/sushi_rice = 4,
		/obj/item/reagent_containers/food/snacks/carpmeat = 2,
	)
	result = /obj/item/reagent_containers/food/snacks/sushi_feline/nekobara
