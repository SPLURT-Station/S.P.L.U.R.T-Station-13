/obj/item/clothing/under/Destroy()
	QDEL_LIST(attached_accessories)
	return ..()

// Allow skirts to equip/unequip underwear
/obj/item/clothing/under/Initialize(mapload)
	if(is_skirt)
		body_parts_equip_uncovered = GROIN
