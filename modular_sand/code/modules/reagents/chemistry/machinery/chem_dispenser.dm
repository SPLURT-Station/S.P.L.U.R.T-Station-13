/obj/machinery/chem_dispenser
	var/list/upgrade_reagents4 = list(
		/datum/reagent/toxin/slimejelly
	)

/obj/machinery/chem_dispenser/Initialize(mapload)
	if(upgrade_reagents4)
		upgrade_reagents4 = sortList(upgrade_reagents4, /proc/cmp_reagents_asc)
	. = ..()

/obj/machinery/chem_dispenser/drinks
	upgrade_reagents4 = list(
		/datum/reagent/toxin/teapowder,
		/datum/reagent/consumable/bungojuice,
		/datum/reagent/consumable/caramel
	)

/obj/machinery/chem_dispenser/drinks/beer
	upgrade_reagents4 = null

/obj/machinery/chem_dispenser/apothecary
	upgrade_reagents4 = list(
		/datum/reagent/blood
	)
