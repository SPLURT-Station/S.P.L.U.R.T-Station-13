// Configuration defines
#define AUTODOC_TIME_BASE	CONFIG_GET(number/autodoc_time_surgery_base)

/obj/machinery/autodoc
	name = "autodoc"
	desc = "An advanced machine used for inserting organs and implants into the occupant."
	density = TRUE
	state_open = FALSE
	icon = 'modular_sand/icons/obj/machines/autodoc.dmi'
	icon_state = "autodoc_machine"
	verb_say = "states"
	idle_power_usage = 50
	circuit = /obj/item/circuitboard/machine/autodoc
	var/obj/item/organ/storedorgan
	var/organ_type = /obj/item/organ
	var/processing = FALSE
	var/surgerytime = 300

/obj/machinery/autodoc/Initialize(mapload)
	. = ..()
	update_icon()

	// Set initial time based on config
	surgerytime = max(AUTODOC_TIME_BASE,10)

/obj/machinery/autodoc/RefreshParts()
	var/max_time = AUTODOC_TIME_BASE
	for(var/obj/item/stock_parts/L in component_parts)
		max_time -= (L.rating*10)
	surgerytime = max(max_time,10)

/obj/machinery/autodoc/examine(mob/user)
	. = ..()
	if((obj_flags & EMAGGED) && panel_open)
		. += span_warning("[src]'s surgery protocols have been corrupted!")
	if(processing)
		. += span_notice("[src] is currently inserting [storedorgan] into [occupant].")
	else if(storedorgan)
		. += span_notice("[src] is prepared to insert [storedorgan].")

/obj/machinery/autodoc/close_machine(mob/user)
	..()
	playsound(src, 'sound/machines/click.ogg', 50)
	if(occupant)
		if(!iscarbon(occupant))
			occupant.forceMove(drop_location())
			occupant = null
			return
		to_chat(occupant, span_notice("You enter [src]."))

		dosurgery()

/obj/machinery/autodoc/proc/dosurgery()
	if(!storedorgan && !(obj_flags & EMAGGED))
		to_chat(occupant, span_notice("[src] currently has no implant stored."))
		return

	occupant.visible_message(span_notice("[occupant] presses a button on [src], and you hear a mechanical noise."), span_notice("You feel a sharp sting as [src] starts inserting the organ into your body."))
	playsound(get_turf(occupant), 'sound/weapons/circsawhit.ogg', 50, 1)
	processing = TRUE
	update_icon()
	var/mob/living/carbon/C = occupant
	if(obj_flags & EMAGGED)

		for(var/obj/item/bodypart/BP in reverseList(C.bodyparts)) //Chest and head are first in bodyparts, so we invert it to make them suffer more
			C.emote("scream")
			if(!HAS_TRAIT(C, TRAIT_NODISMEMBER))
				BP.dismember()
			else
				C.apply_damage(40, BRUTE, BP)
			sleep(5) //2 seconds to get outta there before dying
			if(!processing)
				return

		occupant.visible_message(span_warning("[src] dismembers [occupant]!"), span_warning("[src] saws up your body!"))

	else
		sleep(surgerytime)
		if(!processing)
			return
		var/obj/item/organ/currentorgan = C.getorganslot(storedorgan.slot)
		if(currentorgan)
			currentorgan.Remove(C)
			currentorgan.forceMove(get_turf(src))
		storedorgan.Insert(occupant)//insert stored organ into the user
		storedorgan = null
		occupant.visible_message(span_notice("[src] completes the surgery procedure."), span_notice("[src] inserts the organ into your body."))
	playsound(src, 'sound/machines/microwave/microwave-end.ogg', 100, 0)
	processing = FALSE
	open_machine()

/obj/machinery/autodoc/open_machine(mob/user)
	if(processing)
		occupant.visible_message(span_notice("[user] cancels [src]'s procedure."), span_notice("[src] stops inserting the organ into your body."))
		processing = FALSE
	if(occupant)
		occupant.forceMove(drop_location())
		occupant = null
	..(FALSE)

/obj/machinery/autodoc/interact(mob/user)
	if(panel_open)
		to_chat(user, span_notice("Close the maintenance panel first."))
		return

	if(state_open)
		close_machine()
		return

	open_machine()

/obj/machinery/autodoc/attackby(obj/item/I, mob/user, params)
	if(istype(I, organ_type))
		if(storedorgan)
			to_chat(user, span_notice("[src] already has an implant stored."))
			return
		if(!user.transferItemToLoc(I, src))
			return
		storedorgan = I
		I.forceMove(src)
		to_chat(user, span_notice("You insert the [I] into [src]."))
	else
		return ..()

/obj/machinery/autodoc/screwdriver_act(mob/living/user, obj/item/I)
	. = TRUE
	if(..())
		return
	if(occupant)
		to_chat(user, span_warning("[src] is currently occupied!"))
		return
	if(state_open)
		to_chat(user, span_warning("[src] must be closed to [panel_open ? "close" : "open"] its maintenance hatch!"))
		return
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, I))
		if(storedorgan)
			storedorgan.forceMove(drop_location())
			storedorgan = null
		update_icon()
		return
	return FALSE

/obj/machinery/autodoc/crowbar_act(mob/living/user, obj/item/I)
	if(default_deconstruction_crowbar(I))
		return TRUE


/obj/machinery/autodoc/update_icon()
	overlays.Cut()
	if(!state_open)
		if(processing)
			overlays += "[icon_state]_door_on"
			overlays += "[icon_state]_stack"
			overlays += "[icon_state]_smoke"
			overlays += "[icon_state]_green"
		else
			overlays += "[icon_state]_door_off"
			if(occupant)
				if(powered(EQUIP))
					overlays += "[icon_state]_stack"
					overlays += "[icon_state]_yellow"
			else
				overlays += "[icon_state]_red"
	else if(powered(EQUIP))
		overlays += "[icon_state]_red"
	if(panel_open)
		overlays += "[icon_state]_panel"

/obj/machinery/autodoc/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	to_chat(user, span_warning("You reprogram [src]'s surgery procedures."))

#undef AUTODOC_TIME_BASE
