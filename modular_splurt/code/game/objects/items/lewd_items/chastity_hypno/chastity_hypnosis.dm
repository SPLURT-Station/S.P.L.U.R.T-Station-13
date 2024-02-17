/obj/item/chastity_hypno
	name = "Chastity Hypno"
	var/list/available_modes = list("None", "Impotent", "Edging-Only", "Disappointing-Orgasm", "Overstimulated", "Hyper-Sensitive")
	var/list/choices = list("Anus" = "None", "Breasts" = "None", "Penis" = "None", "Vagina" = "None")

/obj/item/chastity_hypno/proc/hypno(mob/target)
	if(!iscarbon(target) || !choices || !(target.client?.prefs.cit_toggles & HYPNO) || choices == initial(choices))
		return

	var/mob/living/carbon/C = target

	C.remove_chastity_hypno_effects()

	for(var/G in choices)
		if(choices[G] == "None")
			continue

		if(G == "Anus" && C.has_anus(REQUIRE_ANY))
			if(!C.dna.features["has_anus"])
				var/trait_flag
				switch(choices[G])
					if("Impotent")
						if(!(target.client?.prefs.cit_toggles & CHASTITY))
							continue

						trait_flag = TRAIT_IMPOTENT_ANUS
					if("Edging-Only")
						if(!(target.client?.prefs.cit_toggles & EDGING))
							continue

						trait_flag = TRAIT_EDGINGONLY_ANUS
					if("Disappointing-Orgasm")
						if(!(target.client?.prefs.cit_toggles & CHASTITY))
							continue

						trait_flag = TRAIT_DISAPPOINTING_ANUS
					if("Overstimulated")
						if(!(target.client?.prefs.cit_toggles & STIMULATION))
							continue

						trait_flag = TRAIT_OVERSTIM_ANUS
					if("Hyper-Sensitive")
						if(!(target.client?.prefs.cit_toggles & STIMULATION))
							continue

						trait_flag = TRAIT_HYPERSENS_ANUS

				ADD_TRAIT(C, trait_flag, ORGAN_TRAIT)
				to_chat(C, span_hypnophrase("Your anus is now <i>[lowertext(choices[G])]</i>."))
				continue

		var/obj/item/organ/genital/genital = C.getorganslot(lowertext(G))
		if(!genital)
			continue


		var/hypno_flag

		switch(choices[G])
			if("Impotent")
				if(!(target.client?.prefs.cit_toggles & CHASTITY))
					continue

				hypno_flag = GENITAL_IMPOTENT
				if(istype(genital, /obj/item/organ/genital/penis))
					genital.set_aroused_state(0, "impotence") //Pp goes wooon
			if("Edging-Only")
				if(!(target.client?.prefs.cit_toggles & EDGING))
					continue

				hypno_flag = GENITAL_EDGINGONLY
			if("Disappointing-Orgasm")
				if(!(target.client?.prefs.cit_toggles & CHASTITY))
					continue

				hypno_flag = GENITAL_DISAPPOINTING
			if("Overstimulated")
				if(!(target.client?.prefs.cit_toggles & STIMULATION))
					continue

				hypno_flag = GENITAL_OVERSTIM
			if("Hyper-Sensitive")
				if(!(target.client?.prefs.cit_toggles & STIMULATION))
					continue

				hypno_flag = GENITAL_HYPERSENS

		if(!hypno_flag)
			continue

		to_chat(C, span_hypnophrase("Your [lowertext(G)] is now <i>[lowertext(choices[G])]</i>."))

		var/obj/item/organ/genital/genital_organ = genital
		ENABLE_BITFIELD(genital_organ.genital_flags, hypno_flag)

	SEND_SIGNAL(C, COMSIG_ADD_MOOD_EVENT, "hypno", /datum/mood_event/hypnosis)
	choices = list("Anus" = "None", "Breasts" = "None", "Penis" = "None", "Vagina" = "None")

