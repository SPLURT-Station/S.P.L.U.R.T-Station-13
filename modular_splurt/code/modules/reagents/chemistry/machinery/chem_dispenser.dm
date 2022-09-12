/obj/machinery/chem_dispenser/drinks/beer/Initialize(mapload)
	var/list/extra_reagents = list(
		/datum/reagent/consumable/ethanol/curacao,
		/datum/reagent/consumable/ethanol/navy_rum
	)
	LAZYADD(dispensable_reagents, extra_reagents)
	. = ..()

/obj/machinery/chem_dispenser/drinks/Initialize(mapload)
	var/list/extra_reagents = list(
		/datum/reagent/consumable/coco
	)
	LAZYADD(emagged_reagents, extra_reagents)
	. = ..()
