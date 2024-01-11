/mob/living/update_transform(do_animate)
	appearance_flags |= PIXEL_SCALE
	if(fuzzy)
		appearance_flags &= ~PIXEL_SCALE
	. = ..()
