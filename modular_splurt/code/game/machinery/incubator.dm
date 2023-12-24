/obj/machinery/incubator
	name = "Egg Incubator"
	desc = "Used to incubate eggs for hatching. It's looks too big for regular chicken eggs..."
	density = TRUE
	layer = BELOW_OBJ_LAYER
	icon = 'icons/obj/chemical.dmi'
	icon_state = "smoke0"
	use_power = IDLE_POWER_USE
	active_power_usage = 200
	idle_power_usage = 20
	resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/machine/incubator

	var/is_on = FALSE

/obj/machinery/incubator/update_icon_state()
	if((!is_operational()) || (!is_on))
		if (panel_open)
			icon_state = "smoke0-o"
		else
			icon_state = "smoke0"
	else
		icon_state = "smoke1"

/obj/machinery/incubator/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction_screwdriver(user, "smoke0-o", "smoke0", I))
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
	if(is_on)
		to_chat(user, span_notice("You turn [src] on"))
	else
		to_chat(user, span_notice("You turn [src] off"))

/obj/machinery/incubator/proc/toggle_power()
	is_on = !is_on
	if(is_on)
		START_PROCESSING(SSmachines, src)
		use_power = ACTIVE_POWER_USE
	else
		STOP_PROCESSING(SSmachines, src)
		use_power = IDLE_POWER_USE
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

/obj/machinery/incubator/Destroy()
	for(var/obj/item/viable_egg in contents)
		viable_egg.forceMove(get_turf(src))
	. = ..()

/obj/machinery/incubator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "IncubatorControl", name)
		ui.open()

/obj/machinery/incubator/ui_data(mob/user)
	. = list()
	.["is_on"] = is_on
	.["eggs"] = list()
	for(var/obj/item/egg_item in contents)
		var/datum/component/pregnancy/preggo = egg_item.GetComponent(/datum/component/pregnancy)
		if(!preggo)
			continue
		var/list/data = list(
			name = egg_item.name,
			stage = preggo.stage / preggo.max_stage,
			ref = REF(egg_item)
		)
		.["eggs"] += list(data)

/obj/machinery/incubator/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("toggle_power")
			toggle_power()
			if(is_on)
				to_chat(usr, span_notice("You turn [src] on"))
				use_power = ACTIVE_POWER_USE
			else
				to_chat(usr, span_notice("You turn [src] off"))
				use_power = IDLE_POWER_USE
		if("remove")
			var/ref = params["ref"]
			var/obj/item/eggo = locate(ref) in contents
			if(!eggo)
				return
			usr.put_in_active_hand(eggo)
