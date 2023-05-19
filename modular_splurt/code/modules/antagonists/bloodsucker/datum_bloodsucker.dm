/datum/antagonist/bloodsucker/New()
	. = ..()

	// Add antagonist incompatible quirks
	LAZYADD(blacklisted_quirks, list(/datum/quirk/bloodfledge))
