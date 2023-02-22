//Main code edits
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

/datum/emote/living/fart/run_emote(mob/living/user, params, type_override, intentional)
	if(TIMER_COOLDOWN_CHECK(user, COOLDOWN_EMOTE_FART))
		to_chat(user, span_warning("You try your hardest, but no shart comes out."))
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
		TIMER_COOLDOWN_START(user, COOLDOWN_EMOTE_FART, 3 SECONDS)

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

/datum/emote/living/audio_emote/chitter2
	key = "chitter2"
	key_third_person = "chitters2"
	message = "chitters."
	message_mime = "chitters silently!"

/datum/emote/living/audio_emote/chitter2/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(isinsect(C))
			playsound(C, 'modular_splurt/sound/voice/moth/mothchitter2.ogg', 50, 1)

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
	key_third_person = "bruhs"
	message = "thinks this is a bruh moment."
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
	message = "mutters swaos."
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

/datum/emote/living/eyebrow3
	key = "eyebrow3"
	key_third_person = "eyebrows3"
	message = "raises an eyebrow <i>quizzaciously</i>."

/datum/emote/living/eyebrow3/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 60
	playsound(user, 'modular_splurt/sound/voice/moonmen.ogg', 50, 0, 1)

/datum/emote/living/blink2
	key = "blink2"
	key_third_person = "blinks2"
	message = "blinks."

/datum/emote/living/blink2/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/blink.ogg', 50, 1, -1)

/datum/emote/living/laugh2
	key = "laugh2"
	key_third_person = "laughs2"
	message = "laughs like a king."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/laugh2/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/laugh_king.ogg', 50, 1, -1)

/datum/emote/living/laugh3
	key = "laugh3"
	key_third_person = "laughs3"
	message = "laughs silly."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/laugh3/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 70
	playsound(user, 'modular_splurt/sound/voice/lol.ogg', 50, 1, -1)

/datum/emote/living/laugh4
	key = "laugh4"
	key_third_person = "laughs4"
	message = "burst into laughter!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/laugh4/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 70
	playsound(user, 'modular_splurt/sound/voice/laugh_muta.ogg', 50, 1, -1)

/datum/emote/living/laugh5
	key = "laugh5"
	key_third_person = "laughs5"
	message = "laughs in Scottish."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/laugh5/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 70
	playsound(user, 'modular_splurt/sound/voice/laugh_deman.ogg', 50, 1, -1)

/datum/emote/living/laugh6
	key = "laugh6"
	key_third_person = "laughs6"
	message = "laughs like a kettle!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/laugh6/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 70
	playsound(user, 'modular_splurt/sound/voice/laugh6.ogg', 50, 1, -1)

/datum/emote/living/breakbad
	key = "breakbad"
	key_third_person = "breakbads"
	message = "stares intensively with determination."

/datum/emote/living/breakbad/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 60
	playsound(user, 'modular_splurt/sound/voice/breakbad.ogg', 50, 1, -1)

/datum/emote/living/lawyerup
	key = "lawyerup"
	key_third_person = "lawyerups"
	message = "emits an aura of expertise."

/datum/emote/living/lawyerup/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 60
	playsound(user, 'modular_splurt/sound/voice/lawyerup.ogg', 50, 1, -1)

/datum/emote/living/goddamn
	key = "damn"
	key_third_person = "damns"
	message = "is in utter stupor."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE

/datum/emote/living/goddamn/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/god_damn.ogg', 50, 1, -1)

/datum/emote/living/spoonful
	key = "spoonful"
	key_third_person = "spoonfuls"
	message = "asks for a spoonful."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE

/datum/emote/living/spoonful/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/spoonful.ogg', 50, 1, -1)

/datum/emote/living/ohhmygod
	key = "mygod"
	key_third_person = "omgs"
	message = "invokes the presence of Jesus Christ."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE

/datum/emote/living/ohhmygod/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 14
	playsound(user, 'modular_splurt/sound/voice/OMG.ogg', 50, 1, -1)

/datum/emote/living/whatthehell
	key = "wth"
	key_third_person = "wths"
	message = "condemns the abysses of hell!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE

