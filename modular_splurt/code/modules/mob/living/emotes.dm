/* SPLURT STATION Guide:
To create an emote, create a new /datum/emote/sound/human/ entry.
	Here are the variables you can set:
	- "key" is the command that a person will run to execute your emote.
	- "key_third_person" is another way the command can be run to execute your emote, but in case of third person. (Example: "laugh" & "laughs")
	- "name" is the name that shows up in the emote panel.
	- "message" is the message that gets displayed when your emote is executed.
	- "message_mime" is the message that gets displayed when your emote is executed by a mime.
	- "emote_cooldown" is the cooldown of your emote (in SECONDS).
	- "sound" is the sound file that gets played when your emote is executed.
	- "emote_type" is the type of emote that your emote is.
		EMOTE_AUDIBLE: Your emote will be audible to everyone. (Except deaf people)
		EMOTE_VISIBLE: Your emote will be visible to everyone. (Except people who are blind)
		EMOTE_BOTH: Your emote will be both audible and visible to everyone.
		EMOTE_OMNI: Your emote will be audible to everyone, and visible to everyone who can see the user.
		!!! THESE ARE IMPORTANT. THE EMOTE PANEL USES THESE !!!
	- "restraint_check" is a boolean. If true, the emote will not be able to be used if the user is restrained. Defaults to FALSE.
	- "mob_type_allowed_typecache" is a list of mob types that are allowed to use your emote. Do not use this unless necessary. Defaults to list(/mob/living).
	- "emote_volume" is the volume of your emote. Defaults to 50.
	- "emote_pitch_variance" is a boolean. If true, the emote will have a random pitch. Defaults to FALSE.

To add randomization to your emote, copy and paste this line of code:
	/datum/emote/sound/human/your_emote_name/run_emote(mob/user, params)
		sound = pick('sound1.ogg', 'sound2.ogg', 'sound3.ogg')
		. = ..()
*/


//Main code edits
/datum/emote/living/audio_emote/laugh/run_emote(mob/user, params)
	. = ..()

	// Check parent return
	if(!.)
		return

	// Define carbon user
	var/mob/living/carbon/carbon_user = user

	// Check if carbon user exists
	if(!istype(carbon_user))
		return

	// Check for subraces
	if(ishumanbasic(carbon_user) || iscatperson(carbon_user) || isinsect(carbon_user) || isjellyperson(carbon_user))
		return

	// Define default laugh type
	// Defaults to male
	var/laugh_sound = 'sound/voice/human/manlaugh1.ogg'

	// Check gender
	switch(user.gender)
		// Female
		if(FEMALE)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/womanlaugh.ogg'

		/*
		 * Please add more gendered laughs
		 *
		// Male
		if(MALE)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/laugh_male.ogg'

		// Non-binary
		if(PLURAL)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/laugh_nonbinary.ogg'

		// Object
		if(NEUTER)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/laugh_object.ogg'
		*/

		// Other
		else
			// Set laugh sound
			laugh_sound = pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg')

	// Play laugh sound
	playsound(carbon_user, laugh_sound, 50, 1)


/datum/emote/living/surrender/run_emote(mob/user, params, type_override, intentional)
	// Set message with pronouns
	message = "puts [user.p_their()] hands on [user.p_their()] head and falls to the ground, [user.p_they()] surrender[user.p_s()]!"

	// Return normally
	. = ..()

// SPLURT emotes
/datum/emote/living/tilt
	key = "tilt"
	key_third_person = "tilts"
	message = "tilts their head."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/squint
	key = "squint"
	key_third_person = "squints"
	message = "squints their eyes." // i dumb
	emote_type = EMOTE_VISIBLE

/datum/emote/living/ruffle
	key = "ruffle"
	key_third_person = "ruffles"
	message = "ruffles their wings for a moment."
	restraint_check = TRUE
	emote_type = EMOTE_VISIBLE

/datum/emote/sound/human/fart
	key = "fart"
	key_third_person = "farts"
	message = "farts out shitcode."
	sound = 'modular_splurt/sound/voice/farts/fart.ogg'
	vary = TRUE
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 3 SECONDS

/datum/emote/sound/human/fart/run_emote(mob/user, params, type_override, intentional)
	var/list/fart_emotes = list(
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
	message = pick(fart_emotes)
	sound = pick(GLOB.brap_noises)
	. = ..()

/datum/emote/sound/human/cackle
	key = "cackle"
	key_third_person = "cackles"
	message = "cackles hysterically!"
	message_mime = "cackles silently!"
	sound = 'modular_splurt/sound/voice/cackle_yeen.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.6 SECONDS

/datum/emote/sound/human/speen
	key = "speen"
	key_third_person = "speens"
	message = "speeeeens!"
	message_mime = "speeeeens silently!"
	restraint_check = TRUE
	mob_type_allowed_typecache = list(/mob/living)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)
	sound = 'modular_splurt/sound/voice/speen.ogg'
	// No cooldown var required

/datum/emote/sound/human/speen/run_emote(mob/user, params)
	. = ..()

	// Check parent return
	if(!.)
		return

	// Spin user
	user.spin(20, 1)

	// Check for cyborg
	// Check for buckled mobs
	if(iscyborg(user) && user.has_buckled_mobs())
		// Define cyborg user
		var/mob/living/silicon/robot/user_cyborg = user

		// Define riding datum
		var/datum/component/riding/riding_datum = user_cyborg.GetComponent(/datum/component/riding)

		// Check if riding datum exists
		if(riding_datum)
			// Iterate over buckled mobs
			for(var/mob/buckled_mob in user_cyborg.buckled_mobs)
				// Unbuckle iterated mob
				riding_datum.force_dismount(buckled_mob)

		// Riding datum does not exist
		else
			// Unbuckle all mobs
			user_cyborg.unbuckle_all_mobs()

/datum/emote/sound/human/chirp
	key = "chirp"
	key_third_person = "chirps"
	message = "chirps!"
	message_mime = "chirps silently!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/chirp.ogg'
	emote_cooldown = 0.2 SECONDS

/datum/emote/sound/human/caw
	key = "caw"
	key_third_person = "caws"
	message = "caws!"
	message_mime = "caws silently!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/caw.ogg'
	emote_cooldown = 0.35 SECONDS

/datum/emote/sound/human/mew
	key = "mew"
	key_third_person = "mews"
	message = "mews hysterically!"
	message_mime = "makes a cat face!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/meow_meme.ogg'
	emote_cooldown = 1 SECONDS

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

/datum/emote/sound/human/bleat
	key = "bleat"
	key_third_person = "bleats"
	message = "bleats loudly!"
	message_mime = "bleats silently!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bleat.ogg'
	emote_cooldown = 0.7 SECONDS

