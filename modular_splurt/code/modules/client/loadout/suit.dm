// removes resricted role for D.A.B. suits. RIP N.E.E.T. gear as exclusive for assistants (2019-2021).
/datum/gear/suit/neetsuit
	subcategory = LOADOUT_SUBCATEGORY_SUIT_GENERAL
	restricted_roles = list()

// Suggestion #148
/datum/gear/suit/techpriest
	name ="Techpriest robes"
	path = /obj/item/clothing/suit/hooded/techpriest
	restricted_roles = list("Chief Engineer","Research Director","Scientist", "Roboticist","Atmospheric Technician","Station Engineer")

// Suggestion #183
/datum/gear/suit/dracula
	name = "dracula coat"
	path = /obj/item/clothing/suit/dracula

// Suggestion #3279
/datum/gear/suit/apron
	name = "apron, blue"
	path = /obj/item/clothing/suit/apron

/datum/gear/suit/overalls
	name = "overalls"
	path = /obj/item/clothing/suit/apron/overalls

// Fixes "Fed (Modern) uniform, White" being in general suit loadout section.
/datum/gear/suit/trekcmdcapmod
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JOBS

// Updates restrictions to accomodate new jobs (mostly trekkie stuff)
/datum/gear/suit/trekds9_coat
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Blueshield","Bridge Officer",
							"Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Scientist", "Roboticist",
							"Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician",
							"Cargo Technician", "Shaft Miner")

/datum/gear/suit/trekcmdcap
	restricted_roles = list("Captain","Head of Personnel","Blueshield")

/datum/gear/suit/trekcmdmov
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Warden","Detective","Security Officer","Brig Physician","Blueshield","Bridge Officer")

/datum/gear/suit/trekmedscimov
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/suit/trekcmdmod
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Warden","Detective","Security Officer","Brig Physician","Blueshield","Bridge Officer")

/datum/gear/suit/trekmedscimod
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/suit/jacketyellow
	name = "Yellow Jacket"
	path = /obj/item/clothing/suit/toggle/rp_jacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacketorange
	name = "Orange Jacket"
	path = /obj/item/clothing/suit/toggle/rp_jacket/orange
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacketred
	name = "Red Jacket"
	path = /obj/item/clothing/suit/toggle/rp_jacket/red
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacketpurple
	name = "Purple Jacket"
	path = /obj/item/clothing/suit/toggle/rp_jacket/purple
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacketwhite
	name = "White Jacket"
	path = /obj/item/clothing/suit/toggle/rp_jacket/white
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacket_runner_engi
	name = "Engineer Runner Jacket"
	path = /obj/item/clothing/suit/jacket/runner/engi
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacket_runner_syndicate
	name = "Syndicate Runner Jacket"
	path = /obj/item/clothing/suit/jacket/runner/syndicate
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/jacket_runner_winter
	name = "Winter Runner Jacket"
	path = /obj/item/clothing/suit/jacket/runner/winter
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/baroness
	name = "Baroness Dress"
	path = /obj/item/clothing/suit/baroness

/datum/gear/suit/ladyballat
	name = "Green Ball Dress"
	path = /obj/item/clothing/suit/baroness/ladyballat

// Polychrome GWTB
/datum/gear/suit/gonersuit
	name = "polychromic trencher coat"
	cost = 2
	path = /obj/item/clothing/suit/goner/fake/poly
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
	loadout_initial_colors = list("#E6E6E6", "#D6D6D6", "#D6D6D6")

/datum/gear/suit/gonersuit/classic
	name = "polychromic trencher coat (classic)"
	path = /obj/item/clothing/suit/goner/fake/poly/classic

/datum/gear/suit/tunnelfox
	name = "tunnel fox jacket"
	path = /obj/item/clothing/suit/toggle/tunnelfox
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/gear/suit/invisijacket
	name = "invisifiber jacket"
	description = "A jacket made of transparent fibers, often used with reinforcement kits."
	path = /obj/item/clothing/suit/invisijacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
