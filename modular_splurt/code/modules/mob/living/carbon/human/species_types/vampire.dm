/datum/species/vampire/roundstart/check_roundstart_eligible()
	. = ..()
	if(id in (CONFIG_GET(keyed_list/roundstart_races)))
		return TRUE
	return FALSE

/datum/species/vampire/roundstart/New()
	. = ..()

	// Add species incompatible quirks
	LAZYADD(blacklisted_quirks, list(/datum/quirk/bloodfledge))
