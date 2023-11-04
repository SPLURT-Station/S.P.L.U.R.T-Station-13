#define HEAD_X_OFFSET_NORTH		2
#define HEAD_Y_OFFSET_NORTH		8
#define HEAD_X_OFFSET_EAST		2
#define HEAD_Y_OFFSET_EAST		8
#define HEAD_X_OFFSET_SOUTH		8
#define HEAD_Y_OFFSET_SOUTH		2
#define HEAD_X_OFFSET_WEST		8
#define HEAD_Y_OFFSET_WEST		-2

#define LHAND_X_OFFSET_NORTH	-5
#define LHAND_Y_OFFSET_NORTH	3
#define LHAND_X_OFFSET_EAST		-2
#define LHAND_Y_OFFSET_EAST		3
#define LHAND_X_OFFSET_SOUTH	8
#define LHAND_Y_OFFSET_SOUTH	3
#define LHAND_X_OFFSET_WEST		-2
#define LHAND_Y_OFFSET_WEST		3

#define RHAND_X_OFFSET_NORTH	8
#define RHAND_Y_OFFSET_NORTH	3
#define RHAND_X_OFFSET_EAST		2
#define RHAND_Y_OFFSET_EAST		3
#define RHAND_X_OFFSET_SOUTH	-5
#define RHAND_Y_OFFSET_SOUTH	3
#define RHAND_X_OFFSET_WEST		2
#define RHAND_Y_OFFSET_WEST		3

#define EARS_X_OFFSET_NORTH		0
#define EARS_Y_OFFSET_NORTH		0
#define EARS_X_OFFSET_EAST		0
#define EARS_Y_OFFSET_EAST		0
#define EARS_X_OFFSET_SOUTH		0
#define EARS_Y_OFFSET_SOUTH		0
#define EARS_X_OFFSET_WEST		0
#define EARS_Y_OFFSET_WEST		0

#define GLASSES_X_OFFSET_NORTH	5
#define GLASSES_Y_OFFSET_NORTH	10
#define GLASSES_X_OFFSET_EAST	1
#define GLASSES_Y_OFFSET_EAST	10
#define GLASSES_X_OFFSET_SOUTH	-2
#define GLASSES_Y_OFFSET_SOUTH	10
#define GLASSES_X_OFFSET_WEST	-1
#define GLASSES_Y_OFFSET_WEST	10

#define BELT_X_OFFSET_NORTH		0
#define BELT_Y_OFFSET_NORTH		10
#define BELT_X_OFFSET_EAST		0
#define BELT_Y_OFFSET_EAST		0
#define BELT_X_OFFSET_SOUTH		0
#define BELT_Y_OFFSET_SOUTH		0
#define BELT_X_OFFSET_WEST		0
#define BELT_Y_OFFSET_WEST		0

#define BACK_X_OFFSET_NORTH		1
#define BACK_Y_OFFSET_NORTH		8
#define BACK_X_OFFSET_EAST		0
#define BACK_Y_OFFSET_EAST		8
#define BACK_X_OFFSET_SOUTH		1
#define BACK_Y_OFFSET_SOUTH		8
#define BACK_X_OFFSET_WEST		0
#define BACK_Y_OFFSET_WEST		8

#define NECK_X_OFFSET_NORTH		2
#define NECK_Y_OFFSET_NORTH		10
#define NECK_X_OFFSET_EAST		0
#define NECK_Y_OFFSET_EAST		10
#define NECK_X_OFFSET_SOUTH		2
#define NECK_Y_OFFSET_SOUTH		10
#define NECK_X_OFFSET_WEST		0
#define NECK_Y_OFFSET_WEST		10

/mob/living/carbon/wendigo/setDir(newdir, ismousemovement)
	if(dir == newdir)
		return	//Don't spend time regenerating icons when we don't move
	. = ..()
	regenerate_icons()

/mob/living/carbon/wendigo/regenerate_icons()
	if(!..())
		update_inv_head()
		update_inv_gloves()
		update_inv_ears()
		update_inv_glasses()
		update_inv_belt()
		update_inv_back()
		update_inv_neck()
		update_transform()

/mob/living/carbon/wendigo/update_inv_gloves()
	if(gloves)
		gloves.screen_loc = ui_gloves
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += gloves

//GLASSES
/mob/living/carbon/wendigo/update_inv_glasses()
	if(glasses)
		glasses.screen_loc = ui_glasses
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += glasses

