//Main code edits
/datum/quirk/social_anxiety
	value = -3
	//mob_trait = TRAIT_ANXIOUS //Not in the code yet, neither are its implementations
	processing_quirk = FALSE //small fixes for big mistakes

/datum/quirk/social_anxiety/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_MOB_SAY, .proc/handle_speech)

/datum/quirk/social_anxiety/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_MOB_SAY)

/datum/quirk/social_anxiety/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER

	if(HAS_TRAIT(quirk_holder, TRAIT_FEARLESS))
		return

	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	var/moodmod
	if(mood)
		moodmod = (1+0.02*(50-(max(50, mood.mood_level*(7-mood.sanity_level))))) //low sanity levels are better, they max at 6
	else
		moodmod = (1+0.02*(50-(max(50, 0.1*quirk_holder.nutrition))))
	var/nearby_people = 0
	for(var/mob/living/carbon/human/H in oview(3, quirk_holder))
		if(H.client)
			nearby_people++
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		var/list/message_split = splittext(message, " ")
		var/list/new_message = list()
		var/mob/living/carbon/human/quirker = quirk_holder
		for(var/word in message_split)
			if(prob(max(5,(nearby_people*12.5*moodmod))) && word != message_split[1]) //Minimum 1/20 chance of filler
				new_message += pick("uh,","erm,","um,")
				if(prob(min(5,(0.05*(nearby_people*12.5)*moodmod)))) //Max 1 in 20 chance of cutoff after a succesful filler roll, for 50% odds in a 15 word sentence
					quirker.silent = max(3, quirker.silent)
					to_chat(quirker, span_danger("You feel self-conscious and stop talking. You need a moment to recover!"))
					break
			if(prob(max(5,(nearby_people*12.5*moodmod)))) //Minimum 1/20 chance of stutter
				// Add a short stutter, THEN treat our word
				quirker.stuttering = max(0.25, quirker.stuttering)
				new_message += quirker.treat_message(word)

			else
				new_message += word

		message = jointext(new_message, " ")
	var/mob/living/carbon/human/quirker = quirk_holder
	if(prob(min(50,(0.50*(nearby_people*12.5)*moodmod)))) //Max 50% chance of not talking
		if(dumb_thing)
			to_chat(quirker, span_userdanger("You think of a dumb thing you said a long time ago and scream internally."))
			dumb_thing = FALSE //only once per life
			if(prob(1))
				new/obj/item/reagent_containers/food/snacks/pastatomato(get_turf(quirker)) //now that's what I call spaghetti code
		else
			to_chat(quirk_holder, span_warning("You think that wouldn't add much to the conversation and decide not to say it."))
			if(prob(min(25,(0.25*(nearby_people*12.75)*moodmod)))) //Max 25% chance of silence stacks after succesful not talking roll
				to_chat(quirker, span_danger("You retreat into yourself. You <i>really</i> don't feel up to talking."))
				quirker.silent = max(5, quirker.silent)
		speech_args[SPEECH_MESSAGE] = pick("Uh.","Erm.","Um.")
	else
		speech_args[SPEECH_MESSAGE] = message

//Own stuff
/datum/quirk/no_guns
	name = "Fat-Fingered"
	desc = "Due to the shape of your hands, width of your fingers or just not having fingers at all, you're unable to fire guns without accommodation."
	value = -2
	mob_trait = TRAIT_CHUNKYFINGERS
	gain_text = span_notice("Your fingers feel... thick.")
	lose_text = span_notice("Your fingers feel normal again.")

/datum/quirk/illiterate
	name = "Illiterate"
	desc = "You can't read nor write, plain and simple."
	value = -1
	mob_trait = TRAIT_ILLITERATE
	gain_text = span_notice("The knowledge of how to read seems to escape from you.")
	lose_text = span_notice("Written words suddenly make sense again.")

/datum/quirk/flimsy
	name = "Flimsy"
	desc = "Your body is a little more fragile then most, decreasing total health by 20%."
	value = -2
	medical_record_text = "Patient has abnormally low capacity for injury."
	gain_text = span_notice("You feel like you could break with a single hit.")
	lose_text = span_notice("You feel more durable.")

