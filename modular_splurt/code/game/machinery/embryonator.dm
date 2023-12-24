#define DUMMY_HUMAN_SLOT_DAYCARE "dummy_daycare"
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


/obj/machinery/embryonator/update_icon_state()
	if((!is_operational()) || (!is_on))
		if (panel_open)
			icon_state = "panel_open"
		else
			icon_state = "empty"
	else
		if(embryo_egg)
			icon_state = "inserted"
		else
			icon_state = "empty"

/obj/machinery/embryonator/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction_screwdriver(user, "panel-open", "empty", I))
		return

	else if(default_deconstruction_crowbar(I))
		return

	if(default_unfasten_wrench(user, I))
		return

	if(embryo_egg)
		to_chat(user, span_warning("You can't insert [I] into [src], there is already an egg inside the machine"))
		return ..()

	if(!I.GetComponent(/datum/component/pregnancy))
		to_chat(user, span_warning("You can't insert [I] into [src], the machine only accepts viable eggs"))
		return ..()

	. = TRUE // no afterattack
	if(panel_open)
		to_chat(user, "<span class='warning'>You can't use the [src.name] while its panel is opened!</span>")
		return
	if(!user.transferItemToLoc(I, src))
		return
	to_chat(user, "<span class='notice'>You add [I] to [src].</span>")
	update_icon()

	embryo_egg = I
	var/datum/component/pregnancy/preggo = I.GetComponent(/datum/component/pregnancy)
	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_HALLUCINATION)
	mannequin.setDir(NORTH)
	preggo.determine_baby_features(mannequin)
	preggo.determine_baby_dna(mannequin)
	mannequin.update_appearance()
	child_image = getFlatIcon(mannequin)
	unset_busy_human_dummy(DUMMY_HUMAN_SLOT_DAYCARE)

/obj/machinery/embryonator/Destroy()
	embryo_egg = null
	for(var/obj/item/viable_egg in contents)
		viable_egg.forceMove(get_turf(src))
	. = ..()

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
	if(!embryo_egg)
		child_image = null
		return
	.["image"] = icon2base64(child_image)
	.["egg"] = REF(embryo_egg)

	.["features"] = list()
	for(var/thing in embryo_egg.features)
		var/list/data = list(
			name = embryo_egg.features[thing],
			setting = thing
		)
		.["features"] += list(data)



/obj/machinery/embryonator/ui_act(action, params)
	. = ..()
