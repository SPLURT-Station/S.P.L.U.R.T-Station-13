/datum/species/lizard/ashwalker/eastern
	name = "Eastern Ash Walker"
	id = SPECIES_ASHWALKER_EAST
	burnmod = 0.85
	brutemod = 0.85

/datum/species/lizard/ashwalker/eastern/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	C.dna.features["legs"] = "Digitigrade Legs"
	return ..()

/datum/species/lizard/ashwalker/western
	name = "Western Ash Walker"
	id = SPECIES_ASHWALKER_WEST
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS)

/datum/species/lizard/ashwalker/western/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	C.dna.features["legs"] = "Normal Legs"
	return ..()
