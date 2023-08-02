/obj/item/reagent_containers/spray/chemsprayer/sleeper
	list_reagents = list(/datum/reagent/toxin/sodium_thiopental = 100, /datum/reagent/consumable/condensedcapsaicin = 100, /datum/reagent/toxin/chloralhydrate = 100)

/obj/item/reagent_containers/spray/plushmium
	name = "\improper Love to Life spray bottle"
	desc = "A toy spray bottle marked with the Donk Co. Stuffing For Spessmen branding. Must be applied directly to a plush, and only contains enough for one."
	icon_state = "cleaner_drying"
	// Single use item!
	volume = 5
	spray_range = 1
	can_fill_from_container = FALSE
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5)
	list_reagents = list(/datum/reagent/fermi/plushmium = 5)

// Custom interaction to prevent wasting the item
/obj/item/reagent_containers/spray/plushmium/afterattack(atom/target, mob/user)
	// Check for plush toy
	if(!istype(target, /obj/item/toy/plush))
		// Alert user and return
		to_chat(user, span_warning("You don't want to waste the solution on a non-plushie."))
		return

	// Return normally
	. = ..()

/obj/item/reagent_containers/spray/ultimate
	name = "ultimate spray bottle"
	desc = "A bottle to spray above them all."
	volume = 750
	amount_per_transfer_from_this = 2
	current_range = 5
	spray_range = 5
	stream_range = 5
	stream_amount = 2
	icon = 'modular_splurt/icons/obj/janitor.dmi'
	icon_state = "cleaneralien"
	item_state = "cleaneralien"
	custom_materials = list(/datum/material/iron = 2250, /datum/material/glass = 2250, /datum/material/plasma = 2250, /datum/material/diamond = 370, /datum/material/bluespace = 370)