//EARS
/mob/living/carbon/wendigo/update_inv_ears()
	remove_overlay(EAR_LEFT_LAYER)
	if(ears)
		if(client && hud_used)
			var/atom/movable/screen/inventory/inv = hud_used.inv_slots[ITEM_SLOT_EARS_LEFT]
			inv.update_icon()
		ears.screen_loc = ui_ears	//move the item to the appropriate screen loc
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += ears

		overlays_standing[EAR_LEFT_LAYER] = ears.build_worn_icon(override_state = ears.icon_state, default_layer = EAR_LEFT_LAYER, default_icon_file = ((ears.mob_overlay_icon) ? ears.mob_overlay_icon : 'icons/mob/ears.dmi'))
		var/mutable_appearance/ears_overlay = overlays_standing[EAR_LEFT_LAYER]
		switch(dir)
			if(NORTH)
				ears_overlay.pixel_x += EARS_X_OFFSET_NORTH
				ears_overlay.pixel_y += EARS_Y_OFFSET_NORTH
			if(EAST)
				ears_overlay.pixel_x += EARS_X_OFFSET_EAST
				ears_overlay.pixel_y += EARS_Y_OFFSET_EAST
			if(SOUTH)
				ears_overlay.pixel_x += EARS_X_OFFSET_SOUTH
				ears_overlay.pixel_y += EARS_Y_OFFSET_SOUTH
			if(WEST)
				ears_overlay.pixel_x += EARS_X_OFFSET_WEST
				ears_overlay.pixel_y += EARS_Y_OFFSET_WEST
		overlays_standing[EAR_LEFT_LAYER] = ears_overlay
	apply_overlay(EAR_LEFT_LAYER)

/mob/living/carbon/wendigo/update_inv_ears_extra()
	remove_overlay(EAR_RIGHT_LAYER)
	if(ears_extra)
		if(client && hud_used)
			var/atom/movable/screen/inventory/inv = hud_used.inv_slots[ITEM_SLOT_EARS_RIGHT]
			inv.update_icon()
		ears_extra.screen_loc = ui_ears	//move the item to the appropriate screen loc
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += ears_extra

		overlays_standing[EAR_RIGHT_LAYER] = ears_extra.build_worn_icon(override_state = ears_extra.icon_state, default_layer = EAR_RIGHT_LAYER, default_icon_file = ((ears_extra.mob_overlay_icon) ? ears_extra.mob_overlay_icon : 'icons/mob/ears.dmi'))
		var/mutable_appearance/ears_overlay = overlays_standing[EAR_RIGHT_LAYER]
		switch(dir)
			if(NORTH)
				ears_overlay.pixel_x += EARS_X_OFFSET_NORTH
				ears_overlay.pixel_y += EARS_Y_OFFSET_NORTH
			if(EAST)
				ears_overlay.pixel_x += EARS_X_OFFSET_EAST
				ears_overlay.pixel_y += EARS_Y_OFFSET_EAST
			if(SOUTH)
				ears_overlay.pixel_x += EARS_X_OFFSET_SOUTH
				ears_overlay.pixel_y += EARS_Y_OFFSET_SOUTH
			if(WEST)
				ears_overlay.pixel_x += EARS_X_OFFSET_WEST
				ears_overlay.pixel_y += EARS_Y_OFFSET_WEST
		overlays_standing[EAR_RIGHT_LAYER] = ears_overlay
	apply_overlay(EAR_RIGHT_LAYER)

//BELT
/mob/living/carbon/wendigo/update_inv_belt()
	remove_overlay(BELT_LAYER)

	if(belt)
		belt.screen_loc = ui_belt
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += belt

		var/t_state = belt.item_state
		if(!t_state)
			t_state = belt.icon_state

		overlays_standing[BELT_LAYER] = belt.build_worn_icon(override_state = t_state, default_layer = BELT_LAYER, default_icon_file = ((belt.mob_overlay_icon) ? belt.mob_overlay_icon : 'icons/mob/clothing/belt.dmi'))
		var/mutable_appearance/belt_overlay = overlays_standing[BELT_LAYER]
		switch(dir)
			if(NORTH)
				belt_overlay.pixel_x += BELT_X_OFFSET_NORTH
				belt_overlay.pixel_y += BELT_Y_OFFSET_NORTH
			if(EAST)
				belt_overlay.pixel_x += BELT_X_OFFSET_EAST
				belt_overlay.pixel_y += BELT_Y_OFFSET_EAST
			if(SOUTH)
				belt_overlay.pixel_x += BELT_X_OFFSET_SOUTH
				belt_overlay.pixel_y += BELT_Y_OFFSET_SOUTH
			if(WEST)
				belt_overlay.pixel_x += BELT_X_OFFSET_WEST
				belt_overlay.pixel_y += BELT_Y_OFFSET_WEST
		overlays_standing[BELT_LAYER] = belt_overlay
	apply_overlay(BELT_LAYER)

