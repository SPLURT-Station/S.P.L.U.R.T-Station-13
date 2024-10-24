GLOBAL_LIST_INIT(rus_unicode_conversion_hex,list(
	"А" = "0410", "а" = "0430",
	"Б" = "0411", "б" = "0431",
	"В" = "0412", "в" = "0432",
	"Г" = "0413", "г" = "0433",
	"Д" = "0414", "д" = "0434",
	"Е" = "0415", "е" = "0435",
	"Ж" = "0416", "ж" = "0436",
	"З" = "0417", "з" = "0437",
	"И" = "0418", "и" = "0438",
	"Й" = "0419", "й" = "0439",
	"К" = "041a", "к" = "043a",
	"Л" = "041b", "л" = "043b",
	"М" = "041c", "м" = "043c",
	"Н" = "041d", "н" = "043d",
	"О" = "041e", "о" = "043e",
	"П" = "041f", "п" = "043f",
	"Р" = "0420", "р" = "0440",
	"С" = "0421", "с" = "0441",
	"Т" = "0422", "т" = "0442",
	"У" = "0423", "у" = "0443",
	"Ф" = "0424", "ф" = "0444",
	"Х" = "0425", "х" = "0445",
	"Ц" = "0426", "ц" = "0446",
	"Ч" = "0427", "ч" = "0447",
	"Ш" = "0428", "ш" = "0448",
	"Щ" = "0429", "щ" = "0449",
	"Ъ" = "042a", "ъ" = "044a",
	"Ы" = "042b", "ы" = "044b",
	"Ь" = "042c", "ь" = "044c",
	"Э" = "042d", "э" = "044d",
	"Ю" = "042e", "ю" = "044e",
	"Я" = "042f", "я" = "044f",

	"Ё" = "0401", "ё" = "0451"
	))

/proc/ismasculine(A)
	. = FALSE
	if(iscarbon(A))
		var/mob/living/carbon/C = A
		if(C.dna.features["body_model"] == MALE)
			. = TRUE

/proc/isfeminine(A)
	. = FALSE
	if(iscarbon(A))
		var/mob/living/carbon/C = A
		if(C.dna.features["body_model"] == FEMALE)
			. = TRUE

/proc/r_json_decode(text) //now I'm stupid
	for(var/s in GLOB.rus_unicode_conversion_hex)
		text = replacetext(text, "\\u[GLOB.rus_unicode_conversion_hex[s]]", s)
	return json_decode(text)

/datum/reagent/drug/labebium
	name = "Labelium"
	description = "Does it smell... unusual?"
	color = "#999922"
	reagent_state = LIQUID
	taste_description = "piss"
	var/obj/effect/hallucination/simple/ovoshi/fruit
	var/obj/effect/hallucination/simple/water/flood
	var/obj/effect/hallucination/simple/ovoshi/statues/statuya
	var/list/trip_types = list("ovoshi", "statues")
	var/current_trip
	var/tripsoundstarted = FALSE
	var/list/shenanigans = list()
	var/list/sounds = list()

/datum/chemical_reaction/labebium
	results = list(/datum/reagent/drug/labebium = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol = 4, /datum/reagent/drug/krokodil = 1)

/datum/reagent/drug/labebium/on_mob_end_metabolize(mob/living/L)
	stop_shit(L)
	..()

/datum/reagent/drug/labebium/proc/stop_shit(mob/living/carbon/C)
	if(C && C.hud_used)
		if(!HAS_TRAIT(C, TRAIT_DUMB))
			C.derpspeech = 0
		C.cultslurring = 0
		C.hud_used.show_hud(HUD_STYLE_STANDARD)
		C.Paralyze(95)
		DIRECT_OUTPUT(C.client, sound(null))
		var/list/screens = list(C.hud_used.plane_masters["[FLOOR_PLANE]"], C.hud_used.plane_masters["[GAME_PLANE]"], C.hud_used.plane_masters["[LIGHTING_PLANE]"])
		for(var/atom/movable/screen/plane_master/whole_screen in screens)
			animate(whole_screen, transform = matrix(), pixel_x = 0, pixel_y = 0, color = "#ffffff", time = 200, easing = ELASTIC_EASING)
			addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 200) //reset filters
		to_chat(C, "<b><big>Ufff.... really let go...</big></b>")

//		if(C.client && current_cycle > 100)
//			if(C.client.get_metabalance() < 0)
//				to_chat(C, "<b><big>Эта терапия излечила мой аутизм.</big></b>")
//				C.client.set_metacoin_count(0)
//				return

		if(prob(50) && current_cycle > 50)
			spawn(30)
				to_chat(C, "<b><big>Or not?!</big></b>")
				if(prob(50))
					spawn(50)
						to_chat(C, "<b><big>A-A-A-A-A-A-A-A-A-A-A-A!!!</big></b>")
						C.reagents.add_reagent_list(list(/datum/reagent/drug/labebium = 10))

