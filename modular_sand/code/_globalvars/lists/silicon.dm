GLOBAL_LIST_INIT(all_law_datums, initialize_all_law_datums())

/proc/initialize_all_law_datums()
	var/list/law_datums
	// Malf runtimes, do not init
	for(var/datum/ai_laws/law_datum as anything in typesof(/datum/ai_laws) - list(/datum/ai_laws/malfunction, /datum/ai_laws/custom))
		LAZYSET(law_datums, law_datum, new law_datum())
	return law_datums
