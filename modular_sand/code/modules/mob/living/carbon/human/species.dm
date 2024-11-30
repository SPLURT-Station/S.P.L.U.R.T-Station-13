/datum/species/proc/handle_thirst(mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOTHIRST))
		return

	//Put more things here if you plan on adding more things. I know this proc is a bit empty at the moment
	if (H.client)
		H.adjust_thirst(-THIRST_FACTOR)
	else
		// Do not allow SSD players to too thirsty.
		if (H.thirst >= THIRST_LEVEL_QUENCHED)
			H.adjust_thirst(-THIRST_FACTOR)

/*	switch(get_thirst(src))
		if(THIRST_LEVEL_THIRSTY to INFINITY)
			H.clear_alert("thirst")
		if(THIRST_LEVEL_PARCHED to THIRST_LEVEL_THIRSTY)
			H.throw_alert("thirst", /atom/movable/screen/alert/thirsty)
		if(0 to THIRST_LEVEL_PARCHED)
			H.throw_alert("thirst", /atom/movable/screen/alert/dehydrated)
*/
