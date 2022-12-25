/datum/interaction/cuddle
	description = "Обнимашки!"
	simple_message = "USER обнимает TARGET."
	simple_style = "lewd"
	needs_physical_contact = TRUE

/datum/interaction/cuddle/display_interaction(mob/living/user, mob/living/target)
	var/static/list/possible_messages = list(
		"USER обнимает TARGET.",
		"USER страстно обнимает TARGET.",
		"USER нежно обнимает TARGET.",
		"USER бережно обнимает TARGET.",
		"USER тыкается носом в TARGET.",
		"USER нежно тыкается носиком в TARGET.",
		"USER бережно тыкается носиком в TARGET.",
		"USER тискает TARGET.",
		"USER хватает TARGET в свои нежные объятия.",
		"USER нежно тискается с TARGET.",
		"USER бережно тискается с TARGET.",
	)
	var/use_message = replacetext(pick(possible_messages), "USER", "\the [user]")
	use_message = replacetext(use_message, "TARGET", "\the [target]")
	user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")
