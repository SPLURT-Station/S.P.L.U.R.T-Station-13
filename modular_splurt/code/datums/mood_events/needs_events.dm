/datum/mood_event/fat/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()
	if(!HAS_TRAIT(actual_owner, TRAIT_VORACIOUS))
		return
	description = span_nicegreen("MORE FOOD!!! MORE FOOD!!! MORE FOOD!!!\n")
	mood_change = 8

/datum/mood_event/cum_craving
	description = span_warning("I... NEED... CUM...\n")
	mood_change = -20

/datum/mood_event/cum_stuffed
	description = span_nicegreen("It feels so good inside me!\n")
	mood_change = 8
	timeout = 5 MINUTES
