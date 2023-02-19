/datum/species/skeleton/New()
	. = ..()

	// Add species incompatible quirks
	LAZYADD(blacklisted_quirks, list(/datum/quirk/blessed_blood))
