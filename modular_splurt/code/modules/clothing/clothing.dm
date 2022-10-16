/obj/item/clothing
    // This gets reduced from body_parts_covered when checking if a piece of clothing is obstructing other
    var/body_parts_equip_uncovered = 0

/obj/item/clothing/proc/get_body_parts_equip_uncovered()
    return body_parts_equip_uncovered
