/obj/item/reagent_containers/food/snacks/egg/oviposition

/obj/item/reagent_containers/food/snacks/egg/oviposition/Initialize(datum/status_effect/pregnancy/pregnancy)
	. = ..()
	if(pregnancy)
		inherit_pregnancy(pregnancy)
		START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/egg/oviposition/proc/inherit_pregnancy(datum/status_effect/pregnancy/pregnancy)
