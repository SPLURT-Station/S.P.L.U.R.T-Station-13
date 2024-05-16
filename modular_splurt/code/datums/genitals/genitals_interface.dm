/// Attempts to open the tgui menu
/mob/living/carbon/verb/genital_menu()
	set name = "Genitals Menu"
	set desc = "Manage your genital, or someone else's."
	set category = "IC"
	set src in view(usr.client)

	if(!iscarbon(usr))
		return
	if(!usr.mind) //Mindless boys, honestly just don't, it's better this way
		return
	if(!usr.mind.genitals_menu_holder)
		usr.mind.genitals_menu_holder= new(usr.mind)

	usr.mind.genitals_menu_holder.target = src
	usr.mind.genitals_menu_holder.ui_interact(usr)

/datum/mind
	var/datum/genitals_menu/genitals_menu_holder

/datum/mind/New(key)
	. = ..()
	genitals_menu_holder = new(src)

/datum/genitals_menu
	var/mob/living/carbon/target

/datum/genitals_menu/ui_state(mob/user)
	return GLOB.conscious_state

/datum/genitals_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GenitalConfig", "Genitals")
		ui.open()

/datum/genitals_menu/ui_data(mob/user)
	. = ..()
	var/mob/living/carbon/genital_holder = target || user
	var/user_is_target = genital_holder == user
	.["istargetself"] = user_is_target
	if(!user_is_target)
		.["target_name"] = genital_holder.name
	var/list/genitals = list()
	for(var/obj/item/organ/genital/genital in genital_holder.internal_organs)	//Only get the genitals
		if(CHECK_BITFIELD(genital.genital_flags, GENITAL_INTERNAL))			//Not those though
			continue
		if(!(genital.is_exposed() || genital.always_accessible || user_is_target)) //Hidden for a reason
			continue

		var/list/genital_entry = list()
		genital_entry["img"] = icon2base64(getFlatIcon(genital, no_anim=TRUE))
		genital_entry["name"] = "[capitalize(genital.name)]" //Prevents code from adding a prefix
		genital_entry["key"] = REF(genital) //The key is the reference to the object

		genital_entry["description"] = genital.desc + "\n [genital.linked_organ ? "Linked organ: [genital.linked_organ.name]" : ""]"

		if(user_is_target)
			var/visibility = "Invalid"
			if(CHECK_BITFIELD(genital.genital_flags, GENITAL_THROUGH_CLOTHES))
				visibility = "Always visible"
			else if(CHECK_BITFIELD(genital.genital_flags, GENITAL_UNDIES_HIDDEN))
				visibility = "Hidden by underwear"
			else if(CHECK_BITFIELD(genital.genital_flags, GENITAL_HIDDEN))
				visibility = "Always hidden"
			else
				visibility = "Hidden by clothes"

			var/extras = "None"
			if(CHECK_BITFIELD(genital.genital_flags, GENITAL_CAN_STUFF))
				extras = "Allows egg stuffing"

			genital_entry["extras"] = extras
			genital_entry["visibility"] = visibility
			genital_entry["possible_choices"] = GLOB.genitals_visibility_toggles
			genital_entry["extra_choices"] = list(GEN_ALLOW_EGG_STUFFING)
			genital_entry["can_arouse"] = (
				!!CHECK_BITFIELD(genital.genital_flags, GENITAL_CAN_AROUSE) \
				&& !(HAS_TRAIT(genital_holder, TRAIT_PERMABONER) \
				|| HAS_TRAIT(genital_holder, TRAIT_NEVERBONER)))
			genital_entry["arousal_state"] = genital.aroused_state
			if(istype(genital, /obj/item/organ/genital/penis))
				var/obj/item/organ/genital/penis/peepee = genital
				genital_entry["max_size"] = peepee.max_length ? peepee.max_length : 0
				genital_entry["min_size"] = peepee.min_length ? peepee.min_length : 0
			else
				genital_entry["max_size"] = genital.max_size ? genital.max_size : 0
				genital_entry["min_size"] = genital.min_size ? genital.min_size : 0

		//fluids
		if(CHECK_BITFIELD(genital.genital_flags, GENITAL_FUID_PRODUCTION) || CHECK_BITFIELD(genital?.linked_organ?.genital_flags, GENITAL_FUID_PRODUCTION))
			var/fluids = genital.get_fluid_fraction()
			genital_entry["fluid"] = fluids

		//equipments
		if(genital.is_exposed())
			var/list/equipments = list()
			for(var/obj/equipment in genital.contents)
				var/list/equipment_entry = list()
				equipment_entry["name"] = equipment.name
				equipment_entry["key"] = REF(equipment)
				equipments += list(equipment_entry)
			genital_entry["possible_equipment_choices"] = GLOB.genitals_interactions
			genital_entry["equipments"] = equipments

		genitals += list(genital_entry)

	if(!genital_holder.getorganslot(ORGAN_SLOT_ANUS) && user_is_target)
		var/simulated_ass = list()
		simulated_ass["name"] = "Anus"
		simulated_ass["key"] = "anus"
		var/visibility = "Invalid"
		switch(genital_holder.anus_exposed)
			if(1)
				visibility = "Always visible"
			if(0)
				visibility = "Hidden by underwear"
			else
				visibility = "Always hidden"
		simulated_ass["visibility"] = visibility
		simulated_ass["possible_choices"] = GLOB.genitals_visibility_toggles - GEN_VISIBLE_NO_CLOTHES
		genitals += list(simulated_ass)
	.["genitals"] = genitals

