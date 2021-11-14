/// Attempts to open the tgui menu
/mob/living/verb/interact_with()
	set name = "Interact With"
	set desc = "Perform an interaction with someone."
	set category = "IC"
	set src in view()

	if(!usr.mind) //Mindless boys, honestly just don't, it's better this way
		return
	if(!usr.mind.interaction_holder)
		usr.mind.interaction_holder = new(usr.mind)
	usr.mind.interaction_holder.target = src
	usr.mind.interaction_holder.ui_interact(usr)

/// Allows "cyborg" players to change gender at will
/mob/living/silicon/robot/verb/toggle_gender()
	set category = "IC"
	set name = "Set Gender"
	set desc = "Allows you to set your gender."

	if(stat != CONSCIOUS)
		to_chat(usr, "<span class='warning'>You cannot toggle your gender while unconcious!</span>")
		return

	var/choice = tgui_alert(usr, "Select Gender.", "Gender", list("Both", "Male", "Female"))
	switch(choice)
		if("Both")
			has_penis = TRUE
			has_vagina = TRUE
		if("Male")
			has_penis = TRUE
			has_vagina = FALSE
		if("Female")
			has_penis = FALSE
			has_vagina = TRUE

#define INTERACTION_NORMAL 0
#define INTERACTION_LEWD 1
#define INTERACTION_EXTREME 2

/datum/mind
	var/datum/interaction_menu/interaction_holder

/datum/mind/New(key)
	. = ..()
	interaction_holder = new(src)

/// The menu itself, only var is target which is the mob you are interacting with
/datum/interaction_menu
	var/mob/living/target

/datum/interaction_menu/ui_state(mob/user)
	return GLOB.conscious_state

/datum/interaction_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MobInteraction", "Interactions")
		ui.open()

