GLOBAL_LIST_EMPTY(roundstart_prisoners)

/datum/job/prisoner/after_spawn(mob/living/carbon/human/H, mob/M, latejoin)
	. = ..()
	if(!latejoin)
		GLOB.roundstart_prisoners += H
