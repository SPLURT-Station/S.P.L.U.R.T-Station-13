/*
Holds things like antag datums, game modes, abilities, and everything
related to the antag that could be a datum
*/

//ANTAGONIST
/datum/antagonist/wendigo
	name = "wendigo"
	antagpanel_category = "Wendigo"

/datum/antagonist/wendigo/on_gain()
	var/mob/living/carbon/human/old_body = owner.current
	if(ishuman(old_body))
		var/mob/living/carbon/wendigo/new_owner = new/mob/living/carbon/wendigo(get_turf(owner.current))
		qdel(old_body)
		owner.transfer_to(new_owner)
	..()

//HUD
//Contents: Intentions, Hands, Dropping/Throwing/Pulling, Inventory Equip
//		Health + Souls on the bottom of screen
//TODO: Health doll, Soul counter (not devil)

/datum/hud/human/wendigo