/datum/interaction_menu/ui_data(mob/user)
	//Getting player
	var/mob/living/self = user
	var/list/data = list()
	//Getting info
	data["isTargetSelf"] = target == self
	data["interactingWith"] = target != self ? "Interacting with \the [target]..." : "Interacting with yourself..."
	data["selfAttributes"] = self.list_interaction_attributes(self)
	if(target != self)
		data["theirAttributes"] = target.list_interaction_attributes(self)

	//Getting interactions
	var/list/sent_interactions = list()
	for(var/interaction_key in SSinteractions.interactions)
		var/datum/interaction/I = SSinteractions.interactions[interaction_key]
		if(I.evaluate_user(self, action_check = FALSE) && I.evaluate_target(self, target))
			if(I.user_is_target == TRUE && target != self)
				continue
			var/list/interaction = list()
			interaction["key"] = I.command
			interaction["desc"] = I.description
			if(istype(I, /datum/interaction/lewd))
				var/datum/interaction/lewd/O = I
				if(O.extreme)
					interaction["type"] = INTERACTION_EXTREME
				else
					interaction["type"] = INTERACTION_LEWD
			else
				interaction["type"] = INTERACTION_NORMAL
			sent_interactions += list(interaction)
	data["interactions"] = sent_interactions

	//Get their genitals
	var/list/genitals = list()
	var/mob/living/carbon/get_genitals = self
	if(istype(get_genitals))
		for(var/obj/item/organ/genital/genital in get_genitals.internal_organs)	//Only get the genitals
			if(CHECK_BITFIELD(genital.genital_flags, GENITAL_INTERNAL))			//Not those though
				continue
			var/list/genital_entry = list()
			genital_entry["name"] = "[genital.name]" //Prevents code from adding a prefix
			genital_entry["key"] = REF(genital) //The key is the reference to the object
			var/visibility = "Invalid"
			if(CHECK_BITFIELD(genital.genital_flags, GENITAL_THROUGH_CLOTHES))
				visibility = "Always visible"
			else if(CHECK_BITFIELD(genital.genital_flags, GENITAL_UNDIES_HIDDEN))
				visibility = "Hidden by underwear"
			else if(CHECK_BITFIELD(genital.genital_flags, GENITAL_HIDDEN))
				visibility = "Always hidden"
			else
				visibility = "Hidden by clothes"
			genital_entry["visibility"] = visibility
			genitals += list(genital_entry)
	if(iscarbon(self))
		var/simulated_ass = list()
		simulated_ass["name"] = "anus"
		simulated_ass["key"] = "anus"
		var/visibility = "Invalid"
		switch(self.anus_exposed)
			if(1)
				visibility = "Always visible"
			if(0)
				visibility = "Hidden by underwear"
			else
				visibility = "Always hidden"
		simulated_ass["visibility"] = visibility
		genitals += list(simulated_ass)
	data["genitals"] = genitals

	var/datum/preferences/prefs = usr?.client.prefs
	if(prefs)

	//Getting preferences
		data["verb_consent"] = 		CHECK_BITFIELD(prefs.toggles, VERB_CONSENT)
		data["lewd_verb_sounds"] = 	!CHECK_BITFIELD(prefs.toggles, LEWD_VERB_SOUNDS)
		data["arousable"] = 		prefs.arousable
		data["genital_examine"] = 	CHECK_BITFIELD(prefs.cit_toggles, GENITAL_EXAMINE)
		data["vore_examine"] = 		CHECK_BITFIELD(prefs.cit_toggles, VORE_EXAMINE)
		data["medihound_sleeper"] = CHECK_BITFIELD(prefs.cit_toggles, MEDIHOUND_SLEEPER)
		data["eating_noises"] = 	CHECK_BITFIELD(prefs.cit_toggles, EATING_NOISES)
		data["digestion_noises"] =	CHECK_BITFIELD(prefs.cit_toggles, DIGESTION_NOISES)
		data["trash_forcefeed"] = 	CHECK_BITFIELD(prefs.cit_toggles, TRASH_FORCEFEED)
		data["forced_fem"] = 		CHECK_BITFIELD(prefs.cit_toggles, FORCED_FEM)
		data["forced_masc"] = 		CHECK_BITFIELD(prefs.cit_toggles, FORCED_MASC)
		data["hypno"] = 			CHECK_BITFIELD(prefs.cit_toggles, HYPNO)
		data["bimbofication"] = 	CHECK_BITFIELD(prefs.cit_toggles, BIMBOFICATION)
		data["breast_enlargement"] = CHECK_BITFIELD(prefs.cit_toggles, BREAST_ENLARGEMENT)
		data["penis_enlargement"] = CHECK_BITFIELD(prefs.cit_toggles, PENIS_ENLARGEMENT)
		data["never_hypno"] = 		!CHECK_BITFIELD(prefs.cit_toggles, NEVER_HYPNO)
		data["no_aphro"] = 			!CHECK_BITFIELD(prefs.cit_toggles, NO_APHRO)
		data["no_ass_slap"] = 		!CHECK_BITFIELD(prefs.cit_toggles, NO_ASS_SLAP)
		data["no_auto_wag"] = 		!CHECK_BITFIELD(prefs.cit_toggles, NO_AUTO_WAG)
		data["extreme_erp_verbs"] =	CHECK_BITFIELD(prefs.cit_toggles, EXTREME_ERP_VERBS)
		data["harmful_erp_verbs"] =	CHECK_BITFIELD(prefs.cit_toggles, HARMFUL_ERP_VERBS)
		data["vore_pref"] = 		CHECK_BITFIELD(prefs.cit_toggles, VORE)
		data["erp_pref"] = 			CHECK_BITFIELD(prefs.cit_toggles, ERP)
		data["noncon_pref"] = 		CHECK_BITFIELD(prefs.cit_toggles, NON_CON)

	return data

