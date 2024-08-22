/datum/preferences/update_character(current_version, savefile/S)
	. = ..()
	if(current_version < 48.5)	//need to rewrite languages into a list, not being a list or null
		if(isnull(language))	//causes it to block preferences panel to be blocked and constant runtimes
			language = list()
		else
			var/tmp = language
			language = list(tmp)

/datum/preferences/update_preferences(current_version, savefile/S)
	// Citadel added a new bitfield to toggles, we need to push our prefs forward starting from the last bit
	if(current_version < 55)
		if(CHECK_BITFIELD(toggles, VERB_CONSENT))
			DISABLE_BITFIELD(toggles, VERB_CONSENT)
			ENABLE_BITFIELD(toggles, LEWD_VERB_SOUNDS)
		if(CHECK_BITFIELD(toggles, SOUND_BARK))
			DISABLE_BITFIELD(toggles, SOUND_BARK)
			ENABLE_BITFIELD(toggles, VERB_CONSENT)

	if(current_version < 59.1)
		// Just invert it, now it's a switch to see if you want it on, rather than off.
		TOGGLE_BITFIELD(toggles, LEWD_VERB_SOUNDS)

		// It may not be a default on cit, but this is meant to be default here at least.
		long_strip_menu = TRUE
	. = ..()

/datum/preferences/save_preferences(bypass_cooldown, silent)
	. = ..()
	if(!istype(., /savefile))
		return FALSE
	WRITE_FILE(.["favorite_interactions"],	favorite_interactions)

	WRITE_FILE(.["use_arousal_multiplier"],	use_arousal_multiplier)
	WRITE_FILE(.["arousal_multiplier"],		arousal_multiplier)
	WRITE_FILE(.["use_moaning_multiplier"],	use_moaning_multiplier)
	WRITE_FILE(.["moaning_multiplier"],		moaning_multiplier)

/datum/preferences/load_preferences(bypass_cooldown)
	. = ..()
	if(!istype(., /savefile))
		return FALSE
	.["favorite_interactions"] >>	favorite_interactions

	.["use_arousal_multiplier"] >>	use_arousal_multiplier
	.["arousal_multiplier"] >>		arousal_multiplier
	.["use_moaning_multiplier"] >>	use_moaning_multiplier
	.["moaning_multiplier"] >>		moaning_multiplier

	favorite_interactions = SANITIZE_LIST(favorite_interactions)

	for(var/interaction in favorite_interactions)
		var/datum/interaction/interaction_path = ispath(interaction) ? interaction : text2path(interaction)
		if(!interaction_path)
			LAZYREMOVE(favorite_interactions, interaction)
			continue
		if(!initial(interaction_path.description))
			LAZYREMOVE(favorite_interactions, interaction)
			continue

	use_arousal_multiplier = sanitize_integer(use_arousal_multiplier, 0, 1, initial(use_arousal_multiplier))
	arousal_multiplier = sanitize_integer(arousal_multiplier, 0, 300, initial(arousal_multiplier))
	use_moaning_multiplier = sanitize_integer(use_moaning_multiplier, 0, 1, initial(use_moaning_multiplier))
	moaning_multiplier = sanitize_integer(moaning_multiplier, 0, 100, initial(moaning_multiplier))
