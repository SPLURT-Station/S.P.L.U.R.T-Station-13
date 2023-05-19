// Potion of flight
/obj/item/reagent_containers/glass/bottle/potion/flight/attack(mob/living/target, mob/living/user)
	// Check for self attack
	// Check for carbon target
	if((target != user) || (!iscarbon(user)))
		// Return normally
		return ..()

	// Check for bloodfledge
	if(isbloodfledge(user))
		// Define list of options
		var/list/prompt_options = list("Confirm", "Cancel")

		// Prompt user for input
		var/input_warning = tgui_alert(user, "You sense that drinking this may be a bad idea. Are you sure you'd like to continue?",src,prompt_options)

		// Sanitize input
		sanitize_inlist(input_warning, prompt_options)

		// Check if input was NOT confirmation
		if(input_warning != "Confirm")
			// Return without results
			return

	// Return normally
	. = ..()
