/mob/living/silicon/robot/activate_module(obj/item/item_module)
	. = ..()
	if(!.)
		return .
	if(istype(item_module,/obj/item/gun/energy/laser/cyborg))
		laser = TRUE
		update_icons() //REEEEEEACH FOR THE SKY
	if(istype(item_module,/obj/item/gun/energy/disabler/cyborg) || istype(item_module,/obj/item/gun/energy/e_gun/advtaser/cyborg))
		disabler = TRUE
		update_icons()

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
	LAZYADD(reagent_list, extra_reagents)
	. = ..()
