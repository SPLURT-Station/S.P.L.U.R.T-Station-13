// GYM FURNITURE
/datum/crafting_recipe/stacklifter
	name = "Chest Press Machine"
	result = /obj/structure/weightmachine/stacklifter
	time = 200
	reqs = list(/obj/item/stack/sheet/metal = 20,
				/obj/item/stack/sheet/cloth = 5)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	subcategory = CAT_FURNITURE
	category = CAT_MISCELLANEOUS

/datum/crafting_recipe/weightlifter
	name = "Inline Bench Press"
	result = /obj/structure/weightmachine/weightlifter
	time = 200
	reqs = list(/obj/item/stack/sheet/metal = 20,
				/obj/item/stack/sheet/cloth = 5)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	subcategory = CAT_FURNITURE
	category = CAT_MISCELLANEOUS

/datum/crafting_recipe/punching_bag
	name = "Punching Bag"
	result = /obj/structure/punching_bag
	time = 200
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/cloth = 15)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	subcategory = CAT_FURNITURE
	category = CAT_MISCELLANEOUS
