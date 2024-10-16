/// Turns the target into a pickle
/datum/smite/pickle
	name = "Pickle"

/datum/smite/pickle/effect(client/user, mob/living/target)
	. = ..()
	target.turn_into_pickle()
