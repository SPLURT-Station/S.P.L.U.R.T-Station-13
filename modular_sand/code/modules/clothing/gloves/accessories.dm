/obj/item/clothing/accessory/ring
	name = "gold ring"
	desc = "A tiny gold ring, sized to wrap around a finger."
	gender = NEUTER
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_ACCESSORY | ITEM_SLOT_GLOVES
	slot_equipment_priority = ITEM_SLOT_ACCESSORY | ITEM_SLOT_GLOVES | ITEM_SLOT_BACKPACK
	icon = 'icons/obj/ring.dmi'
	mob_overlay_icon = 'icons/mob/clothing/hands.dmi'
	icon_state = "ringgold"
	item_state = "gring"
	strip_delay = 40
	var/transfer_prints = FALSE
	var/transfer_blood = 0
	var/strip_mod = 1
	var/strip_silence = FALSE

/obj/item/clothing/accessory/ring/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("\[user] is putting the [src] in [user.p_their()] mouth! It looks like [user] is trying to choke on the [src]!"))
	return OXYLOSS

/obj/item/clothing/accessory/ring/attack_self(mob/user)
	user.visible_message(span_warning("\The [user] gets down on one knee, presenting \the [src]."),span_warning("You get down on one knee, presenting \the [src]."))

/obj/item/clothing/accessory/ring/proc/Touch(atom/A, proximity)
	return FALSE // return TRUE to cancel attack_hand()

/obj/item/clothing/accessory/ring/diamond
	name = "diamond ring"
	desc = "An expensive ring, studded with a diamond. Cultures have used these rings in courtship for a millenia."
	icon_state = "ringdiamond"
	item_state = "dring"

/obj/item/clothing/accessory/ring/silver
	name = "silver ring"
	desc = "A tiny silver ring, sized to wrap around a finger."
	icon_state = "ringsilver"
	item_state = "sring"

/obj/item/clothing/accessory/ring/custom
	name = "ring"
	desc = "A ring."
	icon_state = "ringsilver"
	item_state = "sring"
	obj_flags = UNIQUE_RENAME
