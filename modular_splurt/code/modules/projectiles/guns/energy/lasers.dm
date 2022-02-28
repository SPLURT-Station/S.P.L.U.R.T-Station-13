/obj/item/gun/energy/civilian
	name = "civlian energy pistol"
	desc = "A cheap energy pistol produced by Wattz and Hertz. Has no external ammo indicator. It looks easily modfiable"
	icon = 'modular_splurt/icons/obj/guns/energy.dmi'
	icon_state = "wattz1000"
	item_state = "caplaser"
	w_class = WEIGHT_CLASS_SMALL
	cell_type = /obj/item/stock_parts/cell{charge = 700; maxcharge = 700}
	ammo_type = list(/obj/item/ammo_casing/energy/disabler)
	weapon_weight = WEAPON_LIGHT
	inaccuracy_modifier = 0.25
	can_flashlight = 0

/obj/item/gun/energy/civilian/lethal
	name = "moddfied civlian energy pistol"
	desc = "A cheap energy pistol produced by Wattz and Hertz. Has no external ammo indicator. It has been modded to shoot lethal lasers, somehow."
	icon_state = "magnetowattz"
	ammo_type = list(/obj/item/ammo_casing/energy/laser)

/obj/item/gunpart/civilianlaserframe
	name = "civlian energy pistol frame"
	desc = "a civilian energy pistol frame"
	icon_state = "wattz1000frame"

/obj/item/gunpart/civilianlaserbarrel
	name = "civilian energy pistol barrel"
	desc = "a civilian energy pistol barrel"
	icon_state = "wattz1000barrel"

/datum/crafting_recipe/civilianlaserassemble
	name = "Assemble civilian energy pistol"
	result = /obj/item/gun/energy/civilian
	reqs = list(/obj/item/gunpart/civilianlaserframe = 1,
				/obj/item/gunpart/civilianlaserbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/civilianlaserupgrade
	name = "Moddify civilian energy pistol"
	result = /obj/item/gun/energy/civilian/lethal
	reqs = list(/obj/item/gun/energy/civilian = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stock_parts/capacitor = 4,
				/obj/item/stock_parts/micro_laser = 1)
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