/mob/living/carbon/proc/remove_chastity_hypno_effects()
	var/datum/component/mood/mood_comp = GetComponent(/datum/component/mood)
	if(!("hypno" in mood_comp.mood_events))
		return

	if(HAS_TRAIT(src, TRAIT_IMPOTENT_ANUS))
		REMOVE_TRAIT(src, TRAIT_IMPOTENT_ANUS, ORGAN_TRAIT)
	else if(HAS_TRAIT(src, TRAIT_EDGINGONLY_ANUS))
		REMOVE_TRAIT(src, TRAIT_EDGINGONLY_ANUS, ORGAN_TRAIT)
	else if(HAS_TRAIT(src, TRAIT_DISAPPOINTING_ANUS))
		REMOVE_TRAIT(src, TRAIT_DISAPPOINTING_ANUS, ORGAN_TRAIT)
	else if(HAS_TRAIT(src, TRAIT_OVERSTIM_ANUS))
		REMOVE_TRAIT(src, TRAIT_OVERSTIM_ANUS, ORGAN_TRAIT)
	else if(HAS_TRAIT(src, TRAIT_HYPERSENS_ANUS))
		REMOVE_TRAIT(src, TRAIT_HYPERSENS_ANUS, ORGAN_TRAIT)

	for(var/obj/item/organ/genital/G in internal_organs)
		if(CHECK_BITFIELD(G.genital_flags, GENITAL_IMPOTENT))
			DISABLE_BITFIELD(G.genital_flags, GENITAL_IMPOTENT)
			continue
		if(CHECK_BITFIELD(G.genital_flags, GENITAL_EDGINGONLY))
			DISABLE_BITFIELD(G.genital_flags, GENITAL_EDGINGONLY)
			continue
		if(CHECK_BITFIELD(G.genital_flags, GENITAL_DISAPPOINTING))
			DISABLE_BITFIELD(G.genital_flags, GENITAL_DISAPPOINTING)
			continue
		if(CHECK_BITFIELD(G.genital_flags, GENITAL_OVERSTIM))
			DISABLE_BITFIELD(G.genital_flags, GENITAL_OVERSTIM)
			continue
		if(CHECK_BITFIELD(G.genital_flags, GENITAL_HYPERSENS))
			DISABLE_BITFIELD(G.genital_flags, GENITAL_HYPERSENS)
			continue

	SEND_SIGNAL(src, COMSIG_CLEAR_MOOD_EVENT, "hypno")

/obj/item/chastity_hypno/proc/save()
	if(!choices)
		return

/obj/item/chastity_hypno/ui_status(mob/user)
	if(can_interact(user))
		return ..()
	return UI_CLOSE

/obj/item/chastity_hypno/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GenitalArousalPermission", name)
		ui.open()

/obj/item/chastity_hypno/ui_data(mob/user)
	var/list/data = list()

	data["genitals"] = list()
	for(var/genital in choices)
		data["genitals"][genital] = choices[genital]

	return data

/obj/item/chastity_hypno/ui_act(action, list/params)
	. = ..()
	if(!ishuman(usr))
		return

	switch(action)
		if("change_mode")
			change_mode(params["genital"], params["direction"])
			. = TRUE
		if("save")
			save()
			. = TRUE

/obj/item/chastity_hypno/proc/change_mode(genital, direction)
	switch(direction)
		if("left")
			if(choices[genital] == LISTFIRST(available_modes))
				//choices[genital] = available_modes[length(available_modes)]
				choices[genital] = LISTLAST(available_modes)
			else
				choices[genital] = available_modes[LAZYFIND(available_modes, choices[genital]) - 1]
		if("right")
			if(choices[genital] == LISTLAST(available_modes))
				//choices[genital] = available_modes[1]
				choices[genital] = LISTFIRST(available_modes)
			else
				choices[genital] = available_modes[LAZYFIND(available_modes, choices[genital]) + 1]

/datum/reagent/medicine/mannitol/on_mob_metabolize(mob/living/carbon/C)
	var/datum/component/mood/mood_comp = C.GetComponent(/datum/component/mood)
	if(!("hypno" in mood_comp.mood_events))
		return ..()
	C.remove_chastity_hypno_effects()
	to_chat(C, span_warning("You manage to gain control over your genitals again."))
	. = ..()

/datum/mood_event/hypnosis
	description = span_hypnophrase("You don't feel like you're really in control of your body.\n")

/mob/living/carbon/verb/remove_chastity_hypnosis()
	set name = "Escape Chastity Hypnosis"
	set category = "OOC"

	remove_chastity_hypno_effects()
