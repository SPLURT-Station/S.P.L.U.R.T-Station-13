//Milking machines
/datum/crafting_recipe/milking_machine
	name = "Milking Machine"
	result = /obj/item/milking_machine
	reqs = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/rods = 2,
		/obj/item/stack/sheet/cardboard = 1,
		/obj/item/reagent_containers/glass/beaker = 2,
		/obj/item/stock_parts/manipulator = 1
	)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS

/datum/crafting_recipe/milking_machine/penis
	name = "Cock Milker"
	result = /obj/item/milking_machine/penis
	reqs = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/rods = 1,
		/obj/item/stack/sheet/cardboard = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1,
		/obj/item/stock_parts/manipulator = 1
	)

//Bouquets
/datum/crafting_recipe/mixedbouquet
	name = "Mixed bouquet"
	result = /obj/item/bouquet
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/poppy/lily =2,
				/obj/item/grown/sunflower = 2,
				/obj/item/reagent_containers/food/snacks/grown/poppy/geranium = 2)
	category = CAT_MISCELLANEOUS
	subcategory = CAT_MISCELLANEOUS

/datum/crafting_recipe/sunbouquet
	name = "Sunflower bouquet"
	result = /obj/item/bouquet/sunflower
	reqs = list(/obj/item/grown/sunflower = 6)
	category = CAT_MISCELLANEOUS
	subcategory = CAT_MISCELLANEOUS

/datum/crafting_recipe/poppybouquet
	name = "Poppy bouquet"
	result = /obj/item/bouquet/poppy
	reqs = list (/obj/item/reagent_containers/food/snacks/grown/poppy = 6)
	category = CAT_MISCELLANEOUS
	subcategory = CAT_MISCELLANEOUS

/datum/crafting_recipe/rosebouquet
	name = "Rose bouquet"
	result = /obj/item/bouquet/rose
	reqs = list(/obj/item/grown/rose = 6)
	category = CAT_MISCELLANEOUS
	subcategory = CAT_MISCELLANEOUS

//Manly anvil
/datum/crafting_recipe/manlyanvil
	name = "Manly Anvil"
	result = /obj/structure/anvil/obtainable/dwarfvil
	time = 200
	reqs = list(/obj/item/clothing/accessory/skullcodpiece = 1,
	            /obj/item/stack/sheet/mineral/titanium = 25,
				/obj/item/organ/regenerative_core = 2,
				/obj/item/stack/sheet/mineral/wood = 10,
				/datum/reagent/consumable/ethanol/manly_dorf = 50)
	tools = list(TOOL_CROWBAR)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS

