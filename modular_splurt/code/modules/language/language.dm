// Note: Add the relevant language into code\modules\surgery\organs\tongue.dm list, else people could understand but not speak it when selected.
// That's it unless you plan to limit the language to specific tongue.
/datum/language/modular_splurt
	icon = 'modular_splurt/icons/misc/language.dmi'
	icon_state = "whar"

// I am not creative with this.
/datum/language/modular_splurt/avian
	name = "Avian"
	desc = "A collection of bird songs and calls, mostly pleasant to human ears."
	speech_verb = "chirps"
	ask_verb = "chirps curiously"
	exclaim_verb = "chirps loudly"
	whisper_verb = "coos"
	key = "a"
	space_chance = 42
	syllables = list("cheep", "peep", "beep", "tweet")
	default_priority = 70
	flags = TONGUELESS_SPEECH
	icon_state = "birb"
	restricted = FALSE
