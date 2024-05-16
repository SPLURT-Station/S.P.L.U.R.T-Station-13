//Snowflake metabolization with naughty organ manipulation
/mob/living/carbon/wendigo/proc/metabolize_hunger()
	if(HAS_TRAIT(src, TRAIT_NOHUNGER))
		return

	if(connected_link)
		if(connected_link.souls.len > 3)
			nutrition = min(800, nutrition + (HUNGER_FACTOR*connected_link.souls.len))
		nutrition = max(0, nutrition - (HUNGER_FACTOR / (physiology.hunger_mod / (connected_link.souls.len + 1))))
	else
		nutrition = max(0, nutrition - (HUNGER_FACTOR / physiology.hunger_mod))
/*
	switch(nutrition)
		if(NUTRITION_LEVEL_FULL to INFINITY)
			throw_alert("nutrition", /atom/movable/screen/alert/fat)
		if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_FULL)
			clear_alert("nutrition")
		if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_STARVING)
			throw_alert("nutrition", /atom/movable/screen/alert/hungry)
		if(0 to NUTRITION_LEVEL_STARVING)
			throw_alert("nutrition", /atom/movable/screen/alert/starving)
*/

/mob/living/carbon/wendigo/reagent_check(datum/reagent/R)
	if(istype(R, /datum/reagent/fermi))
		var/had_changed = FALSE
		if(R.type == /datum/reagent/fermi/penis_enlarger)
			fake_penis_size += 0.25
			had_changed = "penis_enlarger"
		if(R.type == /datum/reagent/fermi/PEsmaller)
			fake_penis_size = max(0, fake_penis_size - 0.25)
			had_changed = "PEsmaller"
		if(R.type == /datum/reagent/fermi/breast_enlarger)
			fake_breast_size += 0.25
			had_changed = "breast_enlarger"
		if(R.type == /datum/reagent/fermi/BEsmaller)
			fake_breast_size = max(0, fake_breast_size - 0.25)
			had_changed = "BEsmaller"

		if(had_changed)
			R.volume -= R.metabolization_rate
			if(round(fake_penis_size, 1) == fake_penis_size && fake_penis_size)
				switch(had_changed)
					if("penis_enlarger")
						to_chat(src, span_warning("Your [pick(GLOB.dick_nouns)] [pick("swells up to", "flourishes into", "expands into", "bursts forth into", "grows eagerly into", "amplifys into")] a [fake_penis_size] inch penis.</b>"))
					if("PEsmaller")
						if(fake_penis_size > 0)
							to_chat(src, span_warning("Your [pick(GLOB.dick_nouns)] [pick("shrinks down to", "decreases into", "diminishes into", "deflates into", "shrivels regretfully into", "contracts into")] a [fake_penis_size] inch penis.</b>"))
			else if(round(fake_breast_size, 1) == fake_breast_size && fake_breast_size)
				switch(had_changed)
					if("breast_enlarger")
						to_chat(src, span_warning("Your breasts [pick("swell up to", "flourish into", "expand into", "burst forth into", "grow eagerly into", "amplify into")] a [ascii2text(round(fake_breast_size)+63)]-cup.</b>"))
					if("BEsmaller)")
						if(fake_breast_size > 0)
							to_chat(src, span_warning("Your breasts [pick("shrink down to", "decrease into", "diminish into", "deflate into", "shrivel regretfully into", "contracts into")] a [ascii2text(round(fake_breast_size)+63)]-cup.</b>"))
			return TRUE
