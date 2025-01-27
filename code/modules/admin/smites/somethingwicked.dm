


/// "Fully immerses" the player, making them manually breathe and blink
/datum/smite/wicked
	name = "0-S: Something Wicked"

/datum/smite/wicked/effect(client/user, mob/living/target)
	. = ..()
	SEND_SOUND(target, sound('sound/misc/wickedscream.ogg'))
	to_chat(target, span_boldnotice("Something Wicked This Way Comes."))