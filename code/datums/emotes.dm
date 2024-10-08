/datum/emote
	var/key = "" //What calls the emote
	var/key_third_person = "" //This will also call the emote
	var/name = "" // Needed for more user-friendly emote names, so emotes with keys like "aflap" will show as "flap angry". Defaulted to key.
	var/message = "" //Message displayed when emote is used
	var/message_mime = "" //Message displayed if the user is a mime
	var/message_alien = "" //Message displayed if the user is a grown alien
	var/message_larva = "" //Message displayed if the user is an alien larva
	var/message_robot = "" //Message displayed if the user is a robot
	var/message_AI = "" //Message displayed if the user is an AI
	var/message_monkey = "" //Message displayed if the user is a monkey
	var/message_simple = "" //Message to display if the user is a simple_animal
	var/message_param = "" //Message to display if a param was given
	var/emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	var/sound
	var/restraint_check = FALSE //Checks if the mob is restrained before performing the emote
	var/muzzle_ignore = FALSE //Will only work if the emote is EMOTE_AUDIBLE
	var/list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	var/list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	var/list/mob_type_ignore_stat_typecache
	var/stat_allowed = CONSCIOUS
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")

	var/chat_popup = TRUE //Skyrat edit
	var/image_popup

/datum/emote/New()
	if (ispath(mob_type_allowed_typecache))
		switch (mob_type_allowed_typecache)
			if (/mob)
				mob_type_allowed_typecache = GLOB.typecache_mob
			if (/mob/living)
				mob_type_allowed_typecache = GLOB.typecache_living
			else
				mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	else
		mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	mob_type_blacklist_typecache = typecacheof(mob_type_blacklist_typecache)
	mob_type_ignore_stat_typecache = typecacheof(mob_type_ignore_stat_typecache)

	if(!name)
		name = key

/datum/emote/proc/run_emote(mob/user, params, type_override, intentional = FALSE)
	. = TRUE
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	var/msg = select_message_type(user)
	if(params && message_param)
		msg = select_param(user, params)

	msg = replace_pronoun(user, msg)

	if(isliving(user))
		var/mob/living/L = user
		for(var/obj/item/implant/I in L.implants)
			I.trigger(key, L)

	if(!msg)
		return

	user.log_message(msg, LOG_EMOTE)
	//msg = "<b>[user]</b> " + msg //SKYRAT CHANGE
	var/dchatmsg = "<span class='emote'><b>[user]</b> [msg]</span>" //SKYRAT CHANGE

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.client || isnewplayer(M))
			continue
		var/T = get_turf(user)
		if(M.stat == DEAD && M.client && (M.client.prefs && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT)) && !(M in viewers(T, null)) && (user.client)) //SKYRAT CHANGE - only user controlled mobs show their emotes to all-seeing ghosts, to reduce chat spam
			M.show_message(dchatmsg) //SKYRAT CHANGE

	if(emote_type == EMOTE_AUDIBLE)
		user.audible_message(dchatmsg, runechat_popup = chat_popup, rune_msg = msg)
	else if(emote_type == EMOTE_VISIBLE)
		user.visible_message(dchatmsg, runechat_popup = chat_popup, rune_msg = msg)
	else if(emote_type == EMOTE_BOTH)
		user.visible_message(dchatmsg, blind_message = msg, runechat_popup = chat_popup, rune_msg = msg)
	else if(emote_type == EMOTE_OMNI)
		user.visible_message(dchatmsg, omni = TRUE, runechat_popup = chat_popup, rune_msg = msg)
	//Skyrat change
	if(image_popup)
		flick_emote_popup_on_mob(user, image_popup, 40)
	//End of skyrat changes

/datum/emote/proc/get_sound(mob/living/user)
	return sound //by default just return this var.

/datum/emote/proc/replace_pronoun(mob/user, message)
	if(findtext(message, "their"))
		message = replacetext(message, "their", user.p_their())
	if(findtext(message, "them"))
		message = replacetext(message, "them", user.p_them())
	if(findtext(message, "%s"))
		message = replacetext(message, "%s", user.p_s())
	return message

