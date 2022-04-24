/mob/living/carbon/proc/update_hunger_and_thirst_hud()
	if(!client || !hud_used)
		return
	if(hud_used.hunger)
		switch(src.nutrition)
			if(NUTRITION_LEVEL_FULL to INFINITY)
				hud_used.hunger.icon_state = "nutrition0"
			if(NUTRITION_LEVEL_WELL_FED to NUTRITION_LEVEL_FULL)
				hud_used.hunger.icon_state = "nutrition1"
			if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_WELL_FED)
				hud_used.hunger.icon_state = "nutrition2"
			if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
				hud_used.hunger.icon_state = "nutrition3"
			if(0 to NUTRITION_LEVEL_STARVING)
				hud_used.hunger.icon_state = "nutrition4"
	if(hud_used.thirst)
		switch(get_thirst(src))
			if(THIRST_LEVEL_FULL to INFINITY)
				hud_used.thirst.icon_state = "hydration0"
			if(THIRST_LEVEL_QUENCHED to THIRST_LEVEL_FULL)
				hud_used.thirst.icon_state = "hydration1"
			if(THIRST_LEVEL_THIRSTY to THIRST_LEVEL_QUENCHED)
				hud_used.thirst.icon_state = "hydration2"
			if(THIRST_LEVEL_PARCHED to THIRST_LEVEL_THIRSTY)
				hud_used.thirst.icon_state = "hydration3"
			if(0 to THIRST_LEVEL_PARCHED)
				hud_used.thirst.icon_state = "hydration4"

//It's here so it doesn't make a big mess on randomverbs.dm,
//also because of this you can proccall it, why would you if you have smite?
/mob/living/proc/pregoodbye(C)
	if(isanimal(C))
		var/mob/living/simple_animal/D = C
		D.AIStatus = AI_OFF
	Immobilize(1000, TRUE, TRUE)// 			currently the only ways of
	next_action_immediate = 10000000000 // 	completely freezing someone as i know
	playsound(C, "modular_sand/sound/effects/admin_punish/changetheworld.ogg", 100, FALSE)
	say("Change the world")
	sleep(20)
	playsound(C, "modular_sand/sound/effects/admin_punish/myfinalmessage.ogg", 100, FALSE)
	say("My final message")
	sleep(20)
	playsound(C, "modular_sand/sound/effects/admin_punish/goodbye.ogg", 100, FALSE)
	say("Goodbye.")
	sleep(20)
	playsound(C, "modular_sand/sound/effects/admin_punish/endjingle.ogg", 100, FALSE)
	goodbye()

/mob/living/proc/goodbye() //this must be separate because it's a loop!
	if(alpha <= 10)
		sleep(2)
		ghostize()
		Destroy()
	else
		alpha = alpha - 7
		sleep(1)
		goodbye()
