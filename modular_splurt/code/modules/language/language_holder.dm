/datum/language_holder/synthetic/New()
	. = ..()
	understood_languages += list(/datum/language/schechi = list(LANGUAGE_ATOM), /datum/language/modular_splurt/avian = list(LANGUAGE_ATOM))
	spoken_languages += list(/datum/language/schechi = list(LANGUAGE_ATOM), /datum/language/modular_splurt/avian = list(LANGUAGE_ATOM))
