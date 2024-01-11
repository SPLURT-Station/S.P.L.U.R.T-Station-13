#define APPEARANCE_CATEGORY_COLUMN "<td valign='top' width='17%'>"
#define MAX_MUTANT_ROWS 5
#define GFLUID_ETHANOL_POWER_LIMIT 80
#define GFLUID_RARITY_LIMIT REAGENT_VALUE_RARE

/datum/preferences
	max_save_slots = DEFAULT_SAVE_SLOTS
	var/unholypref = "No" //Goin 2 hell fo dis one
	var/stomppref = TRUE // Please step on me.
	var/list/gfluid_blacklist = list() //Stuff you don't want people to cum into you
	var/new_character_creator = TRUE // old/new character creator
	var/show_in_directory = 1	//Show in Character Directory
	var/directory_tag = "Unset" //Sorting tag to use in character directory
	var/directory_erptag = "Unset"	//ditto, but for non-vore scenes
	var/directory_ad = ""		//Advertisement stuff to show in character directory.
	var/fuzzy = FALSE			//Fuzzy scaling

/datum/preferences/New(client/C)
	// Check if readable fluids list exists
	// Please move this check a better location if possible
	if(!GLOB.genital_fluids_list)
		// Build list
		build_genital_fluids_list()

	//Extra saves for donators
	max_save_slots = CONFIG_GET(number/base_save_slots)
	if(istype(C))
		var/extra_slots = 0
		if(IS_CKEY_DONATOR_GROUP(C.key, DONATOR_GROUP_TIER_3))
			extra_slots = 30
		else if(IS_CKEY_DONATOR_GROUP(C.key, DONATOR_GROUP_TIER_2))
			extra_slots = 20
		else if(IS_CKEY_DONATOR_GROUP(C.key, DONATOR_GROUP_TIER_1))
			extra_slots = 10
		max_save_slots = max_save_slots + extra_slots

	. = ..()

/datum/preferences/copy_to(mob/living/carbon/human/character, icon_updates, roundstart_checks, initial_spawn)
	character.fuzzy = fuzzy
	. = ..()

