// This HUD is set based on client data. The above proc is often called before the mob has a client and therefore won't work. Login is thus the better option, correct me if this is a bad idea. - Casper
/mob/living/carbon/human/Login()
	. = ..()
	set_antag_target_indicator()

/mob/living/carbon/human/Logout()
	. = ..()
	set_antag_target_indicator()

/mob/living/carbon/human/wash_cream()
	. = ..()
	if(cheesed)
		cut_overlay(mutable_appearance('modular_splurt/icons/effects/cheesed.dmi', "cheesed_snout"))
		cut_overlay(mutable_appearance('modular_splurt/icons/effects/cheesed.dmi', "cheesed_human"))
		cheesed = FALSE

/mob/living/carbon/human/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/flavor_text/carbon, _name = "Headshot", _save_key = "headshot_link", _examine_no_preview = TRUE, _edit = FALSE)
/mob/living/carbon/human/species/mammal/shadekin
	race = /datum/species/mammal/shadekin

/mob/living/carbon/human/species/mammal/teshari
	race = /datum/species/mammal/teshari

/mob/living/carbon/human/species/mammal/vox
	race = /datum/species/vox

/mob/living/carbon/human/is_literate()
	// Check for D4C craving
	if(HAS_TRAIT(src, TRAIT_DUMB_CUM_CRAVE))
		// Warn user, then return
		to_chat(src, span_love("You can't focus on anything but cum right now!"))
		return FALSE

	// Return normally
	. = ..()
