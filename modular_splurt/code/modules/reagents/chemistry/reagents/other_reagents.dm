/datum/reagent/consumable/semen/on_mob_add(mob/living/carbon/M)
	. = ..()

	// Check for D4C quirk
	if(HAS_TRAIT(M,TRAIT_DUMB_CUM))
		// Define quirk entry
		var/datum/quirk/dumb4cum/quirk_target = locate() in M.roundstart_quirks

		// Remove reset timer
		quirk_target.uncrave()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_add(mob/living/carbon/M)
	. = ..()

	// Check for D4C quirk
	if(HAS_TRAIT(M,TRAIT_DUMB_CUM))
		// Define quirk entry
		var/datum/quirk/dumb4cum/quirk_target = locate() in M.roundstart_quirks

		// Remove reset timer
		quirk_target.uncrave()

//incubus and succubus additions below
/datum/reagent/consumable/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(1)

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(0.5)

/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_INCUBUS))
		M.adjust_nutrition(1.5)

/datum/reagent/blood/reaction_mob(mob/living/carbon/M, method=TOUCH, reac_volume)
	. = ..()
	// Check if ingested
	if(method != INGEST)
		return

	// Check if blood data exists
	if(!data)
		// Log warning and return
		log_game("[M] attempted to ingest blood that had no data!")
		return

	// Check for Bloodfledge quirk
	if(HAS_TRAIT(M,TRAIT_BLOODFLEDGE))
		// Check for own blood
		if(data["donor"] == M)
			// Warn user and return
			to_chat(M, span_warning("You gain no nourishment from the familiar blood..."))
			return

		// Add nutrition reagent
		// Reduced to 50%
		M.reagents.add_reagent(/datum/reagent/consumable/notriment, reac_volume*0.5)

/datum/reagent/water/holywater/on_mob_life(mob/living/carbon/M)
	. = ..()
	// Makes holy water disgusting and hungering for bloodfledges
	// Directly antithetic to the effects of blood
	if(HAS_TRAIT(M,TRAIT_BLOODFLEDGE))
		M.adjust_disgust(2)
		M.adjust_nutrition(-6)

	// Cursed blood effect moved here
	if(HAS_TRAIT(M, TRAIT_CURSED_BLOOD))
		// Wait for stuttering, to match old effect
		if(!M.stuttering)
			return

		// Escape clause: 12% chance to continue
		if(!prob(12))
			return

		// Character speaks nonsense
		M.say(pick("Somebody help me...","Unshackle me please...","Anybody... I've had enough of this dream...","The night blocks all sight...","Oh, somebody, please..."), forced = "holy water")

		// Escape clause: 10% chance to continue
		if(!prob(10))
			return

		// Character has a seisure
		M.visible_message(span_danger("[M] starts having a seizure!"), span_userdanger("You have a seizure!"))
		M.Unconscious(120)
		to_chat(M, "<span class='cultlarge'>[pick("The moon is close. It will be a long hunt tonight.", "Ludwig, why have you forsaken me?", \
		"The night is near its end...", "Fear the blood...")]</span>")

		// Apply damage
		M.adjustToxLoss(1, 0)
		M.adjustFireLoss(1, 0)

		// Escape clause: 25% chance to continue
		if(!prob(25))
			return

		// Spontaneous combustion
		M.IgniteMob()

// This is used by 'alternative food' quirks
// It should not be used for any other purpose
/datum/reagent/consumable/notriment
	name = "Strange Nutriment"
	description = "An exotic form of nutriment produced by unusual digestive systems."
	reagent_state = SOLID
	nutriment_factor = 5					// From 4
	metabolization_rate = 1					// From 0.4
	max_nutrition = NUTRITION_LEVEL_FAT		// From INFINITY
	color = "#66552f" // rgb: 102, 85, 47

/datum/reagent/consumable/notriment/reaction_mob(mob/living/carbon/M, method=TOUCH, reac_volume)
	// Check if mob can process food
	if(!HAS_TRAIT(M, TRAIT_NO_PROCESS_FOOD))
		// Warn user
		to_chat(M, span_warning("Your body is incapable of processing the Strange Nutriment!"))

		// Remove reagent
		M.reagents.remove_reagent(/datum/reagent/consumable/notriment/, reac_volume)

		// Ignore this mob
		return

	// Return normally
	. = ..()

/datum/reagent/consumable/notriment/on_mob_life(mob/living/carbon/M)
	. = ..()

	// Add nutrition
	M.adjust_nutrition(nutriment_factor, max_nutrition)
