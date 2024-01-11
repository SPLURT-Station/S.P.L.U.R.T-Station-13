// MODULAR SPLURT: Balanced gift type and list. See non-modular file for more information.
GLOBAL_LIST_INIT(gift_item_blacklist_balanced, list(
    /obj/item/melee/supermatter_sword,
    /obj/item/uplink/debug,
    /obj/item/uplink/nuclear/debug,
    /obj/item/veilrender,
    /obj/item/pizzabox/bomb,
    /obj/item/cartridge/virus/syndicate,
    /obj/item/nuke_core,
    /obj/item/bombcore,
    /obj/item/projectile,
	/obj/item/chrono_eraser,
	/obj/item/gun/energy/chrono_gun,
	/obj/item/stack/tile
))

// New subtype of a_gift
/obj/item/a_gift/balanced
    name = "christmas gift"
    desc = "It could be (almost) anything!"

// Also excludes items from the non-modular blacklist (GLOB.gift_item_blacklist)
/obj/item/a_gift/balanced/get_gift_type()
    if(!GLOB.possible_gifts.len)
        var/list/gift_types_list = subtypesof(/obj/item)
        for(var/V in gift_types_list)
            var/obj/item/I = V
            if((!initial(I.icon_state)) || (!initial(I.item_state)) || (initial(I.item_flags) & ABSTRACT) || (is_type_in_typecache(I, GLOB.gift_item_blacklist)) || (is_type_in_typecache(I, GLOB.gift_item_blacklist_balanced)))
                gift_types_list -= V
        GLOB.possible_gifts = gift_types_list
    var/gift_type = pick(GLOB.possible_gifts)

    return gift_type
