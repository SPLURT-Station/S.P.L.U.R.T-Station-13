/obj/item/stack/sheet/plasmaglass/cyborg
	custom_materials = null
	is_cyborg = TRUE
	source = /datum/robot_energy_storage/glass
	var/datum/robot_energy_storage/plasource = /datum/robot_energy_storage/plasma
	var/glacost = MINERAL_MATERIAL_AMOUNT * 0.125
	var/placost = MINERAL_MATERIAL_AMOUNT * 0.125

/obj/item/stack/sheet/plasmaglass/cyborg/prepare_estorage(obj/item/robot_module/module)
	. = ..()
	if(plasource)
		plasource = module.get_or_create_estorage(plasource)

/obj/item/stack/sheet/plasmaglass/cyborg/get_amount()
	return min(round(plasource.energy / placost), round(source.energy / glacost))

/obj/item/stack/sheet/plasmaglass/cyborg/use(used, transfer = FALSE) // Requires special checks, because it uses two storages
	source.use_charge(used * glacost)
	plasource.use_charge(used * placost)
	update_icon()

/obj/item/stack/sheet/plasmaglass/cyborg/add(amount)
	source.add_charge(amount * glacost)
	plasource.add_charge(amount * placost)
	update_icon()

/obj/item/stack/sheet/plasmarglass/cyborg
	custom_materials = null
	is_cyborg = TRUE
	source = /datum/robot_energy_storage/glass
	var/datum/robot_energy_storage/plasource = /datum/robot_energy_storage/plasma
	var/glacost = MINERAL_MATERIAL_AMOUNT * 0.25
	var/placost = MINERAL_MATERIAL_AMOUNT * 0.25

/obj/item/stack/sheet/plasmarglass/cyborg/prepare_estorage(obj/item/robot_module/module)
	. = ..()
	if(plasource)
		plasource = module.get_or_create_estorage(plasource)

/obj/item/stack/sheet/plasmarglass/cyborg/get_amount()
	return min(round(source.energy / glacost), round(plasource.energy / placost))

/obj/item/stack/sheet/plasmarglass/cyborg/use(used, transfer = FALSE) // Requires special checks, because it uses two storages
	source.use_charge(used * glacost)
	plasource.use_charge(used * placost)
	update_icon()

/obj/item/stack/sheet/plasmarglass/cyborg/add(amount)
	source.add_charge(amount * glacost)
	plasource.add_charge(amount * placost)
	update_icon()
