/datum/objective/protect_object
	name = "protect object"
	var/obj/protect_target

/datum/objective/protect_object/proc/set_target(obj/O)
	protect_target = O
	update_explanation_text()

/datum/objective/protect_object/update_explanation_text()
	. = ..()
	if(protect_target)
		explanation_text = "Protect \the [protect_target] at all costs."
	else
		explanation_text = "Free objective."

/datum/objective/protect_object/check_completion()
	return !QDELETED(protect_target)

/datum/objective/rescue_prisoner
	name = "rescue prisoner"

/datum/objective/rescue_prisoner/find_target(dupe_search_range, blacklist)
	var/mob/living/rescue_target = pick(GLOB.roundstart_prisoners)
	if(!rescue_target)
		qdel(src)
		return FALSE
	target = rescue_target.mind
	return target

/datum/objective/rescue_prisoner/check_completion()
	return considered_escaped(target)

/datum/objective/slaver
	name = "slave trading"
	explanation_text = "Earn 30,000 credits through slave trading."
	
