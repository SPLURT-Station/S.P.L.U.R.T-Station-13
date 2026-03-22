// Body Morpher Preset System
// Allows players to save and load body configuration presets

// Maximum number of custom presets a player can have
#define MAX_BODYMORPHER_PRESETS 10

// List of features that can be saved in bodymorpher presets
// These must match the options in humanoid_customization/change_form()
GLOBAL_LIST_INIT(bodymorpher_preset_features, list(
	"mcolor",
	"mcolor2", 
	"mcolor3",
	"left_eye_color",
	"right_eye_color",
	"hair_style",
	"hair_color",
	"facial_hair_style",
	"facial_hair_color",
	"skin_tone",
	"mam_ears",
	"mam_snouts",
	"mam_tail",
	"mam_body_markings",
	"deco_wings",
	"wings_color",
	"taur",
	"horns",
	"horns_color",
	"legs",
	"gender",
	"body_model",
	"body_size",
	"cock_shape",
	"cock_length",
	"cock_color",
	"cock_visibility",
	"balls_shape",
	"balls_size",
	"balls_color",
	"balls_visibility",
	"breasts_shape",
	"breasts_size",
	"breasts_color",
	"breasts_visibility",
	"vag_shape",
	"vag_color",
	"vag_visibility",
	"butt_size",
	"butt_color",
	"butt_visibility",
	"belly_size",
	"belly_color",
	"belly_visibility",
	"anus_shape",
	"anus_color",
	"anus_visibility",
	"has_cock",
	"has_balls",
	"has_breasts",
	"has_vag",
	"has_butt",
	"has_belly",
	"has_anus",
	"genitals_use_skintone"
))

// Base presets that cannot be modified by players
/datum/bodymorpher_preset
	var/name = "Unnamed Preset"
	var/description = "A bodymorpher preset"
	var/is_base_preset = FALSE // If TRUE, this preset cannot be modified or deleted by players
	var/list/features = list()

/datum/bodymorpher_preset/New(name, description, list/features, is_base = FALSE)
	src.name = name
	src.description = description
	src.features = features ? features.Copy() : list()
	src.is_base_preset = is_base

// Base presets - these are the default configurations
/datum/bodymorpher_preset/base_human
	name = "Human (Base)"
	description = "Standard human configuration"
	is_base_preset = TRUE
	features = list(
		"mam_ears" = "None",
		"mam_snouts" = "None",
		"mam_tail" = "None",
		"deco_wings" = "None",
		"taur" = "None",
		"horns" = "None",
		"legs" = "Plantigrade",
		"has_cock" = FALSE,
		"has_balls" = FALSE,
		"has_breasts" = FALSE,
		"has_vag" = FALSE,
		"has_butt" = FALSE,
		"has_belly" = FALSE,
		"has_anus" = FALSE
	)

/datum/bodymorpher_preset/base_masculine
	name = "Masculine (Base)"
	description = "Standard masculine configuration"
	is_base_preset = TRUE
	features = list(
		"body_model" = MALE,
		"gender" = MALE
	)

/datum/bodymorpher_preset/base_feminine
	name = "Feminine (Base)"
	description = "Standard feminine configuration"
	is_base_preset = TRUE
	features = list(
		"body_model" = FEMALE,
		"gender" = FEMALE
	)

/datum/bodymorpher_preset/base_dragon
	name = "Dragon (Base)"
	description = "Dragon-like configuration with wings and tail"
	is_base_preset = TRUE
	features = list(
		"mam_tail" = "Dragon",
		"deco_wings" = "Dragon",
		"mam_snouts" = "Dragon",
		"mam_ears" = "None",
		"horns" = "Dragon",
		"legs" = "Digitigrade"
	)

/datum/bodymorpher_preset/base_wolf
	name = "Wolf (Base)"
	description = "Wolf-like configuration"
	is_base_preset = TRUE
	features = list(
		"mam_tail" = "Wolf",
		"mam_snouts" = "Wolf",
		"mam_ears" = "Wolf",
		"legs" = "Digitigrade"
	)

