/mob/equip_to_slot_if_possible(obj/item/W, slot, qdel_on_fail = FALSE, disable_warning = FALSE, redraw_mob = TRUE, bypass_equip_delay_self = FALSE, clothing_check = FALSE)
	. = ..()

	if(.)
		SEND_SIGNAL(src, COMSIG_MOB_ITEM_EQUIPPED, W, slot)
