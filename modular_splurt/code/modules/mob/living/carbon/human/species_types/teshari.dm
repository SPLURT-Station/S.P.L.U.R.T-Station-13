#define TESHARI_TEMP_OFFSET -30 // K, added to comfort/damage limit etc
#define TESHARI_BURNMOD 1.25 // They take more damage from practically everything
#define TESHARI_BRUTEMOD 1.2
#define TESHARI_HEATMOD 1.3
#define TESHARI_COLDMOD 0.67 // Except cold.


/datum/species/mammal/teshari
	name = "Teshari"
	id = SPECIES_TESHARI
	say_mod = "mars"
	eye_type = "teshari"
	mutant_bodyparts = list("mcolor" = "FFFFFF", "mcolor2" = "FFFFFF", "mcolor3" = "FFFFFF", "mam_tail" = "teshari tail, colorable", "mam_ears" = "None", "mam_body_markings" = list())
	allowed_limb_ids = null
	override_bp_icon = 'modular_splurt/icons/mob/teshari.dmi'
	damage_overlay_type = "teshari"
	species_language_holder = /datum/language_holder/teshari
	exotic_blood_color = "#D514F7"
	disliked_food = GROSS | GRAIN
	liked_food = MEAT
	payday_modifier = 0.75
	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	ass_image = 'icons/ass/asslizard.png'

	species_traits = list(MUTCOLORS,
		EYECOLOR,
		NO_UNDERWEAR,
		HAIR,
		FACEHAIR,
		MARKINGS
		)

	coldmod = TESHARI_COLDMOD
	heatmod = TESHARI_HEATMOD
	brutemod = TESHARI_BRUTEMOD
	burnmod = TESHARI_BURNMOD


/datum/species/mammal/teshari/on_species_gain(mob/living/carbon/human/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		C.verbs += /mob/living/carbon/human/proc/sonar_ping
		C.verbs += /mob/living/carbon/human/proc/hide
		C.setMaxHealth(50)
		C.physiology.hunger_mod *= 2
		C.add_movespeed_modifier(/datum/movespeed_modifier/teshari)

/datum/movespeed_modifier/teshari
	multiplicative_slowdown = -0.2

/datum/emote/sound/teshari
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	emote_type = EMOTE_AUDIBLE

/datum/language_holder/teshari
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/schechi = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/schechi = list(LANGUAGE_ATOM))

/datum/language/schechi

/datum/emote/living/audio/teshari/teshsqueak
	key = "surprised"
	key_third_person = "surprised"
	message = "chirps in surprise!"
	message_mime = "lets out an <b>inaudible</b> chirp!"
	emote_sound = 'modular_splurt/sound/voice/teshsqueak.ogg' // Copyright CC BY 3.0 InspectorJ (freesound.org) for the source audio.
	emote_cooldown = 2.1 SECONDS

/datum/emote/living/audio/teshari/teshsqueak/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	if(D.species.name != "Teshari")
		return
	// Return normally
	. = ..()

/datum/emote/living/audio/teshari/teshchirp
	key = "tchirp"
	key_third_person = "tchirp"
	message = "chirps!"
	message_mime = "lets out an <b>inaudible</b> chirp!"
	emote_sound = 'modular_splurt/sound/voice/teshchirp.ogg' // Copyright CC BY 3.0 InspectorJ (freesound.org) for the source audio.
	emote_cooldown = 2.1 SECONDS

/datum/emote/living/audio/teshari/teshchirp/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	if(D.species.name != "Teshari")
		return
	// Return normally
	. = ..()

/datum/emote/living/audio/teshari/trill
	key = "trill"
	key_third_person = "trill"
	message = "trills!"
	message_mime = "lets out an <b>inaudible</b> chirp!"
	emote_sound = 'modular_splurt/sound/voice/teshtrill.ogg' // Copyright CC BY 3.0 InspectorJ (freesound.org) for the source audio.
	emote_cooldown = 2.1 SECONDS

/datum/emote/living/audio/teshari/trill/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	if(D.species.name != "Teshari")
		return
	// Return normally
	. = ..()

/datum/emote/living/audio/teshari/teshscream
	key = "teshscream"
	key_third_person = "teshscream"
	message = "screams!"
	message_mime = "lets out an <b>inaudible</b> screams!"
	emote_sound = 'modular_splurt/sound/voice/teshscream.ogg' // Copyright CC BY 3.0 InspectorJ (freesound.org) for the source audio.
	emote_cooldown = 2.1 SECONDS

/datum/emote/living/audio/teshari/teshscream/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	if(D.species.name != "Teshari")
		return
	// Return normally
	. = ..()

/mob/living/carbon/human
	var/next_sonar_ping = 0
	var/hiding = 0

/mob/living/carbon/human/proc/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(stat == DEAD || restrained() || buckled|| has_buckled_mobs()) //VORE EDIT: Check for has_buckled_mobs() (taur riding)
		return

	if(hiding)
		plane = initial(plane)
		layer = initial(layer)
		to_chat(usr, "<span class='notice'>You have stopped hiding.</span>")
		hiding = 0
	else
		hiding = 1
		layer = BELOW_OBJ_LAYER //Just above cables with their 2.44
		plane = GAME_PLANE
		to_chat(src,"<span class='notice'>You are now hiding.</span>")


/mob/living/carbon/human/proc/sonar_ping()
	set name = "Listen In"
	set desc = "Allows you to listen in to movement and noises around you."
	set category = "Abilities"

	if(incapacitated())
		to_chat(src, "<span class='warning'>You need to recover before you can use this ability.</span>")
		return
	if(world.time < next_sonar_ping)
		to_chat(src, "<span class='warning'>You need another moment to focus.</span>")
		return
	var/obj/item/organ/ears/ears = getorganslot(ORGAN_SLOT_EARS)
	if(ears.deaf > 0)
		to_chat(src, "<span class='warning'>You are for all intents and purposes currently deaf!</span>")
		return
	next_sonar_ping += 10 SECONDS
	var/heard_something = FALSE
	to_chat(src, "<span class='notice'>You take a moment to listen in to your environment...</span>")
	for(var/mob/living/L in range(client.view, src))
		var/turf/T = get_turf(L)
		if(!T || L == src || L.stat == DEAD)
			continue
		heard_something = TRUE
		var/feedback = list()
		feedback += "<span class='notice'>There are noises of movement "
		var/direction = get_dir(src, L)
		if(direction)
			feedback += "towards the [dir2text(direction)], "
			switch(get_dist(src, L) / 7)
				if(0 to 0.2)
					feedback += "very close by."
				if(0.2 to 0.4)
					feedback += "close by."
				if(0.4 to 0.6)
					feedback += "some distance away."
				if(0.6 to 0.8)
					feedback += "further away."
				else
					feedback += "far away."
		else // No need to check distance if they're standing right on-top of us
			feedback += "right on top of you."
		feedback += "</span>"
		to_chat(src,jointext(feedback,null))
	if(!heard_something)
		to_chat(src, "<span class='notice'>You hear no movement but your own.</span>")

