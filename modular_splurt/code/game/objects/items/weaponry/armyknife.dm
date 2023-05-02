/obj/item/armyknife
	name = "Army Multitool"
	desc = "A simple tool with a small knife, screwdriver, and wirecutters. It is currently folded away."
	icon_state = "armyknife_fold"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	custom_materials = list(/datum/material/iron=300, /datum/material/plastic=300)
	force = 2
	w_class = WEIGHT_CLASS_TINY
	throwforce = 3
	throw_speed = 4
	throw_range = 5
	attack_verb_continuous = list("whacks")
	attack_verb_simple = list("whack")
	hitsound = 'sound/weapons/genhit.ogg'
	usesound = list('sound/items/screwdriver.ogg', 'sound/items/screwdriver2.ogg')

/obj/item/armyknife/attack_self(mob/user)
	playsound(get_turf(user),'sound/weapons/batonextend.ogg',50,1)
	var/obj/item/armyknife/ak_screw = new /obj/item/armyknife/screw(drop_location())
	to_chat(user, span_notice("You unfold the screwdriver."))
	qdel(src)
	user.put_in_active_hand(ak_screw)

/obj/item/armyknife/screw
	name = "Army Multitool"
	desc = "A simple tool with a small knife, screwdriver, and wirecutters. Currently has the screwdriver extended."
	icon_state = "armyknife_screw"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	item_state = "screwdriver"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	force = 4
	w_class = WEIGHT_CLASS_SMALL
	tool_behaviour = TOOL_SCREWDRIVER
	throwforce = 3
	throw_speed = 4
	throw_range = 5
	attack_verb_continuous = list("stabs", "screws", "jabs","whacks")
	attack_verb_simple = list("stab", "screw", "jab","whack")
	hitsound = 'sound/weapons/bladeslice.ogg'
	usesound = list('sound/items/screwdriver.ogg', 'sound/items/screwdriver2.ogg')
	toolspeed = 1.1

/obj/item/armyknife/screw/attack_self(mob/user)
	playsound(get_turf(user),'sound/weapons/batonextend.ogg',50,1)
	var/obj/item/armyknife/ak_cut = new /obj/item/armyknife/cutter(drop_location())
	to_chat(user, span_notice("You fold the screwdriver and unfold the wirecutters."))
	qdel(src)
	user.put_in_active_hand(ak_cut)

/obj/item/armyknife/cutter
	name = "Army Multitool"
	desc = "A simple tool with a small knife, screwdriver, and wirecutters. Currently has the wirecutters extended."
	icon_state = "armyknife_cutter"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	item_state = "jawsoflife"
	item_state = "cutters"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	hitsound = 'sound/items/wirecutter.ogg'
	usesound = 'sound/items/wirecutter.ogg'
	force = 4
	w_class = WEIGHT_CLASS_SMALL
	tool_behaviour = TOOL_WIRECUTTER
	throwforce = 3
	throw_speed = 4
	throw_range = 5
	attack_verb_continuous = list("cuts", "whacks")
	attack_verb_simple = list("cut", "whack")
	hitsound = 'sound/weapons/bladeslice.ogg'
	toolspeed = 1.1

/obj/item/armyknife/cutter/attack_self(mob/user)
	playsound(get_turf(user), 'sound/weapons/batonextend.ogg', 50, 1)
	var/obj/item/armyknife/ak_knife = new /obj/item/armyknife/blade(drop_location())
	to_chat(user, span_notice("You fold the wirecutters and unfold the knife."))
	qdel(src)
	user.put_in_active_hand(ak_knife)

/obj/item/armyknife/blade
	name = "Army Multitool"
	icon_state = "armyknife_blade"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	item_state = "switchblade_ext"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "A simple tool with a small knife, screwdriver, and wirecutters. Currently has the knife extended."
	flags_1 = CONDUCT_1
	force = 10
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 5
	throw_speed = 4
	throw_range = 5
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("stabs", "slashs", "cuts")
	attack_verb_simple = list("stab", "slash", "cut")

/obj/item/armyknife/blade/attack_self(mob/user)
	playsound(get_turf(user), 'sound/weapons/batonextend.ogg', 50, 1)
	var/obj/item/armyknife/ak_fold = new /obj/item/armyknife(drop_location())
	to_chat(user, span_notice("You fold the knife."))
	qdel(src)
	user.put_in_active_hand(ak_fold)

/datum/design/armyknife
	name = "Army Multitool"
	id = "armyknife"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron=300, /datum/material/plastic=300)
	build_path = /obj/item/armyknife
	category = list("initial","Tools","Tool Designs")
