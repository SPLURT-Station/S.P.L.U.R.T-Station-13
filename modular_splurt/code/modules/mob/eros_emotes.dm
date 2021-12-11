// SPLURT emotes
/datum/emote/living/tilt
	key = "tilt"
	key_third_person = "tilts their head"
	message = "tilts their head."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/squint
	key = "squint"
	key_third_person = "squints their eyes"
	message = "squints their eyes." // i dumb
	emote_type = EMOTE_VISIBLE

/datum/emote/living/fart
	key = "fart"
	key_third_person = "farts"
	message = "farts out shitcode."
	emote_type = EMOTE_AUDIBLE

/mob/living
	var/fart_cooldown = 0

/datum/emote/living/fart/run_emote(mob/living/user, params, type_override, intentional)
	if(user.fart_cooldown)
		to_chat(user, "<span class='warning'>You try your hardest, but no shart comes out.</span>")
		return
	var/static/list/fart_emotes = list( //cope goonies
		"lets out a girly little 'toot' from their butt.",
		"farts loudly!",
		"lets one rip!",
		"farts! It sounds wet and smells like rotten eggs.",
		"farts robustly!",
		"farted! It smells like something died.",
		"farts like a muppet!",
		"defiles the station's air supply.",
		"farts a ten second long fart.",
		"groans and moans, farting like the world depended on it.",
		"breaks wind!",
		"expels intestinal gas through the anus.",
		"release an audible discharge of intestinal gas.",
		"is a farting motherfucker!!!",
		"suffers from flatulence!",
		"releases flatus.",
		"releases methane.",
		"farts up a storm.",
		"farts. It smells like Soylent Surprise!",
		"farts. It smells like pizza!",
		"farts. It smells like George Melons' perfume!",
		"farts. It smells like the kitchen!",
		"farts. It smells like medbay in here now!",
		"farts. It smells like the bridge in here now!",
		"farts like a pubby!",
		"farts like a goone!",
		"sharts! That's just nasty.",
		"farts delicately.",
		"farts timidly.",
		"farts very, very quietly. The stench is OVERPOWERING.",
		"farts egregiously.",
		"farts voraciously.",
		"farts cantankerously.",
		"fart in they own mouth. A shameful %OWNER.",
		"breaks wind noisily!",
		"releases gas with the power of the gods! The very station trembles!!",
		"<B><span style='color:red'>f</span><span style='color:blue'>a</span>r<span style='color:red'>t</span><span style='color:blue'>s</span>!</B>",
		"laughs! Their breath smells like a fart.",
		"farts, and as such, blob cannot evoulate.",
		"farts. It might have been the Citizen Kane of farts."
	)
	message = pick(fart_emotes)
	message = replacetext(message, "%OWNER", "[user]")
	. = ..()
	if(.)
		playsound(user, pick(\
			'modular_splurt/sound/voice/farts/fart.ogg',\
			'modular_splurt/sound/voice/farts/fart1.ogg',\
			'modular_splurt/sound/voice/farts/fart2.ogg',\
			'modular_splurt/sound/voice/farts/fart3.ogg',\
			'modular_splurt/sound/voice/farts/fart4.ogg',\
			'modular_splurt/sound/voice/farts/fart5.ogg',\
			'modular_splurt/sound/voice/farts/fart6.ogg',\
			'modular_splurt/sound/voice/farts/fart7.ogg'\
		), 50, 1)

		//Iunno about this one yet chief
		/*
		var/turf/open/T = get_turf(user)
		var/datum/gas_mixture/stank = new
		var/list/cached_gases = stank.gases
		cached_gases[/datum/gas/miasma] += 7*MIASMA_CORPSE_MOLES //eh.
		stank.temperature = T20C // without this the room would eventually freeze and miasma mining would be easier
		T.assume_air(stank)
		T.air_update_turf()
		*/

		var/delay = 300 + rand(0, 150)
		user.fart_cooldown = TRUE
		addtimer(CALLBACK(GLOBAL_PROC, .proc/_fart_renew_msg, user), delay)

