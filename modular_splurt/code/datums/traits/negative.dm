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
/datum/quirk/no_clone
	name = "DNC"
	desc = "You have filed a Do Not Clone order, stating that you do not wish to be cloned. You can still be revived by other means."
	value = -2
	mob_trait = TRAIT_NO_CLONE
	medical_record_text = "Patient has a DNC (Do Not Clone) order and will be rejected by cloning mechanisms as a result."

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
	lose_text = "<span class='notice'>Written words suddenly make sense again."

/datum/quirk/flimsy
	name = "Flimsy"
	desc = "Your body is a little more fragile then most, decreasing total health by 20%."
	value = -2
	medical_record_text = "Patient has abnormally low capacity for injury."
	gain_text = "<span class='notice'>You feel like you could break with a single hit."
	lose_text = "<span class='notice'>You feel more durable."

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
	desc = "For one reason or another, you're totally obsessed with cum. The heat of it, the smell... its taste... It's quite simply euphoric."
	value = 0
	gain_text = "<span class='notice'>You suddenly start craving some seed inside of you!<span>"
	lose_text = span_danger("Cum didn't even taste that good, anyways.")
	medical_record_text = "Patient seems to have an unhealthy psychological obsession with seminal fluids."
	var/craving_after = 15 MINUTES
	var/timer

/datum/quirk/dumb4cum/on_spawn()
	. = ..()
	timer = addtimer(CALLBACK(src, .proc/crave), craving_after, TIMER_STOPPABLE)

/datum/quirk/dumb4cum/proc/crave()
	var/list/hungry_phrases = list(
									"Your stomach rumbles a bit and cum comes to your mind.",\
									"Urgh, you should really get some cum...",\
									"Some jizz wouldn't be so bad right now!",\
									"You're starting to long for some more cum..."
								  )
	to_chat(quirk_holder, span_love("[pick(hungry_phrases)]"))

	if(quirk_holder.stat == CONSCIOUS)
		quirk_holder.emote("sigh")
	//ADD_TRAIT(quirk_holder, TRAIT_PACIFISM, type)
	ADD_TRAIT(quirk_holder, TRAIT_DUMB4CUM, type)
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "cum_craving", /datum/mood_event/cum_craving)

/datum/quirk/dumb4cum/proc/uncrave()
	//REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, type)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB4CUM, type)
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "cum_craving")
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "cum_stuffed", /datum/mood_event/cum_stuffed)

	deltimer(timer)
	timer = null
	timer = addtimer(CALLBACK(src, .proc/crave), craving_after, TIMER_STOPPABLE)

// Small issue with this. If the quirk holder has NO_HUNGER or NO_THIRST, this trait can still be taken and they will still get the benefits of it.
// It's unlikely that someone will be both, especially at round start, but vampirism makes me wary of having these separate.
/datum/quirk/hungry
	name = "Hungry And Thirsty"
	desc = "You find yourself unusually hungry and thirsty. Gotta eat and drink twice as much as normal."
	value = -1
	gain_text = span_danger("You're starting to feel hungrier and thirstier a lot faster.")
	lose_text = span_notice("Your craving for food and water begins dying down.")
	medical_record_text = "Patient reports eating twice as many meals per day than usual for their species."

/datum/quirk/hungry/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.hunger_mod *= 2
	P.thirst_mod *= 2

/datum/quirk/hungry/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		P.hunger_mod /= 2
		P.thirst_mod /= 2

/datum/quirk/no_revive
	name = "One Shot"
	desc = "Your life is a precious and fleeting thing. Once it's over, it's over for good. Not even CentCom can save you."
	value = -4
	mob_trait = TRAIT_PERMADEATH
	gain_text = span_danger("Your palms are sweaty, knees weak, arms are heavy.")
	lose_text = span_notice("You find the determination to keep going.")
	medical_record_text = "Patient cannot be revived with station-issued technologies. In the event of an emergency; Return to central command for processing."

/datum/quirk/no_revive/add()
	. = ..()

	// Add trait: No revival
	ADD_TRAIT(quirk_holder, TRAIT_NOCLONE, "quirk_oneshot")

/datum/quirk/no_revive/remove()
	. = ..()

	// Remove trait: No revival
	REMOVE_TRAIT(quirk_holder, TRAIT_NOCLONE, "quirk_oneshot")
