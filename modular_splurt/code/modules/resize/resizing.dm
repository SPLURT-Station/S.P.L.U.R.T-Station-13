/mob/living/handle_micro_bump_other(mob/living/target)

	// If the target is not in combat mode, if the target is a player mob with the preference off, stop the interaction.
	var/datum/preferences/target_prefs = target.client?.prefs || GLOB.preferences_datums[target.ckey]
	if(target.a_intent != INTENT_HARM && SEND_SIGNAL(target, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE) && (target.ckey && !target_prefs?.stomppref))
		return FALSE

	// Do the rest of the function normally.
	. = ..()