/datum/reagent/drug/labebium/proc/create_flood(mob/living/carbon/C)
	for(var/turf/T in orange(14,C))
		if(prob(66))
			if(!(locate(flood) in T.contents))
				flood = new(T, C)

/datum/reagent/drug/labebium/proc/create_ovosh(mob/living/carbon/C)
	for(var/turf/T in orange(14,C))
		if(prob(23))
			if(!(locate(fruit) in T.contents))
				fruit = new(T, C, phrases = shenanigans)

/datum/reagent/drug/labebium/proc/create_statue(mob/living/carbon/C)
	for(var/turf/T in orange(14,C))
		if(prob(1))
			if(!(locate(statuya) in T.contents))
				statuya = new(T, C, phrases = shenanigans)

/datum/reagent/drug/labebium/on_mob_add(mob/living/L)
	. = ..()
	if (!current_trip)
		current_trip = pick(trip_types)
	var/json_file = file("data/npc_saves/Poly.json")
	if(!fexists(json_file))
		return
	var/list/json = r_json_decode(file2text(json_file))
	shenanigans = json["phrases"]
	return

/datum/reagent/drug/labebium/on_mob_life(mob/living/carbon/H)
	if(!H || !H.hud_used)
		return
	var/high_message
	var/list/screens = list(H.hud_used.plane_masters["[FLOOR_PLANE]"], H.hud_used.plane_masters["[GAME_PLANE]"], H.hud_used.plane_masters["[LIGHTING_PLANE]"])
	switch(current_trip)
		if("ovoshi")
			switch(current_cycle)
				if(1 to 20)
					high_message = "NO... JUST NOT VEGETABLES!!"
					if(prob(30))
						H.derpspeech++
						H.cultslurring++
					if(!tripsoundstarted)
						var/sound/sound = sound('modular_splurt/sound/lifeweb/cometodaddy.ogg', TRUE)
						sound.environment = 23
						sound.volume = 100
						SEND_SOUND(H.client, sound)
						create_ovosh(H)
						H.hud_used.show_hud(HUD_STYLE_NOHUD)
						H.emote("realagony")
						tripsoundstarted = TRUE
				if(31 to INFINITY)
					if(prob(80) && (H.mobility_flags & MOBILITY_MOVE) && !ismovable(H.loc))
						step(H, pick(GLOB.cardinals))
					if(H.client)
						sounds = H.client.SoundQuery()
						for(var/sound/S in sounds)
							if(S.len <= 3)
								PlaySpook(H, S.file, 23)
								sounds = list()
					if(prob(85))
						H.Jitter(35)
						var/rotation = max(min(round(current_cycle/4), 20),360)
						for(var/atom/movable/screen/plane_master/whole_screen in screens)
							if(prob(3))
								var/sound/sound = sound('modular_splurt/sound/misc/trip_blast.wav')
								sound.environment = 23
								sound.volume = 100
								SEND_SOUND(H.client, sound)
								H.emote("realagony")
								H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
								H.clear_fullscreen("labebium", rand(15, 60))
								new /datum/hallucination/delusion(H, TRUE, duration = 150, skip_nearby = FALSE, custom_name = H.name)
								if(prob(50))
									spawn(30)
										H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
										H.clear_fullscreen("labebium", rand(15, 60))
										H.emote("realagony")
										if(prob(50))
											spawn(30)
												H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
												H.clear_fullscreen("labebium", rand(15, 60))
												H.emote("realagony")
							if(prob(40))
								H.stuttering = 90
								animate(whole_screen, color = color_matrix_rotate_hue(rand(0, 360)), transform = turn(matrix(), rand(1,rotation)), time = 150, easing = CIRCULAR_EASING)
								animate(transform = turn(matrix(), -rotation), time = 100, easing = BACK_EASING)
							if(prob(13))
								H.Jitter(100)
								whole_screen.filters += filter(type="wave", x=20*rand() - 20, y=20*rand() - 20, size=rand()*0.1, offset=rand()*0.5, flags = WAVE_BOUNDED)
								animate(whole_screen, transform = matrix()*2, time = 40, easing = BOUNCE_EASING)
								addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 1200)
							addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 600)
					high_message = "GOD, NO!!!"
					create_flood(H)
					create_ovosh(H)
		if("statues")
			high_message = "relaxed..."
			if(!tripsoundstarted)
				var/sound/sound = sound('modular_splurt/sound/lifeweb/caves8.ogg', TRUE)
				sound.environment = 23
				sound.volume = 80
				SEND_SOUND(H.client, sound)
				H.hud_used.show_hud(HUD_STYLE_NOHUD)
				tripsoundstarted = TRUE
			if(prob(15))
				for(var/atom/movable/screen/plane_master/whole_screen in screens)
					animate(whole_screen, color = color_matrix_rotate_hue(rand(0, 360)), time = rand(5, 20))
			if(prob(15))
				if(H.client)
					sounds = H.client.SoundQuery()
					for(var/sound/S in sounds)
						if(S.len <= 3)
							PlaySpook(H, S.file, 23)
							sounds = list()
				create_statue(H)
				if(prob(3))
					var/sound/sound = sound('modular_splurt/sound/misc/trip_blast.wav')
					sound.environment = 23
					sound.volume = 100
					SEND_SOUND(H.client, sound)
					H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
					H.clear_fullscreen("labebium", rand(15, 60))
	if(prob(10))
		to_chat(H, "\n")
	if(prob(5))
		to_chat(H, "<b><big> ... [readable_corrupted_text(high_message)] ... </big></b>")
	..()

