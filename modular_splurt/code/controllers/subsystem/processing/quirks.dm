// Add incompatible quirks.
// Inspired from LeDrascol's code. Thank you.
/datum/controller/subsystem/processing/quirks/Initialize(timeofday)
	. = ..()

	// Prevent incompatible quirks.
	LAZYADD(quirk_blacklist, list(
		// BLOCKED: Thematic, mechanic.
		// Hallowed is a direct foil to Cursed Blood.
		// Causes a conflict with Holy Water effects.
		list("Hallowed","Cursed Blood"),

		// BLOCKED: Thematic, mechanic, game lore.
		// Bloodsuckers cannot interact with Hallowed users.
		list("Hallowed","Bloodsucker Fledgling"),
		))
