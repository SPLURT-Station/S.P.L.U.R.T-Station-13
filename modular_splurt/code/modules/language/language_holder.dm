/datum/language_holder/synthetic/New()
	. = ..()
	understood_languages += list(/datum/language/schechi = list(LANGUAGE_ATOM))
	spoken_languages += list(/datum/language/schechi = list(LANGUAGE_ATOM))