/datum/emote/living/whatthehell/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 40
	playsound(user, 'modular_splurt/sound/voice/WTH.ogg', 50, 1, -1)

/datum/emote/living/fusrodah
	key = "fusrodah"
	key_third_person = "furodahs"
	message = "yells, \"<b>FUS RO DAH!!!</b>\""

/datum/emote/living/fusrodah/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 60
	playsound(user, 'modular_splurt/sound/voice/fusrodah.ogg', 50, 0, 1)

/datum/emote/living/skibidi
	key = "skibidi"
	key_third_person = "skibidis"
	message = "yells, \"<b>Skibidi bop mm dada!</b>\""

/datum/emote/living/skibidi/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 10
	playsound(user, 'modular_splurt/sound/voice/skibidi.ogg', 50, 0, 1)

/datum/emote/living/fbi
	key = "fbi"
	key_third_person = "fbis"
	message = "yells, \"<b>FBI OPEN UP!</b>\""

/datum/emote/living/fbi/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 20
	playsound(user, 'modular_splurt/sound/voice/fbi.ogg', 50, 0, 1)

/datum/emote/living/illuminati
	key = "illuminati"
	key_third_person = "illuminatis"
	message = "exudes a mysterious aura!"

/datum/emote/living/illuminati/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 80
	playsound(user, 'modular_splurt/sound/voice/illuminati.ogg', 50, 0, 1)

/datum/emote/living/bonerif
	key = "bonerif"
	key_third_person = "bonerifs"
	message = "riffs!"

/datum/emote/living/bonerif/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 10
	playsound(user, 'modular_splurt/sound/voice/bonerif.ogg', 50, 0, 1)


/datum/emote/living/cry2
	key = "cry2"
	key_third_person = "crys2"
	message = "cries like a king."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/cry2/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, pick('modular_splurt/sound/voice/cry_king.ogg', 'modular_splurt/sound/voice/cry_king2.ogg'), 50, 1, -1)

/datum/emote/living/choir
	key = "choir"
	key_third_person = "choirs"
	message = "let out a choir!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/choir/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 60
	playsound(user, 'modular_splurt/sound/voice/choir.ogg', 50, 1, -1)

/datum/emote/living/sicko
	key = "sicko"
	key_third_person = "sickos"
	message = "briefly goes sicko mode!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/sicko/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/sicko.ogg', 50, 1, -1)

/datum/emote/living/chill
	key = "chill"
	key_third_person = "chills"
	message = "feels a chill running down their spine..."

/datum/emote/living/chill/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 10
	playsound(user, 'modular_splurt/sound/voice/waterphone.ogg', 50, 1, -1)

/datum/emote/living/weh2
	key = "weh2"
	key_third_person = "wehs2"
	message = "let out a weh!"

/datum/emote/living/weh2/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/weh2.ogg', 50, 1, -1)

/datum/emote/living/weh3
	key = "weh3"
	key_third_person = "wehs3"
	message = "let out a weh!"

/datum/emote/living/weh3/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/weh3.ogg', 50, 1, -1)

/datum/emote/living/weh4
	key = "weh-s"
	key_third_person = "wehs4"
	message = "let out a surprised weh!"

/datum/emote/living/weh4/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_splurt/sound/voice/weh_s.ogg', 50, 1, -1)

/datum/emote/living/mlem
	key = "mlem"
	key_third_person = "mlems"
	message = "sticks their tongue for a moment. Mlem!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/snore/snore2
	key = "snore2"
	key_third_person = "snores2"
	message = "lets out an <b>earthshaking</b> snore"

/datum/emote/living/snore/snore2/run_emote(mob/user, params, type_override, intentional)
	var/datum/dna/D = user.has_dna()
	var/say_mod = (D ? D.species.say_mod : "says")
	var/list/aaauughh = list(
		"lets out an <b>earthshaking</b> snore.",
		"lets out what sounds like a <b>painful</b> snore.",
		"[say_mod], <b>\"AAAAAAUUUUUUGGGHHHHH!!!\"</b>"
	)
	message = pick(aaauughh)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 10
	playsound(user, pick('modular_splurt/sound/voice/aauugghh1.ogg', 'modular_splurt/sound/voice/aauugghh2.ogg'), 40, 1, -1)

