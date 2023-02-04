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
