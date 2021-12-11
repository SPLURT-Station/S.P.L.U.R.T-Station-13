/datum/supply_pack/misc/lewdkeg
	name = "Lewd Deluxe Keg"
	desc = "That other stuff not getting you ready? Well I have a Chemslut making tons of the good stuff."
	cost = 7500 //It can be a weapon
	contraband = TRUE
	contains = list(/obj/structure/reagent_dispensers/keg/aphro/strong)
	crate_name = "deluxe keg"
	crate_type = /obj/structure/closet/crate

//Hyper stuff
/datum/supply_pack/misc/wedding
	name = "Wedding Crate"
	desc = "Almost everything you need to host a wedding! Don't forget a ring!"
	cost = 1500
	contains = list(/obj/item/clothing/under/wedding_dress,
					/obj/item/clothing/under/tuxedo,
					/obj/item/storage/belt/cummerbund,
					/obj/item/bouquet,
					/obj/item/bouquet/sunflower,
					/obj/item/bouquet/poppy,
					/obj/item/reagent_containers/food/drinks/bottle/champagne)
	crate_name = "wedding crate"
