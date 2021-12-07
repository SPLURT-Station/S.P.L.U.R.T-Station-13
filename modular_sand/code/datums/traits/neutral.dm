/datum/quirk/hypnotic_stupor //straight from skyrat
	name = "Hypnotic Stupor"
	desc = "Your prone to episodes of extreme stupor that leaves you extremely suggestible."
	value = 0
	human_only = TRUE
	gain_text = null // Handled by trauma.
	lose_text = null
	medical_record_text = "Patient has an untreatable condition with their brain, wiring them to be extreamly suggestible..."

/datum/quirk/hypnotic_stupor/add()
	var/datum/brain_trauma/severe/hypnotic_stupor/T = new()
	var/mob/living/carbon/human/H = quirk_holder
	H.gain_trauma(T, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/infertile
	name = "Infertile"
	desc = "For one reason or another you simply don't seem able to get pregnant, no matter how hard you try."
	value = 0
	human_only = TRUE
	mob_trait = TRAIT_INFERTILE
	gain_text = "<span class='notice'>Your womb starts feeling dry and empty, all the life in it begins to fade away...</span>"
	lose_text = "<span class='love'>You feel the warm blow of life flooding your womb, full of newfound, vibrant fertility!</span>"
	medical_record_text = "Patient doesn't seem able to ovulate properly..."
