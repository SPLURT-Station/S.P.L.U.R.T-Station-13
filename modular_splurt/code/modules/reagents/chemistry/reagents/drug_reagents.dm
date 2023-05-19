#define QUIRK_ESTROUS_ACTIVE /datum/quirk/estrous_active

// Hexacrocin
/datum/reagent/drug/aphrodisiacplus/overdose_start(mob/living/M)
	. = ..()

	// Check for mob with client
	if(!(istype(M) && M.client))
		return

	// Check pref for arousable
	if(!M.client?.prefs.arousable)
		// Log interaction and return
		M.log_message("overdosed on [src], but ignored it due to arousal preference.", LOG_EMOTE)
		return

	// Check pref for aphro
	if(M.client?.prefs.cit_toggles & NO_APHRO)
		// Log interaction and return
		M.log_message("overdosed on [src], but ignored it due to aphrodisiac preference.", LOG_EMOTE)
		return

	// Check for pre-existing heat trait
	if(!M.has_quirk(QUIRK_ESTROUS_ACTIVE))
		// Add quirk
		M.add_quirk(QUIRK_ESTROUS_ACTIVE, APHRO_TRAIT)

		// Chat message is handled by the quirk

		// Log interaction
		M.log_message("was given the In Estrous quirk by [src] overdose.", LOG_EMOTE)

	// Return normally
	. = ..()

// Hexacamphor
/datum/reagent/drug/anaphrodisiacplus/overdose_start(mob/living/M)
	. = ..()

	// Check for mob with client
	if(!(istype(M) && M.client))
		return

	// Check pref for arousable
	if(!M.client?.prefs.arousable)
		// Log interaction and return
		M.log_message("overdosed on [src], but ignored it due to arousal preference.", LOG_EMOTE)
		return

	// Check for pre-existing heat trait
	if(M.has_quirk(QUIRK_ESTROUS_ACTIVE))
		// Remove quirk
		M.remove_quirk(QUIRK_ESTROUS_ACTIVE)

		// Chat message is handled by the quirk

		// Log interaction
		M.log_message("lost the In Estrous quirk due to [src] overdose.", LOG_EMOTE)

//Own stuff
/datum/reagent/drug/maint/tar
	name = "Maintenance Tar"
	description = "An unknown tar that you most likely gotten from an assistant, a bored chemist... or cooked yourself."
	reagent_state = LIQUID
	color = "#000000"
	overdose_threshold = 30

/datum/reagent/drug/maint/tar/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()

	M.AdjustStun(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustKnockdown(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustUnconscious(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustParalyzed(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustImmobilized(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, 1.5 * REAGENTS_EFFECT_MULTIPLIER * delta_time)

/datum/reagent/drug/maint/tar/overdose_process(mob/living/M, delta_time, times_fired)
	. = ..()

	M.adjustToxLoss(5 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, 3 * REAGENTS_EFFECT_MULTIPLIER * delta_time)

/datum/reagent/drug/copium
	name = "Copium"
	description = "Cope and sssethe"
	taste_description = "coping"
	color = "#0f0"
	overdose_threshold = 30
	gas = GAS_COPIUM
	value = REAGENT_VALUE_GLORIOUS

// Variant of Copium created by genital fluids
/datum/reagent/drug/copium/gfluid
	value = REAGENT_VALUE_COMMON

/datum/reagent/drug/copium/on_mob_life(mob/living/carbon/M)
	. = ..()

	if (!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	if (prob(10))
		to_chat(H, span_notice("You feel like you can cope!"))
		H.adjust_disgust(-10)
		SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "copium", /datum/mood_event/cope, name)
	. = 1

/datum/reagent/drug/copium/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("What the fuck."))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/copium/overdose_process(mob/living/M)
	var/mob/living/carbon/human/H = M
	if (prob(5))
		H.adjust_disgust(20)
		to_chat(H, span_warning("I can't stand it anymore!"))
	..()

/datum/reagent/drug/copium/reaction_obj(obj/O, volume)
	if ((!O) || (!volume))
		return 0
	var/temp = holder ? holder.chem_temp : T20C
	O.atmos_spawn_air("copium=[volume];TEMP=[temp]")

/datum/reagent/drug/reaction_turf(turf/open/T, volume)
	if (istype(T))
		var/temp = holder ? holder.chem_temp : T20C
		T.atmos_spawn_air("copium=[volume];TEMP=[temp]")
	return

#undef QUIRK_ESTROUS_ACTIVE
