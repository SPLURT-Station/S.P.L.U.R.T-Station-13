/obj/structure/closet/crate/coffin/examine(mob/user)
	. = ..()

	// Define carbon user
	var/mob/living/carbon/coffin_examinee

	// Check if carbon user exists
	if(!istype(coffin_examinee))
		return

	// Check for bloodfledge
	if(isbloodfledge(coffin_examinee))
		. += span_cult("As a Bloodsucker Fledgling; You can use coffins like this one to heal your wounds and escape from death.")

/obj/structure/closet/crate/coffin/after_close(mob/living/coffin_toucher)
	. = ..()

	// Iterate over carbon mobs inside
	for(var/mob/living/carbon/coffin_user in contents)
		// Check for bloodfledge
		if(isbloodfledge(coffin_user))
			// Check for synthetic
			if(coffin_user.mob_biotypes && (coffin_user.mob_biotypes & MOB_ROBOTIC))
				// Warn user and continue
				to_chat(coffin_user, span_warning("Your components don't respond to [src]'s sanguine connection! Regeneration will not be possible."))
				continue

			// Check if vampire ability is allowed
			if(!coffin_user.allow_vampiric_ability())
				to_chat(coffin_user, span_warning("[src] fails to form a connection with your body amidst the strong magical interference! Something is blocking your connection to the other-world!"))
				// Function already contains message
				continue

			// Define quirk entry
			var/datum/quirk/bloodfledge/quirk_target = locate() in coffin_user.roundstart_quirks

			// Start processing
			START_PROCESSING(SSquirks, quirk_target)

			// Alert user
			to_chat(coffin_user, span_nicegreen("[src] empowers your connection to the other-world, allowing your body to mend."))

/obj/structure/closet/crate/coffin/after_open(mob/living/coffin_toucher)
	. = ..()

	// Define turf
	var/turf/coffin_turf = get_turf(src)

	// Iterate over carbon mobs inside
	for(var/mob/living/carbon/coffin_user in coffin_turf.contents)
		// Check for bloodfledge
		if(isbloodfledge(coffin_user))
			// Define quirk entry
			var/datum/quirk/bloodfledge/quirk_target = locate() in coffin_user.roundstart_quirks

			// Stop processing
			STOP_PROCESSING(SSquirks, quirk_target)

			// Alert user
			to_chat(coffin_user, span_notice("[src] is no longer empowering you."))