/datum/emote/living/pant
	key = "pant"
	key_third_person = "pants"
	message = "pants!"

/datum/emote/living/pant/run_emote(mob/user, params, type_override, intentional)
	var/list/pants = list(
		"pants!",
		"pants like a dog.",
		"lets out soft pants.",
		"pulls [user.p_their()] tongue out, panting."
	)
	message = pick(pants)
	. = ..()

/datum/emote/living/yippee
	key = "yippee"
	key_third_person = "yippees"
	message = "lets out a yippee!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/yippee/run_emote(mob/user, params, type_override, intentional)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 70
	playsound(user, 'modular_splurt/sound/voice/yippee.ogg', 50, 1, -1)

/datum/emote/living/mewo
	key = "mewo"
	key_third_person = "mewos"
	message = "mewos!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/mewo/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 1 SECONDS
	playsound(user, 'modular_splurt/sound/voice/mewo.ogg', 50, 1, -1)

/datum/emote/living/ara_ara
	key = "ara"
	key_third_person = "aras"
	message = "coos with sultry surprise~..."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	var/voicesound = 'modular_splurt/sound/voice/ara-ara.ogg'

/datum/emote/living/ara_ara/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 1.5 SECONDS
	playsound(user, voicesound, 50, 1, -1)

/datum/emote/living/ara_ara/alt
	key = "ara2"
	voicesound = 'modular_splurt/sound/voice/ara-ara2.ogg'

/datum/emote/living/missouri
	key = "missouri"
	key_third_person = "missouris"
	message = "appears to believe %THEYRE in Missouri."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE

/datum/emote/living/missouri/run_emote(mob/user, params, type_override, intentional)
	message = replacetextEx(message, "%THEYRE", user.p_theyre())
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 3 SECONDS
	playsound(user, 'modular_splurt/sound/voice/missouri.ogg', 50, 0, -1)

/datum/emote/living/facemetacarpus
	key = "facehand" // Facepalm was taken
	key_third_person = "facepalms"
	// Message is generated from metacarpus_type below. You shouldn't see this!
	message = "creates an error in the code."
	emote_type = EMOTE_AUDIBLE // Hear a slapping sound
	muzzle_ignore = TRUE // Not a spoken emote
	restraint_check = TRUE // Uses your hands
	mob_type_allowed_typecache = list(/mob/living/carbon) // Don't let borgs do this
	// Defines appendage type for generated message
	var/metacarpus_type = "palm" // Default to hands

/datum/emote/living/facemetacarpus/run_emote(mob/user, params, type_override, intentional)
	// Randomly pick a message using metacarpus_type for hand
	message = pick(list(
			"places [usr.p_their()] [metacarpus_type] across [usr.p_their()] face.",
			"lowers [usr.p_their()] face into [usr.p_their()] [metacarpus_type].",
			"face[metacarpus_type]s",
		))
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 10
	playsound(user, 'modular_splurt/sound/effects/slap.ogg', 50, 1, -1)

/datum/emote/living/facemetacarpus/paw
	key = "facepaw" // For furries
	key_third_person = "facepaws"
	metacarpus_type = "paw"

/datum/emote/living/facemetacarpus/claw
	key = "faceclaw" // For scalies and avians
	key_third_person = "faceclaws"
	metacarpus_type = "claw"

/datum/emote/living/facemetacarpus/hoof
	key = "facehoof" // For horse enthusiasts
	key_third_person = "facehoofs"
	metacarpus_type = "hoof"

/datum/emote/living/poyo
	key = "poyo"
	key_third_person = "poyos"
	message = "%SAYS, \"Poyo!\""
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/poyo/run_emote(mob/user, params, type_override, intentional)
	var/datum/dna/D = user.has_dna()
	var/say_mod = (D ? D.species.say_mod : "says")
	message = replacetextEx(message, "%SAYS", say_mod)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 1 SECONDS
	playsound(user, 'modular_splurt/sound/voice/barks/poyo.ogg', 50, 1, -1)
