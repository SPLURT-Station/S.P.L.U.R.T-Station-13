/datum/species/ipc/New()
	var/list/markings_fix = list("mam_body_markings" = list())
	LAZYADD(mutant_bodyparts, markings_fix)
	. = ..()
