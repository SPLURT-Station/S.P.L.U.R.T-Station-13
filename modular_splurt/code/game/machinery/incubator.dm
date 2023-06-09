/obj/machinery/incubator
	name = "Egg Incubator"
	desc = "Used to incubate eggs for hatching. It's looks too big for regular chicken eggs..."
	density = TRUE
	layer = BELOW_OBJ_LAYER
	icon = 'icons/obj/chemical.dmi'
	icon_state = "smoke0"
	use_power = ACTIVE_POWER_USE
	active_power_usage = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/machine/incubator

	var/is_on = FALSE

/obj/machinery/incubator/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction_screwdriver(user, "mixer0_nopower", "mixer0", I))
		return

	else if(default_deconstruction_crowbar(I))
		return

	if(default_unfasten_wrench(user, I))
		return

	if(I.GetComponent(/datum/component/pregnancy))
		. = TRUE // no afterattack
		if(panel_open)
			to_chat(user, "<span class='warning'>You can't use the [src.name] while its panel is opened!</span>")
			return
		if(!user.transferItemToLoc(I, src))
			return
		to_chat(user, "<span class='notice'>You add [I] to [src].</span>")
		update_icon()
	else
		to_chat(user, "<span class='warning'>You can't insert [I] into [src], it only accepts viable eggs!</span>")
		return ..()

/obj/machinery/incubator/CtrlClick(mob/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	toggle_power()

/obj/machinery/incubator/toggle_power()
	is_on = !is_on
	if(is_on)
		START_PROCESSING(SSmachines, src)
	else
		STOP_PROCESSING(SSmachines, src)
	update_icon()

/obj/machinery/incubator/process()
	if(!is_on)
		return PROCESS_KILL
	if(!is_operational())
		is_on = FALSE
		update_icon()
		return PROCESS_KILL
	for(var/obj/item/viable_egg in contents)
		SEND_SIGNAL(viable_egg, COMSIG_MACHINERY_INCUBATOR_PROCESS)

/obj/item/circuitboard/machine/incubator
	name = "Egg Incubator (Machine Board)"
	icon_state = "medical"
	build_path = /obj/machinery/incubator
	req_components = list(
		/obj/item/reagent_containers/glass/beaker = 2,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/sheet/glass = 2)
