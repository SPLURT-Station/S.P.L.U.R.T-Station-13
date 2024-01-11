/obj/machinery/chem_dispenser
	var/list/upgrade_reagents4 = list(
		/datum/reagent/toxin/slimejelly
	)

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