/proc/_fart_renew_msg(mob/living/user)
	if(QDELETED(user))
		return
	to_chat(user, "<span class='notice'>Your ass feels full, again.</span>")
	user.fart_cooldown = 0

// Hyperstation Emotes
/datum/emote/living/cackle
	key = "cackle"
	key_third_person = "cackles"
	message = "cackles hysterically!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/cackle/run_emote(mob/living/user, params)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			return
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/cackle_yeen.ogg', 50, 1, -1)
	. = ..()

/datum/emote/speen
	key = "speen"
	key_third_person = "speeeeens!"
	restraint_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)

/datum/emote/speen/run_emote(mob/user)
	. = ..()
	if(.)
		user.spin(20, 1)

		if(iscyborg(user) && user.has_buckled_mobs())
			var/mob/living/silicon/robot/R = user
			var/datum/component/riding/riding_datum = R.GetComponent(/datum/component/riding)
			if(riding_datum)
				for(var/mob/M in R.buckled_mobs)
					riding_datum.force_dismount(M)
			else
				R.unbuckle_all_mobs()

/datum/emote/speen/run_emote(mob/living/user, params)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			return
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/speen.ogg', 50, 1, -1)
	. = ..()

/datum/emote/sound/human/chirp
	key = "chirp"
	key_third_person = "chirps"
	message = "chirps!"
	sound = 'modular_splurt/sound/voice/chirp.ogg'

/datum/emote/sound/human/caw
	key = "caw"
	key_third_person = "caws"
	message = "caws!"
	sound = 'modular_splurt/sound/voice/caw.ogg'

/datum/emote/living/burp/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/list/burp_noises = list(
		'modular_splurt/sound/voice/burps/belch1.ogg','modular_splurt/sound/voice/burps/belch2.ogg','modular_splurt/sound/voice/burps/belch3.ogg','modular_splurt/sound/voice/burps/belch4.ogg',
		'modular_splurt/sound/voice/burps/belch5.ogg','modular_splurt/sound/voice/burps/belch6.ogg','modular_splurt/sound/voice/burps/belch7.ogg','modular_splurt/sound/voice/burps/belch8.ogg',
		'modular_splurt/sound/voice/burps/belch9.ogg','modular_splurt/sound/voice/burps/belch10.ogg','modular_splurt/sound/voice/burps/belch11.ogg','modular_splurt/sound/voice/burps/belch12.ogg',
		'modular_splurt/sound/voice/burps/belch13.ogg','modular_splurt/sound/voice/burps/belch14.ogg','modular_splurt/sound/voice/burps/belch15.ogg'
	)
	if(.)
		playsound(user, pick(burp_noises), 50, 1)

/datum/emote/living/bleat
	key = "bleat"
	key_third_person = "bleats loudly"
	message = "bleats loudly!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/bleat/run_emote(mob/living/user, params)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			return
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bleat.ogg', 50, 1, -1)
	. = ..()

/datum/emote/living/carbon/moan/run_emote(mob/living/user, params) //I can't not port this shit, come on.
	if(user.nextsoundemote >= world.time || user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(!user.is_muzzled() && !miming)
		user.nextsoundemote = world.time + 7
		sound = pick('modular_splurt/sound/voice/moan_m1.ogg', 'modular_splurt/sound/voice/moan_m2.ogg', 'modular_splurt/sound/voice/moan_m3.ogg')
		if(user.gender == FEMALE)
			sound = pick('modular_splurt/sound/voice/moan_f1.ogg', 'modular_splurt/sound/voice/moan_f2.ogg', 'modular_splurt/sound/voice/moan_f3.ogg', 'modular_splurt/sound/voice/moan_f4.ogg', 'modular_splurt/sound/voice/moan_f5.ogg', 'modular_splurt/sound/voice/moan_f6.ogg', 'modular_splurt/sound/voice/moan_f7.ogg')
		if(isalien(user))
			sound = 'sound/voice/hiss6.ogg'
		playsound(user.loc, sound, 50, 1, 4, 1.2)
		message = "moans!"
	else if(miming)
		message = "acts out a moan."
	else
		message = "makes a very loud noise."
	. = ..()