// /datum/emote/living/carbon/moan/run_emote(mob/user, params, type_override, intentional) //I can't not port this shit, come on.
// 	if(user.nextsoundemote >= world.time || user.stat != CONSCIOUS)
// 		return
// 	var/sound
// 	var/miming = user.mind ? user.mind.miming : 0
// 	if(!user.is_muzzled() && !miming)
// 		user.nextsoundemote = world.time + 7
// 		sound = pick('modular_splurt/sound/voice/moan_m1.ogg', 'modular_splurt/sound/voice/moan_m2.ogg', 'modular_splurt/sound/voice/moan_m3.ogg')
// 		if(user.gender == FEMALE)
// 			sound = pick('modular_splurt/sound/voice/moan_f1.ogg', 'modular_splurt/sound/voice/moan_f2.ogg', 'modular_splurt/sound/voice/moan_f3.ogg', 'modular_splurt/sound/voice/moan_f4.ogg', 'modular_splurt/sound/voice/moan_f5.ogg', 'modular_splurt/sound/voice/moan_f6.ogg', 'modular_splurt/sound/voice/moan_f7.ogg')
// 		if(isalien(user))
// 			sound = 'sound/voice/hiss6.ogg'
// 		playlewdinteractionsound(user.loc, sound, 50, 1, 4, 1.2)
// 		message = "moans!"
// 	else if(miming)
// 		message = "acts out a moan."
// 	else
// 		message = "makes a very loud noise."
// 	. = ..()

/datum/emote/sound/human/chitter2
	key = "chitter2"
	key_third_person = "chitters2"
	message = "chitters."
	message_mime = "chitters silently!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/moth/mothchitter2.ogg'
	emote_cooldown = 0.3 SECONDS

/datum/emote/sound/human/monkeytwerk
	key = "twerk"
	key_third_person = "twerks"
	message = "shakes it harder than James Russle himself!"
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/misc/monkey_twerk.ogg'
	emote_cooldown = 3.2 SECONDS

/datum/emote/sound/human/bruh
	key = "bruh"
	key_third_person = "bruhs"
	message = "thinks this is a bruh moment."
	message_mime = "silently acknowledges the bruh moment."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bruh.ogg'
	emote_cooldown = 0.6 SECONDS

/datum/emote/sound/human/bababooey
	key = "bababooey"
	key_third_person = "bababooeys"
	message = "spews bababooey."
	message_mime = "spews something silently."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/bababooey.ogg'
	emote_cooldown = 0.9 SECONDS

