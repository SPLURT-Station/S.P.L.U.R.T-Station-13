/mob/living
	var/size_multiplier = RESIZE_NORMAL

/// Returns false on failure
/mob/living/proc/update_size(new_size)
	if(!new_size)
		return FALSE
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		var/oldsize = get_size(H)
		if(new_size == oldsize)
			return FALSE
		H.dna.features["body_size"] = new_size
		H.dna.update_body_size(oldsize)
	else
		var/oldsize = get_size(src)
		if(new_size == oldsize)
			return FALSE
		size_multiplier = new_size
		resize = new_size / oldsize
		update_transform()
	switch(get_size(src))
		if(0 to 40)
			mob_size = MOB_SIZE_TINY
		if(41 to 80)
			mob_size = MOB_SIZE_SMALL
		if(81 to 120)
			mob_size = MOB_SIZE_HUMAN
		if(121 to INFINITY)
			mob_size = MOB_SIZE_LARGE

	return TRUE
