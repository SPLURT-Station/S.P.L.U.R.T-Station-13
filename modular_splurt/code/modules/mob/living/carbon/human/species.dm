/datum/species
	var/icon_accessories
	var/icon_back
	var/icon_belt
	var/icon_ears
	var/icon_eyes
	var/icon_feet
	var/icon_feet64
	var/icon_hands
	var/icon_head
	var/icon_mask
	var/icon_neck
	var/icon_suit
	var/icon_uniform

	/// If set to true, will force it into the roundstart races list regardless of what the config says (config file bloat prevention)
	var/roundstart = FALSE

	var/rotate_on_lying = TRUE
	/// The icon file to use if your species has a non-humanoid body. (FERAL species trait)
	var/simple_icon
	/// The width of the simple_icon file. Used to auto-center your sprite.
	var/simple_icon_width = 32
	/// This is appended to the end of the "id" variable in order to set the DEAD icon state of species that use the simple_icon
	var/icon_dead_suffix
	/// This is appended to the end of the "id" variable in order to set the RESTING/PRONE icon state of species that use the simple_icon
	var/icon_rest_suffix


/datum/species/althelp(mob/living/carbon/human/user, mob/living/carbon/human/target, datum/martial_art/attacker_style)
	if(user == target && istype(user))
		if(HAS_TRAIT(user, TRAIT_FLOORED))
			to_chat(user, span_warning("You can't seem to force yourself up right now!"))
			return
	. = ..()

/datum/species/handle_thirst(mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOTHIRST))
		return

	// A lot of this is just copied and pasted from the handle_digestion proc
	if (H.thirst > 0 && H.stat != DEAD && !HAS_TRAIT(H, TRAIT_NOTHIRST))
		// THEY ~~HUNGER~~ THIRST
		var/thirst_rate = THIRST_FACTOR
		/*
		var/datum/component/mood/mood = H.GetComponent(/datum/component/mood)
		if(mood && mood.sanity > SANITY_DISTURBED)
			thirst_rate *= max(0.5, 1 - 0.002 * mood.sanity) //0.85 to 0.75

		// Whether we cap off our satiety or move it towards 0
		if(H.satiety > MAX_SATIETY)
			H.satiety = MAX_SATIETY
		else if(H.satiety > 0)
			H.satiety--
		else if(H.satiety < -MAX_SATIETY)
			H.satiety = -MAX_SATIETY
		else if(H.satiety < 0)
			H.satiety++
			if(prob(round(-H.satiety/40)))
				H.Jitter(5)
			thirst_rate = 3 * THIRST_FACTOR
		*/
		thirst_rate *= H.physiology.thirst_mod
		H.adjust_thirst(-thirst_rate)

/datum/species/handle_mutations_and_radiation(mob/living/carbon/human/H)
	//Note: In the future, we should probably make radfiend assign TRAIT_RADIMMUME, but this is a good balancing aspect for now.
	if(HAS_TRAIT(H, TRAIT_RAD_FIEND)) //Note. Due to how radiation code works, this does not provide FULL immunity.
		// Return without effects
		return TRUE

	. = ..()
