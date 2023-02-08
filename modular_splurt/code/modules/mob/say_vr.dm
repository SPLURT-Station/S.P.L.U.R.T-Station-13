/datum/emote/living/narrate
	key = "narrate"
	key_third_person = "narrates"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)
	emote_type = EMOTE_OMNI

/datum/emote/living/narrate/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, span_danger("Invalid emote."))
		return TRUE
	return FALSE

/datum/emote/living/narrate/run_emote(mob/user, params, type_override, intentional)
	. = TRUE
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send narrates (banned).")
		return FALSE
	if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	if(!params)
		return FALSE
	message = params
	if(type_override)
		emote_type = type_override
	if(!can_run_emote(user) || check_invalid(user, message))
		return FALSE

	user.log_message(message, LOG_EMOTE)
	message = span_name("([user])</span> <span class='pnarrate'>[message]")

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.client || isnewplayer(M))
			continue
		var/T = get_turf(src)
		if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(T, null)) && (user.client))
			M.show_message("[FOLLOW_LINK(M, user)] " + message)

	user.visible_message(message = message, self_message = message, omni = TRUE)

/mob/living/verb/player_narrate(message as message)
	set category = "IC"
	set name = "Narrate (Player)"
	set desc = "Narrate an action or event! An alternative to emoting, for when your emote shouldn't start with your name!"
	if(GLOB.say_disabled)
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return
	message = trim(html_encode(message), MAX_MESSAGE_LEN)
	emote("narrate", message=message)

/datum/emote/living/subtle/subtle_indicator
	key = "subtle-indicator"
	key_third_person = "subtle-indicator"

/mob/living/verb/subtle_indicator()
	// Set data
	set name = "Subtle (Indicator)"
	set category = "IC"

	// Check if say is disabled
	if(GLOB.say_disabled)
		// Warn user and return
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return

	// Display typing indicator
	display_typing_indicator()

	// Prompt user for text input
	var/input_message = input(usr, "What would you like to subtly emote, with a typing indicator?", "Input subtle emote") as message|null

	// Remove typing indicator
	clear_typing_indicator()

	// Run subtle emote with input
	usr.emote("subtle", message = input_message)
