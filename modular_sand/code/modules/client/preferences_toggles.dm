TOGGLE_CHECKBOX(/datum/verbs/menu/Settings/Sound, toggle_lewd_sounds)()
	set name = "Hear/Silence Lewd Verb Sounds"
	set category = "Preferences"
	set desc = "Hear Lewd Verb Sounds From Interactions"
	usr.client.prefs.toggles ^= LEWD_VERB_SOUNDS
	usr.client.prefs.save_preferences()
	if(usr.client.prefs.toggles & LEWD_VERB_SOUNDS)
		to_chat(usr, "You will now hear lewd verb sounds.")
	else
		to_chat(usr, "You will no longer hear lewd verb sounds")
	SSblackbox.record_feedback("nested tally", "preferences_verb", 1, list("Toggle Hearing Lewd Verb Sounds", "[usr.client.prefs.toggles & LEWD_VERB_SOUNDS ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
/datum/verbs/menu/Settings/Sound/toggle_lewd_sounds/Get_checked(client/C)
	return C.prefs.toggles & LEWD_VERB_SOUNDS
