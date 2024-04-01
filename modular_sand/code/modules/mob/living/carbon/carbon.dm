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