/datum/preferences/ShowChoices(mob/user)
	//check if the player wants to use the new character creation menu
	if(new_character_creator)
		return ..()

	//Use the old character creation menu
	if(!user || !user.client)
		return
	update_preview_icon(current_tab)
	var/list/dat = list("<center>")

	dat += "<a href='?_src_=prefs;preference=tab;tab=[SETTINGS_TAB]' [current_tab == SETTINGS_TAB ? "class='linkOn'" : ""]>Character Settings</a>"
	dat += "<a href='?_src_=prefs;preference=tab;tab=[APPEARANCE_TAB]' [current_tab == APPEARANCE_TAB ? "class='linkOn'" : ""]>Character Appearance</a>"
	dat += "<a href='?_src_=prefs;preference=tab;tab=[SPEECH_TAB]' [current_tab == SPEECH_TAB ? "class='linkOn'" : ""]>Character Speech</a>"
	dat += "<a href='?_src_=prefs;preference=tab;tab=[LOADOUT_TAB]' [current_tab == LOADOUT_TAB ? "class='linkOn'" : ""]>Loadout</a>"
	dat += "<a href='?_src_=prefs;preference=tab;tab=[GAME_PREFERENCES_TAB]' [current_tab == GAME_PREFERENCES_TAB ? "class='linkOn'" : ""]>Game Preferences</a>"
	dat += "<a href='?_src_=prefs;preference=tab;tab=[CONTENT_PREFERENCES_TAB]' [current_tab == CONTENT_PREFERENCES_TAB ? "class='linkOn'" : ""]>Content Preferences</a>"
	dat += "<a href='?_src_=prefs;preference=tab;tab=[KEYBINDINGS_TAB_OLD]' [current_tab == KEYBINDINGS_TAB_OLD ? "class='linkOn'" : ""]>Keybindings</a>"

	if(!path)
		dat += "<div class='notice'>Please create an account to save your preferences</div>"

	dat += "</center>"

	dat += "<HR>"

	switch(current_tab)
		if(SETTINGS_TAB) // Character Settings#
			if(path)
				var/savefile/S = new /savefile(path)
				if(S)
					dat += "<center>"
					var/name
					var/unspaced_slots = 0
					for(var/i=1, i<=max_save_slots, i++)
						unspaced_slots++
						if(unspaced_slots > 4)
							dat += "<br>"
							unspaced_slots = 0
						S.cd = "/character[i]"
						S["real_name"] >> name
						if(!name)
							name = "Character[i]"
						dat += "<a style='white-space:nowrap;' href='?_src_=prefs;preference=changeslot;num=[i];' [i == default_slot ? "class='linkOn'" : ""]>[name]</a> "
					dat += "</center>"

			dat += "<center><h2>Occupation Choices</h2>"
			dat += "<a href='?_src_=prefs;preference=job;task=menu'>Set Occupation Preferences</a><br></center>"
			if(CONFIG_GET(flag/roundstart_traits))
				dat += "<center><h2>Quirk Setup</h2>"
				dat += "<a href='?_src_=prefs;preference=trait;task=menu'>Configure Quirks</a><br></center>"
				dat += "<center><b>Current Quirks:</b> [all_quirks.len ? all_quirks.Join(", ") : "None"]</center>"
			dat += "<h2>Identity</h2>"
			dat += "<table width='100%'><tr><td width='75%' valign='top'>"
			if(jobban_isbanned(user, "appearance"))
				dat += "<b>You are banned from using custom names and appearances. You can continue to adjust your characters, but you will be randomised once you join the game.</b><br>"
			dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=name;task=random'>Random Name</A> "
			dat += "<b>Always Random Name:</b><a style='display:block;width:30px' href='?_src_=prefs;preference=name'>[be_random_name ? "Yes" : "No"]</a><BR>"

			dat += "<b>[nameless ? "Default designation" : "Name"]:</b>"
			dat += "<a href='?_src_=prefs;preference=name;task=input'>[real_name]</a><BR>"
			dat += "<a href='?_src_=prefs;preference=nameless'>Be nameless: [nameless ? "Yes" : "No"]</a><BR>"

			dat += "<b>Gender:</b> <a href='?_src_=prefs;preference=gender;task=input'>[gender == MALE ? "Male" : (gender == FEMALE ? "Female" : (gender == PLURAL ? "Non-binary" : "Object"))]</a><BR>"
			dat += "<b>Age:</b> <a style='display:block;width:30px' href='?_src_=prefs;preference=age;task=input'>[age]</a><BR>"

			dat += "<b>Special Names:</b><BR>"
			var/old_group
			for(var/custom_name_id in GLOB.preferences_custom_names)
				var/namedata = GLOB.preferences_custom_names[custom_name_id]
				if(!old_group)
					old_group = namedata["group"]
				else if(old_group != namedata["group"])
					old_group = namedata["group"]
					dat += "<br>"
				dat += "<a href ='?_src_=prefs;preference=[custom_name_id];task=input'><b>[namedata["pref_name"]]:</b> [custom_names[custom_name_id]]</a> "
			dat += "<br><br>"

			dat += "<b>Custom job preferences:</b><BR>"
			dat += "<a href='?_src_=prefs;preference=ai_core_icon;task=input'><b>Preferred AI Core Display:</b> [preferred_ai_core_display]</a><br>"
			dat += "<a href='?_src_=prefs;preference=sec_dept;task=input'><b>Preferred Security Department:</b> [prefered_security_department]</a><BR></td>"
			dat += "<br><a href='?_src_=prefs;preference=hide_ckey;task=input'><b>Hide ckey: [hide_ckey ? "Enabled" : "Disabled"]</b></a><br>"
			dat += "</tr></table>"

		//Character Appearance
		if(APPEARANCE_TAB)
			if(path)
				var/savefile/S = new /savefile(path)
				if(S)
					dat += "<center>"
					var/name
					var/unspaced_slots = 0
					for(var/i=1, i<=max_save_slots, i++)
						unspaced_slots++
						if(unspaced_slots > 4)
							dat += "<br>"
							unspaced_slots = 0
						S.cd = "/character[i]"
						S["real_name"] >> name
						if(!name)
							name = "Character[i]"
						dat += "<a style='white-space:nowrap;' href='?_src_=prefs;preference=changeslot;num=[i];' [i == default_slot ? "class='linkOn'" : ""]>[name]</a> "
					dat += "</center>"

			dat += "<table><tr><td width='20%' height='300px' valign='top'>"
			dat += "<h2>Flavor Text</h2>"
			dat += "<a href='?_src_=prefs;preference=flavor_text;task=input'><b>Set Examine Text</b></a><br>"
			if(length(features["flavor_text"]) <= MAX_FLAVOR_PREVIEW_LEN)
				if(!length(features["flavor_text"]))
					dat += "\[...\]<BR>" //skyrat - adds <br> //come to brazil or brazil comes to you
				else
					dat += "[html_encode(features["flavor_text"])]<BR>" //skyrat - adds <br> and uses html_encode
			else
				dat += "[TextPreview(html_encode(features["flavor_text"]))]...<BR>" //skyrat edit, uses html_encode
			//SPLURT edit - naked flavor text
			dat += "<h2>Naked Flavor Text</h2>"
			dat += "<a href='?_src_=prefs;preference=naked_flavor_text;task=input'><b>Set Naked Examine Text</b></a><br>"
			if(length(features["naked_flavor_text"]) <= 40)
				if(!length(features["naked_flavor_text"]))
					dat += "\[...\]<BR>"
				else
					dat += "[html_encode(features["naked_flavor_text"])]<BR>"
			else
				dat += "[TextPreview(html_encode(features["naked_flavor_text"]))]...<BR>"
			//SPLURT edit end
			dat += "<h2>Silicon Flavor Text</h2>"
			dat += "<a href='?_src_=prefs;preference=silicon_flavor_text;task=input'><b>Set Silicon Examine Text</b></a><br>"
			if(length(features["silicon_flavor_text"]) <= MAX_FLAVOR_PREVIEW_LEN)
				if(!length(features["silicon_flavor_text"]))
					dat += "\[...\]<BR>"
				else
					dat += "[features["silicon_flavor_text"]]<BR>"
			else
				dat += "[TextPreview(features["silicon_flavor_text"])]...<BR>"
			dat += "<h2>OOC notes</h2>"
			dat += "<a href='?_src_=prefs;preference=ooc_notes;task=input'><b>Set OOC notes</b></a><br>"
			var/ooc_notes_len = length(features["ooc_notes"])
			if(ooc_notes_len <= MAX_FLAVOR_PREVIEW_LEN)
				if(!ooc_notes_len)
					dat += "\[...\]<BR>"
				else
					dat += "[features["ooc_notes"]]<BR>"
			else
				dat += "[TextPreview(features["ooc_notes"])]...<BR>"
			//SPLURT EDIT
			dat += "<h2>Headshot Image</h2>"
			dat += "<a href='?_src_=prefs;preference=headshot'><b>Set Headshot Image</b></a><br>"
			if(features["headshot_link"])
				dat += "<img src='[features["headshot_link"]]' width='160px' height='120px'>"
			dat += "<br><br>"
			//SPLURT EDIT END
			//SKYRAT EDIT
			dat += 	"ERP : <a href='?_src_=prefs;preference=erp_pref'>[erppref]</a><br>"
			dat += 	"Non-Con : <a href='?_src_=prefs;preference=noncon_pref'>[nonconpref]</a><br>"
			dat += 	"Vore : <a href='?_src_=prefs;preference=vore_pref'>[vorepref]</a><br>"
			//END OF SKYRAT EDIT

			dat += "<h2>Records</h2><br>"
			dat += "<a href='?_src_=prefs;preference=security_records;task=input'><b>Security Records</b></a><br>"
			if(length_char(security_records) <= 40)
				if(!length(security_records))
					dat += "\[...\]"
				else
					dat += "[security_records]"
			else
				dat += "[TextPreview(security_records)]...<BR>"

			dat += "<br><a href='?_src_=prefs;preference=medical_records;task=input'><b>Medical Records</b></a><br>"
			if(length_char(medical_records) <= 40)
				if(!length(medical_records))
					dat += "\[...\]<br>"
				else
					dat += "[medical_records]"
			else
				dat += "[TextPreview(medical_records)]...<BR>"

			dat += APPEARANCE_CATEGORY_COLUMN //body moves right sandstorm change

			dat += "<h2>Body</h2>"
			dat += "<b>Gender:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=gender;task=input'>[gender == MALE ? "Male" : (gender == FEMALE ? "Female" : (gender == PLURAL ? "Non-binary" : "Object"))]</a><BR>"
			if(pref_species.sexes)
				dat += "<b>Body Model:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=body_model'>[features["body_model"] == MALE ? "Masculine" : "Feminine"]</a><BR>"
			dat += "<b>Limb Modification:</b><BR>"
			dat += "<a href='?_src_=prefs;preference=modify_limbs;task=input'>Modify Limbs</a><BR>"
			for(var/modification in modified_limbs)
				if(modified_limbs[modification][1] == LOADOUT_LIMB_PROSTHETIC)
					dat += "<b>[modification]: [modified_limbs[modification][2]]</b><BR>"
				else
					dat += "<b>[modification]: [modified_limbs[modification][1]]</b><BR>"
			dat += "<BR>"
			dat += "<b>Species:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=species;task=input'>[pref_species.name]</a><BR>"
			dat += "<b>Custom Species Name:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=custom_species;task=input'>[custom_species ? custom_species : "None"]</a><BR>"
			dat += "<b>Random Body:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=all;task=random'>Randomize!</A><BR>"
			dat += "<b>Always Random Body:</b><a href='?_src_=prefs;preference=all'>[be_random_body ? "Yes" : "No"]</A><BR>"
			dat += "<br><b>Cycle background:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=cycle_bg;task=input'>[bgstate]</a><BR>"

			dat += "</td>" //body moves right sandstorm change

			var/use_skintones = pref_species.use_skintones
			if(use_skintones)
				dat += APPEARANCE_CATEGORY_COLUMN

				dat += "<h3>Skin Tone</h3>"

				dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=s_tone;task=input'>[use_custom_skin_tone ? "custom: <span style='border:1px solid #161616; background-color: [skin_tone];'><font color='[color_hex2num(skin_tone) < 200 ? "FFFFFF" : "000000"]'>[skin_tone]</font></span>" : skin_tone]</a><BR>"

			var/mutant_colors
			if((MUTCOLORS in pref_species.species_traits) || (MUTCOLORS_PARTSONLY in pref_species.species_traits))
				if(!use_skintones)
					dat += APPEARANCE_CATEGORY_COLUMN

				dat += "<h3>Advanced Coloring</h3>"
				dat += "</b><a style='display:block;width:100px' href='?_src_=prefs;preference=color_scheme;task=input'>[(features["color_scheme"] == ADVANCED_CHARACTER_COLORING) ? "Enabled" : "Disabled"]</a>"

				dat += "<h2>Body Colors</h2>"

				dat += "<b>Primary Color:</b><BR>"
				dat += "<span style='border: 1px solid #161616; background-color: #[features["mcolor"]];'><font color='[color_hex2num(features["mcolor"]) < 200 ? "FFFFFF" : "000000"]'>#[features["mcolor"]]</font></span> <a href='?_src_=prefs;preference=mutant_color;task=input'>Change</a><BR>"

				dat += "<b>Secondary Color:</b><BR>"
				dat += "<span style='border: 1px solid #161616; background-color: #[features["mcolor2"]];'><font color='[color_hex2num(features["mcolor2"]) < 200 ? "FFFFFF" : "000000"]'>#[features["mcolor2"]]</font></span> <a href='?_src_=prefs;preference=mutant_color2;task=input'>Change</a><BR>"

				dat += "<b>Tertiary Color:</b><BR>"
				dat += "<span style='border: 1px solid #161616; background-color: #[features["mcolor3"]];'><font color='[color_hex2num(features["mcolor3"]) < 200 ? "FFFFFF" : "000000"]'>#[features["mcolor3"]]</font></span> <a href='?_src_=prefs;preference=mutant_color3;task=input'>Change</a><BR>"
				mutant_colors = TRUE

				dat += "<b>Sprite Size:</b> <a href='?_src_=prefs;preference=body_size;task=input'>[features["body_size"]*100]%</a><br>"
				dat += "<b>Scaled Appearance:</b> <a href='?_src_=prefs;preference=toggle_fuzzy;task=input'>[fuzzy ? "Fuzzy" : "Sharp"]</a><br>"

			if(!(NOEYES in pref_species.species_traits))
				dat += "<h3>Eye Type</h3>"
				dat += "</b><a style='display:block;width:100px' href='?_src_=prefs;preference=eye_type;task=input'>[eye_type]</a><BR>"
				if((EYECOLOR in pref_species.species_traits))
					if(!use_skintones && !mutant_colors)
						dat += APPEARANCE_CATEGORY_COLUMN
					if(left_eye_color != right_eye_color)
						split_eye_colors = TRUE
					dat += "<h3>Heterochromia</h3>"
					dat += "</b><a style='display:block;width:100px' href='?_src_=prefs;preference=toggle_split_eyes;task=input'>[split_eye_colors ? "Enabled" : "Disabled"]</a>"
					if(!split_eye_colors)
						dat += "<h3>Eye Color</h3>"
						dat += "<span style='border: 1px solid #161616; background-color: #[left_eye_color];'><font color='[color_hex2num(left_eye_color) < 200 ? "FFFFFF" : "000000"]'>#[left_eye_color]</font></span> <a href='?_src_=prefs;preference=eyes;task=input'>Change</a>"
					else
						dat += "<h3>Left Eye Color</h3>"
						dat += "<span style='border: 1px solid #161616; background-color: #[left_eye_color];'><font color='[color_hex2num(left_eye_color) < 200 ? "FFFFFF" : "000000"]'>#[left_eye_color]</font></span> <a href='?_src_=prefs;preference=eye_left;task=input'>Change</a>"
						dat += "<h3>Right Eye Color</h3>"
						dat += "<span style='border: 1px solid #161616; background-color: #[right_eye_color];'><font color='[color_hex2num(right_eye_color) < 200 ? "FFFFFF" : "000000"]'>#[right_eye_color]</font></span> <a href='?_src_=prefs;preference=eye_right;task=input'>Change</a><BR>"

			if(HAIR in pref_species.species_traits)

				dat += APPEARANCE_CATEGORY_COLUMN

				dat += "<h3>Hair Style</h3>"

				dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=hair_style;task=input'>[hair_style]</a>"
				dat += "<a href='?_src_=prefs;preference=previous_hair_style;task=input'>&lt;</a> <a href='?_src_=prefs;preference=next_hair_style;task=input'>&gt;</a><BR>"
				dat += "<span style='border:1px solid #161616; background-color: #[hair_color];'><font color='[color_hex2num(hair_color) < 200 ? "FFFFFF" : "000000"]'>#[hair_color]</font></span> <a href='?_src_=prefs;preference=hair;task=input'>Change</a><BR>"

				dat += "<h3>Facial Hair Style</h3>"

				dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=facial_hair_style;task=input'>[facial_hair_style]</a>"
				dat += "<a href='?_src_=prefs;preference=previous_facehair_style;task=input'>&lt;</a> <a href='?_src_=prefs;preference=next_facehair_style;task=input'>&gt;</a><BR>"
				dat += "<span style='border: 1px solid #161616; background-color: #[facial_hair_color];'><font color='[color_hex2num(facial_hair_color) < 200 ? "FFFFFF" : "000000"]'>#[facial_hair_color]</font></span> <a href='?_src_=prefs;preference=facial;task=input'>Change</a><BR>"

				dat += "<h3>Hair Gradient</h3>"

				dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=grad_style;task=input'>[grad_style]</a>"
				dat += "<a href='?_src_=prefs;preference=previous_grad_style;task=input'>&lt;</a> <a href='?_src_=prefs;preference=next_grad_style;task=input'>&gt;</a><BR>"
				dat += "<span style='border: 1px solid #161616; background-color: #[grad_color];'><font color='[color_hex2num(grad_color) < 200 ? "FFFFFF" : "000000"]'>#[grad_color]</font></span> <a href='?_src_=prefs;preference=grad_color;task=input'>Change</a><BR>"

				dat += "</td>"
			//Mutant stuff
			var/mutant_category = 0

			dat += APPEARANCE_CATEGORY_COLUMN
			dat += "<h3>Show mismatched markings</h3>"
			dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=mismatched_markings;task=input'>[show_mismatched_markings ? "Yes" : "No"]</a>"
			mutant_category++
			if(mutant_category >= MAX_MUTANT_ROWS) //just in case someone sets the max rows to 1 or something dumb like that
				dat += "</td>"
				mutant_category = 0

			// rp marking selection
			// assume you can only have mam markings or regular markings or none, never both
			var/marking_type
			if(parent.can_have_part("mam_body_markings"))
				marking_type = "mam_body_markings"
			if(marking_type)
				dat += APPEARANCE_CATEGORY_COLUMN
				dat += "<h3>[GLOB.all_mutant_parts[marking_type]]</h3>" // give it the appropriate title for the type of marking
				dat += "<a href='?_src_=prefs;preference=marking_add;marking_type=[marking_type];task=input'>Add marking</a>"
				// list out the current markings you have
				if(length(features[marking_type]))
					dat += "<table>"
					var/list/markings = features[marking_type]
					if(!islist(markings))
						// something went terribly wrong
						markings = list()
					var/list/reverse_markings = reverseList(markings)
					for(var/list/marking_list in reverse_markings)
						var/marking_index = markings.Find(marking_list) // consider changing loop to go through indexes over lists instead of using Find here
						var/limb_value = marking_list[1]
						var/actual_name = GLOB.bodypart_names[num2text(limb_value)] // get the actual name from the bitflag representing the part the marking is applied to
						var/color_marking_dat = ""
						var/number_colors = 1
						var/datum/sprite_accessory/mam_body_markings/S = GLOB.mam_body_markings_list[marking_list[2]]
						var/matrixed_sections = S.covered_limbs[actual_name]
						if(S && matrixed_sections)
							// if it has nothing initialize it to white
							if(length(marking_list) == 2)
								var/first = "#FFFFFF"
								var/second = "#FFFFFF"
								var/third = "#FFFFFF"
								if(features["mcolor"])
									first = "#[features["mcolor"]]"
								if(features["mcolor2"])
									second = "#[features["mcolor2"]]"
								if(features["mcolor3"])
									third = "#[features["mcolor3"]]"
								marking_list += list(list(first, second, third)) // just assume its 3 colours if it isnt it doesnt matter we just wont use the other values
							// index magic
							var/primary_index = 1
							var/secondary_index = 2
							var/tertiary_index = 3
							switch(matrixed_sections)
								if(MATRIX_GREEN)
									primary_index = 2
								if(MATRIX_BLUE)
									primary_index = 3
								if(MATRIX_RED_BLUE)
									secondary_index = 2
								if(MATRIX_GREEN_BLUE)
									primary_index = 2
									secondary_index = 3

							// we know it has one matrixed section at minimum
							color_marking_dat += "<span style='border: 1px solid #161616; background-color: [marking_list[3][primary_index]];'><font color='[color_hex2num(marking_list[3][primary_index]) < 200 ? "FFFFFF" : "000000"]'>[marking_list[3][primary_index]]</font></span>"
							// if it has a second section, add it
							if(matrixed_sections == MATRIX_RED_BLUE || matrixed_sections == MATRIX_GREEN_BLUE || matrixed_sections == MATRIX_RED_GREEN || matrixed_sections == MATRIX_ALL)
								color_marking_dat += "<span style='border: 1px solid #161616; background-color: [marking_list[3][secondary_index]];'><font color='[color_hex2num(marking_list[3][secondary_index]) < 200 ? "FFFFFF" : "000000"]'>[marking_list[3][secondary_index]]</font></span>"
								number_colors = 2
							// if it has a third section, add it
							if(matrixed_sections == MATRIX_ALL)
								color_marking_dat += "<span style='border: 1px solid #161616; background-color: [marking_list[3][tertiary_index]];'><font color='[color_hex2num(marking_list[3][tertiary_index]) < 200 ? "FFFFFF" : "000000"]'>[marking_list[3][tertiary_index]]</font></span>"
								number_colors = 3
							color_marking_dat += " <a href='?_src_=prefs;preference=marking_color;marking_index=[marking_index];marking_type=[marking_type];number_colors=[number_colors];task=input'>Change</a><BR>"
						dat += "<tr><td>[marking_list[2]] - [actual_name]</td> <td><a href='?_src_=prefs;preference=marking_down;task=input;marking_index=[marking_index];marking_type=[marking_type];'>&#708;</a> <a href='?_src_=prefs;preference=marking_up;task=input;marking_index=[marking_index];marking_type=[marking_type]'>&#709;</a> <a href='?_src_=prefs;preference=marking_remove;task=input;marking_index=[marking_index];marking_type=[marking_type]'>X</a> [color_marking_dat]</td></tr>"
					dat += "</table>"

			for(var/mutant_part in GLOB.all_mutant_parts)
				if(mutant_part == "mam_body_markings")
					continue
				if(parent.can_have_part(mutant_part))
					if(!mutant_category)
						dat += APPEARANCE_CATEGORY_COLUMN
					dat += "<h3>[GLOB.all_mutant_parts[mutant_part]]</h3>"
					dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=[mutant_part];task=input'>[features[mutant_part]]</a>"
					var/color_type = GLOB.colored_mutant_parts[mutant_part] //if it can be coloured, show the appropriate button
					if(color_type)
						dat += "<span style='border:1px solid #161616; background-color: #[features[color_type]];'><font color='[color_hex2num(features[color_type]) < 200 ? "FFFFFF" : "000000"]'>#[features[color_type]]</font></span> <a href='?_src_=prefs;preference=[color_type];task=input'>Change</a><BR>"
					else
						if(features["color_scheme"] == ADVANCED_CHARACTER_COLORING) //advanced individual part colouring system
							//is it matrixed or does it have extra parts to be coloured?
							var/find_part = features[mutant_part] || pref_species.mutant_bodyparts[mutant_part]
							var/find_part_list = GLOB.mutant_reference_list[mutant_part]
							if(find_part && find_part != "None" && find_part_list)
								var/datum/sprite_accessory/accessory = find_part_list[find_part]
								if(accessory)
									if(accessory.color_src == MATRIXED || accessory.color_src == MUTCOLORS || accessory.color_src == MUTCOLORS2 || accessory.color_src == MUTCOLORS3) //mutcolors1-3 are deprecated now, please don't rely on these in the future
										var/mutant_string = accessory.mutant_part_string
										var/primary_feature = "[mutant_string]_primary"
										var/secondary_feature = "[mutant_string]_secondary"
										var/tertiary_feature = "[mutant_string]_tertiary"
										if(!features[primary_feature])
											features[primary_feature] = features["mcolor"]
										if(!features[secondary_feature])
											features[secondary_feature] = features["mcolor2"]
										if(!features[tertiary_feature])
											features[tertiary_feature] = features["mcolor3"]

										var/matrixed_sections = accessory.matrixed_sections
										if(accessory.color_src == MATRIXED && !matrixed_sections)
											message_admins("Sprite Accessory Failure (customization): Accessory [accessory.type] is a matrixed item without any matrixed sections set!")
											continue
										else if(accessory.color_src == MATRIXED)
											switch(matrixed_sections)
												if(MATRIX_GREEN) //only composed of a green section
													primary_feature = secondary_feature //swap primary for secondary, so it properly assigns the second colour, reserved for the green section
												if(MATRIX_BLUE)
													primary_feature = tertiary_feature //same as above, but the tertiary feature is for the blue section
												if(MATRIX_RED_BLUE) //composed of a red and blue section
													secondary_feature = tertiary_feature //swap secondary for tertiary, as blue should always be tertiary
												if(MATRIX_GREEN_BLUE) //composed of a green and blue section
													primary_feature = secondary_feature //swap primary for secondary, as first option is green, which is linked to the secondary
													secondary_feature = tertiary_feature //swap secondary for tertiary, as second option is blue, which is linked to the tertiary
										dat += "<b>Primary Color</b><BR>"
										dat += "<span style='border:1px solid #161616; background-color: #[features[primary_feature]];'><font color='[color_hex2num(features[primary_feature]) < 200 ? "FFFFFF" : "000000"]'>#[features[primary_feature]]</font></span> <a href='?_src_=prefs;preference=[primary_feature];task=input'>Change</a><BR>"
										if((accessory.color_src == MATRIXED && (matrixed_sections == MATRIX_RED_BLUE || matrixed_sections == MATRIX_GREEN_BLUE || matrixed_sections == MATRIX_RED_GREEN || matrixed_sections == MATRIX_ALL)) || (accessory.extra && (accessory.extra_color_src == MUTCOLORS || accessory.extra_color_src == MUTCOLORS2 || accessory.extra_color_src == MUTCOLORS3)))
											dat += "<b>Secondary Color</b><BR>"
											dat += "<span style='border:1px solid #161616; background-color: #[features[secondary_feature]];'><font color='[color_hex2num(features[secondary_feature]) < 200 ? "FFFFFF" : "000000"]'>#[features[secondary_feature]]</font></span> <a href='?_src_=prefs;preference=[secondary_feature];task=input'>Change</a><BR>"
											if((accessory.color_src == MATRIXED && matrixed_sections == MATRIX_ALL) || (accessory.extra2 && (accessory.extra2_color_src == MUTCOLORS || accessory.extra2_color_src == MUTCOLORS2 || accessory.extra2_color_src == MUTCOLORS3)))
												dat += "<b>Tertiary Color</b><BR>"
												dat += "<span style='border:1px solid #161616; background-color: #[features[tertiary_feature]];'><font color='[color_hex2num(features[tertiary_feature]) < 200 ? "FFFFFF" : "000000"]'>#[features[tertiary_feature]]</font></span> <a href='?_src_=prefs;preference=[tertiary_feature];task=input'>Change</a><BR>"

					mutant_category++
					if(mutant_category >= MAX_MUTANT_ROWS)
						dat += "</td>"
						mutant_category = 0

			if(length(pref_species.allowed_limb_ids))
				if(!chosen_limb_id || !(chosen_limb_id in pref_species.allowed_limb_ids))
					chosen_limb_id = pref_species.limbs_id || pref_species.id
				dat += "<h3>Body sprite</h3>"
				dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=bodysprite;task=input'>[chosen_limb_id]</a>"

			if(mutant_category)
				dat += "</td>"
				mutant_category = 0

			dat += "</tr></table>"

			dat += "</td>"
			dat += "<table><tr><td width='340px' height='300px' valign='top'>"
			dat += "<h2>Clothing & Equipment</h2>"
			/* skyrat change
			dat += "<b>Underwear:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=underwear;task=input'>[underwear]</a>"
			if(GLOB.underwear_list[underwear]?.has_color)
				dat += "<b>Underwear Color:</b> <span style='border:1px solid #161616; background-color: #[undie_color];'><font color='[color_hex2num(undie_color) < 200 ? "FFFFFF" : "000000"]'>#[undie_color]</font></span> <a href='?_src_=prefs;preference=undie_color;task=input'>Change</a><BR>"
			dat += "<b>Undershirt:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=undershirt;task=input'>[undershirt]</a>"
			if(GLOB.undershirt_list[undershirt]?.has_color)
				dat += "<b>Undershirt Color:</b> <span style='border:1px solid #161616; background-color: #[shirt_color];'><font color='[color_hex2num(shirt_color) < 200 ? "FFFFFF" : "000000"]'>#[shirt_color]</font></span> <a href='?_src_=prefs;preference=shirt_color;task=input'>Change</a><BR>"
			dat += "<b>Socks:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=socks;task=input'>[socks]</a>"
			if(GLOB.socks_list[socks]?.has_color)
				dat += "<b>Socks Color:</b> <span style='border:1px solid #161616; background-color: #[socks_color];'><font color='[color_hex2num(socks_color) < 200 ? "FFFFFF" : "000000"]'>#[socks_color]</font></span> <a href='?_src_=prefs;preference=socks_color;task=input'>Change</a><BR>"
			*/
			dat += "<b>Backpack:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=bag;task=input'>[backbag]</a>"
			dat += "<b>Jumpsuit:</b><BR><a href ='?_src_=prefs;preference=suit;task=input'>[jumpsuit_style]</a><BR>"
			if((HAS_FLESH in pref_species.species_traits) || (HAS_BONE in pref_species.species_traits))
				dat += "<BR><b>Temporal Scarring:</b><BR><a href='?_src_=prefs;preference=persistent_scars'>[(persistent_scars) ? "Enabled" : "Disabled"]</A>"
				dat += "<a href='?_src_=prefs;preference=clear_scars'>Clear scar slots</A><BR>"
			dat += "<b>Uplink Location:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=uplink_loc;task=input'>[uplink_spawn_loc]</a>"
			dat += "</td>"

			dat += "<td width='220px' height='300px' valign='top'>"
			dat += "<h3>Lewd preferences</h3>"
			dat += "<b>Lust tolerance:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=lust_tolerance;task=input'>[lust_tolerance]</a>"
			dat += "<b>Sexual potency:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=sexual_potency;task=input'>[sexual_potency]</a>"
			dat += "</td>"

			//SPLURT EDIT BEGIN - gregnancy preferences
			dat += "<td width='220px' height='300px' valign='top'>"
			dat += "<h3>Pregnancy preferences</h3>"
			dat += "<b>Chance of impregnation:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=virility;task=input'>[virility ? virility : "Disabled"]</a>"
			dat += "<b>Chance of getting pregnant:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=fertility;task=input'>[fertility ? fertility : "Disabled"]</a>"
			dat += "<b>Lay inert eggs:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=inert_eggs'>[features["inert_eggs"] == TRUE ? "Enabled" : "Disabled"]</a>"
			if(fertility)
				dat += "<b>Pregnancy inflation:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=pregnancy_inflation;task=input'>[pregnancy_inflation ? "Enabled" : "Disabled"]</a>"
				dat += "<b>Pregnancy breast growth:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=pregnancy_breast_growth;task=input'>[pregnancy_breast_growth ? "Enabled" : "Disabled"]</a>"
			if(fertility || features["inert_eggs"])
				dat += "<b>Egg shell:</b><a style='display:block;width:100px' href ='?_src_=prefs;preference=egg_shell;task=input'>[egg_shell]</a>"
			dat += "</td>"
			//SPLURT EDIT END
			dat += APPEARANCE_CATEGORY_COLUMN
			if(NOGENITALS in pref_species.species_traits)
				dat += "<b>Your species ([pref_species.name]) does not support genitals!</b><br>"
			else
				if(pref_species.use_skintones)
					dat += "<b>Genitals use skintone:</b><a href='?_src_=prefs;preference=genital_colour'>[features["genitals_use_skintone"] == TRUE ? "Yes" : "No"]</a>"
				dat += "<h3>Penis</h3>"
				dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=has_cock'>[features["has_cock"] == TRUE ? "Yes" : "No"]</a>"
				if(features["has_cock"])
					if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
						dat += "<b>Penis Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)</a><br>"
					else
						dat += "<b>Penis Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: #[features["cock_color"]];'><font color='[color_hex2num(features["cock_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["cock_color"]]</font></span> <a href='?_src_=prefs;preference=cock_color;task=input'>Change</a><br>"
					var/tauric_shape = FALSE
					if(features["cock_taur"])
						var/datum/sprite_accessory/penis/P = GLOB.cock_shapes_list[features["cock_shape"]]
						if(P.taur_icon && parent.can_have_part("taur"))
							var/datum/sprite_accessory/taur/T = GLOB.taur_list[features["taur"]]
							if(T.taur_mode & P.accepted_taurs)
								tauric_shape = TRUE
					dat += "<b>Penis Shape:</b> <a style='display:block;width:120px' href='?_src_=prefs;preference=cock_shape;task=input'>[features["cock_shape"]][tauric_shape ? " (Taur)" : ""]</a>"
					dat += "<b>Penis Length:</b> <a style='display:block;width:120px' href='?_src_=prefs;preference=cock_length;task=input'>[features["cock_length"]] inch(es)</a>"
					dat += "<b>Diameter Ratio:</b> <a style='display:block;width:120px' href='?_src_=prefs;preference=cock_diameter_ratio;task=input'>[features["cock_diameter_ratio"]]</a>"
					dat += "<b>Penis Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=cock_visibility;task=input'>[features["cock_visibility"]]</a>"
					dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=cock_stuffing'>[features["cock_stuffing"] == TRUE ? "Yes" : "No"]</a>"
					dat += "<b>Has Testicles:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=has_balls'>[features["has_balls"] == TRUE ? "Yes" : "No"]</a>"
					if(features["has_balls"])
						if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
							dat += "<b>Testicles Color:</b></a><BR>"
							dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)<br>"
						else
							dat += "<b>Testicles Color:</b></a><BR>"
							dat += "<span style='border: 1px solid #161616; background-color: #[features["balls_color"]];'><font color='[color_hex2num(features["balls_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["balls_color"]]</font></span> <a href='?_src_=prefs;preference=balls_color;task=input'>Change</a><br>"
						dat += "<b>Testicles Shape:</b> <a style='display:block;width:120px' href='?_src_=prefs;preference=balls_shape;task=input'>[features["balls_shape"]]</a>"
						dat += "<b>Testicles Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=balls_visibility;task=input'>[features["balls_visibility"]]</a>"
						dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=balls_stuffing'>[features["balls_stuffing"] == TRUE ? "Yes" : "No"]</a>"
						dat += "<b>Produces:</b>"
						var/datum/reagent/balls_fluid = find_reagent_object_from_type(features["balls_fluid"])
						if(balls_fluid && (balls_fluid in GLOB.genital_fluids_list))
							dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=balls_fluid;task=input'>[balls_fluid.name]</a>"
						else
							dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=balls_fluid;task=input'>Nothing?</a>"
				dat += "</td>"
				dat += APPEARANCE_CATEGORY_COLUMN
				dat += "<h3>Vagina</h3>"
				dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=has_vag'>[features["has_vag"] == TRUE ? "Yes" : "No"]</a>"
				if(features["has_vag"])
					dat += "<b>Vagina Type:</b> <a style='display:block;width:100px' href='?_src_=prefs;preference=vag_shape;task=input'>[features["vag_shape"]]</a>"
					if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
						dat += "<b>Vagina Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)<br>"
					else
						dat += "<b>Vagina Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: #[features["vag_color"]];'><font color='[color_hex2num(features["vag_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["vag_color"]]</font></span> <a href='?_src_=prefs;preference=vag_color;task=input'>Change</a><br>"
					dat += "<b>Vagina Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=vag_visibility;task=input'>[features["vag_visibility"]]</a>"
					dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=vag_stuffing'>[features["vag_stuffing"] == TRUE ? "Yes" : "No"]</a>"
					dat += "<b>Has Womb:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=has_womb'>[features["has_womb"] == TRUE ? "Yes" : "No"]</a>"
					if(features["has_womb"] == TRUE)
						dat += "<b>Produces:</b>"
						var/datum/reagent/womb_fluid = find_reagent_object_from_type(features["womb_fluid"])
						if(womb_fluid && (womb_fluid in GLOB.genital_fluids_list))
							dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=womb_fluid;task=input'>[womb_fluid.name]</a>"
						else
							dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=womb_fluid;task=input'>Nothing?</a>"
				dat += "</td>"
				dat += APPEARANCE_CATEGORY_COLUMN
				dat += "<h3>Breasts</h3>"
				dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=has_breasts'>[features["has_breasts"] == TRUE ? "Yes" : "No"]</a>"
				if(features["has_breasts"])
					if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)<br>"
					else
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: #[features["breasts_color"]];'><font color='[color_hex2num(features["breasts_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["breasts_color"]]</font></span> <a href='?_src_=prefs;preference=breasts_color;task=input'>Change</a><br>"
					dat += "<b>Cup Size:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=breasts_size;task=input'>[features["breasts_size"]]</a>"
					dat += "<b>Breasts Shape:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=breasts_shape;task=input'>[features["breasts_shape"]]</a>"
					dat += "<b>Breasts Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=breasts_visibility;task=input'>[features["breasts_visibility"]]</a>"
					dat += "<b>Lactates:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=breasts_producing'>[features["breasts_producing"] == TRUE ? "Yes" : "No"]</a>"
					dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=breasts_stuffing'>[features["breasts_stuffing"] == TRUE ? "Yes" : "No"]</a>"
					if(features["breasts_producing"] == TRUE)
						dat += "<b>Produces:</b>"
						var/datum/reagent/breasts_fluid = find_reagent_object_from_type(features["breasts_fluid"])
						if(breasts_fluid && (breasts_fluid in GLOB.genital_fluids_list))
							dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=breasts_fluid;task=input'>[breasts_fluid.name]</a>"
						else
							dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=breasts_fluid;task=input'>Nothing?</a>"
				dat += "</td>"
				dat += APPEARANCE_CATEGORY_COLUMN
				dat += "<h3>Butt</h3>"
				dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=has_butt'>[features["has_butt"] == TRUE ? "Yes" : "No"]</a>"
				if(features["has_butt"])
					if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)<br>"
					else
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: #[features["butt_color"]];'><font color='[color_hex2num(features["butt_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["butt_color"]]</font></span> <a href='?_src_=prefs;preference=butt_color;task=input'>Change</a><br>"
					dat += "<b>Butt Size:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=butt_size;task=input'>[features["butt_size"]]</a>"
					dat += "<b>Butt Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=butt_visibility;task=input'>[features["butt_visibility"]]</a>"
					dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=butt_stuffing'>[features["butt_stuffing"] == TRUE ? "Yes" : "No"]</a>"
					dat += "<b>Butthole Sprite:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=has_anus'>[features["has_anus"] == TRUE ? "Yes" : "No"]</a>"
					if(features["has_anus"])
						dat += "<b>Butthole Color:</b></a><BR>"
						if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
							dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)<br>"
						else
							dat += "<span style='border: 1px solid #161616; background-color: #[features["anus_color"]];'><font color='[color_hex2num(features["anus_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["anus_color"]]</font></span> <a href='?_src_=prefs;preference=anus_color;task=input'>Change</a><br>"
							dat += "<b>Butthole Shape:</b> <a style='display:block;width:120px' href='?_src_=prefs;preference=anus_shape;task=input'>[features["anus_shape"]]</a>"
						dat += "<b>Butthole Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=anus_visibility;task=input'>[features["anus_visibility"]]</a>"
						dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=anus_stuffing'>[features["anus_stuffing"] == TRUE ? "Yes" : "No"]</a>"
				dat += "</td>"
				dat += APPEARANCE_CATEGORY_COLUMN
				dat += "<h3>Belly</h3>"
				dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=has_belly'>[features["has_belly"] == TRUE ? "Yes" : "No"]</a>"
				if(features["has_belly"])
					if(pref_species.use_skintones && features["genitals_use_skintone"] == TRUE)
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: [SKINTONE2HEX(skin_tone)];'><font color='[color_hex2num(SKINTONE2HEX(skin_tone)) < 200 ? "FFFFFF" : "000000"]'>[SKINTONE2HEX(skin_tone)]</font></span>(Skin tone overriding)<br>"
					else
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: #[features["belly_color"]];'><font color='[color_hex2num(features["belly_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["belly_color"]]</font></span> <a href='?_src_=prefs;preference=belly_color;task=input'>Change</a><br>"
					dat += "<b>Belly Size:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=belly_size;task=input'>[features["belly_size"]]</a>"
					dat += "<b>Belly Visibility:</b><a style='display:block;width:100px' href='?_src_=prefs;preference=belly_visibility;task=input'>[features["belly_visibility"]]</a>"
					dat += "<b>Egg Stuffing:</b><a style='display:block;width:50px' href='?_src_=prefs;preference=belly_stuffing'>[features["belly_stuffing"] == TRUE ? "Yes" : "No"]</a>"
				dat += "</td>"
				if(all_quirks.Find("Dullahan"))
					dat += APPEARANCE_CATEGORY_COLUMN

					dat += "<h3>Neckfire</h3>"
					dat += "<a style='display:block;width:50px' href='?_src_=prefs;preference=has_neckfire;task=input'>[features["neckfire"] ? "Yes" : "No"]</a>"
					if(features["neckfire"])
						dat += "<b>Color:</b></a><BR>"
						dat += "<span style='border: 1px solid #161616; background-color: #[features["neckfire_color"]];'><font color='[color_hex2num(features["neckfire_color"]) < 200 ? "FFFFFF" : "000000"]'>#[features["neckfire_color"]]</font></span><a href='?_src_=prefs;preference=has_neckfire_color;task=input'>Change</a><br>"

					dat += "</td>"
			dat += "</td>"
			dat += "</tr></table>"

		if(SPEECH_TAB)
			if(path)
				var/savefile/S = new /savefile(path)
				if(S)
					dat += "<center>"
					var/name
					var/unspaced_slots = 0
					for(var/i=1, i<=max_save_slots, i++)
						unspaced_slots++
						if(unspaced_slots > 4)
							dat += "<br>"
							unspaced_slots = 0
						S.cd = "/character[i]"
						S["real_name"] >> name
						if(!name)
							name = "Character[i]"
						dat += "<a style='white-space:nowrap;' href='?_src_=prefs;preference=changeslot;num=[i];' [i == default_slot ? "class='linkOn'" : ""]>[name]</a> "
					dat += "</center>"

			dat += "<table><tr><td width='340px' height='300px' valign='top'>"
			dat += "<h2>Speech preferences</h2>"
			dat += "<b>Custom Speech Verb:</b><BR>"
			dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=speech_verb;task=input'>[custom_speech_verb]</a><BR>"
			dat += "<b>Custom Tongue:</b><BR>"
			dat += "<a style='display:block;width:100px' href='?_src_=prefs;preference=tongue;task=input'>[custom_tongue]</a><BR>"
			//SANDSTORM EDIT - additional language + runechat color
			dat += "<b>Additional Language</b><br>"
			var/list/languages_sorted = sort_list(language)
			dat += "<a href='?_src_=prefs;preference=language;task=menu'>[language.len ? languages_sorted.Join(", ") : "None"]</a></center><br>"
			dat += "<b>Custom runechat color:</b> <a href='?_src_=prefs;preference=enable_personal_chat_color'>[enable_personal_chat_color ? "Enabled" : "Disabled"]</a><br> [enable_personal_chat_color ? "<span style='border: 1px solid #161616; background-color: [personal_chat_color];'><font color='[color_hex2num(personal_chat_color) < 200 ? "FFFFFF" : "000000"]'>[personal_chat_color]</font></span> <a href='?_src_=prefs;preference=personal_chat_color;task=input'>Change</a>" : ""]<br>"
			dat += "</td>"
			//END OF SANDSTORM EDIT
			dat += "<td width='340px' height='300px' valign='top'>"
			dat += "<h2>Vocal Bark preferences</h2>"
			var/datum/bark/B = GLOB.bark_list[bark_id]
			dat += "<b>Vocal Bark Sound:</b><BR>"
			dat += "<a style='display:block;width:200px' href='?_src_=prefs;preference=barksound;task=input'>[B ? initial(B.name) : "INVALID"]</a><BR>"
			dat += "<b>Vocal Bark Speed:</b> <a href='?_src_=prefs;preference=barkspeed;task=input'>[bark_speed]</a><BR>"
			dat += "<b>Vocal Bark Pitch:</b> <a href='?_src_=prefs;preference=barkpitch;task=input'>[bark_pitch]</a><BR>"
			dat += "<b>Vocal Bark Variance:</b> <a href='?_src_=prefs;preference=barkvary;task=input'>[bark_variance]</a><BR>"
			dat += "<BR><a href='?_src_=prefs;preference=barkpreview'>Preview Bark</a><BR>"
			dat += "</td>"
			dat += "</tr></table>"

		if(GAME_PREFERENCES_TAB) // Game Preferences
			dat += "<table><tr><td width='340px' height='300px' valign='top'>"
			dat += "<h2>General Settings</h2>"
			dat += "<b>UI Style:</b> <a href='?_src_=prefs;task=input;preference=ui'>[UI_style]</a><br>"
			dat += "<b>Outline:</b> <a href='?_src_=prefs;preference=outline_enabled'>[outline_enabled ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Outline Color:</b> [outline_color ? "<span style='border:1px solid #161616; background-color: [outline_color];'>" : "Theme-based (null)"]<font color='[color_hex2num(outline_color) < 200 ? "FFFFFF" : "000000"]'>[outline_color]</font></span> <a href='?_src_=prefs;preference=outline_color'>Change</a><BR>"
			dat += "<b>Screentip:</b> <a href='?_src_=prefs;preference=screentip_pref'>[screentip_pref]</a><br>"
			dat += "<b>Screentip Color:</b> <span style='border:1px solid #161616; background-color: [screentip_color];'><font color='[color_hex2num(screentip_color) < 200 ? "FFFFFF" : "000000"]'>[screentip_color]</font></span> <a href='?_src_=prefs;preference=screentip_color'>Change</a><BR>"
			dat += "<b>tgui Monitors:</b> <a href='?_src_=prefs;preference=tgui_lock'>[(tgui_lock) ? "Primary" : "All"]</a><br>"
			dat += "<b>tgui Style:</b> <a href='?_src_=prefs;preference=tgui_fancy'>[(tgui_fancy) ? "Fancy" : "No Frills"]</a><br>"
			dat += "<b>Input Framework:</b> <a href='?_src_=prefs;preference=tgui_input_mode'>[(tgui_input_mode) ? "tgui" : "BYOND"]</a><br>"
			dat += "<b>tgui Button Size:</b> <a href='?_src_=prefs;preference=tgui_large_buttons'>[(tgui_large_buttons) ? "Large" : "Small"]</a><br>"
			dat += "<b>tgui Buttons Swapped:</b> <a href='?_src_=prefs;preference=tgui_swapped_buttons'>[(tgui_swapped_buttons) ? "Yes" : "No"]</a><br>"
			dat += "<b>Show Runechat Chat Bubbles:</b> <a href='?_src_=prefs;preference=chat_on_map'>[chat_on_map ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Runechat message char limit:</b> <a href='?_src_=prefs;preference=max_chat_length;task=input'>[max_chat_length]</a><br>"
			dat += "<b>See Runechat for non-mobs:</b> <a href='?_src_=prefs;preference=see_chat_non_mob'>[see_chat_non_mob ? "Enabled" : "Disabled"]</a><br>"
			//SKYRAT CHANGES BEGIN
			dat += "<b>See Runechat for emotes:</b> <a href='?_src_=prefs;preference=see_chat_emotes'>[see_chat_emotes ? "Enabled" : "Disabled"]</a><br>"
			//SKYRAT CHANGES END
			dat += "<b>Shift view when pixelshifting:</b> <a href='?_src_=prefs;preference=view_pixelshift'>[view_pixelshift ? "Enabled" : "Disabled"]</a><br>" //SPLURT Edit
			dat += "<br>"
			dat += "<b>Action Buttons:</b> <a href='?_src_=prefs;preference=action_buttons'>[(buttons_locked) ? "Locked In Place" : "Unlocked"]</a><br>"
			dat += "<br>"
			dat += "<b>PDA Color:</b> <span style='border:1px solid #161616; background-color: [pda_color];'><font color='[color_hex2num(pda_color) < 200 ? "FFFFFF" : "000000"]'>[pda_color]</font></span> <a href='?_src_=prefs;preference=pda_color;task=input'>Change</a><BR>"
			dat += "<b>PDA Style:</b> <a href='?_src_=prefs;task=input;preference=pda_style'>[pda_style]</a><br>"
			dat += "<b>PDA Reskin:</b> <a href='?_src_=prefs;task=input;preference=pda_skin'>[pda_skin]</a><br>"
			dat += "<br>"
			dat += "<b>Ghost Ears:</b> <a href='?_src_=prefs;preference=ghost_ears'>[(chat_toggles & CHAT_GHOSTEARS) ? "All Speech" : "Nearest Creatures"]</a><br>"
			dat += "<b>Ghost Radio:</b> <a href='?_src_=prefs;preference=ghost_radio'>[(chat_toggles & CHAT_GHOSTRADIO) ? "All Messages":"No Messages"]</a><br>"
			dat += "<b>Ghost Sight:</b> <a href='?_src_=prefs;preference=ghost_sight'>[(chat_toggles & CHAT_GHOSTSIGHT) ? "All Emotes" : "Nearest Creatures"]</a><br>"
			dat += "<b>Ghost Whispers:</b> <a href='?_src_=prefs;preference=ghost_whispers'>[(chat_toggles & CHAT_GHOSTWHISPER) ? "All Speech" : "Nearest Creatures"]</a><br>"
			dat += "<b>Ghost PDA:</b> <a href='?_src_=prefs;preference=ghost_pda'>[(chat_toggles & CHAT_GHOSTPDA) ? "All Messages" : "Nearest Creatures"]</a><br>"
			dat += "<b>Window Flashing:</b> <a href='?_src_=prefs;preference=winflash'>[(windowflashing) ? "Enabled":"Disabled"]</a><br>"
			dat += "<br>"
			dat += "<b>Play Admin MIDIs:</b> <a href='?_src_=prefs;preference=hear_midis'>[(toggles & SOUND_MIDI) ? "Enabled":"Disabled"]</a><br>"
			dat += "<b>Play Lobby Music:</b> <a href='?_src_=prefs;preference=lobby_music'>[(toggles & SOUND_LOBBY) ? "Enabled":"Disabled"]</a><br>"
			dat += "<b>See Pull Requests:</b> <a href='?_src_=prefs;preference=pull_requests'>[(chat_toggles & CHAT_PULLR) ? "Enabled":"Disabled"]</a><br>"
			dat += "<br>"
			if(user.client)
				if(unlock_content)
					dat += "<b>BYOND Membership Publicity:</b> <a href='?_src_=prefs;preference=publicity'>[(toggles & MEMBER_PUBLIC) ? "Public" : "Hidden"]</a><br>"
				if(unlock_content || check_rights_for(user.client, R_ADMIN))
					dat += "<b>OOC Color:</b> <span style='border: 1px solid #161616; background-color: [ooccolor ? ooccolor : GLOB.normal_ooc_colour];'><font color='[color_hex2num(ooccolor ? ooccolor : GLOB.normal_ooc_colour) < 200 ? "FFFFFF" : "000000"]'>[ooccolor ? ooccolor : GLOB.normal_ooc_colour]</font></span> <a href='?_src_=prefs;preference=ooccolor;task=input'>Change</a><br>"
					dat += "<b>Antag OOC Color:</b> <span style='border: 1px solid #161616; background-color: [aooccolor ? aooccolor : GLOB.normal_aooc_colour];'><font color='[color_hex2num(aooccolor ? aooccolor : GLOB.normal_aooc_colour) < 200 ? "FFFFFF" : "000000"]'>[aooccolor ? aooccolor : GLOB.normal_aooc_colour]</font></span> <a href='?_src_=prefs;preference=aooccolor;task=input'>Change</a><br>"

			dat += "</td>"

			dat += "<td width='300px' height='300px' valign='top'>"

			dat += "<h2>Special Role Settings</h2>"

			if(jobban_isbanned(user, ROLE_SYNDICATE))
				dat += "<font color=red><b>You are banned from antagonist roles.</b></font>"
				src.be_special = list()

			dat += "<b>DISABLE ALL ANTAGONISM</b> <a href='?_src_=prefs;preference=disable_antag'>[(toggles & NO_ANTAG) ? "YES" : "NO"]</a><br>"

			for (var/i in GLOB.special_roles)
				if(jobban_isbanned(user, i))
					dat += "<b>Be [capitalize(i)]:</b> <a href='?_src_=prefs;jobbancheck=[i]'>BANNED</a><br>"
				else
					var/days_remaining = null
					if(ispath(GLOB.special_roles[i]) && CONFIG_GET(flag/use_age_restriction_for_jobs)) //If it's a game mode antag, check if the player meets the minimum age
						var/mode_path = GLOB.special_roles[i]
						var/datum/game_mode/temp_mode = new mode_path
						days_remaining = temp_mode.get_remaining_days(user.client)

					if(days_remaining)
						dat += "<b>Be [capitalize(i)]:</b> <font color=red> \[IN [days_remaining] DAYS]</font><br>"
					else
						var/enabled_text = ""
						if(i in be_special)
							if(be_special[i] >= 1)
								enabled_text = "Enabled"
							else
								enabled_text = "Low"
						else
							enabled_text = "Disabled"
						dat += "<b>Be [capitalize(i)]:</b> <a href='?_src_=prefs;preference=be_special;be_special_type=[i]'>[enabled_text]</a><br>"
			dat += "<b>Midround Antagonist:</b> <a href='?_src_=prefs;preference=allow_midround_antag'>[(toggles & MIDROUND_ANTAG) ? "Enabled" : "Disabled"]</a><br>"

			dat += "<br>"

			dat += "<td width='300px' height='300px' valign='top'>"

			if(user.client.holder) // sandstorm start - moves admin prefs to the right
				dat += "<h2>Admin Settings</h2>"
				dat += "<b>Adminhelp Sounds:</b> <a href='?_src_=prefs;preference=hear_adminhelps'>[(toggles & SOUND_ADMINHELP)?"Enabled":"Disabled"]</a><br>"
				dat += "<b>Announce Login:</b> <a href='?_src_=prefs;preference=announce_login'>[(toggles & ANNOUNCE_LOGIN)?"Enabled":"Disabled"]</a><br>"
				dat += "<br>"
				dat += "<b>Combo HUD Lighting:</b> <a href = '?_src_=prefs;preference=combohud_lighting'>[(toggles & COMBOHUD_LIGHTING)?"Full-bright":"No Change"]</a><br>"
				dat += "<b>Use Modern Player Panel:</b> <a href='?_src_=prefs;preference=use_new_playerpanel'>[use_new_playerpanel ? "Yes" : "No"]</a><br>" // sandstorm end - moves admins prefs to the right

				//deadmin
				dat += "<h2>Deadmin While Playing</h2>"
				if(CONFIG_GET(flag/auto_deadmin_players))
					dat += "<b>Always Deadmin:</b> FORCED</a><br>"
				else
					dat += "<b>Always Deadmin:</b> <a href = '?_src_=prefs;preference=toggle_deadmin_always'>[(deadmin & DEADMIN_ALWAYS)?"Enabled":"Disabled"]</a><br>"
					if(!(deadmin & DEADMIN_ALWAYS))
						dat += "<br>"
						if(!CONFIG_GET(flag/auto_deadmin_antagonists))
							dat += "<b>As Antag:</b> <a href = '?_src_=prefs;preference=toggle_deadmin_antag'>[(deadmin & DEADMIN_ANTAGONIST)?"Deadmin":"Keep Admin"]</a><br>"
						else
							dat += "<b>As Antag:</b> FORCED<br>"

						if(!CONFIG_GET(flag/auto_deadmin_heads))
							dat += "<b>As Command:</b> <a href = '?_src_=prefs;preference=toggle_deadmin_head'>[(deadmin & DEADMIN_POSITION_HEAD)?"Deadmin":"Keep Admin"]</a><br>"
						else
							dat += "<b>As Command:</b> FORCED<br>"

						if(!CONFIG_GET(flag/auto_deadmin_security))
							dat += "<b>As Security:</b> <a href = '?_src_=prefs;preference=toggle_deadmin_security'>[(deadmin & DEADMIN_POSITION_SECURITY)?"Deadmin":"Keep Admin"]</a><br>"
						else
							dat += "<b>As Security:</b> FORCED<br>"

						if(!CONFIG_GET(flag/auto_deadmin_silicons))
							dat += "<b>As Silicon:</b> <a href = '?_src_=prefs;preference=toggle_deadmin_silicon'>[(deadmin & DEADMIN_POSITION_SILICON)?"Deadmin":"Keep Admin"]</a><br>"
						else
							dat += "<b>As Silicon:</b> FORCED<br>"

			dat += "<h2>Citadel Preferences</h2>" //Because fuck me if preferences can't be fucking modularized and expected to update in a reasonable timeframe.
			dat += "<b>Widescreen:</b> <a href='?_src_=prefs;preference=widescreenpref'>[widescreenpref ? "Enabled ([CONFIG_GET(string/default_view)])" : "Disabled (15x15)"]</a><br>"
			dat += "<b>Long strip menu:</b> <a href='?_src_=prefs;preference=long_strip_menu'>[long_strip_menu ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Auto stand:</b> <a href='?_src_=prefs;preference=autostand'>[autostand ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Auto OOC:</b> <a href='?_src_=prefs;preference=auto_ooc'>[auto_ooc ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Force Slot Storage HUD:</b> <a href='?_src_=prefs;preference=no_tetris_storage'>[no_tetris_storage ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Screen Shake:</b> <a href='?_src_=prefs;preference=screenshake'>[(screenshake==100) ? "Full" : ((screenshake==0) ? "None" : "[screenshake]")]</a><br>"
			if (user && user.client && !user.client.prefs.screenshake==0)
				dat += "<b>Damage Screen Shake:</b> <a href='?_src_=prefs;preference=damagescreenshake'>[(damagescreenshake==1) ? "On" : ((damagescreenshake==0) ? "Off" : "Only when down")]</a><br>"
			dat += "<b>Recoil Screen Push:</b> <a href='?_src_=prefs;preference=recoil_screenshake'>[(recoil_screenshake==100) ? "Full" : ((recoil_screenshake==0) ? "None" : "[screenshake]")]</a><br>"
			var/p_chaos
			if (!preferred_chaos)
				p_chaos = "No preference"
			else
				p_chaos = preferred_chaos
			dat += "<b>Preferred Chaos Amount:</b> <a href='?_src_=prefs;preference=preferred_chaos;task=input'>[p_chaos]</a><br>"

			dat += "<h2>S.P.L.U.R.T. Preferences</h2>"
			dat += "<b>Be Antagonist Victim:</b> <a href='?_src_=prefs;preference=be_victim;task=input'>[be_victim ? be_victim : BEVICTIM_ASK]</a><br>"
			dat += "<b>Disable combat mode cursor:</b> <a href='?_src_=prefs;preference=disable_combat_cursor'>[disable_combat_cursor?"Yes":"No"]</a><br>"
			dat += "<b>Splashscreen Player Panel Style:</b> <a href='?_src_=prefs;preference=tg_playerpanel'>[(toggles & TG_PLAYER_PANEL)?"TG":"Old"]</a><br>"
			dat += "<b>Character Creation Menu Style:</b> <a href='?_src_=prefs;preference=charcreation_style'>[new_character_creator ? "New" : "Old"]</a><br>"
			dat += "<br>"

			dat += "</td>"
			dat += "</tr></table>"
			if(unlock_content)
				dat += "<b>Ghost Form:</b> <a href='?_src_=prefs;task=input;preference=ghostform'>[ghost_form]</a><br>"
				dat += "<B>Ghost Orbit: </B> <a href='?_src_=prefs;task=input;preference=ghostorbit'>[ghost_orbit]</a><br>"
			var/button_name = "If you see this something went wrong."
			switch(ghost_accs)
				if(GHOST_ACCS_FULL)
					button_name = GHOST_ACCS_FULL_NAME
				if(GHOST_ACCS_DIR)
					button_name = GHOST_ACCS_DIR_NAME
				if(GHOST_ACCS_NONE)
					button_name = GHOST_ACCS_NONE_NAME

			dat += "<b>Ghost Accessories:</b> <a href='?_src_=prefs;task=input;preference=ghostaccs'>[button_name]</a><br>"
			switch(ghost_others)
				if(GHOST_OTHERS_THEIR_SETTING)
					button_name = GHOST_OTHERS_THEIR_SETTING_NAME
				if(GHOST_OTHERS_DEFAULT_SPRITE)
					button_name = GHOST_OTHERS_DEFAULT_SPRITE_NAME
				if(GHOST_OTHERS_SIMPLE)
					button_name = GHOST_OTHERS_SIMPLE_NAME

			dat += "<b>Ghosts of Others:</b> <a href='?_src_=prefs;task=input;preference=ghostothers'>[button_name]</a><br>"
			dat += "<br>"

			dat += "<b>FPS:</b> <a href='?_src_=prefs;preference=clientfps;task=input'>[clientfps]</a><br>"

			dat += "<b>Income Updates:</b> <a href='?_src_=prefs;preference=income_pings'>[(chat_toggles & CHAT_BANKCARD) ? "Allowed" : "Muted"]</a><br>"
			dat += "<br>"

			dat += "<b>Parallax (Fancy Space):</b> <a href='?_src_=prefs;preference=parallaxdown' oncontextmenu='window.location.href=\"?_src_=prefs;preference=parallaxup\";return false;'>"
			switch (parallax)
				if (PARALLAX_LOW)
					dat += "Low"
				if (PARALLAX_MED)
					dat += "Medium"
				if (PARALLAX_INSANE)
					dat += "Insane"
				if (PARALLAX_DISABLE)
					dat += "Disabled"
				else
					dat += "High"
			dat += "</a><br>"
			dat += "<b>Ambient Occlusion:</b> <a href='?_src_=prefs;preference=ambientocclusion'>[ambientocclusion ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>Fit Viewport:</b> <a href='?_src_=prefs;preference=auto_fit_viewport'>[auto_fit_viewport ? "Auto" : "Manual"]</a><br>"
			dat += "<b>HUD Button Flashes:</b> <a href='?_src_=prefs;preference=hud_toggle_flash'>[hud_toggle_flash ? "Enabled" : "Disabled"]</a><br>"
			dat += "<b>HUD Button Flash Color:</b> <span style='border: 1px solid #161616; background-color: [hud_toggle_color];'><font color='[color_hex2num(hud_toggle_color) < 200 ? "FFFFFF" : "000000"]'>[hud_toggle_color]</font></span> <a href='?_src_=prefs;preference=hud_toggle_color;task=input'>Change</a><br>"