/datum/bodymorpher_preset/base_cat
	name = "Cat (Base)"
	description = "Cat-like configuration"
	is_base_preset = TRUE
	features = list(
		"mam_tail" = "Cat",
		"mam_snouts" = "Cat",
		"mam_ears" = "Cat",
		"legs" = "Digitigrade"
	)

/datum/bodymorpher_preset/base_fox
	name = "Fox (Base)"
	description = "Fox-like configuration"
	is_base_preset = TRUE
	features = list(
		"mam_tail" = "Fox",
		"mam_snouts" = "Fox",
		"mam_ears" = "Fox",
		"legs" = "Digitigrade"
	)

// Global list of base presets
GLOBAL_LIST_INIT(bodymorpher_base_presets, list(
	"Human (Base)" = /datum/bodymorpher_preset/base_human,
	"Masculine (Base)" = /datum/bodymorpher_preset/base_masculine,
	"Feminine (Base)" = /datum/bodymorpher_preset/base_feminine,
	"Dragon (Base)" = /datum/bodymorpher_preset/base_dragon,
	"Wolf (Base)" = /datum/bodymorpher_preset/base_wolf,
	"Cat (Base)" = /datum/bodymorpher_preset/base_cat,
	"Fox (Base)" = /datum/bodymorpher_preset/base_fox
))

// Proc to get all available presets (base + custom)
/datum/preferences/proc/get_bodymorpher_presets()
	var/list/all_presets = list()
	
	// Add base presets
	for(var/preset_name in GLOB.bodymorpher_base_presets)
		var/preset_type = GLOB.bodymorpher_base_presets[preset_name]
		var/datum/bodymorpher_preset/preset = new preset_type()
		all_presets[preset_name] = preset
	
	// Add custom presets
	if(bodymorpher_presets)
		for(var/preset_name in bodymorpher_presets)
			var/list/preset_data = bodymorpher_presets[preset_name]
			var/datum/bodymorpher_preset/preset = new(preset_name, "Custom preset", preset_data, FALSE)
			all_presets[preset_name] = preset
	
	return all_presets