/datum/crafting_recipe/trash_cannon
	name = "Trash Cannon"
	always_availible = FALSE
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	result = /obj/structure/cannon/trash
	reqs = list(
		/obj/item/melee/skateboard/improvised = 1,
		/obj/item/tank/internals/oxygen = 1,
		/datum/reagent/drug/maint/tar = 15,
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/storage/toolbox = 1,
	)
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/trashball
	name = "Trashball"
	always_availible = FALSE
	result = /obj/item/stack/cannonball/trashball
	reqs = list(
		/obj/item/stack/sheet = 5,
		/datum/reagent/consumable/space_cola = 10,
	)
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/hudsunsecaviators
	name = "Security HUD Aviators"
	result = /obj/item/clothing/glasses/hud/security/sunglasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	parts = list(/obj/item/clothing/glasses/hud/security/sunglasses = 1,
					/obj/item/clothing/glasses/aviators = 1)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses = 1,
				/obj/item/clothing/glasses/aviators = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsunsecavviatorsremoval
	name = "Security HUD Aviators removal"
	result = /obj/item/clothing/glasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses/aviators = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsunsecaviatorsper
	name = "Prescription Security HUD Aviators"
	result = /obj/item/clothing/glasses/hud/security/sunglasses/aviators/prescription
	time = 20
	tools = list(TOOL_SCREWDRIVER)
	parts = list(/obj/item/clothing/glasses/hud/security/sunglasses/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsundiagaviators
	name = "Diagnostic HUD Aviators"
	result = /obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	parts = list(/obj/item/clothing/glasses/hud/diagnostic/sunglasses = 1,
					/obj/item/clothing/glasses/aviators = 1)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic/sunglasses = 1,
				/obj/item/clothing/glasses/aviators = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsundiagavviatorsremoval
	name = "Diagnostic HUD Aviators removal"
	result = /obj/item/clothing/glasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsundiagaviatorsper
	name = "Prescription Diagnostic HUD Aviators"
	result = /obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators/prescription
	time = 20
	tools = list(TOOL_SCREWDRIVER)
	parts = list(/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsunmedaviators
	name = "Medical HUD Aviators"
	result = /obj/item/clothing/glasses/hud/health/sunglasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	parts = list(/obj/item/clothing/glasses/hud/health/sunglasses = 1,
				/obj/item/clothing/glasses/aviators = 1)
	reqs = list(/obj/item/clothing/glasses/hud/health/sunglasses = 1,
				/obj/item/clothing/glasses/aviators = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsunmedaviatorsper
	name = "Prescription Medical HUD Aviators"
	result = /obj/item/clothing/glasses/hud/health/sunglasses/aviators/prescription
	time = 20
	tools = list(TOOL_SCREWDRIVER)
	parts = list(/obj/item/clothing/glasses/hud/health/sunglasses/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	reqs = list(/obj/item/clothing/glasses/hud/health/sunglasses/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudsunmedaviatorsremoval
	name = "Medical HUD Aviators removal"
	result = /obj/item/clothing/glasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health/sunglasses/aviators = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudblueaviators
	name = "Blueshield HUD Aviators"
	result = /obj/item/clothing/glasses/hud/blueshield/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	parts = list(/obj/item/clothing/glasses/hud/blueshield = 1,
				/obj/item/clothing/glasses/aviators = 1)
	reqs = list(/obj/item/clothing/glasses/hud/blueshield = 1,
				/obj/item/clothing/glasses/aviators = 1,
				/obj/item/stack/cable_coil = 5)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudblueaviatorsremoval
	name = "Blueshield HUD Aviators removal"
	result = /obj/item/clothing/glasses/aviators
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/blueshield/aviators = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudblueaviatorsper
	name = "Prescription Blueshield HUD Aviators"
	result = /obj/item/clothing/glasses/hud/blueshield/aviators/prescription
	time = 20
	tools = list(TOOL_SCREWDRIVER)
	parts = list(/obj/item/clothing/glasses/hud/blueshield/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	reqs = list(/obj/item/clothing/glasses/hud/blueshield/aviators = 1,
				/obj/item/clothing/glasses/regular = 1)
	category = CAT_CLOTHING

/datum/crafting_recipe/hudblueper
	name = "Prescription Blueshield HUD"
	result = /obj/item/clothing/glasses/hud/blueshield/prescription
	time = 20
	tools = list(TOOL_SCREWDRIVER)
	parts = list(/obj/item/clothing/glasses/hud/blueshield = 1,
				/obj/item/clothing/glasses/regular = 1)
	reqs = list(/obj/item/clothing/glasses/hud/blueshield = 1,
				/obj/item/clothing/glasses/regular = 1)
	category = CAT_CLOTHING

//to do: put carpentry in it's own crafting tab
/datum/crafting_recipe/weak_metal
	name = "Heated Metal"
	reqs = list(/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_WELDER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS
	result = /obj/item/processed/metal

/datum/crafting_recipe/processed_wood
	name = "Processable Wood"
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5)
	tools = list(TOOL_WIRECUTTER, TOOL_WELDER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS
	result = /obj/item/processed/wood/plank

/datum/crafting_recipe/stool_base
	name = "Stool Base"
	reqs = list(/obj/item/processed/wood/seat = 1, /obj/item/processed/wood/gluepeg = 4)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS
	result = /obj/item/processed/wood/stool1

/datum/crafting_recipe/clothcushion
	name = "Cloth Cushion"
	reqs = list(/obj/item/stack/sheet/cloth = 2, /obj/item/stack/sheet/cotton = 5)
	tools = list(TOOL_WIRECUTTER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS
	result = /obj/item/cushion

/datum/crafting_recipe/silkcushion
	name = "Silk Cushion"
	reqs = list(/obj/item/stack/sheet/silk = 2, /obj/item/stack/sheet/cotton = 5)
	tools = list(TOOL_WIRECUTTER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS
	result = /obj/item/cushion/silk

// TOOLS
/datum/crafting_recipe/igniter
	name = "Igniter"
	result = /obj/item/assembly/igniter
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1
				)
	tools = list(TOOL_SCREWDRIVER)
	time = 30
	subcategory = CAT_TOOL
	category = CAT_MISCELLANEOUS
