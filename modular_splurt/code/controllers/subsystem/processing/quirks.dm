// Add incompatible quirks
/datum/controller/subsystem/processing/quirks/Initialize(timeofday)
	. = ..()
	
	// Prevent DNC with One Shot
	LAZYADD(quirk_blacklist, list(list("DNC","One Shot")))