// Proc to save a new custom preset
/datum/preferences/proc/save_bodymorpher_preset(preset_name, mob/living/carbon/human/H)
	if(!preset_name || !H)
		return FALSE
	
	// Check if preset name is valid
	preset_name = trim(html_encode(preset_name))
	if(length(preset_name) > 50)
		preset_name = copytext(preset_name, 1, 50)
	
	// Check if this is a base preset name (cannot overwrite)
	if(preset_name in GLOB.bodymorpher_base_presets)
		to_chat(H, "<span class='warning'>Cannot overwrite base presets!</span>")
		return FALSE
	
	// Check if we have room for more presets (unless overwriting)
	if(!bodymorpher_presets)
		bodymorpher_presets = list()
	
	if(!bodymorpher_presets[preset_name] && bodymorpher_presets.len >= MAX_BODYMORPHER_PRESETS)
		to_chat(H, "<span class='warning'>Maximum number of presets reached ([MAX_BODYMORPHER_PRESETS])!</span>")
		return FALSE
	
	// Collect current features
	var/list/preset_data = list()
	
	// Body colors
	preset_data["mcolor"] = H.dna.features["mcolor"]
	preset_data["mcolor2"] = H.dna.features["mcolor2"]
	preset_data["mcolor3"] = H.dna.features["mcolor3"]
	
	// Eyes
	preset_data["left_eye_color"] = H.left_eye_color
	preset_data["right_eye_color"] = H.right_eye_color
	
	// Hair
	preset_data["hair_style"] = H.hair_style
	preset_data["hair_color"] = H.hair_color
	preset_data["facial_hair_style"] = H.facial_hair_style
	preset_data["facial_hair_color"] = H.facial_hair_color
	
	// Skin
	preset_data["skin_tone"] = H.skin_tone
	
	// Mutant parts
	preset_data["mam_ears"] = H.dna.features["mam_ears"]
	preset_data["mam_snouts"] = H.dna.features["mam_snouts"]
	preset_data["mam_tail"] = H.dna.features["mam_tail"]
	preset_data["mam_body_markings"] = H.dna.features["mam_body_markings"]
	preset_data["deco_wings"] = H.dna.features["deco_wings"]
	preset_data["wings_color"] = H.dna.features["wings_color"]
	preset_data["taur"] = H.dna.features["taur"]
	preset_data["horns"] = H.dna.features["horns"]
	preset_data["horns_color"] = H.dna.features["horns_color"]
	preset_data["legs"] = H.dna.features["legs"]
	
	// Gender and body model
	preset_data["gender"] = H.gender
	preset_data["body_model"] = H.dna.features["body_model"]
	preset_data["body_size"] = H.dna.features["body_size"]
	
	// Genitals
	preset_data["genitals_use_skintone"] = H.dna.features["genitals_use_skintone"]
	preset_data["has_cock"] = H.dna.features["has_cock"]
	preset_data["cock_shape"] = H.dna.features["cock_shape"]
	preset_data["cock_length"] = H.dna.features["cock_length"]
	preset_data["cock_color"] = H.dna.features["cock_color"]
	preset_data["cock_visibility"] = H.dna.features["cock_visibility"]
	
	preset_data["has_balls"] = H.dna.features["has_balls"]
	preset_data["balls_shape"] = H.dna.features["balls_shape"]
	preset_data["balls_size"] = H.dna.features["balls_size"]
	preset_data["balls_color"] = H.dna.features["balls_color"]
	preset_data["balls_visibility"] = H.dna.features["balls_visibility"]
	
	preset_data["has_breasts"] = H.dna.features["has_breasts"]
	preset_data["breasts_shape"] = H.dna.features["breasts_shape"]
	preset_data["breasts_size"] = H.dna.features["breasts_size"]
	preset_data["breasts_color"] = H.dna.features["breasts_color"]
	preset_data["breasts_visibility"] = H.dna.features["breasts_visibility"]
	
	preset_data["has_vag"] = H.dna.features["has_vag"]
	preset_data["vag_shape"] = H.dna.features["vag_shape"]
	preset_data["vag_color"] = H.dna.features["vag_color"]
	preset_data["vag_visibility"] = H.dna.features["vag_visibility"]
	
	preset_data["has_butt"] = H.dna.features["has_butt"]
	preset_data["butt_size"] = H.dna.features["butt_size"]
	preset_data["butt_color"] = H.dna.features["butt_color"]
	preset_data["butt_visibility"] = H.dna.features["butt_visibility"]
	
	preset_data["has_belly"] = H.dna.features["has_belly"]
	preset_data["belly_size"] = H.dna.features["belly_size"]
	preset_data["belly_color"] = H.dna.features["belly_color"]
	preset_data["belly_visibility"] = H.dna.features["belly_visibility"]
	
	preset_data["has_anus"] = H.dna.features["has_anus"]
	preset_data["anus_shape"] = H.dna.features["anus_shape"]
	preset_data["anus_color"] = H.dna.features["anus_color"]
	preset_data["anus_visibility"] = H.dna.features["anus_visibility"]
	
	// Save preset
	bodymorpher_presets[preset_name] = preset_data
	
	// Log the action
	log_bodymorpher(H, "saved preset '[preset_name]'")
	
	// Save character to persist the preset
	save_character()
	
	to_chat(H, "<span class='notice'>Preset '[preset_name]' saved successfully!</span>")
	return TRUE