/datum/reagent/drug/labebium/proc/PlaySpook(mob/living/carbon/C, soundfile, environment = 0, vary = TRUE)
	var/sound/sound = sound(soundfile)
	sound.environment = environment //druggy
	sound.volume = rand(25,100)
	if(vary)
		sound.frequency = rand(10000,70000)
	SEND_SOUND(C.client, sound)

/obj/effect/hallucination/simple/water
	name = "Hahahahahah"
	desc = "<big>AAAAAAAAAAAAAAAAAAAAA!!!</big>"
	image_icon = 'modular_splurt/icons/lifeweb/water.dmi'
	image_state = "water0"
	var/triggered_shit = FALSE

/obj/effect/hallucination/simple/water/New(turf/location_who_cares_fuck, mob/living/carbon/C, forced = TRUE)
	image_state = "water[rand(0, 7)]"
	. = ..()
	color = pick("#ff00ff", "#ff0000", "#0000ff", "#00ff00", "#00ffff")
	animate(src, color = color_matrix_rotate_hue(rand(0, 360)), time = 200, easing = CIRCULAR_EASING)
	QDEL_IN(src, rand(40, 200))
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)


/obj/effect/hallucination/simple/water/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER
	if(!triggered_shit)
		if(ishuman(AM))
			animate(src, pixel_y = 600, pixel_x = rand(-4, 4), time = 30, easing = BOUNCE_EASING)
			if(prob(10) && AM == target)
				var/mob/living/carbon/human/M = AM
				M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5, 170)
				to_chat(M, "<b>[readable_corrupted_text("PSHHHHHHHHHHHHHHHHHH!!!")]</b>")
				var/sound/sound = sound('modular_splurt/sound/misc/pshsh.ogg')
				sound.environment = 23
				sound.volume = 20
				SEND_SOUND(M, sound)
				M.Paralyze(25)
			triggered_shit = TRUE


/obj/effect/hallucination/simple/ovoshi
	name = "Vegetable"
	desc = "M-M-M-M-M..!"
	image_icon = 'modular_splurt/icons/lifeweb/harvest.dmi'
	image_state = "berrypile"
	var/list/states = list("berrypile", "chilipepper", "eggplant", "soybeans", \
		"plumphelmet", "carrot", "corn", "corn2", "corn_cob", "tomato", "ambrosiavulgaris", \
		"watermelon", "apple", "applestub", "appleold", "lime", "lemon", "poisonberrypile", \
		"grapes", "cabbage", "greengrapes", "orange", "potato", "potato-peeled", "wheat", \
		"ashroom", "cshroom", "eshroom", "fshroom", "amanita", "gshroom", "bshroom", "dshroom", \
		"bezglaznik", "krovnik", "pumpkin", "rice", "goldenapple", "gryab", "curer", "otorvyannik", \
		"glig", "beet", "turnip")

/obj/effect/hallucination/simple/ovoshi/New(turf/location_who_cares_fuck, mob/living/carbon/C, forced = TRUE, list/phrases = list())
	image_state = pick(states)
	. = ..()
	SpinAnimation(rand(5, 40), TRUE, prob(50))
	pixel_x = (rand(-16, 16))
	pixel_y = (rand(-16, 16))
	if(prob(1) && C.client)
		if(!phrases.len)
			phrases = list("Meoy", "quack")
		to_chat(C.client, "<b>[name]</b> <i>say</i>, <big>\"[readable_corrupted_text(pick(phrases))]\"</big>")
	animate(src, color = color_matrix_rotate_hue(rand(0, 360)), transform = matrix()*rand(1,3), time = 200, pixel_x = rand(-64,64), pixel_y = rand(-64,64), easing = CIRCULAR_EASING)
	QDEL_IN(src, rand(40, 200))