//BACK
/mob/living/carbon/wendigo/update_inv_back()
	..()
	if(back)
		back.screen_loc = ui_back
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += back
		var/mutable_appearance/back_overlay = overlays_standing[BACK_LAYER]
		if(back_overlay)
			remove_overlay(BACK_LAYER)
			switch(dir)
				if(NORTH)
					back_overlay.pixel_x += BACK_X_OFFSET_NORTH
					back_overlay.pixel_y += BACK_Y_OFFSET_NORTH
				if(EAST)
					back_overlay.pixel_x += BACK_X_OFFSET_EAST
					back_overlay.pixel_y += BACK_Y_OFFSET_EAST
				if(SOUTH)
					back_overlay.pixel_x += BACK_X_OFFSET_SOUTH
					back_overlay.pixel_y += BACK_Y_OFFSET_SOUTH
				if(WEST)
					back_overlay.pixel_x += BACK_X_OFFSET_WEST
					back_overlay.pixel_y += BACK_Y_OFFSET_WEST
			overlays_standing[BACK_LAYER] = back_overlay
			apply_overlay(BACK_LAYER)

//NECK
/mob/living/carbon/wendigo/update_inv_neck()
	..()
	if(wear_neck)
		wear_neck.screen_loc = ui_neck
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += wear_neck
		var/mutable_appearance/neck_overlay = overlays_standing[NECK_LAYER]
		if(neck_overlay)
			remove_overlay(NECK_LAYER)
			switch(dir)
				if(NORTH)
					neck_overlay.pixel_x += NECK_X_OFFSET_NORTH
					neck_overlay.pixel_y += NECK_Y_OFFSET_NORTH
				if(EAST)
					neck_overlay.pixel_x += NECK_X_OFFSET_EAST
					neck_overlay.pixel_y += NECK_Y_OFFSET_EAST
				if(SOUTH)
					neck_overlay.pixel_x += NECK_X_OFFSET_SOUTH
					neck_overlay.pixel_y += NECK_Y_OFFSET_SOUTH
				if(WEST)
					neck_overlay.pixel_x += NECK_X_OFFSET_WEST
					neck_overlay.pixel_y += NECK_Y_OFFSET_WEST
			overlays_standing[NECK_LAYER] = neck_overlay
			apply_overlay(NECK_LAYER)

//HANDS
/mob/living/carbon/wendigo/update_inv_hands()
	remove_overlay(HANDS_LAYER)
	if (handcuffed)
		drop_all_held_items()
		return

	var/list/hands = list()
	for(var/obj/item/I in held_items)
		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			I.screen_loc = ui_hand_position(get_held_index_of_item(I))
			client.screen += I
			if(observers && observers.len)
				for(var/M in observers)
					var/mob/dead/observe = M
					if(observe.client && observe.client.eye == src)
						observe.client.screen += I
					else
						observers -= observe
						if(!observers.len)
							observers = null
							break

		var/t_state = I.item_state
		if(!t_state)
			t_state = I.icon_state

		var/icon_file = I.lefthand_file
		var/righthand = 0
		if(get_held_index_of_item(I) % 2 == 0)
			icon_file = I.righthand_file
			righthand = 1

		var/mutable_appearance/thing = I.build_worn_icon(override_state = t_state, default_layer = HANDS_LAYER, default_icon_file = icon_file, isinhands = TRUE)
		if(righthand)
			switch(dir)
				if(NORTH)
					thing.pixel_x += RHAND_X_OFFSET_NORTH
					thing.pixel_y += RHAND_Y_OFFSET_NORTH
				if(EAST)
					thing = null	//ghetto
				if(SOUTH)
					thing.pixel_x += RHAND_X_OFFSET_SOUTH
					thing.pixel_y += RHAND_Y_OFFSET_SOUTH
				if(WEST)
					thing.pixel_x += RHAND_X_OFFSET_WEST
					thing.pixel_y += RHAND_Y_OFFSET_WEST
		else
			switch(dir)
				if(NORTH)
					thing.pixel_x += LHAND_X_OFFSET_NORTH
					thing.pixel_y += LHAND_Y_OFFSET_NORTH
				if(EAST)
					thing.pixel_x += LHAND_X_OFFSET_EAST
					thing.pixel_y += LHAND_Y_OFFSET_EAST
				if(SOUTH)
					thing.pixel_x += LHAND_X_OFFSET_SOUTH
					thing.pixel_y += LHAND_Y_OFFSET_SOUTH
				if(WEST)
					thing = null	//ghetto

		hands += thing

	overlays_standing[HANDS_LAYER] = hands
	apply_overlay(HANDS_LAYER)

