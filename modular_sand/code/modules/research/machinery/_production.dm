/obj/machinery/rnd/production/Initialize(mapload)
	. = ..()

	// Generate access lists
	gen_access()

/obj/machinery/rnd/production/ui_interact(mob/user)
	// Check if user can use machine
	if(!user.can_use_production(src))
		// Warn in local chat and return
		say("Access denied: No valid departmental or mineral credentials detected.")
		return

	// Return normally
	. = ..()

/obj/machinery/rnd/production/Topic(raw, ls)
	// Check if user can use machine
	if(!usr.can_use_production_topic(src, raw, ls))
		// Alert in local chat
		usr.visible_message(span_warning("[usr] pushes a button on [src], causing it to chime with the familiar sound of rejection."), span_warning("The machine buzzes with a soft chime. It seems you don't have access to that button."))

		// Play sound
		playsound(loc, 'sound/machines/uplinkerror.ogg', 70, 0)

		// Return
		return

	// Return normally
	. = ..()
