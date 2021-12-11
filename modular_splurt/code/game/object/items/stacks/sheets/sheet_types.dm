/*
 * Shadow Wood
 */
GLOBAL_LIST_INIT(shadow_wood_recipes, list ( \
	new /datum/stack_recipe("shadow wood floor tile", /obj/item/stack/tile/wood/shadow, 1, 4, 20), \
	new /datum/stack_recipe("shadow wood table frame", /obj/structure/table_frame/shadow_wood, 2, time = 10), \
	new /datum/stack_recipe("shadow wood chair", /obj/structure/chair/wood/shadow, 3, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("shadow wood crate", /obj/structure/closet/crate/wooden/shadow, 6, time = 50, one_per_turf = TRUE, on_floor = TRUE),\
	new /datum/stack_recipe("shadow wood bed", /obj/structure/bed/shadow, 2, time = 70, one_per_turf = TRUE, on_floor = TRUE),\
	new /datum/stack_recipe("shadow wood double bed", /obj/structure/bed/double/shadow, 4, time = 140, one_per_turf = TRUE, on_floor = TRUE),\
	new /datum/stack_recipe("shadow wood barricade", /obj/structure/barricade/wooden/shadow, 5, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("shadow wood dog bed", /obj/structure/bed/dogbed/shadow, 10, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("shadow wood dresser", /obj/structure/dresser/shadow, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	))

/obj/item/stack/sheet/mineral/wood/shadow
	name = "shadow wood"
	desc = "An purplish wood, it has nothing of special besides its color."
	singular_name = "shadow wood plank"
	icon_state = "sheet-shadow_wood"
	item_state = "sheet-shadow_wood"
	icon = 'modular_splurt/icons/obj/stack_objects.dmi'
	sheettype = "shadow_wood"
	merge_type = /obj/item/stack/sheet/mineral/wood/shadow
	novariants = TRUE
	grind_results = list(/datum/reagent/carbon = 20)
	walltype = /turf/closed/wall/mineral/wood/shadow

/obj/item/stack/sheet/mineral/wood/shadow/Initialize(mapload, new_amount, merge = TRUE)
	. = ..()
	recipes = GLOB.shadow_wood_recipes

/obj/item/stack/sheet/mineral/wood/shadow/fifty
	amount = 50

GLOBAL_LIST_INIT(mush_wood_recipes, list ( \
	new /datum/stack_recipe("mushroom floor tile", /obj/item/stack/tile/wood/mushroom, 1, 4, 20), \
	new /datum/stack_recipe("mushroom table frame", /obj/structure/table_frame/mushwood, 2, time = 10), \
	new /datum/stack_recipe("mushroom chair", /obj/structure/chair/wood/mushroom, 3, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("mushroom barricade", /obj/structure/barricade/wooden/mushroom, 5, time = 50, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("dog bed", /obj/structure/bed/dogbed/mushroom, 10, time = 10, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("dresser", /obj/structure/dresser/mushroom, 10, time = 15, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("mushroom crate", /obj/structure/closet/crate/wooden/mushroom, 6, time = 50, one_per_turf = TRUE, on_floor = TRUE),\
	))

/obj/item/stack/sheet/mineral/wood/mushroom
	name = "mushroom 'wood'"
	desc = "A material similar to wood, except for being fireproof."
	singular_name = "mushroom plank"
	icon_state = "sheet-mush_wood"
	item_state = "sheet-mush_wood"
	icon = 'modular_splurt/icons/obj/stack_objects.dmi'
	sheettype = "mush_wood"
	merge_type = /obj/item/stack/sheet/mineral/wood/mushroom
	novariants = TRUE
	grind_results = list(/datum/reagent/carbon = 20)
	walltype = /turf/closed/wall/mineral/wood/mushroom

/obj/item/stack/sheet/mineral/wood/mushroom/Initialize(mapload, new_amount, merge = TRUE)
	recipes = GLOB.mush_wood_recipes
	return ..()

/obj/item/stack/sheet/mineral/wood/mushroom/fifty
	amount = 50
