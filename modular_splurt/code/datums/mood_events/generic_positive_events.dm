/datum/mood_event/lewd_headpat
	description = span_nicegreen("I love headpats so much!\n")
	mood_change = 3
	timeout = 2 MINUTES
/datum/mood_event/qareen_bliss
	description = span_umbra("So.. horny...\n")
	mood_change = 5

/datum/mood_event/qareen_bliss/add_effects()
	description = span_umbra("Must.. breed. , [pick("Nngggghh", "Can't.. think.", "It feels so good.", "Need.. fuck.")]...\n")

/datum/mood_event/masked_mook
	description = span_nicegreen("I feel more complete with gas mask on.\n")
	mood_change = 1

/datum/mood_event/cloth_eaten
	description = "<span class='nicegreen'> That sure was a tasty outfit!\n"
	mood_change = 3
	timeout = 2400

/datum/mood_event/cloth_eaten/add_effects(obj/item/clothing/eaten)
	description = "<span class='nicegreen'>That sure was a [pick("tasty","good","linty","amazing")] [eaten.name]!\n"

/datum/mood_event/nudist_positive
	description = span_nicegreen("I'm delighted to not be constricted by clothing.\n")
	mood_change = 1

/datum/mood_event/dorsualiphobic_mood_positive
	description = span_nicegreen("Nobody will know if I'm wearing a backpack or not.\n")
	mood_change = 1

/datum/mood_event/drank_cursed_good
	description = span_nicegreen("I\'ve tasted sympathy from a fellow curse bearer.\n")
	mood_change = 1
	timeout = 2 MINUTES

/datum/mood_event/drank_exotic_matched
	description = span_nicegreen("I tasted familiarity from the blood I drank!\n")
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/brainwashed
	description = span_mind_control("I\'ve been shown the path, and I must follow it!\n")
	mood_change = 1
	hidden = TRUE
