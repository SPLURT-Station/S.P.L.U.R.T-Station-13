// Edited from: core/modules/tgui/states/vorepanel.dm
GLOBAL_DATUM_INIT(ui_genitalspanel_state, /datum/ui_state/genitalspanel_state, new)

/datum/ui_state/genitalspanel_state/can_use_topic(src_object, mob/user)
	if(src_object != user)
		// Note, inp order to allow others to look at others genital panels, change this to
		// UI_UPDATE
		return UI_CLOSE
	if(!user.client)
		return UI_CLOSE
	if(user.stat == DEAD)
		return UI_DISABLED
	return UI_INTERACTIVE
