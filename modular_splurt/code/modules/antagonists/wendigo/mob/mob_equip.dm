/mob/living/carbon/wendigo/can_equip(obj/item/I, slot, disable_warning, bypass_equip_delay_self, clothing_check, list/return_warning)
	switch(slot)
		if(ITEM_SLOT_HANDS)
			if(get_empty_held_indexes())
				return TRUE
			return FALSE
		if(ITEM_SLOT_EYES)
			if(glasses)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_EYES))
				return FALSE
			return TRUE
		if(ITEM_SLOT_NECK)
			if(wear_neck)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_NECK))
				return FALSE
			return TRUE
		if(ITEM_SLOT_EARS_LEFT)
			if(ears)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_EARS))
				return FALSE
			return TRUE
		if(ITEM_SLOT_EARS_RIGHT)
			if(ears_extra)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_EARS))
				return FALSE
			return TRUE
		if(ITEM_SLOT_GLOVES)
			if(gloves)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_GLOVES))
				return FALSE
			return TRUE
		if(ITEM_SLOT_BACK)
			if(back)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_BACK))
				return FALSE
			return TRUE
		if(ITEM_SLOT_BACKPACK)
			if(back)
				if(SEND_SIGNAL(back, COMSIG_TRY_STORAGE_CAN_INSERT, I, src, TRUE))
					return TRUE
			return FALSE
		if(ITEM_SLOT_HEAD)
			if(head)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_HEAD))
				return FALSE
			return TRUE
		if(ITEM_SLOT_BELT)
			if(belt)
				return FALSE
			if(!(I.slot_flags & ITEM_SLOT_BELT))
				return FALSE
			return TRUE
	return FALSE

/mob/living/carbon/wendigo/equip_to_slot(obj/item/I, slot)
	if(!..())
		return
	switch(slot)
		if(ITEM_SLOT_EYES)
			glasses = I
			update_inv_glasses()
		if(ITEM_SLOT_EARS_LEFT)
			ears = I
			update_inv_ears()
		if(ITEM_SLOT_EARS_RIGHT)
			ears_extra = I
			update_inv_ears_extra()
		if(ITEM_SLOT_GLOVES)
			gloves = I
			update_inv_gloves()
	return TRUE

/mob/living/carbon/wendigo/doUnEquip(obj/item/I, force, newloc, no_move, invdrop = TRUE, silent)
	. = ..()
	if(!. || !I)
		return

	else if(I == gloves)
		gloves = null
		if(!QDELETED(src))
			update_inv_gloves()
	else if(I == glasses)
		glasses = null
		var/obj/item/clothing/glasses/G = I
		if(G.tint)
			update_tint()
		if(G.vision_correction)
			clear_fullscreen("nearsighted")
			clear_fullscreen("eye_damage")
		if(G.vision_flags || G.darkness_view || G.invis_override || G.invis_view || !isnull(G.lighting_alpha))
			update_sight()
		if(!QDELETED(src))
			update_inv_glasses()
	else if(I == ears)
		ears = null
		if(!QDELETED(src))
			update_inv_ears()
	else if(I == belt)
		belt = null
		if(!QDELETED(src))
			update_inv_belt()
