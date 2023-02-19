// Add incompatible quirks
/datum/controller/subsystem/processing/quirks/Initialize(timeofday)
	. = ..()

	// Prevent incompatible quirks
	LAZYADD(quirk_blacklist, list(
		// BLOCKED: Thematic, mechanic
		// This is a direct foil to Blessed Blood
		// Causes a conflict with Holy Water effects
		list("Blessed Blood","Cursed Blood"),

		// BLOCKED: Thematic, mechanic, game lore
		// Bloodsuckers cannot interact with TRAIT_HOLY holders
		list("Blessed Blood","Bloodsucker Fledgling"),

		// BLOCKED: Rendering bug
		// Comment this out if the bug is fixed
		list("Blessed Blood","Dullahan"),

		// BLOCKED: Mechanic
		// Light sensitivity could cause a user to be permanently disabled
		// Light phobia could be permanently negated
		list("Blessed Blood","Light Sensitivity"),
		list("Blessed Blood","Nyctophobia"),
		))
