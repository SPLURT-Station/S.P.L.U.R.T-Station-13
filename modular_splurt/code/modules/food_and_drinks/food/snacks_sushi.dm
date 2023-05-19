/obj/item/reagent_containers/food/snacks/vegetariansushiroll
	name = "vegetarian sushi roll"
	desc = "A roll of simple vegetarian sushi with rice, carrots, and potatoes. Sliceable into pieces!"
	icon = 'modular_splurt/icons/obj/food/sushi.dmi'
	icon_state = "vegetariansushiroll"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("boiled rice" = 4, "carrots" = 2, "potato" = 2)
	foodtype = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/spicyfiletsushiroll
	name = "spicy filet sushi roll"
	desc = "A roll of tasty, spicy sushi made with fish and vegetables. Sliceable into pieces!"
	icon = 'modular_splurt/icons/obj/food/sushi.dmi'
	icon_state = "spicyfiletroll"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/capsaicin = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("boiled rice" = 4, "fish" = 2, "spicyness" = 2)
	foodtype = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/meat_poke
	name = "meat poke"
	desc = "Simple poke, rice on the bottom, vegetables and meat on top. Should be mixed before eating."
	icon = 'modular_splurt/icons/obj/food/soupsalad.dmi'
	icon_state = "pokemeat"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	foodtype = MEAT | VEGETABLES
	tastes = list("rice and meat" = 4, "lettuce" = 2, "soy sauce" = 2)
	trash = /obj/item/reagent_containers/glass/bowl
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/fish_poke
	name = "fish poke"
	desc = "Simple poke, rice on the bottom, vegetables and fish on top. Should be mixed before eating."
	icon = 'modular_splurt/icons/obj/food/soupsalad.dmi'
	icon_state = "pokefish"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	foodtype = MEAT | VEGETABLES
	tastes = list("rice and fish" = 4, "lettuce" = 2, "soy sauce" = 2)
	trash = /obj/item/reagent_containers/glass/bowl
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/sushi_feline
	name = "neko roll"
	desc = "A cute sushi roll in the shape of a cat face. Almost too adorable to eat."
	icon = 'modular_splurt/icons/obj/food/sushi.dmi'
	icon_state = "nekoroll"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/sugar = 1
	)
	tastes = list("rice" = 1, "fish" = 1, "cuteness" = 1)
	foodtype = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/sushi_feline/nekobara
	name = "nekobara roll"
	desc = "A fistful of rice with a crude cat face on it. It's got a fishy scent, too."
	icon_state = "bignekoroll"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/consumable/sugar = 2
	)
	tastes = list("rice" = 1, "fish" = 1, "wastefulness" = 1)
