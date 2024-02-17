/datum/action/innate/ability/humanoid_customization
	name = "Alter Form"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "alter_form" //placeholder
	icon_icon = 'modular_citadel/icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"

/datum/action/innate/ability/humanoid_customization/Activate()
	if(owner.get_ability_property(INNATE_ABILITY_HUMANOID_CUSTOMIZATION, PROPERTY_CUSTOMIZATION_SILENT))
		owner.visible_message("<span class='notice'>[owner] gains a look of \
		concentration while standing perfectly still.\
			Their body seems to shift and starts getting more goo-like.</span>",
		"<span class='notice'>You focus intently on altering your body while \
		standing perfectly still...</span>")
	change_form()

///////
/////// NOTICE: This currently doens't support skin tone - if anyone wants to add this to non slimes, it's up to YOU to do this.
////// (someone should also add genital color switching, more mutant color selection)
///// maybe just make this entire thing tgui based. maybe.
///////

/datum/action/innate/ability/humanoid_customization/proc/change_form()
	var/mob/living/carbon/human/H = owner

	var/select_alteration = input(owner, "Select what part of your form to alter", "Form Alteration", "cancel") in list("Body Color", "Eye Color","Hair Style", "Genitals", "Tail", "Snout", "Wings", "Markings", "Ears", "Taur body", "Penis", "Vagina", "Penis Length", "Breast Size", "Breast Shape", "Butt Size", "Belly Size", "Body Size", "Genital Color", "Horns", "Hair Color", "Skin Tone (Non-Mutant)", "Gender & Lewd", "Legs", "Cancel")

	if(select_alteration == "Body Color")
		var/new_color = input(owner, "Choose your skin color:", "Race change","#"+H.dna.features["mcolor"]) as color|null
		if(new_color)
			var/temp_hsv = RGBtoHSV(new_color)
			if(ReadHSV(temp_hsv)[3] >= ReadHSV(MINIMUM_MUTANT_COLOR)[3] || !CONFIG_GET(flag/character_color_limits)) // mutantcolors must be bright //SPLURT EDIT
				H.dna.features["mcolor"] = sanitize_hexcolor(new_color, 6)
				H.update_body()
				H.update_hair()
			else
				to_chat(H, "<span class='notice'>Invalid color. Your color is not bright enough.</span>")
	else if(select_alteration == "Eye Color")
		if(iscultist(H) && HAS_TRAIT(H, TRAIT_CULT_EYES))
			to_chat(H, "<span class='cultlarge'>\"I do not need you to hide yourself anymore, relish my gift.\"</span>")
			return

		var/heterochromia = input(owner, "Do you want to have heterochromia?", "Confirm Multicolors") in list("Yes", "No")
		if(heterochromia == "Yes")
			var/new_color1 = input(owner, "Choose your left eye color:", "Eye Color Change","#"+H.dna?.features["left_eye_color"]) as color|null
			if(new_color1)
				H.left_eye_color = sanitize_hexcolor(new_color1, 6)
			var/new_color2 = input(owner, "Choose your right eye color:",  "Eye Color Change","#"+H.dna?.features["right_eye_color"]) as color|null
			if(new_color2)
				H.right_eye_color = sanitize_hexcolor(new_color2, 6)
		else
			var/new_eyes = input(owner, "Choose your eye color:", "Character Preference","#"+H.dna?.features["left_eye_color"]) as color|null
			if(new_eyes)
				H.left_eye_color = sanitize_hexcolor(new_eyes, 6)
				H.right_eye_color = sanitize_hexcolor(new_eyes, 6)
		H.dna?.update_ui_block(DNA_LEFT_EYE_COLOR_BLOCK)
		H.dna?.update_ui_block(DNA_RIGHT_EYE_COLOR_BLOCK)
		H.update_body()
	else if(select_alteration == "Hair Style")
		if(H.gender == MALE)
			var/new_style = input(owner, "Select a facial hair style", "Hair Alterations")  as null|anything in GLOB.facial_hair_styles_list
			if(new_style)
				H.facial_hair_style = new_style
		else
			H.facial_hair_style = "Shaved"
		//handle normal hair
		var/new_style = input(owner, "Select a hair style", "Hair Alterations")  as null|anything in GLOB.hair_styles_list
		if(new_style)
			H.hair_style = new_style
			H.update_hair()
	else if (select_alteration == "Genitals")
		var/operation = input("Select organ operation.", "Organ Manipulation", "cancel") in list("add sexual organ", "remove sexual organ", "cancel")
		switch(operation)
			if("add sexual organ")
				var/new_organ = input("Select sexual organ:", "Organ Manipulation") as null|anything in GLOB.genitals_list
				if(!new_organ)
					return
				H.give_genital(GLOB.genitals_list[new_organ])

			if("remove sexual organ")
				var/list/organs = list()
				for(var/obj/item/organ/genital/X in H.internal_organs)
					var/obj/item/organ/I = X
					organs["[I.name] ([I.type])"] = I
				var/obj/item/O = input("Select sexual organ:", "Organ Manipulation", null) as null|anything in organs
				var/obj/item/organ/genital/G = organs[O]
				if(!G)
					return
				G.forceMove(get_turf(H))
				qdel(G)
				H.update_genitals()

	else if (select_alteration == "Ears")
		var/list/snowflake_ears_list = list("Normal" = null)
		for(var/path in GLOB.mam_ears_list)
			var/datum/sprite_accessory/ears/mam_ears/instance = GLOB.mam_ears_list[path]
			if(istype(instance, /datum/sprite_accessory))
				var/datum/sprite_accessory/S = instance
				if((!S.ckeys_allowed) || (S.ckeys_allowed.Find(H.client.ckey)))
					snowflake_ears_list[S.name] = path
		var/new_ears
		new_ears = input(owner, "Choose your character's ears:", "Ear Alteration") as null|anything in snowflake_ears_list
		if(new_ears)
			H.dna.features["mam_ears"] = new_ears
		H.update_body()

	else if (select_alteration == "Snout")
		var/list/snowflake_snouts_list = list("Normal" = null)
		for(var/path in GLOB.mam_snouts_list)
			var/datum/sprite_accessory/snouts/mam_snouts/instance = GLOB.mam_snouts_list[path]
			if(istype(instance, /datum/sprite_accessory))
				var/datum/sprite_accessory/S = instance
				if((!S.ckeys_allowed) || (S.ckeys_allowed.Find(H.client.ckey)))
					snowflake_snouts_list[S.name] = path
		var/new_snout
		new_snout = input(owner, "Choose your character's face:", "Face Alteration") as null|anything in snowflake_snouts_list
		if(new_snout)
			H.dna.features["mam_snouts"] = new_snout
		H.update_body()

	else if (select_alteration == "Wings")
		var/new_color = input(owner, "Choose your wing color:", "Race change","#"+H.dna.features["wings_color"]) as color|null
		if(new_color)
			H.dna.features["wings_color"] = sanitize_hexcolor(new_color, 6)
			H.update_body()
			H.update_hair()
		var/list/snowflake_wings_list = list("Normal" = null)
		for(var/path in GLOB.deco_wings_list)
			var/datum/sprite_accessory/deco_wings/instance = GLOB.deco_wings_list[path]
			if(istype(instance, /datum/sprite_accessory))
				var/datum/sprite_accessory/S = instance
				if((!S.ckeys_allowed) || (S.ckeys_allowed.Find(H.client.ckey)))
					snowflake_wings_list[S.name] = path
		var/new_wings
		new_wings = input(owner, "Choose your character's wings:", "Wing Alteration") as null|anything in snowflake_wings_list
		if(new_wings)
			H.dna.features["deco_wings"] = new_wings
		H.update_body()

	else if (select_alteration == "Markings")
		var/list/snowflake_markings_list = list("None")
		for(var/path in GLOB.mam_body_markings_list)
			var/datum/sprite_accessory/mam_body_markings/instance = GLOB.mam_body_markings_list[path]
			if(istype(instance, /datum/sprite_accessory))
				var/datum/sprite_accessory/S = instance
				if((!S.ckeys_allowed) || (S.ckeys_allowed.Find(H.client.ckey)))
					snowflake_markings_list[S.name] = path
		var/new_mam_body_markings
		new_mam_body_markings = input(H, "Choose your character's body markings:", "Marking Alteration") as null|anything in snowflake_markings_list
		if(new_mam_body_markings)
			H.dna.features["mam_body_markings"] = new_mam_body_markings
		for(var/X in H.bodyparts) //propagates the markings changes
			var/obj/item/bodypart/BP = X
			BP.update_limb(FALSE, H)
		H.update_body()

	else if (select_alteration == "Tail")
		var/list/snowflake_tails_list = list("Normal" = null)
		for(var/path in GLOB.mam_tails_list)
			var/datum/sprite_accessory/tails/mam_tails/instance = GLOB.mam_tails_list[path]
			if(istype(instance, /datum/sprite_accessory))
				var/datum/sprite_accessory/S = instance
				if((!S.ckeys_allowed) || (S.ckeys_allowed.Find(H.client.ckey)))
					snowflake_tails_list[S.name] = path
		var/new_tail
		new_tail = input(owner, "Choose your character's Tail(s):", "Tail Alteration") as null|anything in snowflake_tails_list
		if(new_tail)
			H.dna.features["mam_tail"] = new_tail
			if(new_tail != "None")
				H.dna.features["taur"] = "None"
		H.update_body()

	else if (select_alteration == "Taur body")
		var/list/snowflake_taur_list = list("Normal" = null)
		for(var/path in GLOB.taur_list)
			var/datum/sprite_accessory/taur/instance = GLOB.taur_list[path]
			if(istype(instance, /datum/sprite_accessory))
				var/datum/sprite_accessory/S = instance
				if(S.ignore)
					continue
				if((!S.ckeys_allowed) || (S.ckeys_allowed.Find(H.client.ckey)))
					snowflake_taur_list[S.name] = path
		var/new_taur
		new_taur = input(owner, "Choose your character's tauric body:", "Tauric Alteration") as null|anything in snowflake_taur_list
		if(new_taur)
			H.dna.features["taur"] = new_taur
			if(new_taur != "None")
				H.dna.features["mam_tail"] = "None"
		H.update_body()

	else if (select_alteration == "Penis")
		for(var/obj/item/organ/genital/penis/X in H.internal_organs)
			qdel(X)
		var/new_shape
		new_shape = input(owner, "Choose your character's dong", "Genital Alteration") as null|anything in GLOB.cock_shapes_list
		if(new_shape)
			H.dna.features["cock_shape"] = new_shape
		H.update_genitals()
		H.give_genital(/obj/item/organ/genital/testicles)
		H.give_genital(/obj/item/organ/genital/penis)
		H.apply_overlay()


	else if (select_alteration == "Vagina")
		for(var/obj/item/organ/genital/vagina/X in H.internal_organs)
			qdel(X)
		var/new_shape
		new_shape = input(owner, "Choose your character's pussy", "Genital Alteration") as null|anything in GLOB.vagina_shapes_list
		if(new_shape)
			H.dna.features["vag_shape"] = new_shape
		H.update_genitals()
		H.give_genital(/obj/item/organ/genital/womb)
		H.give_genital(/obj/item/organ/genital/vagina)
		H.apply_overlay()

	else if (select_alteration == "Penis Length")
		for(var/obj/item/organ/genital/penis/X in H.internal_organs)
			qdel(X)
		var/min_D = CONFIG_GET(number/penis_min_inches_prefs)
		var/max_D = CONFIG_GET(number/penis_max_inches_prefs)
		var/new_length = input(owner, "Penis length in inches:\n([min_D]-[max_D])", "Genital Alteration") as num|null
		if(new_length)
			H.dna.features["cock_length"] = clamp(round(new_length), min_D, max_D)
		H.update_genitals()
		H.apply_overlay()
		H.give_genital(/obj/item/organ/genital/testicles)
		H.give_genital(/obj/item/organ/genital/penis)

	else if (select_alteration == "Breast Size")
		for(var/obj/item/organ/genital/breasts/X in H.internal_organs)
			qdel(X)
		var/new_size = input(owner, "Breast Size", "Genital Alteration") as null|anything in CONFIG_GET(keyed_list/breasts_cups_prefs)
		if(new_size)
			H.dna.features["breasts_size"] = new_size
		H.update_genitals()
		H.apply_overlay()
		H.give_genital(/obj/item/organ/genital/breasts)

	else if (select_alteration == "Breast Shape")
		for(var/obj/item/organ/genital/breasts/X in H.internal_organs)
			qdel(X)
		var/new_shape
		new_shape = input(owner, "Breast Shape", "Genital Alteration") as null|anything in GLOB.breasts_shapes_list
		if(new_shape)
			H.dna.features["breasts_shape"] = new_shape
		H.update_genitals()
		H.apply_overlay()
		H.give_genital(/obj/item/organ/genital/breasts)
