/obj/item/reagent_containers/borghypo/borgshaker/beershaker/Initialize()
	var/list/extra_reagents = list(
		/datum/reagent/consumable/ethanol/amaretto,
		/datum/reagent/consumable/ethanol/applejack,
		/datum/reagent/consumable/ethanol/curacao,
		/datum/reagent/consumable/ethanol/hcider,
		/datum/reagent/consumable/ethanol/navy_rum,
		/datum/reagent/consumable/ethanol/sake,
		/datum/reagent/consumable/ethanol
		)
	LAZYADD(reagent_ids, extra_reagents)
	. = ..()