/datum/emote/proc/select_message_type(mob/user)
	. = message
	if(!muzzle_ignore && user.is_muzzled() && emote_type == EMOTE_AUDIBLE)
		return "makes a [pick("strong ", "weak ", "")]noise."
	if(user.mind && user.mind.miming && message_mime)
		. = message_mime
	if(isalienadult(user) && message_alien)
		. = message_alien
	else if(islarva(user) && message_larva)
		. = message_larva
	else if(iscyborg(user) && message_robot)
		. = message_robot
	else if(isAI(user) && message_AI)
		. = message_AI
	else if(ismonkey(user) && message_monkey)
		. = message_monkey
	else if(isanimal(user) && message_simple)
		. = message_simple

/datum/emote/proc/select_param(mob/user, params)
	return replacetext(message_param, "%t", params)

/datum/emote/proc/can_run_emote(mob/user, status_check = TRUE, intentional = FALSE)
	. = TRUE
	if(mob_type_allowed_typecache) //empty list = anyone can use it unless specifically blacklisted
		if(!is_type_in_typecache(user, mob_type_allowed_typecache))
			return FALSE
	if(is_type_in_typecache(user, mob_type_blacklist_typecache))
		return FALSE
	if(status_check && !is_type_in_typecache(user, mob_type_ignore_stat_typecache))
		if(user.stat > stat_allowed)
			if(!intentional)
				return FALSE
			switch(user.stat)
				if(SOFT_CRIT)
					to_chat(user, "<span class='notice'>You cannot [key] while in a critical condition.</span>")
				if(UNCONSCIOUS)
					to_chat(user, "<span class='notice'>You cannot [key] while unconscious.</span>")
				if(DEAD)
					to_chat(user, "<span class='notice'>You cannot [key] while dead.</span>")
			return FALSE
		var/mob/living/L = user
		if(restraint_check && (istype(L) && !CHECK_MOBILITY(L, MOBILITY_USE)))
			if(!intentional)
				return FALSE
			to_chat(user, "<span class='notice'>You cannot [key] while stunned.</span>")
			return FALSE
		if(restraint_check && user.restrained())
			if(!intentional)
				return FALSE
			to_chat(user, "<span class='notice'>You cannot [key] while restrained.</span>")
			return FALSE

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_EMOTEMUTE))
			return FALSE

/datum/emote/sound
	var/vary = FALSE	//used for the honk borg emote
	var/volume = 50
	// Default time before using another audio emote
	var/emote_cooldown = 1 SECONDS

	// Default volume of the emote
	var/emote_volume = 50

	// Default range modifier
	var/emote_range = -1
	var/emote_distance_multiplier = SOUND_DEFAULT_DISTANCE_MULTIPLIER
	var/emote_distance_multiplier_min_range = SOUND_DEFAULT_MULTIPLIER_EFFECT_RANGE

	// Default pitch variance
	var/emote_pitch_variance = 1

	// Default audio falloff settings
	var/emote_falloff_exponent = SOUND_FALLOFF_EXPONENT
	var/emote_falloff_distance = SOUND_DEFAULT_FALLOFF_DISTANCE

	// Default frequency
	var/emote_frequency = null

	// Default channel
	var/emote_channel = 0

	// Should the emote consider atmospheric pressure?
	var/emote_check_pressure = TRUE

	// Should the emote ignore walls?
	var/emote_ignore_walls = FALSE

	// Default wet and dry settings (???)
	var/emote_wetness = -10000
	var/emote_dryness = 0
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/camera/aiEye)

/datum/emote/sound/can_run_emote(mob/living/user, status_check, intentional = FALSE)
	. = ..()

	// Check parent return
	if(!.)
		return FALSE

	// Check cooldown
	if(user?.nextsoundemote >= world.time)
		return FALSE

	// Allow use
	return TRUE

/datum/emote/sound/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, sound, emote_volume, emote_pitch_variance, emote_range, emote_falloff_exponent, emote_frequency, emote_channel, emote_check_pressure, emote_ignore_walls, emote_falloff_distance, emote_wetness, emote_dryness, emote_distance_multiplier, emote_distance_multiplier_min_range)

		//Cooldown.
		user.nextsoundemote = world.time + emote_cooldown
