/mob/living
	var/lastclienttime = 0
	var/size_multiplier = RESIZE_NORMAL

/// Returns false on failure
/mob/living/proc/update_size(new_size, cur_size)
	if(!new_size)
		return FALSE
	if(!cur_size)
		cur_size = get_size(src)
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(new_size == cur_size)
			return FALSE
		H.dna.features["body_size"] = new_size
		H.dna.update_body_size(cur_size)
	else
		if(new_size == cur_size)
			return FALSE
		size_multiplier = new_size
		resize = new_size / cur_size
		update_transform()
	adjust_mobsize(new_size)
	SEND_SIGNAL(src, COMSIG_MOB_RESIZED, new_size, cur_size)
	return TRUE

/mob/living/proc/adjust_mobsize(size)
	switch(size)
		if(0 to 0.4)
			mob_size = MOB_SIZE_TINY
		if(0.41 to 0.8)
			mob_size = MOB_SIZE_SMALL
		if(0.81 to 1.2)
			mob_size = MOB_SIZE_HUMAN
		if(1.21 to INFINITY)
			mob_size = MOB_SIZE_LARGE

// It's here so it doesn't make a big mess on randomverbs.dm,
// also because of this you can proccall it, why would you if you have smite?
// This code was bad. For future reference, stoplag() and sleep() are very different and not at all interchangeable.
// You can also use animate() to cleanly animate variables like alpha.
// Finally, NEVER call Destroy() directly.
/mob/living/proc/goodbye()
	set waitfor = FALSE
	if(isanimal(src))
		var/mob/living/simple_animal/simple_animal = src
		simple_animal.toggle_ai(AI_OFF)
	AllImmobility(INFINITY, TRUE, TRUE)
	playsound(src, "modular_sand/sound/effects/admin_punish/changetheworld.ogg", 100, FALSE)
	say("Change the world")
	sleep(20)
	playsound(src, "modular_sand/sound/effects/admin_punish/myfinalmessage.ogg", 100, FALSE)
	say("My final message")
	sleep(20)
	playsound(src, "modular_sand/sound/effects/admin_punish/goodbye.ogg", 100, FALSE)
	say("Goodbye.")
	sleep(20)
	playsound(src, "modular_sand/sound/effects/admin_punish/endjingle.ogg", 100, FALSE)
	animate(src, alpha = 10, 3.5 SECONDS)
	QDEL_IN(src, 2)
