/datum/mind/proc/remove_slaver()
	var/datum/antagonist/slaver/slaver = has_antag_datum(/datum/antagonist/slaver,TRUE)
	if(slaver)
		remove_antag_datum(slaver.type)
		special_role = null
