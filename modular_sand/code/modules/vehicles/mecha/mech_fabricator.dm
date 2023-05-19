/obj/machinery/mecha_part_fabricator/maint
	req_access = null

/obj/machinery/mecha_part_fabricator/offstation
	req_access = null

/obj/machinery/mecha_part_fabricator/ui_interact(mob/user, datum/tgui/ui)
	// Check if user can use machine
	if(!user.can_use_production(src))
		// Check if UI doesn't exist
		if(!ui)
			// Send normal warning
			say("Access denied: No valid credentials detected.")

		// UI does exist
		else
			// Close UI
			ui.close()

			// Send alternate warning
			say("Access revoked: Valid credentials no longer detected.")

		// Return
		return

	// Return normally
	. = ..()

/obj/machinery/mecha_part_fabricator/ui_act(action, var/list/params)
	// Check if user can use machine
	if(!usr.can_use_mechfab_topic(src, action, params))
		// Alert in local chat
		usr.visible_message(span_warning("[usr] pushes a button on [src], causing it to chime with the familiar sound of rejection."), span_warning("The machine buzzes with a soft chime. It seems you don't have access to that button."))

		// Play sound
		playsound(loc, 'sound/machines/uplinkerror.ogg', 70, 0)

		// Return
		return

	// Return normally
	. = ..()
