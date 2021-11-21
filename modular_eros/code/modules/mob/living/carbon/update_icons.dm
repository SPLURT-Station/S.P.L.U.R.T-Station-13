/mob/living/carbon/resize(multiplier = RESIZE_DEFAULT_SIZE)
	if(has_dna())
		return dna.resize(multiplier)
	else
		return ..()
