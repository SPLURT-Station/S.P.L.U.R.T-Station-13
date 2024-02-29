/obj/item/tank/internals/nitrogen
	name = "nitrogen internals tank"
	desc = "An enlarged internals tank. This one is full of nitrogen. If you don't breathe nitrogen, you shouldn't use this."
	icon_state = "nitrogen_belt"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/items_righthand.dmi'
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	force = 4
	volume = 6

/obj/item/tank/internals/nitrogen/populate_gas()
	air_contents.set_moles(GAS_N2, (12*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)) //Double the normal, since these are likely gonna be a nightmare to get refilled
	return
