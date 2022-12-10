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

/obj/item/stack/sheet/silk
	name = "silk"
	desc = "A long soft material. This one is just made out of cotton rather then any spiders or wyrms"
	singular_name = "silk sheet"
	icon_state = "sheet-silk"
	item_state = "sheet-cloth"
	novariants = TRUE
	merge_type = /obj/item/stack/sheet/silk
	grind_results = list(/datum/reagent/cellulose = 2)

//obj/item/stack/sheet/silk/Initialize(mapload, new_amount, merge = TRUE)
//	recipes = GLOB.silk_recipes
//	return ..()


GLOBAL_LIST_INIT(micro_bricks_recipes, list( \
	new /datum/stack_recipe("Road fourway", /obj/structure/micro_brick/road_fourway, 2, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("Road threeway", /obj/structure/micro_brick/road_threeway, 2, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("Road straight", /obj/structure/micro_brick/road_straight, 2, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("Road turn", /obj/structure/micro_brick/Road_turn, 2, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new /datum/stack_recipe("Small houses", /obj/structure/micro_brick/small_house, 5, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("Small business", /obj/structure/micro_brick/small_business, 5, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("Small warehouse", /obj/structure/micro_brick/small_warehouse, 5, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	new /datum/stack_recipe("Small museum", /obj/structure/micro_brick/small_museum, 5, time = 2, one_per_turf = TRUE, on_floor = TRUE), \
	null, \
	new /datum/stack_recipe("Small moon", /obj/item/moon, 5, time = 2), \
	null, \
	))

/obj/item/stack/sheet/micro_bricks
	name = "Micro Bricks"
	desc = "an studless version of the iconic bricks for recreation use on station with big crewmembers "
	singular_name = "Micro Brick"
	icon = 'modular_splurt/icons/obj/stack_objects.dmi'
	icon_state = "SmallBucket"
	item_state = "SmallBucket"
	custom_materials = list(/datum/material/iron=MINERAL_MATERIAL_AMOUNT)
	flags_1 = CONDUCT_1
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/micro_bricks

/obj/item/stack/sheet/micro_bricks/fifty
	amount = 50

/obj/item/stack/sheet/micro_bricks/twenty
	amount = 20

/obj/item/stack/sheet/micro_bricks/ten
	amount = 10

/obj/item/stack/sheet/micro_bricks/five
	amount = 5

/obj/item/stack/sheet/micro_bricks/get_main_recipes()
	. = ..()
	. += GLOB.micro_bricks_recipes

// Hijack recipe loading to add new entries
/obj/item/stack/sheet/cloth/get_main_recipes()
	. = ..()
	. += new/datum/stack_recipe("handmade collar", /obj/item/clothing/neck/petcollar/handmade, 2) \
