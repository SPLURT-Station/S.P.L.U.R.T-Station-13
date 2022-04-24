/obj/machinery/vending/clothing/Initialize(mapload)
	products += list(/obj/item/clothing/head/wig = 5,
					/obj/item/clothing/suit/jacket/duster = 5,
					/obj/item/clothing/head/slouch_hat = 5,
					/obj/item/clothing/head/lawdog = 5,
					/obj/item/clothing/head/gunfighter = 5
	)
	for(var/P in typesof(/datum/gear/underwear))
		var/datum/gear/G = P
		products[initial(G.path)] = 5
	for(var/P in typesof(/datum/gear/shirt))
		var/datum/gear/G = P
		products[initial(G.path)] = 5
	for(var/P in typesof(/datum/gear/socks))
		var/datum/gear/G = P
		products[initial(G.path)] = 5
	. = ..()
