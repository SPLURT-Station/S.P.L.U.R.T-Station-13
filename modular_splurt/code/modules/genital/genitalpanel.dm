// Edited from: core/modules/vore/eating/vorepanel.dm
//
// Genital management panel for players
//

#define GENITAL_PANEL_CHANGES TRUE
#define GENITAL_PANEL_MID_CHANGES TRUE

GLOBAL_LIST_INIT(GENITAL_PANEL_MAPPINGS, list(
	"cock" = list("name" = "Cock", "slot" = ORGAN_SLOT_PENIS),
	"balls" = list("name" = "Balls", "slot" = ORGAN_SLOT_TESTICLES),
	"breasts" = list("name" = "Breasts", "slot" = ORGAN_SLOT_BREASTS),
	"vag" = list("name" = "Vagina", "slot" = ORGAN_SLOT_VAGINA),
	"butt" = list("name" = "Butt", "slot" = ORGAN_SLOT_BUTT),
	"belly" = list("name" = "Belly", "slot" = ORGAN_SLOT_BELLY)
))

/mob/living
	var/datum/genital_look/genitalPanel

/mob/living/proc/genitalPanel()
	set name = "Genitals Panel"
	set category = "IC"

	if(!genitalPanel)
		log_game("GENITAL: [src] ([type], \ref[src]) didn't have a genitalPanel and tried to use the verb.")
		genitalPanel = new(src)

	genitalPanel.ui_interact(src)

/mob/living/proc/updateGenitalsPanel()
	SStgui.update_uis(genitalPanel)

/datum/genital_look
	var/mob/living/carbon/host // Note, we do this in case we ever want to allow people to view others genital panels
	var/unsaved_changes = FALSE

/datum/genital_look/New(mob/living/new_host)
	if(istype(new_host))
		host = new_host
	. = ..()

/datum/genital_look/Destroy()
	host = null
	. = ..()

/datum/genital_look/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GenitalsPanel", "Genitals Panel")
		ui.open()

// This looks weird, but all tgui_host is used for is state checking
// So this allows us to use the self_state just fine.
/datum/genital_look/ui_host(mob/user)
	return host

// Note, in order to allow others to look at others genital panels, this state would need
// to be modified.
/datum/genital_look/ui_state(mob/user)
	return GLOB.ui_genitalspanel_state

