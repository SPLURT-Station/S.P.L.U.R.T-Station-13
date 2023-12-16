/datum/interaction/cuddle
	description = "Cuddle with them."
	simple_message = "USER cuddles TARGET."
	simple_style = "lewd"
	interaction_flags = INTERACTION_FLAG_ADJACENT

/datum/interaction/cuddle/display_interaction(mob/living/user, mob/living/target)
	var/static/list/possible_messages = list(
		"USER cuddles TARGET.",
		"USER passionately cuddles TARGET.",
		"USER affectionately cuddles TARGET.",
		"USER lovingly cuddles TARGET.",
		"USER nuzzles TARGET.",
		"USER passionately nuzzles TARGET.",
		"USER lovingly nuzzles TARGET.",
		"USER embraces TARGET.",
		"USER embraces TARGET in a soft cuddle.",
		"USER passionately embraces TARGET.",
		"USER lovingly embraces TARGET.",
	)
	var/use_message = replacetext(pick(possible_messages), "USER", "\the [user]")
	use_message = replacetext(use_message, "TARGET", "\the [target]")
	user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")
