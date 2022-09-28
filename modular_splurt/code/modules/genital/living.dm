// Edited from: core/modules/vore/eating/living.dm
/mob/living
	var/genital_selected

/hook/living_new/proc/genitals_setup(mob/living/M)
	add_verb(M, /mob/living/proc/genitalPanel)
	spawn(2 SECONDS)
		if(M)
			M.init_genitals()

	return TRUE

/mob/living/proc/init_genitals()
	if(client?.prefs)
		if(client.prefs.features["has_cock"])
			genital_selected = "cock"
		else if(client.prefs.features["has_balls"])
			genital_selected = "balls"
		else if(client.prefs.features["has_breasts"])
			genital_selected = "breasts"
		else if(client.prefs.features["has_vag"])
			genital_selected = "vag"
		else if(client.prefs.features["has_butt"])
			genital_selected = "butt"
		return TRUE