// ~( Ported from TG )~
/obj/item/reagent_containers/food/drinks/bottle/bitters
	name = "Andromeda Bitters"
	desc = "An aromatic addition to any drink. Made in New Trinidad, now and forever."
	icon_state = "bitters_bottle"
	list_reagents = list(/datum/reagent/consumable/ethanol/bitters = 30)

/obj/item/reagent_containers/food/drinks/bottle/curacao
	name = "Beekhof Blauw Curaçao"
	desc = "Still produced on the island of Curaçao, after all these years."
	icon_state = "curacao_bottle"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/curacao = 100)

/obj/item/reagent_containers/food/drinks/bottle/navy_rum
	name = "Pride of the Union Navy-Strength Rum"
	desc = "Ironically named, given it's made in Bermuda."
	icon_state = "navy_rum_bottle"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/navy_rum = 100)

// New Splurt bottles for the barman.

/obj/item/reagent_containers/food/drinks/bottle/cum_rum
	name = "NT Femboy Navy Cum Rum"
	desc = "Can't have female mates in the Navy! Sourced from NT femboy cum farms."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "cum_rum"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/navy_rum = 40, /datum/reagent/consumable/semen = 60)

/obj/item/reagent_containers/food/drinks/bottle/femcum_whiskey
	name = "2440's Special Femcum whiskey"
	desc = "For the womanizer detective."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "femcum_whiskey"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey = 40, /datum/reagent/consumable/semen/femcum = 60)

/obj/item/reagent_containers/food/drinks/bottle/bloodwine
	name = "Stoker's Special reserve Bloodwine"
	desc = "Horribly sweet, wonderfuly wicked and aged to perfection."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "bloodwine"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/wine = 40, /datum/reagent/blood = 60)
