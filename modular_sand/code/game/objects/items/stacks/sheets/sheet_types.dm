/obj/item/stack/sheet/plasteel/cyborg
	custom_materials = null
	is_cyborg = TRUE
	source = /datum/robot_energy_storage/metal
	var/datum/robot_energy_storage/plasource = /datum/robot_energy_storage/plasma
	var/metcost = MINERAL_MATERIAL_AMOUNT * 0.125
	var/placost = MINERAL_MATERIAL_AMOUNT * 0.125

/obj/item/stack/sheet/plasteel/cyborg/prepare_estorage(obj/item/robot_module/module)
	. = ..()
	if(plasource)
		plasource = module.get_or_create_estorage(plasource)

/obj/item/stack/sheet/plasteel/cyborg/get_amount()
	return min(round(source.energy / metcost), round(plasource.energy / placost))

/obj/item/stack/sheet/plasteel/cyborg/use(used, transfer = FALSE) // Requires special checks, because it uses two storages
	source.use_charge(used * metcost)
	plasource.use_charge(used * placost)
	update_icon()

/obj/item/stack/sheet/plasteel/cyborg/add(amount)
	source.add_charge(amount * metcost)
	plasource.add_charge(amount * placost)
	update_icon()

/obj/item/stack/sheet/mineral/wood
	name = "wooden plank"
	desc = "One can only guess that this is a bunch of wood. You might be able to make a stake with this if you use something sharp on it"
	singular_name = "wood plank"
	icon_state = "sheet-wood"
	item_state = "sheet-wood"
	icon = 'icons/obj/stack_objects.dmi'
	sheettype = "wood"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/sheet/mineral/wood
	novariants = TRUE
	grind_results = list(/datum/reagent/cellulose = 20)
