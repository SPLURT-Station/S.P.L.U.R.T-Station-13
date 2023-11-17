/datum/preferences/proc/cit_character_pref_load(savefile/S)
	//ipcs
	S["feature_ipc_screen"] >> features["ipc_screen"]
	S["feature_ipc_antenna"] >> features["ipc_antenna"]

	features["ipc_screen"] 	= sanitize_inlist(features["ipc_screen"], GLOB.ipc_screens_list)
	features["ipc_antenna"] 	= sanitize_inlist(features["ipc_antenna"], GLOB.ipc_antennas_list)
	//Citadel
	features["flavor_text"]		= sanitize_text(features["flavor_text"], initial(features["flavor_text"]))
	if(!features["mcolor2"] || (features["mcolor"] == "#000000" && CONFIG_GET(flag/character_color_limits))) //SPLURT EDIT
		features["mcolor2"] = pick("FFFFFF","7F7F7F", "7FFF7F", "7F7FFF", "FF7F7F", "7FFFFF", "FF7FFF", "FFFF7F")
	if(!features["mcolor3"] || (features["mcolor"] == "#000000" && CONFIG_GET(flag/character_color_limits))) //SPLURT EDIT
		features["mcolor3"] = pick("FFFFFF","7F7F7F", "7FFF7F", "7F7FFF", "FF7F7F", "7FFFFF", "FF7FFF", "FFFF7F")
	features["mcolor2"]	= sanitize_hexcolor(features["mcolor2"], 6, FALSE)
	features["mcolor3"]	= sanitize_hexcolor(features["mcolor3"], 6, FALSE)

	// Sandstorm changes
	S["enable_personal_chat_color"]		>> enable_personal_chat_color
	S["personal_chat_color"]			>> personal_chat_color
	S["lust_tolerance"] 				>> lust_tolerance
	S["sexual_potency"]					>> sexual_potency

	S["alt_titles_preferences"]			>> alt_titles_preferences
	alt_titles_preferences = SANITIZE_LIST(alt_titles_preferences)
	if(SSjob)
		for(var/datum/job/job in sortList(SSjob.occupations, /proc/cmp_job_display_asc))
			if(alt_titles_preferences[job.title])
				if(!(alt_titles_preferences[job.title] in job.alt_titles))
					alt_titles_preferences.Remove(job.title)

	erppref = sanitize_inlist(S["erp_pref"], GLOB.lewd_prefs_choices, "Ask")
	nonconpref = sanitize_inlist(S["noncon_pref"], GLOB.lewd_prefs_choices, "Ask")
	vorepref = sanitize_inlist(S["vore_pref"], GLOB.lewd_prefs_choices, "Ask")
	unholypref = sanitize_inlist(S["unholypref"], GLOB.lewd_prefs_choices, "Ask") //I AM MENTAL I AM MAD I AM INSANE
	extremepref = sanitize_inlist(S["extreme_pref"], GLOB.lewd_prefs_choices, "No") //god has forsaken me
	extremeharm = sanitize_inlist(S["extreme_harm"], (GLOB.lewd_prefs_choices - "Ask"), "No") //hacky for not saving "Ask"
	if(extremepref == "No")
		extremeharm = "No"
	enable_personal_chat_color	= sanitize_integer(enable_personal_chat_color, 0, 1, initial(enable_personal_chat_color))
	personal_chat_color	= sanitize_hexcolor(personal_chat_color, 6, 1, "#FFFFFF")
	lust_tolerance = sanitize_integer(lust_tolerance, 75, 200, initial(lust_tolerance))
	sexual_potency = sanitize_integer(sexual_potency, 10, 25, initial(sexual_potency))

	S["silicon_lawset"] >> silicon_lawset

	silicon_lawset = sanitize_inlist(silicon_lawset, CONFIG_GET(keyed_list/choosable_laws), "None")
	if(silicon_lawset == "None")
		silicon_lawset = null

/datum/preferences/proc/cit_character_pref_save(savefile/S)
	//ipcs
	WRITE_FILE(S["feature_ipc_screen"], features["ipc_screen"])
	WRITE_FILE(S["feature_ipc_antenna"], features["ipc_antenna"])
	//Citadel
	WRITE_FILE(S["feature_genitals_use_skintone"], features["genitals_use_skintone"])
	WRITE_FILE(S["feature_mcolor2"], features["mcolor2"])
	WRITE_FILE(S["feature_mcolor3"], features["mcolor3"])
	WRITE_FILE(S["feature_mam_body_markings"], safe_json_encode(features["mam_body_markings"]))
	WRITE_FILE(S["feature_mam_tail"], features["mam_tail"])
	WRITE_FILE(S["feature_mam_ears"], features["mam_ears"])
	WRITE_FILE(S["feature_mam_tail_animated"], features["mam_tail_animated"])
	WRITE_FILE(S["feature_taur"], features["taur"])
	WRITE_FILE(S["feature_mam_snouts"],	features["mam_snouts"])
	//Xeno features
	WRITE_FILE(S["feature_xeno_tail"], features["xenotail"])
	WRITE_FILE(S["feature_xeno_dors"], features["xenodorsal"])
	WRITE_FILE(S["feature_xeno_head"], features["xenohead"])
	//flavor text
	WRITE_FILE(S["feature_flavor_text"], features["flavor_text"])
	WRITE_FILE(S["feature_naked_flavor_text"], features["naked_flavor_text"]) //SPLURT edit
	WRITE_FILE(S["feature_silicon_flavor_text"], features["silicon_flavor_text"])

	//sandstorm stuff
	WRITE_FILE(S["erp_pref"], erppref)
	WRITE_FILE(S["noncon_pref"], nonconpref)
	WRITE_FILE(S["vore_pref"], vorepref)
	WRITE_FILE(S["unholypref"], unholypref)
	WRITE_FILE(S["extreme_pref"], extremepref)
	WRITE_FILE(S["extreme_harm"], extremeharm)
	WRITE_FILE(S["enable_personal_chat_color"], enable_personal_chat_color)
	WRITE_FILE(S["personal_chat_color"], personal_chat_color)
	WRITE_FILE(S["alt_titles_preferences"], alt_titles_preferences)
	WRITE_FILE(S["lust_tolerance"], lust_tolerance)
	WRITE_FILE(S["sexual_potency"], sexual_potency)
	WRITE_FILE(S["silicon_lawset"], silicon_lawset)