/datum/genitals_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if(..())
		return
	switch(action)
		if("genital")
			var/mob/living/carbon/self = usr
			if(self != target)
				return FALSE
			if("visibility" in params)
				if(params["genital"] == "anus")
					self.anus_toggle_visibility(params["visibility"])
					return TRUE
				var/obj/item/organ/genital/genital = locate(params["genital"], self.internal_organs)
				if(genital && (genital in self.internal_organs))
					genital.toggle_visibility(params["visibility"])
					return TRUE
			if("set_arousal" in params)
				var/obj/item/organ/genital/genital = locate(params["genital"], self.internal_organs)
				if(!genital || (genital \
					&& (!CHECK_BITFIELD(genital.genital_flags, GENITAL_CAN_AROUSE) \
					|| HAS_TRAIT(self, TRAIT_PERMABONER) \
					|| HAS_TRAIT(self, TRAIT_NEVERBONER))))
					return FALSE
				var/original_state = genital.aroused_state
				genital.set_aroused_state(params["set_arousal"])// i'm not making it just `!aroused_state` because
				if(original_state != genital.aroused_state)		// someone just might port skyrat's new genitals
					to_chat(self, "<span class='userlove'>[genital.aroused_state ? genital.arousal_verb : genital.unarousal_verb].</span>")
					. = TRUE
				else
					to_chat(self, "<span class='userlove'>You can't make that genital [genital.aroused_state ? "unaroused" : "aroused"]!</span>")
					. = FALSE
				genital.update_appearance()
				if(ishuman(self))
					var/mob/living/carbon/human/human = self
					human.update_genitals()
				return
			if("max_size" in params)
				var/obj/item/organ/genital/genital = locate(params["genital"], self.internal_organs)
				if(!genital)
					return FALSE
				if(istype(genital, /obj/item/organ/genital/penis))
					var/obj/item/organ/genital/penis/peepee = genital
					if(params["max_size"])
						var/new_max_size = clamp(params["max_size"], peepee.length, INFINITY)
						peepee.max_length = new_max_size
					else
						peepee.max_length = 0
				else
					if(params["max_size"])
						var/new_max_size = clamp(params["max_size"], genital.size, INFINITY)
						genital.max_size = new_max_size
					else
						genital.max_size = 0
			if("min_size" in params)
				var/obj/item/organ/genital/genital = locate(params["genital"], self.internal_organs)
				if(!genital)
					return FALSE
				if(istype(genital, /obj/item/organ/genital/penis))
					var/obj/item/organ/genital/penis/peepee = genital
					var/new_min_size = clamp(params["min_size"], 0, peepee.length)
					peepee.min_length = new_min_size
				else
					var/new_min_size = clamp(params["min_size"], 0, genital.size)
					genital.min_size = new_min_size
			else
				return FALSE
		if("equipment")
			var/mob/living/carbon/actual_target = target || usr
			var/mob/living/carbon/self = usr
			if(get_dist(actual_target, self) > 1)
				to_chat(self, span_warning("You're too far away!"))
				return FALSE
			var/obj/item/organ/genital/genital = locate(params["genital"], actual_target.internal_organs)
			if(!(genital && (genital in actual_target.internal_organs)))
				return FALSE
			switch(params["equipment_action"])
				if("remove")
					var/obj/item/selected_item = locate(params["equipment"], genital.contents)
					if(selected_item)
						var/datum/component/genital_equipment/is_equipment = selected_item.GetComponent(/datum/component/genital_equipment)
						if(!is_equipment)
							return FALSE
						return is_equipment.remove_genital(genital, self)

				if("insert")
					var/obj/item/stuff = self.get_active_held_item()
					if(!istype(stuff))
						to_chat(self, span_warning("You need to hold an item to insert it!"))
						return FALSE
					var/datum/component/genital_equipment/is_equipment = stuff.GetComponent(/datum/component/genital_equipment)
					if(!is_equipment)
						to_chat(self, span_warning("You can't insert this item!"))
						return FALSE
					if(SEND_SIGNAL(actual_target, COMSIG_MOB_GENITAL_TRY_INSERTING, genital, self))
						return FALSE
					return is_equipment.insert_genital(genital, self)