/// SPLURT EDIT START
	else if (select_alteration == "Butt Size")
		for(var/obj/item/organ/genital/butt/X in H.internal_organs)
			qdel(X)
		var/min_B = CONFIG_GET(number/butt_min_size_prefs)
		var/max_B = CONFIG_GET(number/butt_max_size_prefs)
		var/new_length = input(owner, "Butt size:\n([min_B]-[max_B])", "Genital Alteration") as num|null
		if(new_length)
			H.dna.features["butt_size"] = clamp(round(new_length), min_B, max_B)
		H.update_genitals()
		H.apply_overlay()
		H.give_genital(/obj/item/organ/genital/butt)

	else if (select_alteration == "Belly Size")
		for(var/obj/item/organ/genital/belly/X in H.internal_organs)
			qdel(X)
		var/min_belly = CONFIG_GET(number/belly_min_size_prefs)
		var/max_belly = CONFIG_GET(number/belly_max_size_prefs)
		var/new_length = input(owner, "Belly size:\n([min_belly]-[max_belly])", "Genital Alteration") as num|null
		if(new_length)
			H.dna.features["belly_size"] = clamp(round(new_length), min_belly, max_belly)
		H.update_genitals()
		H.apply_overlay()
		H.give_genital(/obj/item/organ/genital/belly)

	else if (select_alteration == "Body Size")
		// Check if the user has the size_normalized component attached, to avoid body size accumulation bug
		var/datum/component/size_normalized = H.GetComponent(/datum/component/size_normalized)
		if (size_normalized)
			to_chat(owner, "<span class='warning'>The normalizer prevents you from adjusting your entire body's size.</span>")
			return
		else
			var/new_body_size = input(owner, "Choose your desired sprite size: ([CONFIG_GET(number/body_size_min)*100]-[CONFIG_GET(number/body_size_max)*100]%)\nWarning: This may make your character look distorted. Additionally, any size under 100% takes a 10% maximum health penalty", "Character Preference", H.dna.features["body_size"]*100) as num|null
			if(new_body_size)
				var/chosen_size = clamp(new_body_size * 0.01, CONFIG_GET(number/body_size_min), CONFIG_GET(number/body_size_max))
				H.update_size(chosen_size)

	else if (select_alteration == "Genital Color")
		var/genital_part = input(owner, "Select what part of your genitals to alter", "Genital Color", "cancel") in list("Penis", "Butt", "Balls", "Anus", "Vagina", "Breasts", "Belly", "Toggle genitals using skintone", "Cancel")
		if(genital_part == "Toggle genitals using skintone")
			var/use_skintone = input(owner, "Do you want to use your skin tone for all genitals? (Only works for Species that support Skin Tones)", "Genital Color") in list("Yes", "No")
			if(use_skintone == "Yes")
				H.dna.features["genitals_use_skintone"] = TRUE
			else
				H.dna.features["genitals_use_skintone"] = FALSE
		else
			var/hex_color = null
			if (genital_part == "Penis")
				hex_color = input(owner, "Choose your " + "penis" + " color:", "Genital Color", "#" + H.dna.features["cock_color"]) as color|null
				genital_part = "cock"
			else if (genital_part == "Vagina")
				hex_color = input(owner, "Choose your " + "vagina" + " color:", "Genital Color", "#" + H.dna.features["vag_color"]) as color|null
				genital_part = "vag"
			else if (genital_part == "Balls")
				hex_color = input(owner, "Choose your " + "balls" + " color:", "Genital Color", "#" + H.dna.features["balls_color"]) as color|null
				genital_part = "balls"
			else if (genital_part == "Breasts")
				hex_color = input(owner, "Choose your " + "breasts" + " color:", "Genital Color", "#" + H.dna.features["breasts_color"]) as color|null
				genital_part = "breasts"
			else if (genital_part == "Butt")
				hex_color = input(owner, "Choose your " + "butt" + " color:", "Genital Color", "#" + H.dna.features["butt_color"]) as color|null
				genital_part = "butt"
			else if (genital_part == "Anus")
				hex_color = input(owner, "Choose your " + "anus" + " color:", "Genital Color", "#" + H.dna.features["anus_color"]) as color|null
				genital_part = "anus"
			else if (genital_part == "Belly")
				hex_color = input(owner, "Choose your " + "belly" + " color:", "Genital Color", "#" + H.dna.features["belly_color"]) as color|null
				genital_part = "belly"

			if (hex_color)
				H.dna.features[genital_part + "_color"] = sanitize_hexcolor(hex_color, 6)
				H.dna.features["genitals_use_skintone"] = FALSE

		H.update_genitals()

	else if (select_alteration == "Horns")
		var/new_horns = input(owner, "Choose your character's horns:", "Character Preference") as null|anything in GLOB.horns_list
		if(new_horns)
			H.dna.features["horns"] = new_horns

		var/new_horn_color = input(owner, "Choose your character's horn color:", "Character Preference", "#" + H.dna.features["horns_color"]) as color|null
		if(new_horn_color)
			if (new_horn_color == "#000000" && H.dna.features["horns_color"] != "85615A")
				H.dna.features["horns_color"] = "85615A"
			else
				H.dna.features["horns_color"] = sanitize_hexcolor(new_horn_color, 6)

			H.update_body()

	else if (select_alteration == "Hair Color")
		var/new_hair_color = input(owner, "Choose your character's hair color:", "Character Preference", "#" + H.dna.features["hair_color"]) as color|null
		if (new_hair_color)
			H.hair_color = sanitize_hexcolor(new_hair_color, 6)
		H.update_hair()

	else if(select_alteration == "Skin Tone (Non-Mutant)") // Skin tone, different than mutant color
		var/list/choices = GLOB.skin_tones - GLOB.nonstandard_skin_tones
		if(CONFIG_GET(flag/allow_custom_skintones))
			choices += "custom"
		var/new_s_tone = input(owner, "Choose your character's skin tone: (This is different than the Body Color option, which changes your character's mutant colors)", "Character Preference")  as null|anything in choices
		if(new_s_tone)
			if(new_s_tone == "custom")
				var/default = H.skin_tone
				var/custom_tone = input(owner, "Choose your character's skin tone: (This is different than the Body Color option, which changes your character's mutant colors)", "Character Preference", default) as color|null
				if(custom_tone)
					var/temp_hsv = RGBtoHSV(custom_tone)
					if(ReadHSV(temp_hsv)[3] < ReadHSV("#333333")[3] && CONFIG_GET(flag/character_color_limits)) // rgb(50,50,50) //SPLURT EDIT
						to_chat(owner,"<span class='danger'>Invalid color. Your color is not bright enough.</span>")
					else
						H.skin_tone = custom_tone
			else
				H.skin_tone = new_s_tone
			H.update_body()
	
	else if (select_alteration == "Gender & Lewd")
		var/lewd_selection = input(owner, "Select what aspect of gender and lewd preferences to alter", "Gender & Lewd", "cancel") in list("Gender", "Body Model", "Cancel")
		if(lewd_selection == "Gender")
			var/new_gender = input(owner, "Select your gender:", "Gender Selection") as null|anything in list("Male", "Female", "Non-binary", "Object")
			if(new_gender)
				switch(new_gender)
					if("Male")
						H.gender = MALE
					if("Female")
						H.gender = FEMALE
					if("Non-binary")
						H.gender = PLURAL
					if("Object")
						H.gender = NEUTER
		if(lewd_selection == "Body Model")
			var/new_body_model = input(owner, "Select your body model:", "Body Model Selection") as null|anything in list("Masculine", "Feminine")
			if(new_body_model)
				H.dna.features["body_model"] = new_body_model == "Masculine" ? MALE : FEMALE
				H.update_body()

	else if (select_alteration == "Legs")
		var/leg_choice = input(owner, "Choose your character's leg type:", "Leg Type Alteration") as null|anything in list("Plantigrade", "Digitigrade", "Cancel")
		if(leg_choice)
			switch(leg_choice)
				if("Plantigrade")
					H.dna.features["legs"] = "Plantigrade"
					H.dna.species.mutant_bodyparts["legs"] = "Plantigrade"
					H.Digitigrade_Leg_Swap(TRUE)
				if("Digitigrade")
					H.dna.features["legs"] = "Digitigrade"
					H.dna.species.mutant_bodyparts["legs"] = "Digitigrade"
					H.Digitigrade_Leg_Swap(FALSE)
			H.update_body()

/// SPLURT EDIT END
	else
		return
