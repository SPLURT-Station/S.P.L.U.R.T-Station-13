#define ESTROUS_CYCLE_LENGTH 32
#define ESTROUS_CYCLE_OFFSET 11

/datum/species/lizard/New()
	mutant_bodyparts += list("ears" = "None")
	. = ..()

/datum/species/lizard/ashwalker/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	. = ..()

	// Add estrous detect quirk
	C.add_quirk(/datum/quirk/estrous_detection, SPECIES_TRAIT)

	// Define round ID
	// Requires a server database to use this
	var/round_id = text2num(GLOB.round_id) || null

	// Define round mating season value
	var/round_season = ((round_id + (ESTROUS_CYCLE_OFFSET + 2)) % ESTROUS_CYCLE_LENGTH)

	// Check for mating season
	// Default to active without variable
	if((!round_id) || round_season <= 2 && round_season >= 0)
		// Alert user in chat
		to_chat(C, span_userlove("It\'s that time again. Your loins lay restless as they await a potential mate."))

		// Add estrous quirk
		C.add_quirk(/datum/quirk/estrous_active, SPECIES_TRAIT)

#undef ESTROUS_CYCLE_LENGTH
#undef ESTROUS_CYCLE_OFFSET