/datum/genital_look/ui_data(mob/user)
	var/list/data = list()
	if(!host)
		return data

	var/list/genitals = list()
	var/list/selected_genital = null

	for(var/genital_type in GLOB.GENITAL_PANEL_MAPPINGS)
		var/list/genital = GLOB.GENITAL_PANEL_MAPPINGS[genital_type]
		var/obj/item/organ/genital/genital_organ = host.getorganslot(genital["slot"])
		var/list/genital_list = list(
			"active" = host.client.prefs.features["has_[genital_type]"],
			"selected" = genital_type == host.genital_selected,
			"type" = genital_type,
			"name" = genital["name"],
			"color" = host.client.prefs.features["[genital_type]_color"],
			"visibility" = host.client.prefs.features["[genital_type]_visibility"],
			"stuffing" = host.client.prefs.features["[genital_type]_stuffing"],
			"equipment" = list()
		)
		if(genital_organ != null)
			for(var/equipment_type in genital_organ.equipment)
				var/obj/item/equipment = genital_organ.equipment[equipment_type]
				LAZYADD(genital_list["equipment"], equipment.get_examine_string(host))
		if(genital_type == "cock" || genital_type == "balls" || genital_type == "breasts" || genital_type == "vag")
			genital_list["shape"] = host.client.prefs.features["[genital_type]_shape"]
		if(genital_type == "balls" || genital_type == "breasts" || genital_type == "butt" || genital_type == "belly")
			genital_list["size"] = host.client.prefs.features["[genital_type]_size"]
		if(genital_type == "balls" || genital_type == "breasts")
			genital_list["fluid"] = host.client.prefs.features["[genital_type]_fluid"]
		if(genital_type == "cock" || genital_type == "breasts" || genital_type == "butt" || genital_type == "belly")
			genital_list["growth_min"] = host.client.prefs.features["[genital_type]_growth_min"]
			if(genital_list["growth_min"] == null || genital_list["growth_min"] == -INFINITY)
				genital_list["growth_min"] = "Unset"
			genital_list["growth_max"] = host.client.prefs.features["[genital_type]_growth_max"]
			if(genital_list["growth_max"] == null || genital_list["growth_max"] == INFINITY)
				genital_list["growth_max"] = "Unset"
		switch(genital_type)
			if("cock")
				genital_list["length"] = host.client.prefs.features["cock_length"]
				genital_list["diameter_ratio"] = host.client.prefs.features["cock_diameter_ratio"]
			if("breasts")
				genital_list["producing"] = host.client.prefs.features["breasts_producing"]
			if("vag")
				genital_list["fluid"] = host.client.prefs.features["womb_fluid"]
				genital_list["womb"] = host.client.prefs.features["has_womb"]
		if(genital_type == "balls" || genital_type == "breasts" || genital_type == "vag")
			genital_list["volume"] = genital_organ ? genital_organ.get_fluid_volume() : 0
			genital_list["max_volume"] = genital_organ ? genital_organ.fluid_max_volume : 0
			var/datum/reagent/genital_fluid = find_reagent_object_from_type(genital_list["fluid"])
			if(genital_fluid && (genital_fluid in GLOB.genital_fluids_list))
				genital_list["fluid_name"] = genital_fluid.name

		genitals.Add(list(genital_list))
		if(genital_list["selected"])
			selected_genital = genital_list

	data["unsaved_changes"] = unsaved_changes
	data["selected"] = selected_genital
	data["genitals"] = genitals

	return data

