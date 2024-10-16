/// Fry the target
/datum/smite/fry
	name = "Fry"

/datum/smite/fry/effect(client/user, mob/living/target)
	. = ..()
	target.fry()