// Proc to load a preset
/datum/preferences/proc/load_bodymorpher_preset(preset_name, mob/living/carbon/human/H)
	if(!preset_name || !H)
		return FALSE
	
	var/list/preset_data
	
	// Check if it's a base preset
	if(preset_name in GLOB.bodymorpher_base_presets)
		var/preset_type = GLOB.bodymorpher_base_presets[preset_name]
		var/datum/bodymorpher_preset/preset = new preset_type()
		preset_data = preset.features
	else if(bodymorpher_presets && bodymorpher_presets[preset_name])
		preset_data = bodymorpher_presets[preset_name]
	else
		to_chat(H, "<span class='warning'>Preset '[preset_name]' not found!</span>")
		return FALSE
	
	// Apply preset features with bodymorpher validation
	apply_bodymorpher_preset_data(preset_data, H)
	
	// Log the action
	log_bodymorpher(H, "loaded preset '[preset_name]'")
	
	to_chat(H, "<span class='notice'>Preset '[preset_name]' loaded successfully!</span>")
	return TRUE

// Proc to delete a custom preset
/datum/preferences/proc/delete_bodymorpher_preset(preset_name, mob/living/carbon/human/H)
	if(!preset_name || !H)
		return FALSE
	
	// Cannot delete base presets
	if(preset_name in GLOB.bodymorpher_base_presets)
		to_chat(H, "<span class='warning'>Cannot delete base presets!</span>")
		return FALSE
	
	if(!bodymorpher_presets || !bodymorpher_presets[preset_name])
		to_chat(H, "<span class='warning'>Preset '[preset_name]' not found!</span>")
		return FALSE
	
	// Log before deletion
	log_bodymorpher(H, "deleted preset '[preset_name]'")
	
	bodymorpher_presets -= preset_name
	
	// Save character to persist the deletion
	save_character()
	
	to_chat(H, "<span class='notice'>Preset '[preset_name]' deleted successfully!</span>")
	return TRUE