/datum/genital_look/ui_act(action, params)
	if(..())
		return TRUE

	switch(action)
		if("genitalpick")
			host.genital_selected = params["genitalpick"]
			return TRUE
		if("changeattr")
			// if(!GENITAL_PANEL_CHANGES)
			// 	return
			var/list/genital_selected_list = GLOB.GENITAL_PANEL_MAPPINGS[host.genital_selected]
			var/genital_selected_type = host.genital_selected
			var/genital_selected_name = genital_selected_list["name"]
			switch(params["attr"])
				if("active")
					var/has_genital = "has_[genital_selected_type]"
					host.client.prefs.features[has_genital] = !host.client.prefs.features[has_genital]
					// Changes from /core/modules/client/preferences.dm:3181
					if(!host.client.prefs.features[has_genital])
						switch(genital_selected_type)
							if("cock")
								host.client.prefs.features["has_balls"] = FALSE
							if("breasts")
								host.client.prefs.features["breasts_producing"] = FALSE
							if("vag")
								host.client.prefs.features["has_womb"] = FALSE
				if("color")
					var/genital_color = "[genital_selected_type]_color"
					var/new_genital_color = input(host, "[genital_selected_name] color:", "Character Preference", "#" + host.client.prefs.features[genital_color]) as color|null
					if(new_genital_color)
						var/temp_hsv = RGBtoHSV(new_genital_color)
						if(new_genital_color == "#000000")
							host.client.prefs.features[genital_color] = host.client.prefs.pref_species.default_color
						else if(ReadHSV(temp_hsv)[3] >= ReadHSV(MINIMUM_MUTANT_COLOR)[3])
							host.client.prefs.features[genital_color] = sanitize_hexcolor(new_genital_color, 6)
						else
							to_chat(host, "<span class='danger'>Invalid color. Your color is not bright enough.</span>")
				if("visibility")
					var/genital_vis = "[genital_selected_type]_visibility"
					var/new_genital_vis = input(host, "[genital_selected_name] visibility:", "Character Preference") as null|anything in CONFIG_GET(keyed_list/safe_visibility_toggles)
					if(new_genital_vis)
						host.client.prefs.features[genital_vis] = new_genital_vis
				if("stuffing", "producing")
					var/genital_attr = "[genital_selected_type]_[params["attr"]]"
					host.client.prefs.features[genital_attr] = !host.client.prefs.features[genital_attr]
				if("growth_min", "growth_max")
					var/genital_growth = "[genital_selected_type]_[params["attr"]]"
					var/genital_growth_name = params["attr"] == "growth_min" ? "shrink" : "growth"
					if(genital_selected_type == "breasts")
						var/new_breasts_growth = input(host, "[genital_selected_name] [genital_growth_name] cap:", "Character Preference") as null|anything in CONFIG_GET(keyed_list/breasts_cups_prefs)
						if(new_breasts_growth != null)
							host.client.prefs.features[genital_growth] = new_breasts_growth
						return
					var/min_G = -INFINITY
					var/max_G = INFINITY
					switch(genital_selected_type)
						if("cock")
							min_G = COCK_SIZE_MIN
						if("butt")
							min_G = BUTT_SIZE_MIN
						if("belly")
							min_G = BELLY_SIZE_MIN
					var/new_genital_growth = input(host, "[genital_selected_name] [genital_growth_name] cap:", "Character Preference") as num|null
					if(new_genital_growth != null)
						host.client.prefs.features[genital_growth] = clamp(round(new_genital_growth), min_G, max_G)
				if("shape")
					var/genital_shape = "[genital_selected_type]_shape"
					var/new_genital_shape
					switch(genital_selected_type)
						if("cock")
							var/list/hockeys = list()
							if(host.client.can_have_part("taur"))
								var/datum/sprite_accessory/taur/T = GLOB.taur_list[host.client.prefs.features["taur"]]
								for(var/A in GLOB.cock_shapes_list)
									var/datum/sprite_accessory/penis/P = GLOB.cock_shapes_list[A]
									if(P.taur_icon && T.taur_mode & P.accepted_taurs)
										LAZYSET(hockeys, "[A] (Taur)", A)
							new_genital_shape = input(host, "[genital_selected_name] shape:", "Character Preference") as null|anything in (GLOB.cock_shapes_list + hockeys)
							if(new_genital_shape)
								host.client.prefs.features["cock_taur"] = FALSE
								if(hockeys[new_genital_shape])
									new_genital_shape = hockeys[new_genital_shape]
									host.client.prefs.features["cock_taur"] = TRUE
						if("balls")
							new_genital_shape = input(host, "[genital_selected_name] shape:", "Character Preference") as null|anything in GLOB.balls_shapes_list
						if("breasts")
							new_genital_shape = input(host, "[genital_selected_name] shape:", "Character Preference") as null|anything in GLOB.breasts_shapes_list
						if("vag")
							new_genital_shape = input(host, "[genital_selected_name] shape:", "Character Preference") as null|anything in GLOB.vagina_shapes_list
					if(new_genital_shape)
						host.client.prefs.features[genital_shape] = new_genital_shape
				if("size")
					var/genital_size = "[genital_selected_type]_size"
					switch(genital_selected_type)
						if("balls")
							var/min_B = BALLS_SIZE_MIN
							var/max_B = BALLS_SIZE_MAX
							var/new_genital_size = input(host, "[genital_selected_name] size ([min_B]-[max_B]):", "Character Preference") as num|null
							if(new_genital_size != null)
								host.client.prefs.features[genital_size] = clamp(round(new_genital_size), min_B, max_B)
						if("breasts")
							var/new_genital_size = input(host, "[genital_selected_name] size:", "Character Preference") as null|anything in CONFIG_GET(keyed_list/breasts_cups_prefs)
							if(new_genital_size != null)
								host.client.prefs.features[genital_size] = new_genital_size
						if("butt")
							var/min_B = CONFIG_GET(number/butt_min_size_prefs)
							var/max_B = CONFIG_GET(number/butt_max_size_prefs)
							var/new_genital_size = input(host, "[genital_selected_name] size ([min_B]-[max_B]):", "Character Preference") as num|null
							if(new_genital_size != null)
								host.client.prefs.features[genital_size] = clamp(round(new_genital_size), min_B, max_B)
						if("belly")
							var/min_B = CONFIG_GET(number/belly_min_size_prefs)
							var/max_B = CONFIG_GET(number/belly_max_size_prefs)
							var/new_genital_size = input(host, "[genital_selected_name] size ([min_B]-[max_B]):", "Character Preference") as num|null
							if(new_genital_size != null)
								host.client.prefs.features[genital_size] = clamp(round(new_genital_size), min_B, max_B)
				if("length")
					var/min_D = CONFIG_GET(number/penis_min_inches_prefs)
					var/max_D = CONFIG_GET(number/penis_max_inches_prefs)
					var/new_length = input(host, "Penis length in inches ([min_D]-[max_D]):\nReminder that your sprite size will affect this.", "Character Preference") as num|null
					if(new_length != null)
						host.client.prefs.features["cock_length"] = clamp(round(new_length), min_D, max_D)
				if("diameter_ratio")
					var/min_diameter_ratio = CONFIG_GET(number/diameter_ratio_min_size_prefs)
					var/max_diameter_ratio = CONFIG_GET(number/diameter_ratio_max_size_prefs)
					var/new_ratio = input(host, "Penis diameter ratio ([min_diameter_ratio]-[max_diameter_ratio]):\nReminder that your sprite size will affect this.", "Character Preference") as num|null
					if(new_ratio != null)
						host.client.prefs.features["cock_diameter_ratio"] = clamp(round(new_ratio, 0.01), min_diameter_ratio, max_diameter_ratio)
				if("womb")
					host.client.prefs.features["has_womb"] = !host.client.prefs.features["has_womb"]
				if("fluid")
					var/genital_fluid = "[genital_selected_type]_fluid"
					var/datum/reagent/new_genital_fluid
					var/list/full_options = list()
					LAZYADD(full_options, GLOB.genital_fluids_list)
					switch(genital_selected_type)
						if("balls")
							LAZYREMOVE(full_options, find_reagent_object_from_type(/datum/reagent/consumable/semen))
							full_options = list(find_reagent_object_from_type(/datum/reagent/consumable/semen)) + full_options
						if("breasts")
							LAZYREMOVE(full_options, find_reagent_object_from_type(/datum/reagent/consumable/milk))
							full_options = list(find_reagent_object_from_type(/datum/reagent/consumable/milk)) + full_options
						if("vag")
							genital_selected_name = "Womb"
							genital_fluid = "womb_fluid"
							LAZYREMOVE(full_options, find_reagent_object_from_type(/datum/reagent/consumable/semen/femcum))
							full_options = list(find_reagent_object_from_type(/datum/reagent/consumable/semen/femcum)) + full_options
					new_genital_fluid = tgui_input_list(host, "[genital_selected_name] fluid:", "Character Preference", full_options)
					if(new_genital_fluid)
						host.client.prefs.features[genital_fluid] = new_genital_fluid.type
			unsaved_changes = TRUE
			return TRUE
		if("saveprefs")
			// if(GENITAL_PANEL_MID_CHANGES)
			var/mob/living/carbon/human/human_host = host
			// TODO: not sure if this is the best way (taken from /code/modules/client/preferences.dm:3824)
			human_host.dna.features = human_host.client.prefs.features.Copy()
			human_host.dna.features["lust_tolerance"] = human_host.client.prefs.lust_tolerance
			human_host.dna.features["sexual_potency"] = human_host.client.prefs.sexual_potency
			SEND_SIGNAL(human_host, COMSIG_HUMAN_PREFS_COPIED_TO, human_host.client.prefs, TRUE, FALSE)

			human_host.give_genitals(TRUE)
			// else
			// 	to_chat(host, "<span class='warning'>Mid round changes are not allowed! Changes will be applied next round.</span>")

			host.client.prefs.save_character()
			unsaved_changes = FALSE
			return TRUE
