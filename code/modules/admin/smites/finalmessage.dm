/// Their Final Message
/datum/smite/finalmessage
	name = "Final Message"

/datum/smite/finalmessage/effect(client/user, mob/living/target)
	. = ..()
	var/mob/living/C = target
	if(C.stat == DEAD)
		to_chat(usr, "<span class='warning'>[C] is dead!")
		return
	else
		C.goodbye()