// Proc to apply preset data to a human, following bodymorpher restrictions
/proc/apply_bodymorpher_preset_data(list/preset_data, mob/living/carbon/human/H)
	if(!preset_data || !H)
		return
	
	// Body colors (with brightness validation)
	if(preset_data["mcolor"])
		var/new_color = preset_data["mcolor"]
		var/temp_hsv = RGBtoHSV("#" + new_color)
		if(ReadHSV(temp_hsv)[3] >= ReadHSV(MINIMUM_MUTANT_COLOR)[3] || !CONFIG_GET(flag/character_color_limits))
			H.dna.features["mcolor"] = sanitize_hexcolor(new_color, 6)
	
	if(preset_data["mcolor2"])
		H.dna.features["mcolor2"] = sanitize_hexcolor(preset_data["mcolor2"], 6)
	
	if(preset_data["mcolor3"])
		H.dna.features["mcolor3"] = sanitize_hexcolor(preset_data["mcolor3"], 6)
	
	// Eyes
	if(preset_data["left_eye_color"])
		H.left_eye_color = sanitize_hexcolor(preset_data["left_eye_color"], 6)
	if(preset_data["right_eye_color"])
		H.right_eye_color = sanitize_hexcolor(preset_data["right_eye_color"], 6)
	
	// Hair
	if(preset_data["hair_style"])
		if(preset_data["hair_style"] in GLOB.hair_styles_list)
			H.hair_style = preset_data["hair_style"]
	if(preset_data["hair_color"])
		H.hair_color = sanitize_hexcolor(preset_data["hair_color"], 6)
	
	if(preset_data["facial_hair_style"])
		if(preset_data["facial_hair_style"] in GLOB.facial_hair_styles_list)
			H.facial_hair_style = preset_data["facial_hair_style"]
	if(preset_data["facial_hair_color"])
		H.facial_hair_color = sanitize_hexcolor(preset_data["facial_hair_color"], 6)
	
	// Skin tone (only for species that support it)
	if(H.pref_species.use_skintones && preset_data["skin_tone"])
		if(preset_data["skin_tone"] in GLOB.skin_tones)
			H.skin_tone = preset_data["skin_tone"]
	
	// Mutant parts (with validation)
	if(preset_data["mam_ears"])
		if(H.client?.can_have_part("mam_ears"))
			var/list/valid_ears = list("Normal" = null)
			for(var/path in GLOB.mam_ears_list)
				var/datum/sprite_accessory/ears/instance = GLOB.mam_ears_list[path]
				if(istype(instance, /datum/sprite_accessory))
					var/datum/sprite_accessory/S = instance
					if((!S.ckeys_allowed) || (S.ckeys_allowed?.Find(H.client?.ckey)))
						valid_ears[S.name] = path
			if(preset_data["mam_ears"] in valid_ears)
				H.dna.features["mam_ears"] = preset_data["mam_ears"]
	
	if(preset_data["mam_snouts"])
		if(H.client?.can_have_part("mam_snouts"))
			var/list/valid_snouts = list("Normal" = null)
			for(var/path in GLOB.mam_snouts_list)
				var/datum/sprite_accessory/snouts/instance = GLOB.mam_snouts_list[path]
				if(istype(instance, /datum/sprite_accessory))
					var/datum/sprite_accessory/S = instance
					if((!S.ckeys_allowed) || (S.ckeys_allowed?.Find(H.client?.ckey)))
						valid_snouts[S.name] = path
			if(preset_data["mam_snouts"] in valid_snouts)
				H.dna.features["mam_snouts"] = preset_data["mam_snouts"]
	
	if(preset_data["mam_tail"])
		if(H.client?.can_have_part("mam_tail"))
			var/list/valid_tails = list("Normal" = null)
			for(var/path in GLOB.mam_tails_list)
				var/datum/sprite_accessory/tails/instance = GLOB.mam_tails_list[path]
				if(istype(instance, /datum/sprite_accessory))
					var/datum/sprite_accessory/S = instance
					if((!S.ckeys_allowed) || (S.ckeys_allowed?.Find(H.client?.ckey)))
						valid_tails[S.name] = path
			if(preset_data["mam_tail"] in valid_tails)
				H.dna.features["mam_tail"] = preset_data["mam_tail"]
				if(preset_data["mam_tail"] != "None")
					H.dna.features["taur"] = "None"
	
	if(preset_data["deco_wings"])
		if(H.client?.can_have_part("deco_wings"))
			var/list/valid_wings = list("Normal" = null)
			for(var/path in GLOB.deco_wings_list)
				var/datum/sprite_accessory/deco_wings/instance = GLOB.deco_wings_list[path]
				if(istype(instance, /datum/sprite_accessory))
					var/datum/sprite_accessory/S = instance
					if((!S.ckeys_allowed) || (S.ckeys_allowed?.Find(H.client?.ckey)))
						valid_wings[S.name] = path
			if(preset_data["deco_wings"] in valid_wings)
				H.dna.features["deco_wings"] = preset_data["deco_wings"]
	
	if(preset_data["wings_color"])
		H.dna.features["wings_color"] = sanitize_hexcolor(preset_data["wings_color"], 6)
	
	if(preset_data["taur"])
		if(H.client?.can_have_part("taur"))
			var/list/valid_taur = list("Normal" = null)
			for(var/path in GLOB.taur_list)
				var/datum/sprite_accessory/taur/instance = GLOB.taur_list[path]
				if(istype(instance, /datum/sprite_accessory))
					var/datum/sprite_accessory/S = instance
					if(S.ignore)
						continue
					if((!S.ckeys_allowed) || (S.ckeys_allowed?.Find(H.client?.ckey)))
						valid_taur[S.name] = path
			if(preset_data["taur"] in valid_taur)
				H.dna.features["taur"] = preset_data["taur"]
				if(preset_data["taur"] != "None")
					H.dna.features["mam_tail"] = "None"
	
	if(preset_data["horns"])
		if(preset_data["horns"] in GLOB.horns_list)
			H.dna.features["horns"] = preset_data["horns"]
	
	if(preset_data["horns_color"])
		H.dna.features["horns_color"] = sanitize_hexcolor(preset_data["horns_color"], 6)
	
	if(preset_data["legs"])
		H.dna.features["legs"] = preset_data["legs"]
		H.dna.species.mutant_bodyparts["legs"] = preset_data["legs"]
		if(preset_data["legs"] == "Plantigrade")
			H.Digitigrade_Leg_Swap(TRUE)
		else if(preset_data["legs"] == "Digitigrade")
			H.Digitigrade_Leg_Swap(FALSE)
	
	// Gender and body model
	if(preset_data["gender"])
		H.gender = preset_data["gender"]
	
	if(preset_data["body_model"])
		H.dna.features["body_model"] = preset_data["body_model"]
	
	// Body size (with validation)
	if(preset_data["body_size"])
		var/min_size = CONFIG_GET(number/body_size_min)
		var/max_size = CONFIG_GET(number/body_size_max)
		var/chosen_size = clamp(preset_data["body_size"], min_size, max_size)
		H.update_size(chosen_size)
	
	// Genitals (with validation)
	if(preset_data["genitals_use_skintone"] != null)
		H.dna.features["genitals_use_skintone"] = preset_data["genitals_use_skintone"]
	
	// Penis
	if(preset_data["has_cock"])
		H.dna.features["has_cock"] = TRUE
		if(preset_data["cock_shape"])
			if(preset_data["cock_shape"] in GLOB.cock_shapes_list)
				H.dna.features["cock_shape"] = preset_data["cock_shape"]
		if(preset_data["cock_length"])
			var/min_D = CONFIG_GET(number/penis_min_inches_prefs)
			var/max_D = CONFIG_GET(number/penis_max_inches_prefs)
			H.dna.features["cock_length"] = clamp(round(preset_data["cock_length"]), min_D, max_D)
		if(preset_data["cock_color"])
			H.dna.features["cock_color"] = sanitize_hexcolor(preset_data["cock_color"], 6)
		if(preset_data["cock_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["cock_visibility"] in safe_vis)
				H.dna.features["cock_visibility"] = preset_data["cock_visibility"]
		H.give_genital(/obj/item/organ/genital/penis)
		H.give_genital(/obj/item/organ/genital/testicles)
	
	// Balls
	if(preset_data["has_balls"])
		H.dna.features["has_balls"] = TRUE
		if(preset_data["balls_shape"])
			if(preset_data["balls_shape"] in GLOB.balls_shapes_list)
				H.dna.features["balls_shape"] = preset_data["balls_shape"]
		if(preset_data["balls_size"])
			H.dna.features["balls_size"] = preset_data["balls_size"]
		if(preset_data["balls_color"])
			H.dna.features["balls_color"] = sanitize_hexcolor(preset_data["balls_color"], 6)
		if(preset_data["balls_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["balls_visibility"] in safe_vis)
				H.dna.features["balls_visibility"] = preset_data["balls_visibility"]
	
	// Breasts
	if(preset_data["has_breasts"])
		H.dna.features["has_breasts"] = TRUE
		if(preset_data["breasts_shape"])
			if(preset_data["breasts_shape"] in GLOB.breasts_shapes_list)
				H.dna.features["breasts_shape"] = preset_data["breasts_shape"]
		if(preset_data["breasts_size"])
			var/B_sizes = CONFIG_GET(keyed_list/breasts_cups_prefs)
			if(preset_data["breasts_size"] in B_sizes)
				H.dna.features["breasts_size"] = preset_data["breasts_size"]
		if(preset_data["breasts_color"])
			H.dna.features["breasts_color"] = sanitize_hexcolor(preset_data["breasts_color"], 6)
		if(preset_data["breasts_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["breasts_visibility"] in safe_vis)
				H.dna.features["breasts_visibility"] = preset_data["breasts_visibility"]
		H.give_genital(/obj/item/organ/genital/breasts)
	
	// Vagina
	if(preset_data["has_vag"])
		H.dna.features["has_vag"] = TRUE
		if(preset_data["vag_shape"])
			if(preset_data["vag_shape"] in GLOB.vagina_shapes_list)
				H.dna.features["vag_shape"] = preset_data["vag_shape"]
		if(preset_data["vag_color"])
			H.dna.features["vag_color"] = sanitize_hexcolor(preset_data["vag_color"], 6)
		if(preset_data["vag_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["vag_visibility"] in safe_vis)
				H.dna.features["vag_visibility"] = preset_data["vag_visibility"]
		H.give_genital(/obj/item/organ/genital/vagina)
		H.give_genital(/obj/item/organ/genital/womb)
	
	// Butt
	if(preset_data["has_butt"])
		H.dna.features["has_butt"] = TRUE
		if(preset_data["butt_size"])
			var/min_B = CONFIG_GET(number/butt_min_size_prefs)
			var/max_B = CONFIG_GET(number/butt_max_size_prefs)
			H.dna.features["butt_size"] = clamp(round(preset_data["butt_size"]), min_B, max_B)
		if(preset_data["butt_color"])
			H.dna.features["butt_color"] = sanitize_hexcolor(preset_data["butt_color"], 6)
		if(preset_data["butt_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["butt_visibility"] in safe_vis)
				H.dna.features["butt_visibility"] = preset_data["butt_visibility"]
		H.give_genital(/obj/item/organ/genital/butt)
	
	// Belly
	if(preset_data["has_belly"])
		H.dna.features["has_belly"] = TRUE
		if(preset_data["belly_size"])
			var/min_belly = CONFIG_GET(number/belly_min_size_prefs)
			var/max_belly = CONFIG_GET(number/belly_max_size_prefs)
			H.dna.features["belly_size"] = clamp(round(preset_data["belly_size"]), min_belly, max_belly)
		if(preset_data["belly_color"])
			H.dna.features["belly_color"] = sanitize_hexcolor(preset_data["belly_color"], 6)
		if(preset_data["belly_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["belly_visibility"] in safe_vis)
				H.dna.features["belly_visibility"] = preset_data["belly_visibility"]
		H.give_genital(/obj/item/organ/genital/belly)
	
	// Anus
	if(preset_data["has_anus"])
		H.dna.features["has_anus"] = TRUE
		if(preset_data["anus_shape"])
			if(preset_data["anus_shape"] in GLOB.anus_shapes_list)
				H.dna.features["anus_shape"] = preset_data["anus_shape"]
		if(preset_data["anus_color"])
			H.dna.features["anus_color"] = sanitize_hexcolor(preset_data["anus_color"], 6)
		if(preset_data["anus_visibility"])
			var/safe_vis = CONFIG_GET(str_list/safe_visibility_toggles)
			if(preset_data["anus_visibility"] in safe_vis)
				H.dna.features["anus_visibility"] = preset_data["anus_visibility"]
	
	// Update body
	H.update_body()
	H.update_hair()
	H.update_genitals()
	H.apply_overlay()

// Logging proc for bodymorpher actions
/proc/log_bodymorpher(mob/user, action)
	if(!user || !action)
		return
	
	var/log_message = "[key_name(user)] bodymorpher: [action]"
	
	// Log to game log
	log_game(log_message)
	
	// Log to admin log for visibility
	log_admin(log_message)
	
	// Also write to a dedicated bodymorpher log file
	var/log_file = file("data/logs/bodymorpher_[time2text(world.realtime, "YYYY-MM")].log")
	WRITE_FILE(log_file, "[time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")] - [log_message]")

#undef MAX_BODYMORPHER_PRESETS