/datum/interaction_menu/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("interact")
			var/datum/interaction/o = SSinteractions.interactions[params["interaction"]]
			if(o)
				o.do_action(usr, target)
				return TRUE
			return FALSE
		if("genital")
			var/mob/living/carbon/self = usr
			if(params["genital"] == "anus")
				var/picked_visibility = tgui_input_list(usr, "Chose visibility setting", "Expose/Hide genitals", GLOB.genitals_visibility_toggles - GEN_VISIBLE_NO_CLOTHES)
				self.anus_toggle_visibility(picked_visibility)
				return TRUE
			var/obj/item/organ/genital/genital = locate(params["genital"], self.internal_organs)
			if(genital && (genital in self.internal_organs))
				var/picked_visibility = tgui_input_list(usr, "Choose visibility setting", "Expose/Hide genitals", GLOB.genitals_visibility_toggles)
				if(picked_visibility && genital && (genital in self.internal_organs))
					genital.toggle_visibility(picked_visibility)
					return TRUE
			else
				return FALSE
		if("char_pref")
			var/datum/preferences/prefs = usr.client.prefs
			switch(params["char_pref"])
				if("erp_pref")
					TOGGLE_BITFIELD(prefs.cit_toggles, ERP)
				if("noncon_pref")
					TOGGLE_BITFIELD(prefs.cit_toggles, NON_CON)
				if("vore_pref")
					TOGGLE_BITFIELD(prefs.cit_toggles, VORE)
				if("extreme_erp_verbs")
					TOGGLE_BITFIELD(prefs.cit_toggles, EXTREME_ERP_VERBS)
				if("harmful_erp_verbs")
					TOGGLE_BITFIELD(prefs.cit_toggles, HARMFUL_ERP_VERBS)
				else
					return FALSE
			prefs.save_character()
			return TRUE
		if("pref")
			var/datum/preferences/prefs = usr.client.prefs
			switch(params["pref"])
				if("verb_consent")
					TOGGLE_BITFIELD(prefs.toggles, VERB_CONSENT)
				if("lewd_verb_sounds")
					TOGGLE_BITFIELD(prefs.toggles, LEWD_VERB_SOUNDS)
				if("arousable")
					prefs.arousable = !prefs.arousable
				if("genital_examine")
					TOGGLE_BITFIELD(prefs.cit_toggles, GENITAL_EXAMINE)
				if("vore_examine")
					TOGGLE_BITFIELD(prefs.cit_toggles, VORE_EXAMINE)
				if("medihound_sleeper")
					TOGGLE_BITFIELD(prefs.cit_toggles, MEDIHOUND_SLEEPER)
				if("eating_noises")
					TOGGLE_BITFIELD(prefs.cit_toggles, EATING_NOISES)
				if("digestion_noises")
					TOGGLE_BITFIELD(prefs.cit_toggles, DIGESTION_NOISES)
				if("trash_forcefeed")
					TOGGLE_BITFIELD(prefs.cit_toggles, TRASH_FORCEFEED)
				if("forced_fem")
					TOGGLE_BITFIELD(prefs.cit_toggles, FORCED_FEM)
				if("forced_masc")
					TOGGLE_BITFIELD(prefs.cit_toggles, FORCED_MASC)
				if("hypno")
					TOGGLE_BITFIELD(prefs.cit_toggles, HYPNO)
				if("bimbofication")
					TOGGLE_BITFIELD(prefs.cit_toggles, BIMBOFICATION)
				if("breast_enlargement")
					TOGGLE_BITFIELD(prefs.cit_toggles, BREAST_ENLARGEMENT)
				if("penis_enlargement")
					TOGGLE_BITFIELD(prefs.cit_toggles, PENIS_ENLARGEMENT)
				if("never_hypno")
					TOGGLE_BITFIELD(prefs.cit_toggles, NEVER_HYPNO)
				if("no_aphro")
					TOGGLE_BITFIELD(prefs.cit_toggles, NO_APHRO)
				if("no_ass_slap")
					TOGGLE_BITFIELD(prefs.cit_toggles, NO_ASS_SLAP)
				if("no_auto_wag")
					TOGGLE_BITFIELD(prefs.cit_toggles, NO_AUTO_WAG)
				else
					return FALSE
			prefs.save_preferences()
			return TRUE

#undef INTERACTION_NORMAL
#undef INTERACTION_LEWD
#undef INTERACTION_EXTREME
