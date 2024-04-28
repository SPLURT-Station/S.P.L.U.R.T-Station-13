/datum/disease/qarbliss
	name = "Unnatural Sloth and Lust"
	stage_prob = 3
	max_stages = 7
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	cure_text = "Holy water or Semen."
	spread_text = "A fog of pink unholy energy"
	cures = list(/datum/reagent/water/holywater, /datum/reagent/consumable/semen)
	cure_chance = 5
	agent = "Unholy Forces"
	viable_mobtypes = list(/mob/living/carbon/human)
	disease_flags = CURABLE
	permeability_mod = 1
	severity = DISEASE_SEVERITY_MEDIUM
	var/bliss_stage_1 = FALSE
	var/bliss_stage_2 = FALSE

/datum/disease/qarbliss/cure()
	if(affected_mob)
		affected_mob.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY, "#1d2953")
		if(affected_mob.dna && affected_mob.dna.species)
			affected_mob.dna.species.handle_mutant_bodyparts(affected_mob)
			affected_mob.dna.species.handle_hair(affected_mob)
		SEND_SIGNAL(affected_mob, COMSIG_CLEAR_MOOD_EVENT, "qar_bliss")
	..()

/datum/disease/qarbliss/stage_act()
	if(prob(stage*2))
		if(prob(5))
			to_chat(affected_mob, span_revennotice("You feel [pick("hot and bothered", "horny", "lusty", "like you're in a rut", "the need to breed", "breedable", "slimy")]..."))
		if(stage > 1 && prob(20))
			affected_mob.confused += 5
		if(stage > 2 && prob(20))
			affected_mob.hallucination += 5
		if(stage > 3 && prob(20))
			affected_mob.drowsyness += 20
		affected_mob.adjustStaminaLoss(stage*10)
		new /obj/effect/temp_visual/revenant(affected_mob.loc)
	..() //So we don't increase a stage before applying the stage damage.
	switch(stage)
		if(2)
			if(prob(5))
				affected_mob.emote("blush")
		if(3)
			if(!bliss_stage_1)
				SEND_SIGNAL(affected_mob, COMSIG_ADD_MOOD_EVENT, "qar_bliss", /datum/mood_event/qareen_bliss)
				bliss_stage_1 = TRUE
			SEND_SIGNAL(affected_mob, COMSIG_MODIFY_SANITY, 0.12, SANITY_CRAZY)
			if(prob(5))
				affected_mob.emote(pick("blush","drool"))
		if(4)
			SEND_SIGNAL(affected_mob, COMSIG_MODIFY_SANITY, 0.18, SANITY_CRAZY)
			if(prob(5))
				affected_mob.emote(pick("blush","drool","moan"))
			affected_mob.add_quirk(/datum/quirk/cum_plus)
		if(5)
			if (bliss_stage_2 == FALSE)
				bliss_stage_2 = TRUE
				to_chat(affected_mob, span_revenbignotice("It's too much! Brain.. fried.."))
				if (ishuman(affected_mob))
					var/mob/living/carbon/human/H = affected_mob
					H.mob_climax(TRUE,"Bliss",src,TRUE)
				if(affected_mob.dna?.species)
					affected_mob.dna.species.handle_mutant_bodyparts(affected_mob,"#fff0ff")
					affected_mob.dna.species.handle_hair(affected_mob,"#da6eda")
				affected_mob.visible_message(span_warning("[affected_mob] looks utterly depraved."), span_revennotice("You suddenly feel like your skin is <i>tingling</i>..."))
				affected_mob.add_atom_colour("#ffdaf3", TEMPORARY_COLOUR_PRIORITY)
				new /obj/effect/temp_visual/revenant(affected_mob.loc)
				// addtimer(CALLBACK(src, PROC_REF(blessings)), 150)
		if(7)
			stage = 6
			if (ishuman(affected_mob))
				var/mob/living/carbon/human/H = affected_mob
				H.mob_climax(forced_climax=TRUE, cause="Bliss")
				if(prob(30))
					affected_mob.emote(pick("blush","drool","moan"))

/datum/disease/qarbliss/proc/blessings()
	if(QDELETED(affected_mob))
		return
	affected_mob.playsound_local(affected_mob, 'sound/effects/gib_step.ogg', 40, 1, -1)
	to_chat(affected_mob, span_revendanger("You sense the curse of a lustful ghost befall you..."))
