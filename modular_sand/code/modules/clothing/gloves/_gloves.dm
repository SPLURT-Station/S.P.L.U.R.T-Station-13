/obj/item/clothing/gloves
	var/dummy_thick = FALSE // is able to hold accessories on its item
	var/max_accessories = 1
	var/list/obj/item/clothing/accessory/ring/attached_accessories = list()
	var/list/mutable_appearance/accessory_overlays = list()

/obj/item/clothing/gloves/Destroy()
	QDEL_LIST(attached_accessories)
	return ..()

/obj/item/clothing/gloves/worn_overlays(isinhands = FALSE, icon_file, used_state, style_flags = NONE)
	. = ..()
	if(!isinhands)
		if(length(accessory_overlays))
			. += accessory_overlays

/obj/item/clothing/gloves/attackby(obj/item/I, mob/user, params)
	if(!attach_accessory(I, user))
		return ..()

/obj/item/clothing/gloves/AltClick(mob/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(length(attached_accessories))
		remove_accessory(user)

/obj/item/clothing/gloves/equipped(mob/user, slot)
	..()

	// Sandstorm edit
	for(var/obj/item/clothing/accessory/ring/attached_accessory in attached_accessories)
		if(attached_accessory && slot != ITEM_SLOT_HANDS && ishuman(user))
			var/mob/living/carbon/human/H = user
			attached_accessory.on_uniform_equip(src, user)
			if(attached_accessory.above_suit)
				H.update_inv_wear_suit()
	// Sandstorm edit END

/obj/item/clothing/gloves/dropped(mob/user)
	// Sandstorm edit
	for(var/obj/item/clothing/accessory/ring/attached_accessory in attached_accessories)
		attached_accessory.on_uniform_dropped(src, user)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(attached_accessory.above_suit)
				H.update_inv_wear_suit()
	// Sandstorm edit END
	..()

/obj/item/clothing/gloves/proc/attach_accessory(obj/item/I, mob/user, notifyAttach = 1)
	. = FALSE
	if(istype(I, /obj/item/clothing/accessory/ring))
		var/obj/item/clothing/accessory/ring/A = I
		if(length(attached_accessories) >= max_accessories)
			if(user)
				to_chat(user, span_warning("[src] already has [length(attached_accessories)] accessories."))
			return
		if(dummy_thick)
			if(user)
				to_chat(user, span_warning("[src] is too bulky and cannot have accessories attached to it!"))
			return
		else
			if(user && !user.temporarilyRemoveItemFromInventory(I))
				return
			if(!A.attach(src, user))
				return

			if(user && notifyAttach)
				to_chat(user, span_notice("You attach [I] to [src]."))

			if((flags_inv & HIDEACCESSORY) || (A.flags_inv & HIDEACCESSORY))
				return TRUE

			accessory_overlays = list(mutable_appearance('icons/mob/clothing/accessories.dmi', "blank"))
			for(var/obj/item/clothing/accessory/attached_accessory in attached_accessories)
				var/datum/element/polychromic/polychromic = LAZYACCESS(attached_accessory.comp_lookup, "item_worn_overlays")
				if(!polychromic)
					var/mutable_appearance/accessory_overlay = mutable_appearance(attached_accessory.mob_overlay_icon, attached_accessory.item_state || attached_accessory.icon_state, ABOVE_HUD_LAYER)
					accessory_overlay.alpha = attached_accessory.alpha
					accessory_overlay.color = attached_accessory.color
					accessory_overlays += accessory_overlay
				else
					polychromic.apply_worn_overlays(attached_accessory, FALSE, attached_accessory.mob_overlay_icon, attached_accessory.item_state || attached_accessory.icon_state, NONE, accessory_overlays)

			if(ishuman(loc))
				var/mob/living/carbon/human/H = loc
				H.update_inv_gloves()

			return TRUE

/obj/item/clothing/gloves/proc/remove_accessory(mob/user)
	if(!isliving(user))
		return
	if(!can_use(user))
		return

	if(length(attached_accessories))
		var/obj/item/clothing/accessory/ring/A = attached_accessories[length(attached_accessories)]
		A.detach(src, user)
		if(user.put_in_hands(A))
			to_chat(user, span_notice("You detach [A] from [src]."))
		else
			to_chat(user, span_notice("You detach [A] from [src] and it falls on the floor."))

		if(ishuman(loc))
			var/mob/living/carbon/human/H = loc
			H.update_inv_gloves()

/obj/item/clothing/gloves/examine(mob/user)
	. = ..()
	if(length(attached_accessories))
		for(var/obj/item/clothing/accessory/ring/attached_accessory in attached_accessories)
			. += "\A [attached_accessory] is attached to one of it's fingers."
