/datum/emote/living/audio_emote/laugh/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(!iscatperson(C) && !isinsect(C) && !isjellyperson(C) && !ishumanbasic(C))
			if(user.gender == FEMALE)
				playsound(C, 'sound/voice/human/womanlaugh.ogg', 50, 1)
			else
				playsound(C, pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg'), 50, 1)

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
	var/list/fart_emotes = list( //cope goonies
		"lets out a girly little 'toot' from [user.p_their()] butt.",
		"farts loudly!",
		"lets one rip!",
		"farts! It sounds wet and smells like rotten eggs.",
		"farts robustly!",
		"farted! It smells like something died.",
		"farts like a muppet!",
		"defiles the station's air supply.",
		"farts for a whole ten seconds.",
		"groans and moans, farting like the world depended on it.",
		"breaks wind!",
		"expels intestinal gas through [user.p_their()] anus.",
		"releases an audible discharge of intestinal gas.",
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
		"farts in [user.p_their()] own mouth. A shameful \the <b>[user]</b>.",
		"breaks wind noisily!",
		"releases gas with the power of the gods! The very station trembles!!",
		"<B><span style='color:red'>f</span><span style='color:blue'>a</span>r<span style='color:red'>t</span><span style='color:blue'>s</span>!</B>",
		"laughs! [user.p_their(TRUE)] breath smells like a fart.",
		"farts, and as such, blob cannot evoulate.",
		"farts. It might have been the Citizen Kane of farts."
	)
	var/new_message = pick(fart_emotes)
	//new_message = replacetext(new_message, "%OWNER", "\the [user]")
	message = new_message
	. = ..()
	if(.)
		playsound(user, pick(GLOB.brap_noises), 50, 1, -1)
		var/delay = 3 SECONDS
		user.fart_cooldown = TRUE
		addtimer(CALLBACK(GLOBAL_PROC, .proc/_fart_renew_msg, user), delay)

/proc/_fart_renew_msg(mob/living/user)
	if(QDELETED(user))
		return
	//to_chat(user, "<span class='notice'>Your ass feels full, again.</span>") //full o shit you mean
	user.fart_cooldown = 0

// Hyperstation Emotes
/datum/emote/living/cackle
	key = "cackle"
	key_third_person = "cackles"
	message = "cackles hysterically!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/cackle/run_emote(mob/user, params, type_override, intentional)
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

/datum/emote/speen/run_emote(mob/user, params, type_override, intentional)
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

/datum/emote/speen/run_emote(mob/user, params, type_override, intentional)
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

/datum/emote/living/bleat/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			return
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bleat.ogg', 50, 1, -1)
	. = ..()

/datum/emote/living/carbon/moan/run_emote(mob/user, params, type_override, intentional) //I can't not port this shit, come on.
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

/datum/emote/living/monkeytwerk
	key = "twerk"
	key_third_person = "twerk"
	message = "shakes it harder than James Russle himself!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = FALSE

/datum/emote/living/monkeytwerk/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	playsound(user, 'modular_splurt/sound/misc/monkey_twerk.ogg', 50, 1)


/datum/emote/living/bruh
	key = "bruh"
	key_third_person = "thinks this is a bruh moment"
	message = "thinks this is a bruh moment"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/bruh/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/bruh.ogg', 50, 1, -1)

/datum/emote/living/bababooey
	key = "bababooey"
	key_third_person = "bababooeys"
	message = "spews bababooey."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/bababooey/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, pick('modular_splurt/sound/voice/bababooey/bababooey.ogg', 'modular_splurt/sound/voice/bababooey/bababooey2.ogg'), 50, 1, -1)

/datum/emote/living/babafooey
	key = "babafooey"
	key_third_person = "babafooeys"
	message = "spews babafooey."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/babafooey/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/bababooey/babafooey.ogg', 50, 1, -1)

/datum/emote/living/fafafooey
	key = "fafafooey"
	key_third_person = "fafafooeys"
	message = "spews fafafooey."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/fafafooey/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, pick('modular_splurt/sound/voice/bababooey/fafafooey.ogg', 'modular_splurt/sound/voice/bababooey/fafafooey2.ogg', 'modular_splurt/sound/voice/bababooey/fafafooey3.ogg'), 50, 1, -1)

/datum/emote/living/fafafoggy
	key = "fafafoggy"
	key_third_person = "fafafoggys"
	message = "spews fafafoggy."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/fafafoggy/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, pick('modular_splurt/sound/voice/bababooey/fafafoggy.ogg', 'modular_splurt/sound/voice/bababooey/fafafoggy2.ogg'), 50, 1, -1)

/datum/emote/living/hohohoy
	key = "hohohoy"
	key_third_person = "hohohoys"
	message = "spews hohohoy."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/hohohoy/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/bababooey/hohohoy.ogg', 50, 1, -1)

/datum/emote/living/ffff
	key = "ffff"
	key_third_person = "ffffs"
	message = "spews something softly."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE

/datum/emote/living/ffff/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)

/datum/emote/living/fafafail
	key = "fafafail"
	key_third_person = "fafafails"
	message = "spews something unintelligible."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/fafafail/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/bababooey/ffff.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/bababooey/ffffhvh.ogg', 50, 1, -1)

/datum/emote/living/boowomp
	key = "boowomp"
	key_third_person = "boowomps"
	message = "produces a sad boowomp."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/boowomp/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/boowomp_muffled.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/boowomp.ogg', 50, 1, -1)

/datum/emote/living/swaos
	key = "swaos"
	key_third_person = "swaos"
	message = "mutters swaos"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/swaos/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	if(user.is_muzzled())
		user.nextsoundemote = world.time + 7
		playsound(user, 'modular_splurt/sound/voice/swaos_muffled.ogg', 50, 1, -1)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/swaos.ogg', 50, 1, -1)

/datum/emote/living/eyebrow2
	key = "eyebrow2"
	key_third_person = "eyebrows2"
	message = "<b>raises an eyebrow.</b>"

/datum/emote/living/eyebrow2/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 60
	playsound(user, 'modular_splurt/sound/voice/vineboom.ogg', 50, 1, -1)

/datum/emote/living/laugh2
	key = "laugh2"
	key_third_person = "laughs2"
	message = "laughs like a king."

/datum/emote/living/laugh2/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/laugh_king.ogg', 50, 1, -1)
