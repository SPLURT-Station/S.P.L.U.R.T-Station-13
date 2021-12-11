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
