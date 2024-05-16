/obj/item/gun/energy/civilian
	name = "civilian energy pistol"
	desc = "A cheap energy pistol produced by Wattz and Hertz. Has no external ammo indicator. It looks easily modifiable"
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
	name = "moddfied civilian energy pistol"
	desc = "A cheap energy pistol produced by Wattz and Hertz. Has no external ammo indicator. It has been modded to shoot lethal lasers, somehow."
	icon_state = "magnetowattz"
	ammo_type = list(/obj/item/ammo_casing/energy/laser)

/obj/item/gunpart/civilianlaserframe
	name = "civilian energy pistol frame"
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

/obj/item/gun/energy/e_gun/corpus
	name = "Dera"
	desc = "An exotic laser rifle of Corpus make, someone's scrawled the word 'GROFIT' on the stock."
	icon = 'modular_splurt/icons/obj/guns/energy.dmi'
	icon_state = "dera"
	item_state = "dera"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	cell_type = /obj/item/stock_parts/cell{charge = 700; maxcharge = 700}
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser)
	weapon_weight = WEAPON_LIGHT
	slot_flags = ITEM_SLOT_BACK
	can_flashlight = 0
	modifystate = FALSE
	automatic_charge_overlays = FALSE

/obj/item/gun/energy/aegisaltlaser
	name = "Aegis DMR"
	desc = "An exotic laser rifle manufactured by Paradeus."
	icon = 'modular_splurt/icons/obj/guns/vhariik4032.dmi'
	icon_state = "aegisalt"
	item_state = "aegis"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	cell_type = /obj/item/stock_parts/cell/upgraded/plus{charge = 5000; maxcharge = 5000}
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hellfire)
	burst_size = 3
	weapon_weight = WEAPON_LIGHT
	slot_flags = ITEM_SLOT_BACK
	can_flashlight = 1
	flight_x_offset = 0
	flight_y_offset = -700
	selfcharge = TRUE

/obj/item/gun/energy/pulse/nerf
	pin = /obj/item/firing_pin/kaiju
