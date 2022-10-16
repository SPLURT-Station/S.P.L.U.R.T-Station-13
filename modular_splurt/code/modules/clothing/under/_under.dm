/obj/item/clothing/under/Destroy()
	QDEL_LIST(attached_accessories)
	return ..()

// Allow skirts to equip/unequip underwear
/obj/item/clothing/under/get_body_parts_equip_uncovered()
    return is_skirt ? GROIN : body_parts_equip_uncovered