//HEAD
/mob/living/carbon/wendigo/update_inv_head()
	remove_overlay(HEAD_LAYER)

	if(head)
		head.screen_loc = ui_head
		if(client && hud_used && hud_used.hud_shown)
			if(hud_used.inventory_shown)
				client.screen += head
		var/mutable_appearance/head_icon = head.build_worn_icon(override_state = head.icon_state, default_layer = HEAD_LAYER, default_icon_file = 'icons/mob/clothing/head.dmi')
		switch(dir)
			if(NORTH)
				head_icon.pixel_x += HEAD_X_OFFSET_NORTH
				head_icon.pixel_y += HEAD_Y_OFFSET_NORTH
			if(EAST)
				head_icon.pixel_x += HEAD_X_OFFSET_EAST
				head_icon.pixel_y += HEAD_Y_OFFSET_EAST
			if(SOUTH)
				head_icon.pixel_x += HEAD_X_OFFSET_SOUTH
				head_icon.pixel_y += HEAD_Y_OFFSET_SOUTH
			if(WEST)
				head_icon.pixel_x += HEAD_X_OFFSET_WEST
				head_icon.pixel_y += HEAD_Y_OFFSET_WEST
		overlays_standing[ITEM_SLOT_HEAD] = head_icon
		update_hud_head(head)

	apply_overlay(HEAD_LAYER)

#undef LHAND_X_OFFSET_NORTH
#undef LHAND_Y_OFFSET_NORTH
#undef LHAND_X_OFFSET_EAST
#undef LHAND_Y_OFFSET_EAST
#undef LHAND_X_OFFSET_SOUTH
#undef LHAND_Y_OFFSET_SOUTH
#undef LHAND_X_OFFSET_WEST
#undef LHAND_Y_OFFSET_WEST
#undef RHAND_X_OFFSET_NORTH
#undef RHAND_Y_OFFSET_NORTH
#undef RHAND_X_OFFSET_EAST
#undef RHAND_Y_OFFSET_EAST
#undef RHAND_X_OFFSET_SOUTH
#undef RHAND_Y_OFFSET_SOUTH
#undef RHAND_X_OFFSET_WEST
#undef RHAND_Y_OFFSET_WEST
#undef EARS_X_OFFSET_NORTH
#undef EARS_Y_OFFSET_NORTH
#undef EARS_X_OFFSET_EAST
#undef EARS_Y_OFFSET_EAST
#undef EARS_X_OFFSET_SOUTH
#undef EARS_Y_OFFSET_SOUTH
#undef EARS_X_OFFSET_WEST
#undef EARS_Y_OFFSET_WEST
#undef GLASSES_X_OFFSET_NORTH
#undef GLASSES_Y_OFFSET_NORTH
#undef GLASSES_X_OFFSET_EAST
#undef GLASSES_Y_OFFSET_EAST
#undef GLASSES_X_OFFSET_SOUTH
#undef GLASSES_Y_OFFSET_SOUTH
#undef GLASSES_X_OFFSET_WEST
#undef GLASSES_Y_OFFSET_WEST
#undef BELT_X_OFFSET_NORTH
#undef BELT_Y_OFFSET_NORTH
#undef BELT_X_OFFSET_EAST
#undef BELT_Y_OFFSET_EAST
#undef BELT_X_OFFSET_SOUTH
#undef BELT_Y_OFFSET_SOUTH
#undef BELT_X_OFFSET_WEST
#undef BELT_Y_OFFSET_WEST
#undef BACK_X_OFFSET_NORTH
#undef BACK_Y_OFFSET_NORTH
#undef BACK_X_OFFSET_EAST
#undef BACK_Y_OFFSET_EAST
#undef BACK_X_OFFSET_SOUTH
#undef BACK_Y_OFFSET_SOUTH
#undef BACK_X_OFFSET_WEST
#undef BACK_Y_OFFSET_WEST
#undef NECK_X_OFFSET_NORTH
#undef NECK_Y_OFFSET_NORTH
#undef NECK_X_OFFSET_EAST
#undef NECK_Y_OFFSET_EAST
#undef NECK_X_OFFSET_SOUTH
#undef NECK_Y_OFFSET_SOUTH
#undef NECK_X_OFFSET_WEST
#undef NECK_Y_OFFSET_WEST
