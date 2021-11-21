/mob/living/carbon/new_body_size(new_size = RESIZE_DEFAULT_SIZE)
	if(has_dna())
		return dna.new_body_size(new_size)
	else
		return ..()
