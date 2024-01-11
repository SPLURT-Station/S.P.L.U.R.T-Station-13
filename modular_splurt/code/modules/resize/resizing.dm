/mob/living/handle_micro_bump_other(mob/living/target)

	// If the target is not in combat mode, if the target has the preference off, stop the interaction.
	if(target.a_intent != INTENT_HARM && SEND_SIGNAL(target, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE) && target.client.prefs.stomppref == FALSE)
		return FALSE

	// Do the rest of the function normally.
	. = ..()
