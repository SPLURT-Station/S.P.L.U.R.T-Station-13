/mob/living/carbon/human/BiologicalLife(delta_time, times_fired)
	..()
	if(stat != DEAD)
		update_arousal()
