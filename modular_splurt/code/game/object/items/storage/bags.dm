/obj/item/storage/bag/security
	name = "security pouch"
	desc = "A pouch for small security items that manages to hang where you would normally put things in your pocket."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "ammopouch"
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/security/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = INFINITY
	STR.max_items = 5
	STR.display_numerical_stacking = TRUE
	STR.can_hold = typecacheof(list(/obj/item/restraints/handcuffs, /obj/item/restraints/handcuffs/cable/zipties, /obj/item/assembly/flash,
	/obj/item/reagent_containers/food/snacks/donut, /obj/item/melee/classic_baton/telescopic, /obj/item/grenade/flashbang, /obj/item/grenade/smokebomb, /obj/item/device/hailer, /obj/item/detective_scanner, /obj/item/reagent_containers/peacehypo, /obj/item/reagent_containers/spray/pepper))
