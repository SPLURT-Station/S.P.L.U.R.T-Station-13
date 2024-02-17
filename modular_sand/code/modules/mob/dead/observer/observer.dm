/mob/dead/observer/CtrlClick(mob/user)
	if(isobserver(user) && check_rights(R_SPAWN))
		var/datum/select_equipment/ui = new(user, src)
		ui.ui_interact(user)
	else
		return ..()

//This is more of a hacky fix for performance due to rune-chat
/mob/dead/observer/proc/HearNoPopup(message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, message_mode, atom/movable/source)
	SEND_SIGNAL(src, COMSIG_MOVABLE_HEAR, args) //parent calls can't overwrite the current proc args.
	var/atom/movable/to_follow = speaker
	if(radio_freq)
		var/atom/movable/virtualspeaker/V = speaker

		if(isAI(V.source))
			var/mob/living/silicon/ai/S = V.source
			to_follow = S.eyeobj
		else
			to_follow = V.source
	var/link = FOLLOW_LINK(src, to_follow)
	// Recompose the message, because it's scrambled by default
	message = compose_message(speaker, message_language, raw_message, radio_freq, spans, message_mode, FALSE, source)
	to_chat(src, "[link] [message]")