/datum/emote/sound/human/bababooey/run_emote(mob/user, params)
	// Check if user is muzzled
	if(user.is_muzzled())
		// Set muzzled sound
		sound = 'modular_splurt/sound/voice/bababooey/ffff.ogg'

	// User is not muzzled
	else
		// Set random emote sound
		sound = pick('modular_splurt/sound/voice/bababooey/bababooey.ogg', 'modular_splurt/sound/voice/bababooey/bababooey2.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/babafooey
	key = "babafooey"
	key_third_person = "babafooeys"
	message = "spews babafooey."
	message_mime = "spews something silently."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/babafooey.ogg'
	emote_cooldown = 0.85 SECONDS

/datum/emote/sound/human/fafafooey
	key = "fafafooey"
	key_third_person = "fafafooeys"
	message = "spews fafafooey."
	message_mime = "spews something silently."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/fafafooey.ogg'
	emote_cooldown = 0.7 SECONDS

/datum/emote/sound/human/fafafooey/run_emote(mob/user, params)
	// Check if user is muzzled
	if(user.is_muzzled())
		// Set muzzled sound
		sound = 'modular_splurt/sound/voice/bababooey/ffff.ogg'

	// User is not muzzled
	else
		// Set random emote sound
		sound = pick('modular_splurt/sound/voice/bababooey/fafafooey.ogg', 'modular_splurt/sound/voice/bababooey/fafafooey2.ogg', 'modular_splurt/sound/voice/bababooey/fafafooey3.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/fafafoggy
	key = "fafafoggy"
	key_third_person = "fafafoggys"
	message = "spews fafafoggy."
	message_mime = "spews something silently."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/fafafoggy.ogg'
	emote_cooldown = 0.9 SECONDS

/datum/emote/sound/human/fafafoggy/run_emote(mob/user, params)
	// Check if user is muzzled
	if(user.is_muzzled())
		// Set muzzled sound
		sound = 'modular_splurt/sound/voice/bababooey/ffff.ogg'

	// User is not muzzled
	else
		// Set random emote sound
		sound = pick('modular_splurt/sound/voice/bababooey/fafafoggy.ogg', 'modular_splurt/sound/voice/bababooey/fafafoggy2.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/hohohoy
	key = "hohohoy"
	key_third_person = "hohohoys"
	message = "spews hohohoy."
	message_mime = "spews something silently."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/hohohoy.ogg'
	emote_cooldown = 0.7 SECONDS

/datum/emote/sound/human/ffff
	key = "ffff"
	key_third_person = "ffffs"
	message = "spews something softly."
	message_mime = "spews something silently."
	muzzle_ignore = TRUE
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/ffff.ogg'
	emote_cooldown = 0.85 SECONDS

/datum/emote/sound/human/fafafail
	key = "fafafail"
	key_third_person = "fafafails"
	message = "spews something unintelligible."
	message_mime = "spews something silent."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bababooey/ffffhvh.ogg'
	emote_cooldown = 1.15 SECONDS

/datum/emote/sound/human/boowomp
	key = "boowomp"
	key_third_person = "boowomps"
	message = "produces a sad boowomp."
	message_mime = "produces a silent boowomp."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/boowomp.ogg'
	emote_cooldown = 0.4 SECONDS

/datum/emote/sound/human/swaos
	key = "swaos"
	key_third_person = "swaos"
	message = "mutters swaos."
	message_mime = "imitates swaos."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/swaos.ogg'
	emote_cooldown = 0.7 SECONDS

/datum/emote/sound/human/eyebrow2
	key = "eyebrow2"
	key_third_person = "eyebrows2"
	name = "raise eyebrow"
	message = "<b>raises an eyebrow.</b>"
	message_mime = "<b>raises an eyebrow with quaking force!</b>"
	emote_type = EMOTE_VISIBLE
	sound = 'modular_splurt/sound/voice/vineboom.ogg'
	emote_cooldown = 2.9 SECONDS

/datum/emote/sound/human/eyebrow3
	key = "eyebrow3"
	key_third_person = "eyebrows3"
	name = "eyebrow quizzaciously"
	message = "raises an eyebrow <i>quizzaciously</i>."
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/moonmen.ogg'
	emote_cooldown = 7 SECONDS

/datum/emote/sound/human/blink2
	key = "blink2"
	key_third_person = "blinks2"
	name = "blink expressively"
	message = "blinks."
	message_mime = "blinks expressively."
	emote_type = EMOTE_VISIBLE
	sound = 'modular_splurt/sound/voice/blink.ogg'
	emote_cooldown = 0.25 SECONDS

/datum/emote/sound/human/laugh2
	key = "laugh2"
	key_third_person = "laughs2"
	name = "king laugh"
	message = "laughs like a king."
	message_mime = "acts out laughing like a king."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/laugh_king.ogg'
	// No cooldown var required

/datum/emote/sound/human/laugh3
	key = "laugh3"
	key_third_person = "laughs3"
	name = "silly laugh"
	message = "laughs silly."
	message_mime = "acts out laughing silly."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/lol.ogg'
	emote_cooldown = 6.1 SECONDS

/datum/emote/sound/human/laugh4
	key = "laugh4"
	key_third_person = "laughs4"
	name = "burst laughter"
	message = "burst into laughter!"
	message_mime = "acts out bursting into laughter."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/laugh_muta.ogg'
	emote_cooldown = 3 SECONDS

/datum/emote/sound/human/laugh5
	key = "laugh5"
	key_third_person = "laughs5"
	name = "scottish laugh"
	message = "laughs in Scottish."
	message_mime = "acts out laughing in Scottish."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/laugh_deman.ogg'
	emote_cooldown = 2.75 SECONDS

/datum/emote/sound/human/laugh6
	key = "laugh6"
	key_third_person = "laughs6"
	name = "kettle laugh"
	message = "laughs like a kettle!"
	message_mime = "acts out laughing like a kettle."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/laugh6.ogg'
	emote_cooldown = 4.45 SECONDS

/datum/emote/sound/human/breakbad
	key = "breakbad"
	key_third_person = "breakbads"
	message = "stares intensively with determination."
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/breakbad.ogg'
	emote_cooldown = 6.4 SECONDS

/datum/emote/sound/human/lawyerup
	key = "lawyerup"
	key_third_person = "lawyerups"
	name = "aura expertise"
	message = "emits an aura of expertise."
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/lawyerup.ogg'
	emote_cooldown = 7.5 SECONDS

/datum/emote/sound/human/goddamn
	key = "damn"
	key_third_person = "damns"
	name = "gah damn"
	message = "is in utter stupor."
	message_mime = "appears to be in utter stupor."
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/god_damn.ogg'
	emote_cooldown = 1.25 SECONDS

/datum/emote/sound/human/spoonful
	key = "spoonful"
	key_third_person = "spoonfuls"
	message = "asks for a spoonful."
	message_mime = "pretends to ask for a spoonful."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/spoonful.ogg'
	// No cooldown var required

/datum/emote/sound/human/ohhmygod
	key = "mygod"
	key_third_person = "omgs"
	name = "oooh my god"
	message = "invokes the presence of Jesus Christ."
	message_mime = "invokes the presence of Jesus Christ through silent prayer."
	emote_type = EMOTE_OMNI
	sound = 'modular_splurt/sound/voice/OMG.ogg'
	emote_cooldown = 1.6 SECONDS

/datum/emote/sound/human/whatthehell
	key = "wth"
	key_third_person = "wths"
	name = "whut the heeell"
	message = "condemns the abysses of hell!"
	message_mime = "silently condemns the abysses of hell!"
	emote_type = EMOTE_OMNI
	sound = 'modular_splurt/sound/voice/WTH.ogg'
	emote_cooldown = 4.4 SECONDS

/datum/emote/sound/human/fusrodah
	key = "fusrodah"
	key_third_person = "furodahs"
	message = "yells, \"<b>FUS RO DAH!!!</b>\""
	message_mime = "acts out a dragon shout."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/fusrodah.ogg'
	emote_cooldown = 7 SECONDS

/datum/emote/sound/human/skibidi
	key = "skibidi"
	key_third_person = "skibidis"
	name = "skibidi bop mm dada"
	message = "yells, \"<b>Skibidi bop mm dada!</b>\""
	message_mime = "makes incoherent mouth motions."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/skibidi.ogg'
	emote_cooldown = 1.1 SECONDS

/datum/emote/sound/human/fbi
	key = "fbi"
	key_third_person = "fbis"
	message = "yells, \"<b>FBI OPEN UP!</b>\""
	message_mime = "acts out being the FBI."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/fbi.ogg'
	emote_cooldown = 2 SECONDS

/datum/emote/sound/human/illuminati
	key = "illuminati"
	key_third_person = "illuminatis"
	message = "exudes a mysterious aura!"
	emote_type = EMOTE_OMNI
	sound = 'modular_splurt/sound/voice/illuminati.ogg'
	emote_cooldown = 7.8 SECONDS

/datum/emote/sound/human/bonerif
	key = "bonerif"
	key_third_person = "bonerifs"
	message = "riffs!"
	message_mime = "riffs silently!"
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE
	sound = 'modular_splurt/sound/voice/bonerif.ogg'
	emote_cooldown = 2 SECONDS

/datum/emote/sound/human/cry2
	key = "cry2"
	key_third_person = "cries2"
	name = "king cry"
	message = "cries like a king."
	message_mime = "acts out crying like a king."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/cry_king.ogg'
	emote_cooldown = 1.6 SECONDS // Uses longest sound's time

/datum/emote/sound/human/cry2/run_emote(mob/user, params)
	// Set random emote sound
	sound = pick('modular_splurt/sound/voice/cry_king.ogg', 'modular_splurt/sound/voice/cry_king2.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/choir
	key = "choir"
	key_third_person = "choirs"
	message = "let out a choir!"
	message_mime = "acts out a choir."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/choir.ogg'
	emote_cooldown = 6 SECONDS

/datum/emote/sound/human/agony
	key = "agony"
	key_third_person = "agonys"
	message = "let out a choir of agony!"
	message_mime = "is visibly in agony."
	emote_type = EMOTE_OMNI
	sound = 'modular_splurt/sound/voice/agony.ogg'
	emote_cooldown = 7 SECONDS

/datum/emote/sound/human/wtune
	key = "whistletune"
	key_third_person = "whistletunes"
	message = "whistles a tune."
	message_mime = "makes an expression as if whistling."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/wtune1.ogg'
	emote_cooldown = 4.55 SECONDS // Uses longest sound's time.

/datum/emote/sound/human/wtune/run_emote(mob/user, params)
	// Set random emote sound
	sound = pick('modular_splurt/sound/voice/wtune1.ogg', 'modular_splurt/sound/voice/wtune2.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/fiufiu
	key = "wolfwhistle"
	key_third_person = "wolfwhistles"
	message = "wolf-whistles!" // i am not creative
	message_param = "audibly approves %t's appearance."
	message_mime = "makes an expression as if <i>inappropriately</i> whistling."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/wolfwhistle.ogg'
	emote_cooldown = 0.78 SECONDS

/datum/emote/sound/human/terror
	key = "terror"
	key_third_person = "terrors"
	name = "dreadful tune"
	message = "whistles some dreadful tune..."
	message_mime = "stares with aura full of dread..."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/terror1.ogg'
	emote_cooldown = 13.07 SECONDS // Uses longest sound's time.

/datum/emote/sound/human/terror/run_emote(mob/user, params)
	// Set random emote sound
	sound = pick('modular_splurt/sound/voice/terror1.ogg', 'modular_splurt/sound/voice/terror2.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/deathglare
	key = "glare2"
	key_third_person = "glares2"
	message = "<b><i>glares</b></i>."
	message_param = "<b><i>glares</b></i> at %t."
	emote_type = EMOTE_VISIBLE
	sound = 'modular_splurt/sound/voice/deathglare.ogg'
	emote_cooldown = 4.4 SECONDS

/datum/emote/sound/human/sicko
	key = "sicko"
	key_third_person = "sickos"
	message = "briefly goes sicko mode!"
	message_mime = "briefly imitates sicko mode!"
	sound = 'modular_splurt/sound/voice/sicko.ogg'
	emote_cooldown = 0.8 SECONDS

/datum/emote/sound/human/chill
	key = "chill"
	key_third_person = "chills"
	message = "feels a chill running down their spine..."
	message_mime = "acts out a chill running down their spine..."
	emote_type = EMOTE_VISIBLE
	sound = 'modular_splurt/sound/voice/waterphone.ogg'
	emote_cooldown = 3.4 SECONDS

/datum/emote/sound/human/taunt
	key = "tt"
	key_third_person = "taunts"
	name = "strike pose"
	message = "strikes a pose!"
	message_param = "taunts %t!"
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE
	sound = 'modular_splurt/sound/voice/phillyhit.ogg'

/datum/emote/sound/human/taunt/alt
	key = "tt2"
	key_third_person = "taunts2"
	name = "strike pose 2"
	emote_volume = 100
	sound = 'modular_splurt/sound/voice/orchestrahit.ogg'

/datum/emote/sound/human/weh2
	key = "weh2"
	key_third_person = "wehs2"
	name = "weh 2"
	message = "let out a weh!"
	message_mime = "acts out a weh!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/weh2.ogg'
	emote_cooldown = 0.25 SECONDS

/datum/emote/sound/human/weh3
	key = "weh3"
	key_third_person = "wehs3"
	name = "weh 3"
	message = "let out a weh!"
	message_mime = "acts out a weh!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/weh3.ogg'
	emote_cooldown = 0.25 SECONDS

/datum/emote/sound/human/weh4
	key = "weh4"
	key_third_person = "wehs4"
	name = "surprised weh"
	message = "let out a surprised weh!"
	message_mime = "acts out a surprised weh!"
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/weh_s.ogg'
	emote_cooldown = 0.35 SECONDS

/datum/emote/sound/human/waa
	key = "waa"
	key_third_person = "waas"
	message = "let out a waa!"
	message_mime = "acts out a waa!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/waa.ogg'
	emote_cooldown = 3.5 SECONDS

/datum/emote/sound/human/bark2
	key = "bark2"
	key_third_person = "barks2"
	name = "bark 2"
	message = "barks!"
	message_mime = "acts out a bark!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bark_alt.ogg'
	emote_cooldown = 0.35 SECONDS

/datum/emote/sound/human/yap
	key = "yap"
	key_third_person = "yaps"
	message = "yaps!"
	message_mime = "acts out a yap!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/yap.ogg'
	emote_cooldown = 0.28 SECONDS

/datum/emote/sound/human/yip
	key = "yip"
	key_third_person = "yips"
	message = "yips!"
	message_mime = "acts out a yip!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/yip.ogg'
	emote_cooldown = 0.2 SECONDS

/datum/emote/sound/human/bork
	key = "bork"
	key_third_person = "borks"
	message = "borks!"
	message_mime = "acts out a bork!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bork.ogg'
	emote_cooldown = 0.4 SECONDS

/datum/emote/sound/human/woof
	key = "woof"
	key_third_person = "woofs"
	message = "woofs!"
	message_mime = "acts out a woof!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/woof.ogg'
	emote_cooldown = 0.71 SECONDS

/datum/emote/sound/human/woof/alt
	key = "woof2"
	key_third_person = "woofs2"
	name = "woof 2"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/woof2.ogg'
	emote_cooldown = 0.3 SECONDS

/datum/emote/sound/human/howl
	key = "howl"
	key_third_person = "howls"
	message = "howls!"
	message_mime = "acts out a howl!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/wolfhowl.ogg'
	emote_cooldown = 2.04 SECONDS

/datum/emote/sound/human/coyhowl
	key = "coyhowl"
	key_third_person = "coyhowls"
	name = "coyote howl"
	message = "howls like coyote!"
	message_mime = "acts out a coyote's howl!"
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/coyotehowl.ogg'
	emote_cooldown = 2.94 SECONDS // Uses longest sound's time

/datum/emote/sound/human/coyhowl/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/coyotehowl.ogg', 'modular_splurt/sound/voice/coyotehowl2.ogg', 'modular_splurt/sound/voice/coyotehowl3.ogg', 'modular_splurt/sound/voice/coyotehowl4.ogg', 'modular_splurt/sound/voice/coyotehowl5.ogg')
	. = ..()

/datum/emote/living/mlem
	key = "mlem"
	key_third_person = "mlems"
	message = "sticks their tongue for a moment. Mlem!"
	emote_type = EMOTE_VISIBLE

/datum/emote/sound/human/snore/snore2
	key = "snore2"
	key_third_person = "snores2"
	name = "earthshaking snore"
	message = "lets out an <b>earthshaking</b> snore"
	message_mime = "lets out an <b>inaudible</b> snore!"
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/aauugghh1.ogg'
	emote_cooldown = 2.1 SECONDS

/datum/emote/sound/human/snore/snore2/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	var/say_mod = (D ? D.species.say_mod : "says")
	var/list/aaauughh = list(
		"lets out an <b>earthshaking</b> snore.",
		"lets out what sounds like a <b>painful</b> snore.",
		"[say_mod], <b>\"AAAAAAUUUUUUGGGHHHHH!!!\"</b>"
	)
	message = pick(aaauughh)

	// Set random emote sound
	sound = pick('modular_splurt/sound/voice/aauugghh1.ogg', 'modular_splurt/sound/voice/aauugghh2.ogg')

	// Return normally
	. = ..()

/datum/emote/living/pant
	key = "pant"
	key_third_person = "pants"
	emote_type = EMOTE_VISIBLE
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

/datum/emote/sound/human/yippee
	key = "yippee"
	key_third_person = "yippees"
	message = "lets out a yippee!"
	message_mime = "acts out a yippee!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/yippee.ogg'
	emote_cooldown = 1.2 SECONDS

/datum/emote/sound/human/mewo
	key = "mewo"
	key_third_person = "mewos"
	message = "mewos!"
	message_mime = "mewos silently!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/mewo.ogg'
	emote_cooldown = 0.7 SECONDS

/datum/emote/sound/human/ara_ara
	key = "ara"
	key_third_person = "aras"
	name = "ara ara"
	message = "coos with sultry surprise~..."
	message_mime = "exudes a sultry aura~"
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/ara-ara.ogg'
	emote_cooldown = 1.25 SECONDS

/datum/emote/sound/human/ara_ara/alt
	key = "ara2"
	name = "ara ara 2"
	sound = 'modular_splurt/sound/voice/ara-ara2.ogg'
	emote_cooldown = 1.3 SECONDS

/datum/emote/sound/human/missouri
	key = "missouri"
	key_third_person = "missouris"
	message = "has relocated to Missouri."
	message_mime = "starts thinking about Missouri."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/missouri.ogg'
	emote_cooldown = 3.4 SECONDS

/datum/emote/sound/human/missouri/run_emote(mob/user, params)
	// Set message pronouns
	message = "appears to believe [user.p_theyre()] in Missouri."

	// Return normally
	. = ..()

/datum/emote/sound/human/facemetacarpus
	key = "facehand" // Facepalm was taken
	key_third_person = "facepalms"
	// Message is generated from metacarpus_type below. You shouldn't see this!
	message = "creates an error in the code." // Hear a slapping sound
	muzzle_ignore = TRUE // Not a spoken emote
	restraint_check = TRUE // Uses your hands
	sound = 'modular_splurt/sound/effects/slap.ogg'
	// Defines appendage type for generated message
	var/metacarpus_type = "palm" // Default to hands
	emote_cooldown = 0.25 SECONDS

/datum/emote/sound/human/facemetacarpus/run_emote(mob/user, params)
	// Randomly pick a message using metacarpus_type for hand
	message = pick(list(
			"places [usr.p_their()] [metacarpus_type] across [usr.p_their()] face.",
			"lowers [usr.p_their()] face into [usr.p_their()] [metacarpus_type].",
			"face[metacarpus_type]s",
		))

	// Return normally
	. = ..()

/datum/emote/sound/human/facemetacarpus/paw
	key = "facepaw" // For furries
	key_third_person = "facepaws"
	metacarpus_type = "paw"

/datum/emote/sound/human/facemetacarpus/claw
	key = "faceclaw" // For scalies and avians
	key_third_person = "faceclaws"
	metacarpus_type = "claw"

/datum/emote/sound/human/facemetacarpus/wing
	key = "facewing" // For avians, harpies or just anyone with wings
	key_third_person = "facewings"
	metacarpus_type = "wing"

/datum/emote/sound/human/facemetacarpus/hoof
	key = "facehoof" // For horse enthusiasts
	key_third_person = "facehoofs"
	metacarpus_type = "hoof"

/datum/emote/sound/human/poyo
	key = "poyo"
	key_third_person = "poyos"
	message = "%SAYS, \"Poyo!\""
	message_mime = "acts out an excited motion!"
	sound = 'modular_splurt/sound/voice/barks/poyo.ogg'
	// No cooldown var required

/datum/emote/sound/human/poyo/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	var/say_mod = (D ? D.species.say_mod : "says")
	message = replacetextEx(message, "%SAYS", say_mod)

	// Return normally
	. = ..()


/datum/emote/sound/human/rizz
	key = "rizz"
	key_third_person = "rizzes"
	name = "THE LOOK"
	message = "gives <b>\[<u><i>The Look</i></u>\]</b>."
	message_param = "looks at %t with bedroom eyes."
	message_mime = "makes bedroom eyes."
	emote_type = EMOTE_VISIBLE
	sound = 'modular_splurt/sound/voice/rizz.ogg'
	emote_cooldown = 1.43 SECONDS

/datum/emote/sound/human/buff
	key = "buff"
	key_third_person = "buffs"
	name = "show muscles"
	message = "shows off their muscles."
	message_param = "shows off their muscles to %t."
	emote_type = EMOTE_VISIBLE
	sound = 'modular_splurt/sound/voice/buff.ogg'
	emote_cooldown = 4.77 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/sound/human/merowr
	key = "merowr"
	key_third_person = "merowrs"
	message = "merowrs!"
	message_mime = "acts out a merowr!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/merowr.ogg'
	emote_cooldown = 1.2 SECONDS

/datum/emote/sound/human/hoot
	key = "hoot"
	key_third_person = "hoots"
	message = "hoots!"
	message_mime = "acts out a hoot!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/hoot.ogg'
	emote_cooldown = 2.4 SECONDS

/datum/emote/sound/human/wurble
	key = "wurble"
	key_third_person = "wurbles"
	message = "wurbles!"
	message_mime = "acts out a wurbling!"
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/wurble.ogg'
	emote_cooldown = 2.3 SECONDS

/datum/emote/sound/human/warble
	key = "warble"
	key_third_person = "warbles"
	message = "warbles!"
	message_mime = "acts out a warbling!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/warble.ogg'
	emote_cooldown = 0.4 SECONDS

//Teshari took *trill
/datum/emote/sound/human/trill2
	key = "trill2"
	key_third_person = "trills2"
	name = "trill"
	message = "trills!"
	message_mime = "acts out a trilling!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/trill.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/rattlesnek
	key = "rattle"
	key_third_person = "rattles"
	message = "rattles!"
	message_mime = "acts like a rattling snake."
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/rattle.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/sound/human/rpurr
	key = "rpurr"
	key_third_person = "rpurrs"
	name = "raptor purr"
	message = "purrs like raptor!"
	message_mime = "acts like a purring raptor."
	emote_type = EMOTE_BOTH
	sound = 'modular_splurt/sound/voice/raptor_purr.ogg'
	emote_cooldown = 1.5 SECONDS

/datum/emote/sound/human/bawk
	key = "bawk"
	key_third_person = "bawks"
	message = "bawks!"
	message_mime = "acts like a bawking chicken."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/bawk.ogg'
	emote_cooldown = 0.5 SECONDS

/datum/emote/sound/human/moo
	key = "moo"
	key_third_person = "moos"
	message = "moos!"
	message_mime = "acts like a mooing cow."
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/moo.ogg'
	emote_cooldown = 1.7 SECONDS

/datum/emote/sound/human/coo
	key = "coo"
	key_third_person = "coos"
	message = "coos."
	message_mime = "acts like a cooing pidgeon."
	emote_volume = 30
	sound = 'modular_splurt/sound/voice/coo.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.78 SECONDS

/datum/emote/sound/human/untitledgoose
	key = "goosehonk"
	key_third_person = "goosehonks"
	name = "goose honk"
	message = "honks!"
	message_mime = "looks like a duck from hell!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/goosehonk/sfx_goose_honk_b_01.ogg'
	emote_cooldown = 0.8 SECONDS

/datum/emote/sound/human/untitledgoose/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/goosehonk/sfx_goose_honk_b_01.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_goose_honk_b_02.ogg','modular_splurt/sound/voice/goosehonk/sfx_goose_honk_b_03.ogg','modular_splurt/sound/voice/goosehonk/sfx_goose_honk_b_06.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_02.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_03.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_04.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_06.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_07.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_08.ogg', 'modular_splurt/sound/voice/goosehonk/sfx_gooseB_honk_09.ogg')
	. = ..()

/datum/emote/sound/human/scream2
	key = "scream2"
	key_third_person = "screams2"
	name = "silly scream"
	message = "screams!"
	message_mime = "acts out a rather silly scream!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/cscream1.ogg'
	emote_cooldown = 3.3 SECONDS // Uses longest sound's time.
	emote_pitch_variance = FALSE

/datum/emote/sound/human/scream2/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/cscream1.ogg', 'modular_splurt/sound/voice/cscream2.ogg', 'modular_splurt/sound/voice/cscream3.ogg', 'modular_splurt/sound/voice/cscream4.ogg', 'modular_splurt/sound/voice/cscream5.ogg', 'modular_splurt/sound/voice/cscream6.ogg', 'modular_splurt/sound/voice/cscream7.ogg', 'modular_splurt/sound/voice/cscream8.ogg', 'modular_splurt/sound/voice/cscream9.ogg', 'modular_splurt/sound/voice/cscream10.ogg', 'modular_splurt/sound/voice/cscream11.ogg', 'modular_splurt/sound/voice/cscream12.ogg')
	. = ..()

// Here comes gachimuchi
/datum/emote/sound/human/scream3
	key = "scream3"
	key_third_person = "screams3"
	name = "gachi scream"
	message = "screams manly!"
	message_mime = "acts out a rather manly scream!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/gachi/scream1.ogg'
	emote_cooldown = 4.64 SECONDS // Uses longest sound's time.

/datum/emote/sound/human/scream3/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/gachi/scream1.ogg', 'modular_splurt/sound/voice/gachi/scream2.ogg', 'modular_splurt/sound/voice/gachi/scream3.ogg', 'modular_splurt/sound/voice/gachi/scream4.ogg')
	. = ..()

/datum/emote/sound/human/moan2
	key = "moan2"
	key_third_person = "moans2"
	name = "gachi moan"
	message = "moans somewhat manly!"
	message_mime = "acts out a rather manly moan!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/gachi/moan1.ogg'
	emote_cooldown = 2.7 SECONDS // Uses longest sound's time.

/datum/emote/sound/human/moan2/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/gachi/moan1.ogg', 'modular_splurt/sound/voice/gachi/moan2.ogg', 'modular_splurt/sound/voice/gachi/moan3.ogg', 'modular_splurt/sound/voice/gachi/moan4.ogg')
	. = ..()

/datum/emote/sound/human/woop
	key = "woop"
	key_third_person = "woops"
	name = "gachi woop"
	message = "woops!"
	message_mime = "silently woops!"
	sound = 'modular_splurt/sound/voice/gachi/woop.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_volume = 35
	emote_cooldown = 0.4 SECONDS

/datum/emote/sound/human/whatthehell/right
	key = "wth2"
	key_third_person = "wths2"
	name = "gachi what the hell"
	sound = 'modular_splurt/sound/voice/gachi/wth2.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_volume = 100
	emote_cooldown = 1.0 SECONDS

/datum/emote/sound/human/pardon
	key = "sorry"
	key_third_person = "sorrys"
	name = "gachi sorry"
	message = "exclaims, \"Oh shit, I am sorry!\""
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/gachi/sorry.ogg'
	emote_cooldown = 1.3 SECONDS

/datum/emote/sound/human/pardonfor
	key = "sorryfor"
	key_third_person = "sorrysfor"
	name = "gachi for what?"
	message = "asks, \"Sorry for what?\""
	sound = 'modular_splurt/sound/voice/gachi/sorryfor.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.9 SECONDS

/datum/emote/sound/human/fock
	key = "fuckyou"
	key_third_person = "fuckyous"
	name = "gachi fuck you"
	message = "curses someone!"
	message_param = "curses %t!"
	message_mime = "silently curses someone!"
	sound = 'modular_splurt/sound/voice/gachi/fockyou1.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.18 SECONDS // Uses longest sound's time.

/datum/emote/sound/human/fock/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/gachi/fockyou1.ogg', 'modular_splurt/sound/voice/gachi/fockyou2.ogg')
	. = ..()

/datum/emote/sound/human/letsgo
	key = "go"
	key_third_person = "goes"
	name = "gachi come on"
	message = "yells, \"Come on, lets go!\""
	message_mime = "motions moving forward!"
	sound = 'modular_splurt/sound/voice/gachi/go.ogg'
	emote_type = EMOTE_BOTH
	emote_cooldown = 1.6 SECONDS

/datum/emote/sound/human/chuckle2
	key = "chuckle2"
	key_third_person = "chuckles2"
	name = "gachi chuckle"
	message = "chuckles."
	message_mime = "chuckles silently."
	sound = 'modular_splurt/sound/voice/gachi/chuckle.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.01 SECONDS

/datum/emote/sound/human/fockslaves
	key = "slaves"
	key_third_person = "slaves"
	name = "gachi slaves"
	message = "curses slaves!"
	message_mime = "silently curses slaves!"
	sound = 'modular_splurt/sound/voice/gachi/fokensleves.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.2 SECONDS

/datum/emote/sound/human/getbuttback
	key = "assback"
	key_third_person = "assbacks"
	name = "gachi ass back"
	message = "demands someone's ass to get back here!"
	message_param = "demands %t's ass to get back here!"
	message_mime = "motions for someone's ass to get back here!"
	sound = 'modular_splurt/sound/voice/gachi/assback.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.9 SECONDS

/datum/emote/sound/human/boss
	key = "boss"
	key_third_person = "boss"
	name = "gachi boss of this gym"
	message = "seeks the boss of this place!"
	message_mime = "stares at the potential boss of this place!"
	sound = 'modular_splurt/sound/voice/gachi/boss.ogg'
	emote_type = EMOTE_VISIBLE
	emote_cooldown = 1.68 SECONDS

/datum/emote/sound/human/attention
	key = "attention"
	key_third_person = "attentions"
	name = "atteeention"
	message = "demands an attention!"
	message_mime = "seems to be looking for an attention."
	emote_volume = 100
	sound = 'modular_splurt/sound/voice/gachi/attention.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.36 SECONDS

/datum/emote/sound/human/ah
	key = "ah"
	key_third_person = "ahs"
	name = "gachi ah"
	message = "ahs!"
	message_mime = "ahs silently!"
	sound = 'modular_splurt/sound/voice/gachi/ah.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.67 SECONDS
	emote_volume = 25

/datum/emote/sound/human/boolets
	key = "ammo"
	key_third_person = "ammos"
	name = "more boolets"
	message = "is requesting ammo!"
	message_mime = "seem to ask for ammo!"
	sound = 'modular_splurt/sound/voice/gachi/boolets.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.1 SECONDS // Uses longest sound's time.
	emote_volume = 10

/datum/emote/sound/human/boolets/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/gachi/boolets.ogg', 'modular_splurt/sound/voice/gachi/boolets2.ogg')
	. = ..()

/datum/emote/sound/human/wepon
	key = "wepon"
	key_third_person = "wepons"
	name = "bigger wepons"
	message = "is requesting bigger weapons!"
	message_mime = "seem to ask for weapons!"
	sound = 'modular_splurt/sound/voice/gachi/wepons.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.07 SECONDS
	emote_volume = 10

/datum/emote/sound/human/sciteam
	key = "sciteam"
	key_third_person = "sciteams"
	name = "Science Team"
	message = "exclaims, \"I am with the <b>Science</b> team!\""
	message_mime = "gestures being with the Science team!"
	sound = 'modular_splurt/sound/voice/sciteam.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1.32 SECONDS
	emote_volume = 90

/datum/emote/sound/human/ambatukam
	key = "ambatukam"
	key_third_person = "ambatukams"
	message = "is about to come!"
	message_mime = "seems like about to come!"
	sound = 'modular_splurt/sound/voice/ambatukam.ogg'
	emote_type = EMOTE_BOTH
	emote_cooldown = 2.75 SECONDS
	//emote_volume = 30

/datum/emote/sound/human/ambatukam2
	key = "ambatukam2"
	key_third_person = "ambatukams2"
	name = "ambatukam 2"
	message = "is about to come in harmony!"
	message_mime = "seems like about to come in harmony!"
	sound = 'modular_splurt/sound/voice/ambatukam_harmony.ogg'
	emote_type = EMOTE_BOTH
	emote_cooldown = 3.42 SECONDS
	//emote_volume = 60

/datum/emote/sound/human/eekum
	key = "eekumbokum"
	key_third_person = "eekumbokums"
	message = "eekum-bokums!"
	message_mime = "seem to eekum-bokum!"
	sound = 'modular_splurt/sound/voice/eekum-bokum.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.9 SECONDS // Uses longest sound's time.

/datum/emote/sound/human/eekum/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE) // Game's SFX
			sound = 'modular_splurt/sound/voice/eekum-bokum.ogg'
		if(FEMALE) // Korone's
			sound = pick('modular_splurt/sound/voice/eekum-bokum_f1.ogg', 'modular_splurt/sound/voice/eekum-bokum_f2.ogg')
		else // Both
			sound = pick('modular_splurt/sound/voice/eekum-bokum.ogg', 'modular_splurt/sound/voice/eekum-bokum_f1.ogg', 'modular_splurt/sound/voice/eekum-bokum_f2.ogg')
	. = ..()

/datum/emote/sound/human/bazinga
	key = "bazinga"
	key_third_person = "bazingas"
	message = "exclaims, \"<i>Bazinga!</i>\""
	message_mime = "fools someone, silently."
	sound = 'modular_splurt/sound/voice/bazinga.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.65 SECONDS

/datum/emote/sound/human/bazinga/run_emote(mob/user, params)
	if(prob(1)) // If Empah had TTS #25
		sound = 'modular_splurt/sound/voice/bazinga_ebil.ogg'
		emote_pitch_variance = FALSE
		emote_cooldown = 1.92 SECONDS
		emote_volume = 110
	else
		sound = 'modular_splurt/sound/voice/bazinga.ogg'
		emote_pitch_variance = TRUE
		emote_cooldown = 0.65 SECONDS
		emote_volume = 50
	. = ..()

/datum/emote/sound/human/yooo
	key = "yooo"
	key_third_person = "yooos"
	message = "thinks they are part of Kabuki play."
	sound = 'modular_splurt/sound/voice/yooo.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 2.54 SECONDS

/datum/emote/sound/human/buzzer_correct
	key = "correct"
	key_third_person = "corrects"
	message = "thinks someone is correct."
	message_param = "thinks %t is correct."
	sound = 'modular_splurt/sound/voice/buzzer_correct.ogg'
	emote_type = EMOTE_OMNI
	emote_cooldown = 0.84 SECONDS

/datum/emote/sound/human/buzzer_incorrect
	key = "incorrect"
	key_third_person = "incorrects"
	message = "thinks someone is incorrect."
	message_param = "thinks %t is incorrect."
	sound = 'modular_splurt/sound/voice/buzzer_incorrect.ogg'
	emote_type = EMOTE_OMNI
	emote_cooldown = 1.21 SECONDS

/datum/emote/sound/human/ace/
	key = "objection0"
	key_third_person = "objects0"
	name = "OBJECTION!!"
	message = "<b><i>\<\< OBJECTION!! \>\></i></b>"
	message_param = "<b><i>\<\< %t \>\></i></b>" // Allows for custom objections, but alas only in lowercase.
	message_mime = "points their finger with determination!"
	sound = 'modular_splurt/sound/voice/ace/ace_objection_generic.ogg'
	emote_type = EMOTE_OMNI
	emote_cooldown = 6.0 SECONDS // This is regardless of sound's length.
	emote_volume = 30

/datum/emote/sound/human/ace/objection
	key = "objection"
	key_third_person = "objects"
	name = "Objection!"
	sound = 'modular_splurt/sound/voice/ace/ace_objection_m1.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_pitch_variance = FALSE // IT BREAKS THESE SOMEHOW

/datum/emote/sound/human/ace/objection/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE)
			sound = pick('modular_splurt/sound/voice/ace/ace_objection_m1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m2.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m3.ogg')
		if(FEMALE)
			sound = pick('modular_splurt/sound/voice/ace/ace_objection_f1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_f2.ogg')
		else // Both because I am lazy.
			sound = pick('modular_splurt/sound/voice/ace/ace_objection_m1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m2.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m3.ogg', 'modular_splurt/sound/voice/ace/ace_objection_f1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_f2.ogg')
	. = ..()

/datum/emote/sound/human/ace/hold_it
	key = "holdit"
	key_third_person = "holdsit"
	name = "HOLD IT!!"
	message = "<b><i>\<\< HOLD IT!! \>\></i></b>"
	sound = 'modular_splurt/sound/voice/ace/ace_holdit_m1.ogg'
	emote_type = EMOTE_OMNI
	emote_pitch_variance = FALSE // IT BREAKS THESE SOMEHOW

/datum/emote/sound/human/ace/hold_it/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE)
			sound = pick('modular_splurt/sound/voice/ace/ace_holdit_m1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m2.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m3.ogg')
		if(FEMALE)
			sound = pick('modular_splurt/sound/voice/ace/ace_holdit_f1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_f2.ogg')
		else // Both because I am lazy.
			sound = pick('modular_splurt/sound/voice/ace/ace_holdit_m1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m2.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m3.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_f1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_f2.ogg')
	. = ..()

/datum/emote/sound/human/ace/take_that
	key = "takethat"
	key_third_person = "takesthat"
	name = "TAKE THAT!!"
	message = "<b><i>\<\< TAKE THAT!! \>\></i></b>"
	sound = 'modular_splurt/sound/voice/ace/ace_takethat_m1.ogg'
	emote_type = EMOTE_OMNI
	emote_pitch_variance = FALSE // IT BREAKS THESE SOMEHOW

/datum/emote/sound/human/ace/take_that/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE)
			sound = pick('modular_splurt/sound/voice/ace/ace_takethat_m1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m2.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m3.ogg')
		if(FEMALE)
			sound = pick('modular_splurt/sound/voice/ace/ace_takethat_f1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_f2.ogg')
		else // Both because I am lazy.
			sound = pick('modular_splurt/sound/voice/ace/ace_takethat_m1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m2.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m3.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_f1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_f2.ogg')
	. = ..()

/datum/emote/sound/human/realize
	key = "realize"
	key_third_person = "realizes"
	message = "realizes something."
	sound = 'modular_splurt/sound/voice/ace/ace_realize.ogg'
	emote_type = EMOTE_VISIBLE
	emote_cooldown = 1.19 SECONDS

/datum/emote/sound/human/smirk2
	key = "smirk2"
	key_third_person = "smirks2"
	name = "smirk 2"
	message = "<i>smirks</i>."
	sound = 'modular_splurt/sound/voice/ace/ace_wubs.ogg'
	emote_type = EMOTE_VISIBLE
	emote_cooldown = 0.84 SECONDS

/datum/emote/sound/human/nani
	key = "nani"
	key_third_person = "nanis"
	message = "seems confused."
	sound = 'modular_splurt/sound/voice/nani.ogg'
	emote_type = EMOTE_VISIBLE
	emote_cooldown = 0.5 SECONDS

/datum/emote/sound/human/canonevent
	key = "2099"
	key_third_person = "canons"
	name = "canon event"
	message = "thinks this is a canon event."
	sound = 'modular_splurt/sound/voice/canon_event.ogg'
	emote_type = EMOTE_OMNI
	emote_cooldown = 5.0 SECONDS
	emote_volume = 27

/datum/emote/sound/human/meow
	key = "meow"
	key_third_person = "meows"
	message = "meows!"
	emote_type = EMOTE_AUDIBLE // No reason mimes shouldn't meow.
	restraint_check = FALSE
	sound = 'modular_splurt/sound/voice/catpeople/cat_meow1.ogg'

	emote_cooldown = 0.8 SECONDS // the longest audio is 1 second but who gives a fuck mrrp mrrp meow
	emote_pitch_variance = FALSE // why would you

/datum/emote/sound/human/meow/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/catpeople/cat_meow1.ogg', 'modular_splurt/sound/voice/catpeople/cat_meow2.ogg', 'modular_splurt/sound/voice/catpeople/cat_meow3.ogg') // Credit to Nyanotrasen (https://github.com/Nyanotrasen/Nyanotrasen)
	. = ..()

/datum/emote/sound/human/meow2
	key = "meow2"
	key_third_person = "meows2"
	name = "meow 2"
	message = "mews!"
	message_mime = "mews silently!"
	sound = 'modular_splurt/sound/voice/catpeople/cat_mew1.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.8 SECONDS // mrrp mrrp meow
	emote_pitch_variance = FALSE

/datum/emote/sound/human/meow2/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/catpeople/cat_mew1.ogg', 'modular_splurt/sound/voice/catpeople/cat_mew2.ogg') // Credit to Nyanotrasen (https://github.com/Nyanotrasen/Nyanotrasen)
	. = ..()

/datum/emote/sound/human/mrrp
	key = "mrrp"
	key_third_person = "mrrps"
	message = "trills like a cat!"
	message_mime = "trills silently!"
	sound = 'modular_splurt/sound/voice/catpeople/cat_mrrp1.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.8 SECONDS // mrrp mrrp meow
	emote_pitch_variance = FALSE

/datum/emote/sound/human/mrrp/run_emote(mob/user, params)
	sound = pick('modular_splurt/sound/voice/catpeople/cat_mrrp1.ogg', 'modular_splurt/sound/voice/catpeople/cat_mrrp2.ogg')
	. = ..()

/datum/emote/sound/human/mrowl
	key = "mrowl"
	key_third_person = "mrowls"
	message = "mrowls."
	sound = 'modular_splurt/sound/voice/mrowl.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.95 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/sound/human/gay
	key = "gay"
	key_third_person = "points at a player"
	message = "saw something gay."
	sound = 'modular_splurt/sound/voice/gay-echo.ogg'
	emote_type = EMOTE_BOTH
	emote_cooldown = 0.95 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/sound/human/flabbergast
	key = "flabbergast"
	key_third_person = "is flabbergasted"
	message = "looks flabbergasted!"
	sound = 'modular_splurt/sound/voice/flabbergasted.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 3.0 SECONDS
	emote_pitch_variance = FALSE
	emote_volume = 70

/datum/emote/sound/human/rawr
	key = "rawr"
	key_third_person = "rawrs"
	message = "lets out a rawr!"
	sound = 'modular_sand/sound/voice/rawr.ogg'
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 0.8 SECONDS

/datum/emote/sound/human/sadness
	key = "sadness"
	key_third_person = "feels sadness"
	message = "is experiencing <b><i>Profound Sadness</i></b>!"
	sound = 'modular_splurt/sound/voice/sadness.ogg'
	emote_cooldown = 4 SECONDS
	vary = FALSE
	volume = 30

/datum/emote/sound/human/malaysia
	key = "malaysia"
	key_third_person = "admits to blowing up Malaysia!"
	message = "admits to blowing up Malaysia!"
	message_mime = "silently explains they blew up Malaysia!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_splurt/sound/voice/malaysia.ogg'
	emote_cooldown = 2 SECONDS
