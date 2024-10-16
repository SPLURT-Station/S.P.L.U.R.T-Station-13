/// Cluwneifies the target
/datum/smite/cluwne
	name = "Cluwne"

/datum/smite/cluwne/effect(client/user, mob/living/carbon/human/target as mob)
	. = ..()
	if(!iscarbon(target))
		to_chat(usr,"<span class='warning'>This must be used on a carbon mob.</span>")
		return
	target.cluwneify()
