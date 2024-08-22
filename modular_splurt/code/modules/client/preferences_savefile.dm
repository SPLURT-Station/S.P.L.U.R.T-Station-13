/datum/preferences/proc/splurt_character_pref_load(savefile/S) //TODO: modularize our other savefile edits... maybe?
	//Character directory
	S["show_in_directory"]		>> show_in_directory
	S["directory_tag"]			>> directory_tag
	S["directory_erptag"]			>> directory_erptag
	S["directory_ad"]			>> directory_ad

	// Get stomping preferences.
	S["stomp_pref"] >> stomppref

	// Fuzzy scaling
	S["feature_fuzzy"] >> fuzzy

	// Custom blood color
	S["custom_blood_color"] >> custom_blood_color // TRUE/FALSE - If custom blood color is enabled
	S["blood_color"] >> blood_color // The custom blood color itself

	//sanitize data
	show_in_directory		= sanitize_integer(show_in_directory, 0, 1, initial(show_in_directory))
	directory_tag			= sanitize_inlist(directory_tag, GLOB.char_directory_tags, initial(directory_tag))
	directory_erptag		= sanitize_inlist(directory_erptag, GLOB.char_directory_erptags, initial(directory_erptag))
	directory_ad			= strip_html_simple(directory_ad, MAX_FLAVOR_LEN)
	stomppref				= sanitize_integer(stomppref, 0, 1, initial(stomppref))
	fuzzy 					= sanitize_integer(fuzzy, 0, 1, initial(fuzzy))
	custom_blood_color 		= sanitize_integer(custom_blood_color, 0, 1, initial(custom_blood_color))
	blood_color 			= sanitize_hexcolor(blood_color, 6, 1, initial(blood_color))

/datum/preferences/proc/splurt_character_pref_save(savefile/S) //TODO: modularize our other savefile edits... maybe?
	//Character directory
	WRITE_FILE(S["show_in_directory"], show_in_directory)
	WRITE_FILE(S["directory_tag"], directory_tag)
	WRITE_FILE(S["directory_erptag"], directory_erptag)
	WRITE_FILE(S["directory_ad"], directory_ad)

	// Stomping preferences.
	WRITE_FILE(S["stomp_pref"], stomppref)

	// Fuzzy scaling
	WRITE_FILE(S["feature_fuzzy"]			, fuzzy)

	// Custom blood color
	WRITE_FILE(S["custom_blood_color"], custom_blood_color)
	WRITE_FILE(S["blood_color"], blood_color)

/datum/preferences/update_preferences(current_version, savefile/S)
	. = ..()
	if(current_version < 57.01) //a
		new_character_creator = TRUE

	if(current_version < 58.01) // Stomp pref.
		stomppref = TRUE

/datum/preferences/update_character(current_version, savefile/S)
	. = ..()
	if(current_version < 53.01)
		if(!features["balls_fluid"] || !(find_reagent_object_from_type(features["balls_fluid"]) in GLOB.genital_fluids_list))
			features["balls_fluid"] = /datum/reagent/consumable/semen
		if(!features["breasts_fluid"] || !(find_reagent_object_from_type(features["breasts_fluid"]) in GLOB.genital_fluids_list))
			features["breasts_fluid"] = /datum/reagent/consumable/milk
		if(!features["womb_fluid"] || !(find_reagent_object_from_type(features["womb_fluid"]) in GLOB.genital_fluids_list))
			features["womb_fluid"] = /datum/reagent/consumable/semen/femcum
