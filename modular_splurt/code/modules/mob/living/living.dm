/mob/living
	var/datum/action/sizecode_smallsprite/small_sprite

/// Gender Change
// Intended only for silicons/robots (incl. pAI) and simple_animal code so far. This proc was made to somewhat ease up duplicated verb code.
// There's probably better way to do this but I am terrible at it --Nopeman
/mob/living/proc/change_gender()
	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You cannot toggle your gender while unconcious!"))
		return

	var/choice = tgui_alert(usr, "Select Gender.", "Gender", list("Both", "Male", "Female", "None", "Toggle Breasts", "Toggle Penis", "Toggle Pussy", "Toggle Balls"))
	switch(choice)
		if("Both")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = TRUE
			gender = PLURAL
		if("Male")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = FALSE
			gender = MALE
		if("Female")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = TRUE
			gender = FEMALE
		if("None")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = FALSE
			gender = NEUTER
		if("Toggle Breasts") // Idea/Initial code by @LunarFleet (github)
			has_breasts = !has_breasts // Simplified line by @Zirok-BYOND (github)
		if("Toggle Penis")
			has_penis = !has_penis
		if("Toggle Pussy")
			has_vagina = !has_vagina 
		if("Toggle Balls")
			has_balls = !has_balls

/// Toggle admin frozen
/mob/living/proc/toggle_admin_freeze(client/admin)
	admin_frozen = !admin_frozen

	if(admin_frozen)
		SetStun(INFINITY, ignore_canstun = TRUE)
	else
		SetStun(0, ignore_canstun = TRUE)

	if(client && admin)
		to_chat(src, span_userdanger("An admin has [!admin_frozen ? "un" : ""]frozen you."))
		log_admin("[key_name(admin)] toggled admin-freeze on [key_name(src)].")
		message_admins("[key_name_admin(admin)] toggled admin-freeze on [key_name_admin(src)].")

/// Toggle admin sleeping
/mob/living/proc/toggle_admin_sleep(client/admin)
	admin_sleeping = !admin_sleeping

	if(admin_sleeping)
		SetSleeping(INFINITY, ignore_canstun = TRUE)
	else
		SetSleeping(0, ignore_canstun = TRUE)

	if(client && admin)
		to_chat(src, span_userdanger("An admin has [!admin_sleeping ? "un": ""]slept you."))
		log_admin("[key_name(admin)] toggled admin-sleep on [key_name(src)].")
		message_admins("[key_name_admin(admin)] toggled admin-sleep on [key_name_admin(src)].")

/mob/living/adjust_mobsize()
	. = ..()
	if(mob_size == 0)
		AddElement(/datum/element/smalltalk)
	else
		RemoveElement(/datum/element/smalltalk)

/mob/living/do_resist_grab(moving_resist, forced, silent = FALSE)
	. = ..()
	if(iswendigo(pulledby)) //Grip is too strong, nonetheless.
		to_chat(src, "<span class='danger'>The grip is too strong! I need some time...</span>")
		if(do_after(src, 200, target = pulledby))
			to_chat(src, "<span class='danger'>I break free off [pulledby]'s grip!</span>")
			return TRUE

/mob/living/verb/switch_scaling()
	set name = "Switch scaling mode"
	set category = "IC"
	set desc = "Switch sharp/fuzzy scaling for current mob."
	appearance_flags ^= PIXEL_SCALE
	fuzzy = !fuzzy
