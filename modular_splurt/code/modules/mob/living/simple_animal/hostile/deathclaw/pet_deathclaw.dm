/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/pet_femclaw
	vision_range = 0
	aggro_vision_range = 0
	wander = 1
	melee_damage_lower = 0
	melee_damage_upper = 0
	stop_automated_movement_when_pulled = 1

	//Ordering mechanics
	var/list/speech_buffer = ""
	var/mob/capsule_owner

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/pet_femclaw/pet_mommyclaw
	icon_state = "mommyclaw"
	desc = "A machine that turns her victim's pelvis into pelvwas."
	name = "Mommy Funclaw"

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/pet_deathclaw
	vision_range = 0
	aggro_vision_range = 0
	wander = 1
	melee_damage_lower = 0
	melee_damage_upper = 0
	stop_automated_movement_when_pulled = 1

	//Ordering mechanics
	var/list/speech_buffer = ""
	var/mob/capsule_owner

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/pet_deathclaw/pet_alphaclaw
	name = "Alpha Funclaw"
	icon_state = "alphaclaw"
	base_state = "alphaclaw"
	cock_state = "alphaclaw_cocked"


/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/pet_femclaw/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, spans, message_mode, atom/movable/source)
	. = ..()
	SEND_SIGNAL(src, COMSIG_MOB_EMOTE, args)
	if(speaker != src && !radio_freq && !stat)
		if (speaker == capsule_owner)
			speech_buffer = ""
			speech_buffer = lowertext(html_decode(message))
			new_order()

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/pet_femclaw/proc/new_order()
	if(speech_buffer != null)
		if (findtext(speech_buffer, "fuck") && findtext(speech_buffer, "me"))
			target = capsule_owner
			aggro_vision_range =9
			vision_range = 9
		if (findtext(speech_buffer, "stop"))
			target = null
			aggro_vision_range = 0
			vision_range = 0

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/pet_femclaw/CanAttack(atom/the_target)
	. = ..()
	if(the_target != capsule_owner)
		aggro_vision_range = 0
		vision_range = 0
		return FALSE

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/pet_deathclaw/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, spans, message_mode, atom/movable/source)
	. = ..()
	SEND_SIGNAL(src, COMSIG_MOB_EMOTE, args)
	if(speaker != src && !radio_freq && !stat)
		if (speaker == capsule_owner)
			speech_buffer = ""
			speech_buffer = lowertext(html_decode(message))
			new_order()

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/pet_deathclaw/proc/new_order()
	if(speech_buffer != null)
		if (findtext(speech_buffer, "fuck") && findtext(speech_buffer, "me"))
			target = capsule_owner
			aggro_vision_range =9
			vision_range = 9
		if (findtext(speech_buffer, "stop"))
			target = null
			aggro_vision_range = 0
			vision_range = 0

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/pet_deathclaw/CanAttack(atom/the_target)
	. = ..()
	if(the_target != capsule_owner)
		aggro_vision_range = 0
		vision_range = 0
		return FALSE

