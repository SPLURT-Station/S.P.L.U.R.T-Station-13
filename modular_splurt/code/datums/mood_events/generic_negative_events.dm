/datum/mood_event/masked_mook_incomplete
	description = span_warning("I feel incomplete without a gas mask...\n")
	mood_change = -4

/datum/mood_event/creampie/cheesed
	description = span_warning("I've been cheesed. Tastes like cheese.\n")

/datum/mood_event/creampie/cheesed/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()

	if(!ishuman(actual_owner))
		return .
	if(iscatperson(actual_owner))
		description = span_warning("<b>CHEESE!!! WAAAAAAAAAAAAAAAAAAAAAAAAAAAA!!!</b>\n")
		mood_change = -5
		timeout = 5 MINUTES

/datum/mood_event/nudist_negative
	description = span_warning("I don't feel comfortable wearing this.\n")
	mood_change = -4

/datum/mood_event/dorsualiphobic_mood_negative
	description = span_warning("I can't let anyone find out if I'm wearing a backpack or not!\n")
	mood_change = -4

// Matches drinking synth blood (drankblood_synth)
/datum/mood_event/drankblood_slime
	description = span_boldwarning("I drank liquid slime. What is wrong with me?\n")
	mood_change = -7
	timeout = 15 MINUTES

/datum/mood_event/drank_cursed_bad
	description = span_warning("I can feel a pale curse from the blood I drank.\n")
	mood_change = -1
	timeout = 2 MINUTES

// Matches drinking shared exotic blood
/datum/mood_event/drankblood_insect
	description = span_boldwarning("I drank an insect's hemolymph. What is wrong with me?\n")
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/drankblood_xeno
	description = span_boldwarning("I drank xenobiological blood. What is wrong with me?\n")
	mood_change = -2
	timeout = 2 MINUTES
