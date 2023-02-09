/obj/item/toy/prize/savannahivanov
	name = "toy Savannah-Ivanov"
	icon = 'modular_splurt/icons/obj/toy.dmi'
	icon_state = "savannahivanovtoy"
	desc = "Mini-Mecha action figure! Collect them all! 13/12."

/obj/item/toy/figure/assistant/imaginary_friend
	name = "imaginary friend action figure"
	desc = "A toy that resembles a special friend."
	toysay = "I'll always be your best friend!"
	var/item_used

/obj/item/toy/figure/assistant/imaginary_friend/attack_self(mob/user as mob)
	// Check if already used
	if(item_used)
		// Warn user, then return
		to_chat(user, span_warning("[src] does nothing. It must be broken."))
		return

	// Check if human user exists
	if(!ishuman(user))
		// Warn user, then return
		to_chat(user, span_warning("You refrain from handling [src]."))
		return

	// Define human user
	var/mob/living/carbon/human/mirror_user = user

	// Add brain trauma
	mirror_user.gain_trauma(/datum/brain_trauma/special/imaginary_friend, TRAUMA_RESILIENCE_SURGERY)

	// Set item used variable
	// This prevents future use
	item_used = TRUE

	// Alert in local chat
	mirror_user.visible_message(span_warning("[mirror_user] plays with [src]."), span_warning("You start to remember [src], as if they were a real person!"))

	// Set flavor text
	name = "generic action figure"
	desc = "It\'s just a normal toy."
