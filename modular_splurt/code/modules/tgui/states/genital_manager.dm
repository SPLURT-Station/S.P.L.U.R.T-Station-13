 /**
  * tgui state: genital_manager_state
  *
  * Checks if user is not unconscious or softcrit, checks if src_object still has a client and preferences, and
  * checks if user is adjacent to src_object if not the same as user.
 **/

GLOBAL_DATUM_INIT(ui_genital_manager_state, /datum/ui_state/genital_manager_state, new)

/datum/ui_state/genital_manager_state/can_use_topic(mob/living/carbon/src_object, mob/user)
	if(!src_object.genital_manager?.preferences)
		return UI_CLOSE
	if(src_object != user)
		if(!user.Adjacent(src_object))
			return UI_CLOSE
	if(user.stat >= DEAD)
		return UI_CLOSE
	if(user.stat >= SOFT_CRIT)
		return UI_DISABLED
	return UI_INTERACTIVE
