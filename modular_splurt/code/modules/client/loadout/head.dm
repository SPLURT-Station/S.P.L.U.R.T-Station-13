// removes resricted role for D.A.B. helmets. RIP N.E.E.T. gear as exclusive for assistants (2019-2021).
/datum/gear/head/neethelm
	subcategory = LOADOUT_SUBCATEGORY_SUIT_GENERAL
	restricted_roles = list()

// Updates restrictions to accomodate new jobs (mostly trekkie stuff)
/datum/gear/head/brodie
	restricted_roles = list("Security Officer", "Warden", "Head of Security", "Brig Physician", "Blueshield")

/datum/gear/head/trekcapcap
	restricted_roles = list("Captain","Head of Personnel","Blueshield")

/datum/gear/head/trekcapmedisci
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/head/trekcapsec
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Warden","Detective","Security Officer","Brig Physician","Blueshield","Bridge Officer")

/datum/gear/head/orvkepicom
	restricted_roles = list("Head of Security", "Captain", "Head of Personnel", "Chief Engineer", "Research Director", "Chief Medical Officer", "Quartermaster", "Bridge Officer")

/datum/gear/head/orvkepisec
	restricted_roles = list("Warden", "Detective", "Security Officer", "Head of Security", "Brig Physician", "Blueshield")

/datum/gear/head/orvkepimedsci
	restricted_roles = list("Chief Medical Officer", "Medical Doctor", "Chemist", "Virologist", "Paramedic", "Geneticist", "Research Director", "Scientist", "Roboticist", "Brig Physician")

/datum/gear/head/cowboyhat/sec
	restricted_roles = list("Warden","Detective","Security Officer","Head of Security", "Brig Physician", "Blueshield")

// Polychrome GWTB
/datum/gear/head/gonerhelm
	name = "polychromic trencher helmet"
	cost = 2
	path = /obj/item/clothing/head/helmet/goner/fake/poly
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
	loadout_initial_colors = list("#D9D9D9")

/datum/gear/head/goneroffcap
	name = "polychromic trencher officer cap"
	cost = 2
	path = /obj/item/clothing/head/helmet/goner/officer/fake/poly
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
	loadout_initial_colors = list("#F2F2F2")

//Adds bowler hats
/datum/gear/head/bowler
	name = "Bowler-hat"
	cost = 1
	path = /obj/item/clothing/head/bowler
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

//Adds medical beret
/datum/gear/head/medberet
	name = "Medical officer's beret"
	cost = 1
	path = /obj/item/clothing/head/beret/med
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
	restricted_roles = list("Chief Medical Officer", "Medical Doctor", "Chemist", "Virologist", "Paramedic", "Geneticist", "Brig Physician")
	subcategory = LOADOUT_SUBCATEGORY_HEAD_JOBS

//Adds the three basic flowers that can be pinned into the hair
/datum/gear/head/poppy
	name = "Poppy"
	cost = 2
	path = /obj/item/reagent_containers/food/snacks/grown/poppy
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/head/lily
	name = "Lily"
	cost = 2
	path = /obj/item/reagent_containers/food/snacks/grown/poppy/lily
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/head/geranium
	name = "Geranium"
	cost = 2
	path = /obj/item/reagent_containers/food/snacks/grown/poppy/geranium
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/head/deckers
	name = "Decker Headphones"
	description = "A sweet pair of headphones."
	cost = 2
	path = /obj/item/clothing/head/deckers
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/head/invisihat
	name = "invisifiber hat"
	description = "A hat made of transparent fibers, often used with reinforcement kits."
	path = /obj/item/clothing/head/invisihat
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/head/clussy_wig
	name = "Clussy wig"
	path = /obj/item/clothing/head/clussy_wig
	subcategory = LOADOUT_SUBCATEGORY_HEAD_JOBS
	restricted_roles = list("Clown")
	restricted_desc = "Clown"

/datum/gear/head/hoodcowl
	name = "Hood cowl"
	path= /obj/item/clothing/head/hoodcowl
