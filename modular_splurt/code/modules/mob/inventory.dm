/mob/doUnEquip(obj/item/I, force, newloc, no_move, invdrop, silent)
	if(I && SEND_SIGNAL(I, COMSIG_MOB_ITEM_DROPPING, force, newloc, no_move, invdrop, silent)) //this can return null
		return FALSE
	. = ..()

/mob/equip_to_slot_if_possible(obj/item/W, slot, qdel_on_fail = FALSE, disable_warning = FALSE, redraw_mob = TRUE, bypass_equip_delay_self = FALSE, clothing_check = FALSE)
	. = ..()
	if(.)
		SEND_SIGNAL(src, COMSIG_MOB_ITEM_EQUIPPED, W, slot)