/obj/effect/hallucination/simple/ovoshi/attack_hand(mob/living/carbon/C)
	if(prob(10))
		to_chat(C, "<b>HUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUH!!!</b>")
	var/sound/sound = sound(pick('modular_splurt/sound/lifeweb/wallhit.ogg', \
		'modular_splurt/sound/lifeweb/wallhit2.ogg', 'modular_splurt/sound/lifeweb/wallhit3.ogg'))
	sound.environment = 23
	sound.volume = rand(50, 100)
	SEND_SOUND(C.client, sound)
	C.Paralyze(5)
	to_chat(C, "<span class='rose bold'>[prob(50) ? "Received" : "Lost"] [rand(1000, 500000)] credits!</span>")
	. = ..()
	qdel(src)

/obj/effect/hallucination/simple/ovoshi/statues
	name = "Meoy"
	desc = "Wow!"
	image_icon = 'modular_splurt/icons/lifeweb/crafts.dmi'
	image_state = "statue1"
	states = list("statue1", "statue2", "statue3", "statue4", \
		"statue6", "statue7", "seangel", "seangel2")

/atom/movable/screen/fullscreen/labeb
	icon = 'modular_splurt/icons/ruzone_went_up.dmi'
	plane = SPLASHSCREEN_PLANE
	screen_loc = "CENTER-7,SOUTH"
	icon_state = ""

/obj/item/reagent_containers/pill/labebium
	name = "Labebium"
	desc = "Drink me!"
	icon_state = "pill5"
	list_reagents = list(/datum/reagent/drug/labebium = 10)

/obj/item/storage/pill_bottle/labebium
	name = "Labebium pill"
	desc = "Consuming one such tablet turned you into a vegetable. I am not kidding."

/obj/item/storage/pill_bottle/labebium/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/labebium(src)

/datum/emote/living/real_agony
	key = "realagony"
	key_third_person = "realagony"
	message = "screams in agony!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/real_agony/run_emote(mob/living/user, params) //Agony
	if(user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(iscarbon(user))
		var/mob/living/carbon/c = user
		c.reindex_screams()
	if(!user.is_muzzled() && !miming)
		if(issilicon(user))
			sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(iscyborg(user))
				var/mob/living/silicon/robot/S = user
				if(S.cell?.charge < 20)
					to_chat(S, "<span class='warning'>The scream module is deactivated. Please recharge.</span>")
					return
				S.cell.use(200)
		if(ismonkey(user))
			sound = 'modular_citadel/sound/voice/scream_monkey.ogg'
		if(istype(user, /mob/living/simple_animal/hostile/gorilla))
			sound = 'sound/creatures/gorilla.ogg'
		if(ishuman(user))
			user.adjustOxyLoss(10)
			if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
				sound = pick('modular_splurt/sound/emotes/agony_male_1.ogg',\
						'modular_splurt/sound/emotes/agony_male_2.ogg',\
						'modular_splurt/sound/emotes/agony_male_3.ogg',\
						'modular_splurt/sound/emotes/agony_male_4.ogg',\
						'modular_splurt/sound/emotes/agony_male_5.ogg',\
						'modular_splurt/sound/emotes/agony_male_6.ogg',\
						'modular_splurt/sound/emotes/agony_male_7.ogg',\
						'modular_splurt/sound/emotes/agony_male_8.ogg',\
						'modular_splurt/sound/emotes/agony_male_9.ogg')
			if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
				sound = pick('modular_splurt/sound/emotes/agony_female_1.ogg',\
						'modular_splurt/sound/emotes/agony_female_2.ogg',\
						'modular_splurt/sound/emotes/agony_female_3.ogg')
			if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
				sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(is_species(user, /datum/species/skeleton))
				sound = 'modular_citadel/sound/voice/scream_skeleton.ogg'
			if (is_species(user, /datum/species/fly) || is_species(user, /datum/species/insect))
				sound = 'modular_citadel/sound/voice/scream_moth.ogg'
		if(isalien(user))
			sound = 'sound/voice/hiss6.ogg'
		LAZYINITLIST(user.alternate_screams)
		if(LAZYLEN(user.alternate_screams))
			sound = pick(user.alternate_screams)
		playsound(user.loc, sound, 75, 1, 4, 1.2)
		message = "Screams in agony!"
	else if(miming)
		message = "Depicts a cry of agony."
	else
		message = "Makes an extremely loud sound."
	. = ..()

//Code SmiLeY :3
//Adapted GranMor
