/obj/machinery/embryonator
	name = "Honeystone's Genetic Daycare"
	desc = "A machine used to modify an egg's genetics. It has a nursery theme to it"
	density = TRUE
	layer = BELOW_OBJ_LAYER
	icon = 'modular_splurt/icons/obj/machinery/honeystones_genetic_daycare.dmi'
	icon_state = "empty"
	use_power = ACTIVE_POWER_USE
	active_power_usage = 150
	resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/machine/embryonator
	var/icon/child_image
	var/obj/item/embryo_egg

/obj/machinery/embryonator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Daycare")
		ui.open()
	ui.set_autoupdate(FALSE)

/obj/machinery/embryonator/ui_static_data(mob/user)
	. = ..()

/obj/machinery/embryonator/ui_data(mob/user)
	. = ..()
	.["child_image"] = icon2base64(child_image)

/obj/machinery/embryonator/ui_act(action, params)
	. = ..()