/* CITADEL EDIT - We're using top menu instead
			button_name = pixel_size
			dat += "<b>Pixel Scaling:</b> <a href='?_src_=prefs;preference=pixel_size'>[(button_name) ? "Pixel Perfect [button_name]x" : "Stretch to fit"]</a><br>"

			switch(scaling_method)
				if(SCALING_METHOD_NORMAL)
					button_name = "Nearest Neighbor"
				if(SCALING_METHOD_DISTORT)
					button_name = "Point Sampling"
				if(SCALING_METHOD_BLUR)
					button_name = "Bilinear"
			dat += "<b>Scaling Method:</b> <a href='?_src_=prefs;preference=scaling_method'>[button_name]</a><br>"
*/

			if (CONFIG_GET(flag/maprotation) && CONFIG_GET(flag/tgstyle_maprotation))
				var/p_map = preferred_map
				if (!p_map)
					p_map = "Default"
					if (config.defaultmap)
						p_map += " ([config.defaultmap.map_name])"
				else
					if (p_map in config.maplist)
						var/datum/map_config/VM = config.maplist[p_map]
						if (!VM)
							p_map += " (No longer exists)"
						else
							p_map = VM.map_name
					else
						p_map += " (No longer exists)"
				if(CONFIG_GET(flag/allow_map_voting))
					dat += "<b>Preferred Map:</b> <a href='?_src_=prefs;preference=preferred_map;task=input'>[p_map]</a><br>"

			dat += "</td>"

		if(LOADOUT_TAB)
			//calculate your gear points from the chosen item
			gear_points = CONFIG_GET(number/initial_gear_points)
			var/list/chosen_gear = loadout_data["SAVE_[loadout_slot]"]
			if(chosen_gear)
				for(var/loadout_item in chosen_gear)
					var/loadout_item_path = loadout_item[LOADOUT_ITEM]
					if(loadout_item_path)
						var/datum/gear/loadout_gear = text2path(loadout_item_path)
						if(loadout_gear)
							gear_points -= initial(loadout_gear.cost)
			else
				chosen_gear = list()

			dat += "<table align='center' width='100%'>"
			dat += "<tr><td colspan=4><center><b><font color='[gear_points == 0 ? "#E62100" : "#CCDDFF"]'>[gear_points]</font> loadout points remaining.</b> \[<a href='?_src_=prefs;preference=gear;clear_loadout=1'>Clear Loadout</a>\]</center></td></tr>"
			dat += "<tr><td colspan=4><center>You can only choose one item per category, unless it's an item that spawns in your backpack or hands.</center></td></tr>"
			dat += "<tr><td colspan=4><center><b>"

			if(!length(GLOB.loadout_items))
				dat += "<center>ERROR: No loadout categories - something is horribly wrong!"
			else
				if(!GLOB.loadout_categories[gear_category])
					gear_category = GLOB.loadout_categories[1]
				var/firstcat = TRUE
				for(var/category in GLOB.loadout_categories)
					if(firstcat)
						firstcat = FALSE
					else
						dat += " |"
					if(category == gear_category)
						dat += " <span class='linkOn'>[category]</span> "
					else
						dat += " <a href='?_src_=prefs;preference=gear;select_category=[html_encode(category)]'>[category]</a> "

				dat += "</b></center></td></tr>"
				dat += "<tr><td colspan=4><hr></td></tr>"

				dat += "<tr><td colspan=4><center><b>"

				if(!length(GLOB.loadout_categories[gear_category]))
					dat += "No subcategories detected. Something is horribly wrong!"
				else
					var/list/subcategories = GLOB.loadout_categories[gear_category]
					if(!subcategories.Find(gear_subcategory))
						gear_subcategory = subcategories[1]

					var/firstsubcat = TRUE
					for(var/subcategory in subcategories)
						if(firstsubcat)
							firstsubcat = FALSE
						else
							dat += " |"
						if(gear_subcategory == subcategory)
							dat += " <span class='linkOn'>[subcategory]</span> "
						else
							dat += " <a href='?_src_=prefs;preference=gear;select_subcategory=[html_encode(subcategory)]'>[subcategory]</a> "
					dat += "</b></center></td></tr>"

					dat += "<tr width=10% style='vertical-align:top;'><td width=15%><b>Name</b></td>"
					dat += "<td style='vertical-align:top'><b>Cost</b></td>"
					dat += "<td width=10%><font size=2><b>Restrictions</b></font></td>"
					dat += "<td width=80%><font size=2><b>Description</b></font></td></tr>"
					for(var/name in GLOB.loadout_items[gear_category][gear_subcategory])
						var/datum/gear/gear = GLOB.loadout_items[gear_category][gear_subcategory][name]
						var/donoritem = gear.donoritem
						if(donoritem && !gear.donator_ckey_check(user.ckey))
							continue
						var/class_link = ""
						var/list/loadout_item = has_loadout_gear(loadout_slot, "[gear.type]")
						var/extra_loadout_data = ""
						if(loadout_item)
							class_link = "style='white-space:normal;' class='linkOn' href='?_src_=prefs;preference=gear;toggle_gear_path=[html_encode(name)];toggle_gear=0'"
							if(gear.loadout_flags & LOADOUT_CAN_COLOR_POLYCHROMIC)
								extra_loadout_data += "<BR><a href='?_src_=prefs;preference=gear;loadout_color_polychromic=1;loadout_gear_name=[html_encode(gear.name)];'>Color</a>"
								for(var/loadout_color in loadout_item[LOADOUT_COLOR])
									extra_loadout_data += "<span style='border: 1px solid #161616; background-color: [loadout_color];'><font color='[color_hex2num(loadout_color) < 200 ? "FFFFFF" : "000000"]'>[loadout_color]</font></span>"
							else
								var/loadout_color_non_poly = "#FFFFFF"
								if(length(loadout_item[LOADOUT_COLOR]))
									loadout_color_non_poly = loadout_item[LOADOUT_COLOR][1]
								extra_loadout_data += "<BR><a href='?_src_=prefs;preference=gear;loadout_color=1;loadout_gear_name=[html_encode(gear.name)];'>Color</a>"
								extra_loadout_data += "<span style='border: 1px solid #161616; background-color: [loadout_color_non_poly];'><font color='[color_hex2num(loadout_color_non_poly) < 200 ? "FFFFFF" : "000000"]'>[loadout_color_non_poly]</font></span>"
							if(gear.loadout_flags & LOADOUT_CAN_NAME)
								extra_loadout_data += "<BR><a href='?_src_=prefs;preference=gear;loadout_rename=1;loadout_gear_name=[html_encode(gear.name)];'>Name</a> [loadout_item[LOADOUT_CUSTOM_NAME] ? loadout_item[LOADOUT_CUSTOM_NAME] : "N/A"]"
							if(gear.loadout_flags & LOADOUT_CAN_DESCRIPTION)
								extra_loadout_data += "<BR><a href='?_src_=prefs;preference=gear;loadout_redescribe=1;loadout_gear_name=[html_encode(gear.name)];'>Description</a>"
						else if((gear_points - gear.cost) < 0)
							class_link = "style='white-space:normal;' class='linkOff'"
						else if(donoritem)
							class_link = "style='white-space:normal;background:#ebc42e;' href='?_src_=prefs;preference=gear;toggle_gear_path=[html_encode(name)];toggle_gear=1'"
						else if(!istype(gear, /datum/gear/unlockable) || can_use_unlockable(gear))
							class_link = "style='white-space:normal;' href='?_src_=prefs;preference=gear;toggle_gear_path=[html_encode(name)];toggle_gear=1'"
						else
							class_link = "style='white-space:normal;background:#eb2e2e;' class='linkOff'"
						dat += "<tr style='vertical-align:top;'><td width=15%><a [class_link]>[name]</a>[extra_loadout_data]</td>"
						dat += "<td width = 5% style='vertical-align:top'>[gear.cost]</td><td>"
						if(islist(gear.restricted_roles))
							if(gear.restricted_roles.len)
								if(gear.restricted_desc)
									dat += "<font size=2>"
									dat += gear.restricted_desc
									dat += "</font>"
								else
									dat += "<font size=2>"
									dat += gear.restricted_roles.Join(";")
									dat += "</font>"
						if(!istype(gear, /datum/gear/unlockable))
							// the below line essentially means "if the loadout item is picked by the user and has a custom description, give it the custom description, otherwise give it the default description"
							dat += "</td><td><font size=2><i>[loadout_item ? (loadout_item[LOADOUT_CUSTOM_DESCRIPTION] ? loadout_item[LOADOUT_CUSTOM_DESCRIPTION] : gear.description) : gear.description]</i></font></td></tr>"
						else
							//we add the user's progress to the description assuming they have progress
							var/datum/gear/unlockable/unlockable = gear
							var/progress_made = unlockable_loadout_data[unlockable.progress_key]
							if(!progress_made)
								progress_made = 0
							dat += "</td><td><font size=2><i>[loadout_item ? (loadout_item[LOADOUT_CUSTOM_DESCRIPTION] ? loadout_item[LOADOUT_CUSTOM_DESCRIPTION] : gear.description) : gear.description] Progress: [min(progress_made, unlockable.progress_required)]/[unlockable.progress_required]</i></font></td></tr>"

					dat += "</table>"
		if(CONTENT_PREFERENCES_TAB) // Content preferences
			dat += "<table><tr><td width='340px' height='300px' valign='top'>"
			dat += "<h2>Fetish content prefs</h2>"
			dat += "<b>Allow Lewd Verbs:</b> <a href='?_src_=prefs;preference=verb_consent'>[(toggles & VERB_CONSENT) ? "Yes":"No"]</a><br>" // Skyrat - ERP Mechanic Addition
			dat += "<b>Mute Lewd Verb Sounds:</b> <a href='?_src_=prefs;preference=mute_lewd_verb_sounds'>[(toggles & LEWD_VERB_SOUNDS) ? "Yes":"No"]</a><br>" // Skyrat - ERP Mechanic Addition
			dat += "<b>Arousal:</b><a href='?_src_=prefs;preference=arousable'>[arousable == TRUE ? "Enabled" : "Disabled"]</a><BR>"
			dat += "<b>Genital examine text</b>:<a href='?_src_=prefs;preference=genital_examine'>[(cit_toggles & GENITAL_EXAMINE) ? "Enabled" : "Disabled"]</a><BR>"
			dat += "<b>Vore examine text</b>:<a href='?_src_=prefs;preference=vore_examine'>[(cit_toggles & VORE_EXAMINE) ? "Enabled" : "Disabled"]</a><BR>"
			dat += "<b>Voracious MediHound sleepers:</b> <a href='?_src_=prefs;preference=hound_sleeper'>[(cit_toggles & MEDIHOUND_SLEEPER) ? "Yes" : "No"]</a><br>"
			dat += "<b>Hear Vore Sounds:</b> <a href='?_src_=prefs;preference=toggleeatingnoise'>[(cit_toggles & EATING_NOISES) ? "Yes" : "No"]</a><br>"
			dat += "<b>Hear Vore Digestion Sounds:</b> <a href='?_src_=prefs;preference=toggledigestionnoise'>[(cit_toggles & DIGESTION_NOISES) ? "Yes" : "No"]</a><br>"
			dat += "<b>Allow trash forcefeeding (requires Trashcan quirk)</b> <a href='?_src_=prefs;preference=toggleforcefeedtrash'>[(cit_toggles & TRASH_FORCEFEED) ? "Yes" : "No"]</a><br>"
			dat += "<b>Forced Feminization:</b> <a href='?_src_=prefs;preference=feminization'>[(cit_toggles & FORCED_FEM) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Forced Masculinization:</b> <a href='?_src_=prefs;preference=masculinization'>[(cit_toggles & FORCED_MASC) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Lewd Hypno:</b> <a href='?_src_=prefs;preference=hypno'>[(cit_toggles & HYPNO) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Bimbofication:</b> <a href='?_src_=prefs;preference=bimbo'>[(cit_toggles & BIMBOFICATION) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "</td>"
			dat +="<td width='300px' height='300px' valign='top'>"
			dat += "<h2>Other content prefs</h2>"
			dat += "<b>Breast Enlargement:</b> <a href='?_src_=prefs;preference=breast_enlargement'>[(cit_toggles & BREAST_ENLARGEMENT) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Penis Enlargement:</b> <a href='?_src_=prefs;preference=penis_enlargement'>[(cit_toggles & PENIS_ENLARGEMENT) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Butt Enlargement:</b> <a href='?_src_=prefs;preference=butt_enlargement'>[(cit_toggles & BUTT_ENLARGEMENT) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Belly Inflation:</b> <a href='?_src_=prefs;preference=belly_inflation'>[(cit_toggles & BELLY_INFLATION) ? "Allowed" : "Disallowed"]</a><br>"
			dat += "<b>Hypno:</b> <a href='?_src_=prefs;preference=never_hypno'>[(cit_toggles & NEVER_HYPNO) ? "Disallowed" : "Allowed"]</a><br>"
			dat += "<b>Aphrodisiacs:</b> <a href='?_src_=prefs;preference=aphro'>[(cit_toggles & NO_APHRO) ? "Disallowed" : "Allowed"]</a><br>"
			dat += "<b>Ass Slapping:</b> <a href='?_src_=prefs;preference=ass_slap'>[(cit_toggles & NO_ASS_SLAP) ? "Disallowed" : "Allowed"]</a><br>"
			//SPLURT EDIT
			dat += "<span style='border-radius: 2px;border:1px dotted white;cursor:help;' title='Enables verbs involving farts, shit and piss.'>?</span> "
			dat += "<b>Unholy ERP verbs :</b> <a href='?_src_=prefs;preference=unholypref'>[unholypref]</a><br>" //https://www.youtube.com/watch?v=OHKARc-GObU
			dat += "<span style='border-radius: 2px;border:1px dotted white;cursor:help;' title='Enables macro / micro stepping and stomping interactions.'>?</span> "
			dat += "<b>Stomping Interactions :</b> <a href='?_src_=prefs;preference=stomppref'>[stomppref ? "Yes" : "No"]</a><br>"
			//END OF SPLURT EDIT
			//SKYRAT EDIT
			dat += "<span style='border-radius: 2px;border:1px dotted white;cursor:help;' title='Enables verbs involving ear/brain fucking.'>?</span> "
			dat += 	"<b>Extreme ERP verbs :</b> <a href='?_src_=prefs;preference=extremepref'>[extremepref]</a><br>" // https://youtu.be/0YrU9ASVw6w
			if(extremepref != "No")
				dat += "<span style='border-radius: 2px;border:1px dotted white;cursor:help;' title='Enables in-game damage from extreme verbs.'>?</span> "
				dat += "<b><span style='color: #e60000;'>Harmful ERP verbs :</b> <a href='?_src_=prefs;preference=extremeharm'>[extremeharm]</a><br>"
			//END OF SKYRAT EDIT
			dat += "<b>Automatic Wagging:</b> <a href='?_src_=prefs;preference=auto_wag'>[(cit_toggles & NO_AUTO_WAG) ? "Disabled" : "Enabled"]</a><br>"
			dat += "<span style='border-radius: 2px;border:1px dotted white;cursor:help;' title='If anyone cums a blacklisted fluid into you, it uses the default fluid for that genital.'>?</span> "
			dat += "<b><a href='?_src_=prefs;preference=gfluid_black;task=input'>Genital Fluid Blacklist</a></b><br>"
			if(gfluid_blacklist?.len)
				dat += "<span style='border-radius: 2px;border:1px dotted white;cursor:help;' title='Remove a genital fluid from your blacklist.'>?</span> "
				dat += "<b><a href='?_src_=prefs;preference=gfluid_unblack;task=input'>Genital Fluid Un-Blacklist</a></b><br>"
			dat += "</tr></table>"
			dat += "<br>"
		if(KEYBINDINGS_TAB_OLD) // Custom keybindings
			dat += "<b>Keybindings:</b> <a href='?_src_=prefs;preference=hotkeys'>[(hotkeys) ? "Hotkeys" : "Input"]</a><br>"
			dat += "Keybindings mode controls how the game behaves with tab and map/input focus.<br>If it is on <b>Hotkeys</b>, the game will always attempt to force you to map focus, meaning keypresses are sent \
			directly to the map instead of the input. You will still be able to use the command bar, but you need to tab to do it every time you click on the game map.<br>\
			If it is on <b>Input</b>, the game will not force focus away from the input bar, and you can switch focus using TAB between these two modes: If the input bar is pink, that means that you are in non-hotkey mode, sending all keypresses of the normal \
			alphanumeric characters, punctuation, spacebar, backspace, enter, etc, typing keys into the input bar. If the input bar is white, you are in hotkey mode, meaning all keypresses go into the game's keybind handling system unless you \
			manually click on the input bar to shift focus there.<br>\
			Input mode is the closest thing to the old input system.<br>\
			<b>IMPORTANT:</b> While in input mode's non hotkey setting (tab toggled), Ctrl + KEY will send KEY to the keybind system as the key itself, not as Ctrl + KEY. This means Ctrl + T/W/A/S/D/all your familiar stuff still works, but you \
			won't be able to access any regular Ctrl binds.<br>"
			dat += "<br><b>Modifier-Independent binding</b> - This is a singular bind that works regardless of if Ctrl/Shift/Alt are held down. For example, if combat mode is bound to C in modifier-independent binds, it'll trigger regardless of if you are \
			holding down shift for sprint. <b>Each keybind can only have one independent binding, and each key can only have one keybind independently bound to it.</b>"
			// Create an inverted list of keybindings -> key
			var/list/user_binds = list()
			var/list/user_modless_binds = list()
			for (var/key in key_bindings)
				for(var/kb_name in key_bindings[key])
					user_binds[kb_name] += list(key)
			for (var/key in modless_key_bindings)
				user_modless_binds[modless_key_bindings[key]] = key

			var/list/kb_categories = list()
			// Group keybinds by category
			for (var/name in GLOB.keybindings_by_name)
				var/datum/keybinding/kb = GLOB.keybindings_by_name[name]
				kb_categories[kb.category] += list(kb)

			dat += {"
			<style>
			span.bindname { display: inline-block; position: absolute; width: 20% ; left: 5px; padding: 5px; } \
			span.bindings { display: inline-block; position: relative; width: auto; left: 20%; width: auto; right: 20%; padding: 5px; } \
			span.independent { display: inline-block; position: absolute; width: 20%; right: 5px; padding: 5px; } \
			</style><body>
			"}

			for (var/category in kb_categories)
				dat += "<h3>[category]</h3>"
				for (var/i in kb_categories[category])
					var/datum/keybinding/kb = i
					var/current_independent_binding = user_modless_binds[kb.name] || "Unbound"
					if(!length(user_binds[kb.name]))
						dat += "<span class='bindname'>[kb.full_name]</span><span class='bindings'><a href ='?_src_=prefs;preference=keybindings_capture;keybinding=[kb.name];old_key=["Unbound"]'>Unbound</a>"
						var/list/default_keys = hotkeys ? kb.hotkey_keys : kb.classic_keys
						if(LAZYLEN(default_keys))
							dat += "| Default: [default_keys.Join(", ")]"
						dat += "</span>"
						if(!kb.special && !kb.clientside)
							dat += "<span class='independent'>Independent Binding: <a href='?_src_=prefs;preference=keybindings_capture;keybinding=[kb.name];old_key=[current_independent_binding];independent=1'>[current_independent_binding]</a></span>"
						dat += "<br>"
					else
						var/bound_key = user_binds[kb.name][1]
						dat += "<span class='bindname'l>[kb.full_name]</span><span class='bindings'><a href ='?_src_=prefs;preference=keybindings_capture;keybinding=[kb.name];old_key=[bound_key]'>[bound_key]</a>"
						for(var/bound_key_index in 2 to length(user_binds[kb.name]))
							bound_key = user_binds[kb.name][bound_key_index]
							dat += " | <a href ='?_src_=prefs;preference=keybindings_capture;keybinding=[kb.name];old_key=[bound_key]'>[bound_key]</a>"
						if(length(user_binds[kb.name]) < MAX_KEYS_PER_KEYBIND)
							dat += "| <a href ='?_src_=prefs;preference=keybindings_capture;keybinding=[kb.name]'>Add Secondary</a>"
						var/list/default_keys = hotkeys ? kb.classic_keys : kb.hotkey_keys
						if(LAZYLEN(default_keys))
							dat += "| Default: [default_keys.Join(", ")]"
						dat += "</span>"
						if(!kb.special && !kb.clientside)
							dat += "<span class='independent'>Independent Binding: <a href='?_src_=prefs;preference=keybindings_capture;keybinding=[kb.name];old_key=[current_independent_binding];independent=1'>[current_independent_binding]</a></span>"
						dat += "<br>"

			dat += "<br><br>"
			dat += "<a href ='?_src_=prefs;preference=keybindings_reset'>\[Reset to default\]</a>"
			dat += "</body>"


	dat += "<hr><center>"

	if(!IsGuestKey(user.key))
		dat += "<a href='?_src_=prefs;preference=load'>Undo</a> "
		dat += "<a href='?_src_=prefs;preference=save'>Save Setup</a> "

	dat += "<a href='?_src_=prefs;preference=reset_all'>Reset Setup</a>"
	dat += "</center>"

	winshow(user, "preferences_window", TRUE)
	var/datum/browser/popup = new(user, "preferences_browser", "<div align='center'>Character Setup</div>", 640, 770)
	popup.set_content(dat.Join())
	popup.open(FALSE)
	onclose(user, "preferences_window", src)

/datum/preferences/process_link(mob/user, list/href_list)
	switch(href_list["task"])
		if("random")
			//no
		if("input")
			switch(href_list["preference"])
				if("marking_color")
					var/index = text2num(href_list["marking_index"])
					var/marking_type = href_list["marking_type"]
					if(index && marking_type && features[marking_type])
						// work out the input options to show the user
						var/list/options = list("Primary")
						var/number_colors = text2num(href_list["number_colors"])
						var/color_number = 1 // 1-3 which color are we editing
						if(number_colors >= 2)
							options += "Secondary"
						if(number_colors == 3)
							options += "Tertiary"
						var/color_option = input(user, "Select the colour you wish to edit") as null|anything in options
						if(color_option)
							if(color_option == "Secondary") color_number = 2
							if(color_option == "Tertiary") color_number = 3
							// perform some magic on the color number
							var/list/marking_list = features[marking_type][index]
							var/datum/sprite_accessory/mam_body_markings/S = GLOB.mam_body_markings_list[marking_list[2]]
							var/matrixed_sections = S.covered_limbs[GLOB.bodypart_names[num2text(marking_list[1])]]
							if(color_number == 1)
								switch(matrixed_sections)
									if(MATRIX_GREEN)
										color_number = 2
									if(MATRIX_BLUE)
										color_number = 3
							else if(color_number == 2)
								switch(matrixed_sections)
									if(MATRIX_RED_BLUE)
										color_number = 3
									if(MATRIX_GREEN_BLUE)
										color_number = 3

							var/color_list = features[marking_type][index][3]
							var/new_marking_color = input(user, "Choose your character's marking color:", "Character Preference","#"+color_list[color_number]) as color|null
							if(new_marking_color)
								var/temp_hsv = RGBtoHSV(new_marking_color)
								if((MUTCOLORS_PARTSONLY in pref_species.species_traits) || ReadHSV(temp_hsv)[3] >= ReadHSV(MINIMUM_MUTANT_COLOR)[3] || !CONFIG_GET(flag/character_color_limits)) // mutantcolors must be bright, but only if they affect the skin
									color_list[color_number] = "#[sanitize_hexcolor(new_marking_color, 6)]"
								else
									to_chat(user, "<span class='danger'>Invalid color. Your color is not bright enough.</span>")
		else
			switch(href_list["preference"])
				if("charcreation_style")
					new_character_creator = !new_character_creator
	. = ..()

/proc/build_genital_fluids_list()
	// Define disallowed reagents
	var/list/blacklisted = list(
		// Base ethanol
		/datum/reagent/consumable/ethanol,

		//
		// Effect drinks
		//

		// Removes dizziness, drowsiness, and sleeping
		/datum/reagent/consumable/ethanol/kahlua,

		// Can cause organ loss and death
		/datum/reagent/consumable/ethanol/thirteenloko,

		// Drugs the user
		/datum/reagent/consumable/ethanol/threemileisland,

		// Causes hallucinations
		/datum/reagent/consumable/ethanol/absinthe,

		// Heals body parts for assistants
		/datum/reagent/consumable/ethanol/hooch,

		// Heals revolutionary antagonists
		/datum/reagent/consumable/ethanol/cuba_libre,

		// Heals radiation for engineers
		/datum/reagent/consumable/ethanol/screwdrivercocktail,

		// Restores blood volume
		/datum/reagent/consumable/ethanol/bloody_mary,

		// Causes the user to emit light
		/datum/reagent/consumable/ethanol/tequila_sunrise,

		// Increases body temperature
		/datum/reagent/consumable/ethanol/toxins_special,

		// Causes hallucinations
		/datum/reagent/consumable/ethanol/beepsky_smash,

		// Heals brute and burn damage for dwarfs
		/datum/reagent/consumable/ethanol/manly_dorf,

		// Drugs the user
		/datum/reagent/consumable/ethanol/manhattan_proj,

		// Increases body temperature
		/datum/reagent/consumable/ethanol/antifreeze,

		// Heals brute damage
		/datum/reagent/consumable/ethanol/barefoot,

		// Increases body temperature
		/datum/reagent/consumable/ethanol/sbiten,

		// Reduces body temperature
		/datum/reagent/consumable/ethanol/iced_beer,

		// Grants points for changeling antagonist
		/datum/reagent/consumable/ethanol/changelingsting,

		// Plays an explosion sound effect
		/datum/reagent/consumable/ethanol/syndicatebomb,

		// Heals body parts for clowns
		/datum/reagent/consumable/ethanol/bananahonk,

		// Heals body parts for mimes
		/datum/reagent/consumable/ethanol/silencer,

		// Attracts nearby ores
		/datum/reagent/consumable/ethanol/fetching_fizz,

		// Heals critical health users 'extremely quickly'
		/datum/reagent/consumable/ethanol/hearty_punch,

		// Causes confusion, dizziness, slurring, sleep, and toxin damage
		/datum/reagent/consumable/ethanol/atomicbomb,

		// Causes dizziness, slurring, confusion, drugging, and toxin damage
		/datum/reagent/consumable/ethanol/gargle_blaster,

		// Causes brain damage, drugging, and dizziness
		/datum/reagent/consumable/ethanol/neurotoxin,

		// Causes brain damage
		/datum/reagent/consumable/ethanol/neuroweak,

		// Causes slurring, dizziness, drugging, jittering, and toxin damage
		/datum/reagent/consumable/ethanol/hippies_delight,

		// Causes cult sluttering and stuttering
		/datum/reagent/consumable/ethanol/narsour,

		// Causes clock cult slurring and stuttering
		/datum/reagent/consumable/ethanol/cogchamp,

		// Heals body part and brute damage for some mobs
		/datum/reagent/consumable/ethanol/pinotmort,

		// Heals body part and brute damage for security
		/datum/reagent/consumable/ethanol/quadruple_sec,

		// Heals body part, brute, suffocation, burn, and toxin damage for security
		/datum/reagent/consumable/ethanol/quintuple_sec,

		// Heals brute, burn, toxin, suffocation, and stamina damage
		/datum/reagent/consumable/ethanol/bastion_bourbon,

		// Grants nutrition
		/datum/reagent/consumable/ethanol/squirt_cider,

		// Grants nutrition
		/datum/reagent/consumable/ethanol/sugar_rush,

		// Grants soothed throat effect and increases temperature
		/datum/reagent/consumable/ethanol/peppermint_patty,

		// Removes mighty shield reagent
		/datum/reagent/consumable/ethanol/alexander,

		// Heals brute and burn damage for sleeping users
		/datum/reagent/consumable/ethanol/between_the_sheets,

		// Removes nutrition and causes toxin damage
		/datum/reagent/consumable/ethanol/fernet,

		// Removes nutrition and causes toxin damage
		/datum/reagent/consumable/ethanol/fernet_cola,

		// Removes nutrition and clears overeating duration
		/datum/reagent/consumable/ethanol/fanciulli,

		// Reduces body temperature
		/datum/reagent/consumable/ethanol/branca_menta,

		// Heals body part damage for mimes
		/datum/reagent/consumable/ethanol/blank_paper,

		// Heals body part, suffocation, and toxin damage for wizards
		/datum/reagent/consumable/ethanol/wizz_fizz,

		// Causes toxin damage to insects
		/datum/reagent/consumable/ethanol/bug_spray,

		// Reduces stamina
		/datum/reagent/consumable/ethanol/turbo,

		// Increases age, changes hair color, causes nearsightedness, causes a beard
		/datum/reagent/consumable/ethanol/old_timer,

		// Heals burn damage, removes jittering, and removes stuttering for Chaplain
		/datum/reagent/consumable/ethanol/trappist,

		// Teleports the user
		/datum/reagent/consumable/ethanol/blazaam,

		// Increases temperature, and can cause ignition
		/datum/reagent/consumable/ethanol/mauna_loa,

		// Heals body part, brute, suffocation, fire, foxin, and radiation for the Captain
		/datum/reagent/consumable/ethanol/commander_and_chief,

		// Increases temperature
		/datum/reagent/consumable/ethanol/hellfire,

		// Causes drugging and stamina loss
		/datum/reagent/consumable/ethanol/hotlime_miami,

		// Causes brute damage
		/datum/reagent/consumable/ethanol/crevice_spike,

		/*
		 * The following reagents have effects
		 * But are too mild to warrant blacklisting
		 *
		// Tints the user green
		/datum/reagent/consumable/ethanol/beer/green,

		// Heals radiation
		/datum/reagent/consumable/ethanol/vodka,

		// Heals brute loss
		/datum/reagent/consumable/ethanol/bilk,

		// Plays an explosion sound effect
		/datum/reagent/consumable/ethanol/b52,

		// Displays a chat message
		/datum/reagent/consumable/ethanol/gunfire,
		*/

		//
		// SPLURT effect drinks
		//

		/*
		 * The following reagents have effects
		 * But are allowed for humor purposes
		 *
		// Causes clothing loss
		/datum/reagent/consumable/ethanol/panty_dropper,

		// Causes brain damage
		/datum/reagent/consumable/ethanol/lean,
		*/

		// Contains morphine
		/datum/reagent/consumable/ethanol/isloation_cell/morphine,

		// Contains hexacrocin, morphine, and enthrall
		/datum/reagent/consumable/ethanol/chemical_ex,

		// Captain drink
		/datum/reagent/consumable/ethanol/heart_of_gold,

		// Captain drink
		/datum/reagent/consumable/ethanol/moth_in_chief,

		// Replaces the tongue
		/datum/reagent/consumable/ethanol/skullfucker_deluxe,

		// Heals brute, burn, and toxin or suffocation damage
		/datum/reagent/consumable/ethanol/ionstorm,

		//
		// Effect drink reagents
		//

		// Causes toxin damage
		/datum/reagent/consumable/poisonberryjuice,

		// Heals body parts for clown
		/datum/reagent/consumable/banana,

		// Heals body parts for mime
		/datum/reagent/consumable/nothing,

		// Causes forced laughter emote and mood event
		/datum/reagent/consumable/laughter,

		// Causes stun and mood event
		/datum/reagent/consumable/superlaughter,

		// Heals brute, fire, toxin, and suffocation damage, and reduces nutrition for non-doctors
		/datum/reagent/consumable/doctor_delight,

		// Reduces size
		/datum/reagent/consumable/red_queen,

		// Causes stamina loss, forced emote, chat messages, and arousal
		/datum/reagent/consumable/catnip_tea,

		// Heals toxin damage
		/datum/reagent/consumable/aloejuice,

		/*
		 * The following reagents have effects
		 * But are allowed for humor purposes
		 *

		// Heals body part and brute damage, removes capsaicin, and heals body parts for calcium healers
		/datum/reagent/consumable/milk,

		// Heals body parts
		/datum/reagent/consumable/soymilk,

		// Heals body parts
		/datum/reagent/consumable/coconutmilk,

		// Heals body parts
		/datum/reagent/consumable/cream,
		*/

		/*
		 * The following reagents have effects
		 * But are too mild to warrant blacklisting
		 *

		// Heals suffocation damage
		/datum/reagent/consumable/orangejuice,

		// Heals burn damage
		/datum/reagent/consumable/tomatojuice,

		// Heals body parts
		/datum/reagent/consumable/tomatojuice,

		// Heals blurred vision, blindness, and nearsightedness
		/datum/reagent/consumable/carrotjuice,

		// Removes dizziness, drowsiness, and sleeping, increases temperature, and removes frost oil
		/datum/reagent/consumable/coffee,

		// Reduces dizziness, drowsiness, jittering, and sleeping, heals toxin damage, and increases temperature
		/datum/reagent/consumable/tea,

		// Reduces nutrition, dizziness, drowsiness, and jittering, and increases temperature
		/datum/reagent/consumable/tea/red,

		// Heals liver damage, reduces dizziness, drowsiness, and jittering, and increases temperature
		/datum/reagent/consumable/tea/green,

		// Heals toxin damage, reduces dizziness, drowsiness, and jittering, and increases temperature
		/datum/reagent/consumable/tea/forest,

		// Causes drugging and dizziness, removes all disgust
		/datum/reagent/consumable/tea/mush,

		// Displays chat messages
		/datum/reagent/consumable/tea/arnold_palmer,

		// Reduces dizziness, drowsiness, jittering, and sleeping, and reduces temperature
		/datum/reagent/consumable/icecoffee,

		// Reduces dizziness, drowsiness, and sleeping, heals toxin damage, and reduces temperature
		/datum/reagent/consumable/icetea,

		// Reduces drowsiness and temperature
		/datum/reagent/consumable/space_cola,

		// Causes jittering, drugging, and dizziness, removes drowsiness, reduces sleeping and temperature
		/datum/reagent/consumable/nuka_cola,

		// Reduces drowsiness, sleeping, and temperature, and causes jittering
		/datum/reagent/consumable/spacemountainwind,

		// Reduces temperature
		/datum/reagent/consumable/space_up,

		// Reduces temperature
		/datum/reagent/consumable/lemon_lime,

		// Reduces temperature
		/datum/reagent/consumable/pwr_game,

		// Reduces temperature
		/datum/reagent/consumable/shamblers,

		// Adds sugar or honey
		/datum/reagent/consumable/buzz_fuzz,

		// Causes jittering, and dizziness, removes drowsiness, reduces sleeping and temperature
		/datum/reagent/consumable/grey_bull,

		// Reduces dizziness, and drowsiness, and temperature
		/datum/reagent/consumable/sodawater,

		// Reduces dizziness, and drowsiness, and temperature
		/datum/reagent/consumable/tonic,

		// Reduces dizziness and drowsiness, removes sleeping, increases temperature and jittering, heals body parts
		/datum/reagent/consumable/soy_latte,

		// Reduces dizziness and drowsiness, removes sleeping, increases temperature and jittering, heals body parts
		/datum/reagent/consumable/cafe_latte,

		// Reduces temperature
		/datum/reagent/consumable/grape_soda,

		// Causes throat soothed effect
		/datum/reagent/consumable/menthol,

		// Reduces temperature
		/datum/reagent/consumable/cream_soda,

		// Reduces disgust
		/datum/reagent/consumable/sol_dry,

		// Causes chat messages
		/datum/reagent/consumable/milk/pinkmilk,

		// Causes chat messages
		/datum/reagent/consumable/tea/pinktea,

		// Causes jittering, and dizziness, removes drowsiness, reduces sleeping and temperature
		/datum/reagent/consumable/monkey_energy,
		*/

		//
		// Effect standard reagents
		//

		// Grants nutrition
		/datum/reagent/consumable/nutriment/vitamin,

		// Can cause hyperglycemic shock (sleeping)
		/datum/reagent/consumable/sugar,

		// Increases temperature
		/datum/reagent/consumable/capsaicin,

		// Reduces temperature
		/datum/reagent/consumable/frostoil,

		// Causes coughing, and can be used for stuns
		/datum/reagent/consumable/condensedcapsaicin,

		// Heals the cook, but damages vampires
		/datum/reagent/consumable/garlic,

		// Heals body part damage
		/datum/reagent/consumable/sprinkles,

		// Increases temperature
		/datum/reagent/consumable/hot_ramen,

		// Increases temperature
		/datum/reagent/consumable/hell_ramen,

		// Adds sugar reagent
		/datum/reagent/consumable/corn_syrup,

		// Adds sugar, heals brute, burn, suffocation, and toxin
		/datum/reagent/consumable/honey,

		// Causes temporary blindness and blurred vision
		/datum/reagent/consumable/tearjuice,

		// Causes unconsciousness, breath loss, brain damage, toxin damage, stamina loss, and blurred vision
		/datum/reagent/consumable/entpoly,

		// Heals brute and burn damage
		/datum/reagent/consumable/vitfro,

		// Causes electrocution
		/datum/reagent/consumable/liquidelectricity,

		// Causes forced speech
		/datum/reagent/consumable/char,

		// Secret reagent, makes all food max quality
		/datum/reagent/consumable/secretsauce,

		// Used for making most food
		/datum/reagent/consumable/enzyme,

		/*
		 * The following reagents have effects
		 * But are too mild to warrant blacklisting
		 *
		// Increases temperature
		/datum/reagent/consumable/hot_coco,
		*/
	)

	// Define base list
	var/list/consumable_list = subtypesof(/datum/reagent/consumable)

	// Define additional allowed reagents
	var/list/whitelist_list = list(
		// Just water
		/datum/reagent/water,

		// Causes arousal
		// Allowed for ERP reasons
		/datum/reagent/drug/aphrodisiac,

		// Causes positive mood bonus
		// On overdose: Causes negative mood penalty and disgust
		/datum/reagent/drug/copium/gfluid,

		// Restores blood volume
		/datum/reagent/blood,
	)

	// Add whitelisted entries to main list
	LAZYADD(consumable_list, whitelist_list)

	// Define final list
	var/list/reagent_list

	// Define final type-based list
	var/list/reagent_list_paths

	for(var/reagent in consumable_list)
		// Define reagent
		var/datum/reagent/instance = find_reagent_object_from_type(reagent)

		// Check if reagent exists
		if(!instance)
			continue

		// Check if reagent is non-liquid
		if(instance.reagent_state != LIQUID)
			// Ignore reagent
			continue

		// Check if reagent is blacklisted
		if(reagent in blacklisted)
			// Ignore reagent
			continue

		// Check if reagent is manually whitelisted
		if(reagent in whitelist_list)
			// Add immediately
			LAZYADD(reagent_list, instance)
			LAZYADD(reagent_list_paths, reagent)

			// Skip further processing
			continue

		// Check if reagent exceeds rarity limit
		if(instance.value >= GFLUID_RARITY_LIMIT)
			// Ignore reagent
			continue

		// Check if reagent is an ethanol sub-type
		if(istype(instance, /datum/reagent/consumable/ethanol))
			// Define ethanol reagent
			var/datum/reagent/consumable/ethanol/drink = instance

			// Check if booze power exceeds the defined limit
			if(drink.boozepwr > GFLUID_ETHANOL_POWER_LIMIT)
				// Ignore reagent
				continue

		// Add reagent to final list
		LAZYADD(reagent_list, instance)

		// Add reagent to type list
		LAZYADD(reagent_list_paths, reagent)

	// Define readable GLOB
	GLOB.genital_fluids_list = reagent_list

	// Define type-path GLOB
	GLOB.genital_fluids_paths = reagent_list_paths

/proc/allowed_gfluid_paths()
	// Check if paths list exists
	if(!GLOB.genital_fluids_paths)
		// Build list
		build_genital_fluids_list()

	// Return list of valid types
	return GLOB.genital_fluids_paths

#undef APPEARANCE_CATEGORY_COLUMN
#undef MAX_MUTANT_ROWS
