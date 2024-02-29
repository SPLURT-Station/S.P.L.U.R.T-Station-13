/datum/brain_trauma/severe/dark_passenger
	name = "Severe intrusive thoughts"
	desc = "Patient presents erratic and hazardous behavior for unknown motives."
	gain_text = ""
	lose_text = span_warning("You've won the battle against your intrusive thoughts!")
	random_gain = FALSE

/datum/brain_trauma/severe/dark_passenger/on_gain()
	owner.mind.add_antag_datum(/datum/antagonist/dark_passenger)
	. = ..()

/datum/brain_trauma/severe/dark_passenger/on_lose(silent)
	owner.mind.remove_antag_datum(/datum/antagonist/dark_passenger)
	. = ..()
