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

/datum/language/modular_splurt/nyanese
	name = "Nyanese"
	desc = "The intergalatic language of felines, often used to annoy gods."
	speech_verb = "meows"
	ask_verb = "mrrps"
	exclaim_verb = "mrowls"
	key = "3"
	flags = TONGUELESS_SPEECH
	space_chance = 100
	syllables = list(
		"Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Mrrp", "Hiss", "Prrr", "Myaa", "Mrow", "Nyah", "Rrrt", "Purr", "Yow",
"Murrr", "Meow",  "Nyaa", "Meow",  "Mii", "Meeoo", "Meow",  "Rrraow", "Chrr", "Mrrrr", "Myaow", "Mrawr", "Mrowl",
"Meeeow", "Nyrrrr", "Rrrrrooo", "Meow",  "Hrrrrt", "Meeew","Meow",  "Mieow", "Raaow", "Meerp", "Meow",  "Ryaa", "Meow",  "Hrrrawr",
"Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow",
"Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow",
"Meow", "Meow", "Meow", "Meow", "Meow", "Meow", "Meow"

	)
	icon_state = "feline"
	default_priority = 75
	//SKYRAT CHANGE - language restriction
	restricted = FALSE

//    							-----LUCKY KITTY MEOW MEOW LEARNING TIME-----
// CODER! To save you the hassle, the key variable of a language must have be completly unique and not shared with any other languages.
// To save you the trouble I have gone through all the languages in SPLURT Code. The remaining keys are 5, 7 and 8.
// Please remove the keys from this comment when you use them! - Lucky (12/10/24)

// Hypothetically, we could get around this by dynamically assigning keys to the languages a person speaks, but that's beyond me
