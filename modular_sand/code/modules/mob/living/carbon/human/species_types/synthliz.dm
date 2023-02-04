/datum/species/synthliz/New()
	. = ..()

	// Define inherent traits to add
	var/modular_inherent_traits = list(TRAIT_NOTHIRST)

	// Add new traits to list
	LAZYADD(inherent_traits, modular_inherent_traits)