/datum/quirk/flimsy/add()
	quirk_holder.maxHealth *= 0.8

/datum/quirk/flimsy/remove() //how do admins even remove traits?
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 1.25

/datum/quirk/hypersensitive
	name = "Hypersensitive"
	desc = "For better or worse, everything seems to affect your mood more than it should."
	value = -1
	gain_text = span_danger("You seem to make a big deal out of everything.")
	lose_text = span_notice("You don't seem to make a big deal out of everything anymore.")
	mood_quirk = TRUE //yogs
	medical_record_text = "Patient demonstrates a high level of emotional volatility."

/datum/quirk/hypersensitive/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier += 0.5

/datum/quirk/hypersensitive/remove()
	if(!quirk_holder)
		return
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.5

// masked_mook moved to neutral

//well-trained moved to neutral

/datum/quirk/dumb4cum
	name = "Dumb For Cum"
	desc = "For one reason or another, you're totally obsessed with seminal fluids. The heat of it, the smell... the taste... It's quite simply euphoric."
	value = 0
	mob_trait = TRAIT_DUMB_CUM
	gain_text = span_notice("You feel an insatiable craving for seminal fluids.")
	lose_text = span_notice("Cum didn't even taste that good, anyways.")
	medical_record_text = "Patient seems to have an unhealthy psychological obsession with seminal fluids."
	mood_quirk = TRUE
	var/timer
	var/timer_trigger = 15 MINUTES

/datum/quirk/dumb4cum/add()
	// Set timer
	timer = addtimer(CALLBACK(src, .proc/crave), timer_trigger, TIMER_STOPPABLE)

/datum/quirk/dumb4cum/remove()
	// Remove status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Remove mood event
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, QMOOD_DUMB_CUM)

	// Remove timer
	deltimer(timer)

/datum/quirk/dumb4cum/proc/crave()
	// Check if conscious
	if(quirk_holder.stat == CONSCIOUS)
		// Display emote
		quirk_holder.emote("sigh")

		// Define list of phrases
		var/list/trigger_phrases = list(
										"Your stomach rumbles a bit and cum comes to your mind.",\
										"Urgh, you should really get some cum...",\
										"Some jizz wouldn't be so bad right now!",\
										"You're starting to long for some more cum..."
									)
		// Alert user in chat
		to_chat(quirk_holder, span_love("[pick(trigger_phrases)]"))

	// Add active status trait
	ADD_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Add illiterate, dumb, and pacifist
	ADD_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Add negative mood effect
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_craving)

/datum/quirk/dumb4cum/proc/uncrave()
	// Remove active status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Add positive mood event
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_stuffed)

	// Remove timer
	deltimer(timer)
	timer = null

	// Add new timer
	timer = addtimer(CALLBACK(src, .proc/crave), timer_trigger, TIMER_STOPPABLE)

// Small issue with this. If the quirk holder has NO_HUNGER or NO_THIRST, this trait can still be taken and they will still get the benefits of it.
// It's unlikely that someone will be both, especially at round start, but vampirism makes me wary of having these separate.
/datum/quirk/hungry
	name = "Hungry"
	desc = "You find yourself unusually hungry. Gotta eat twice as much as normal."
	value = -1
	gain_text = span_danger("You're starting to feel hungrier a lot faster.")
	lose_text = span_notice("Your elevated craving for food begins dying down.")
	medical_record_text = "Patient reports eating twice as many meals per day than usual for their species."

/datum/quirk/hungry/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.hunger_mod *= 2

/datum/quirk/hungry/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		P.hunger_mod /= 2

/datum/quirk/thirsty
	name = "Thirsty"
	desc = "You find yourself unusually thirsty. Gotta drink twice as much as normal."
	value = -1
	gain_text = span_danger("You're starting to feel thirstier a lot faster.")
	lose_text = span_notice("Your elevated craving for water begins dying down.")
	medical_record_text = "Patient reports drinking twice as many liquids per day than usual for their species."

/datum/quirk/thirsty/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.thirst_mod *= 2

/datum/quirk/thirsty/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		P.thirst_mod /= 2
