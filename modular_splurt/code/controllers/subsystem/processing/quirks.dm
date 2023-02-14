// Add incompatible quirks
/datum/controller/subsystem/processing/quirks/Initialize(timeofday)
	. = ..()

	// Prevent incompatible quirks
	LAZYADD(quirk_blacklist, list(
		// BLOCKED: Mechanic
		// Zombies can't regenerate blood
		list("Postmortem Flesh","Polycythemia vera"),

		// BLOCKED: Mechanic
		// Zombies are slower and clumsier
		list("Postmortem Flesh","Freerunning"),
		list("Postmortem Flesh","Light Step"),
		list("Postmortem Flesh","Quick Step"),

		// BLOCKED: Mechanic
		// Zombies can't evaluate wounds properly
		list("Postmortem Flesh","Self-Aware"),

		// BLOCKED: Mechanic
		// Zombies are already cold blooded
		list("Postmortem Flesh","Cold-blooded"),

		// BLOCKED: Mechanic
		// Zombies already can't be cloned
		list("Postmortem Flesh","DNC Order"),
		))
