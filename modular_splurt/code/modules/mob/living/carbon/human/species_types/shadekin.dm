/datum/species/mammal/shadekin
	name = "Shadekin"
	id = SPECIES_SHADEKIN
	say_mod = "mars"
	eye_type = "shadekin"
	mutant_bodyparts = list("mcolor" = "FFFFFF", "mcolor2" = "FFFFFF", "mcolor3" = "FFFFFF", "mam_tail" = "Shadekin", "mam_ears" = "Shadekin", "deco_wings" = "None",
						"taur" = "None", "horns" = "None", "legs" = "Plantigrade", "meat_type" = "Mammalian")
	allowed_limb_ids = null
	override_bp_icon = 'modular_splurt/icons/mob/human_parts_greyscale.dmi'
	eye_type = "shadekin"
	
	// Prevent quirks with this species
	blacklisted_quirks = list(/datum/quirk/blessed_blood)
