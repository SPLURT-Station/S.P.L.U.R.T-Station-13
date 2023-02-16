/datum/gear/uniform/tunic
	name = "Tunic"
	description = "A simple tunic."
	path = /obj/item/clothing/under/tunic

/datum/gear/uniform/lumberjack
	name = "Lumberjack Outfit"
	description = "Makes you want to pull a genocide on trees."
	path = /obj/item/clothing/under/lumberjack

/datum/gear/uniform/halfsuit
	name = "Half Latex Catsuit"
	path = /obj/item/clothing/under/latex/half

/datum/gear/uniform/latex
	name = "Full Latex Catsuit"
	path = /obj/item/clothing/under/misc/latex_catsuit

/datum/gear/uniform/shorts/redwshort
	name = "Red workout short"
	path = /obj/item/clothing/under/shorts/redwshort

/datum/gear/uniform/shorts/yellowwshort
	name = "Yellow workout short"
	path = /obj/item/clothing/under/shorts/yellowwshort

/datum/gear/uniform/shorts/pinkwshort
	name = "Pink workout short"
	path = /obj/item/clothing/under/shorts/pinkwshort

/datum/gear/uniform/domina
	name = "Dominatrix Dress"
	path = /obj/item/clothing/under/domina

/datum/gear/uniform/bluedress
	name = "Blue Royal Dress"
	path = /obj/item/clothing/under/bluedress

/datum/gear/uniform/performer
	name = "Performers one piece"
	path = /obj/item/clothing/under/performer

// Suggestion #151
/datum/gear/uniform/waiter
	name = "waiter's outfit"
	path = /obj/item/clothing/under/suit/waiter

// Suggestion #3278
/datum/gear/uniform/amish
	name = "Amish suit"
	path = /obj/item/clothing/under/suit/sl

/datum/gear/uniform/bunnysuit
	name = "bunny outfit"
	path = /obj/item/clothing/under/bunnysuit

/datum/gear/uniform/bunnysuitwhite
	name = "white bunny outfit"
	path = /obj/item/clothing/under/bunnysuit/white

/datum/gear/uniform/raccveralls
	name = "form fitting overalls"
	path = /obj/item/clothing/under/raccveralls

/datum/gear/uniform/sexyoffice
	name = "Revealing office uniform"
	path = /obj/item/clothing/under/officesexy

/datum/gear/uniform/vaultsuit
	name = "vault suit"
	path = /obj/item/clothing/under/vaultsuit

// Updates restrictions to accomodate new jobs (mostly trekkie stuff)
/datum/gear/uniform/grey/sec
	restricted_roles = list("Detective", "Security Officer", "Warden", "Head of Security", "Brig Physician")

/datum/gear/uniform/grey/med
	restricted_roles = list("Medical Doctor", "Virologist", "Chemist", "Geneticist", "Paramedic", "Brig Physician")

/datum/gear/uniform/grey/com
	restricted_roles = list("Quartermaster", "Research Director", "Chief Medical Officer", "Head Of Security", "Head Of Personnel", "Captain", "Blueshield", "Bridge Officer")

/datum/gear/uniform/trekcmdtos
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Bridge Officer")

/datum/gear/uniform/trekmedscitos
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/uniform/trekengtos
	restricted_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician","Head of Security","Blueshield","Cargo Technician", "Shaft Miner", "Quartermaster")

/datum/gear/uniform/trekcmdtng
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Bridge Officer")

/datum/gear/uniform/trekmedscitng
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/uniform/trekengtng
	restricted_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician","Head of Security","Blueshield","Cargo Technician", "Shaft Miner", "Quartermaster")

/datum/gear/uniform/trekcmdvoy
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Bridge Officer")

/datum/gear/uniform/trekmedscivoy
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/uniform/trekengvoy
	restricted_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician","Head of Security","Blueshield","Cargo Technician", "Shaft Miner", "Quartermaster")

/datum/gear/uniform/trekcmdds9
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Bridge Officer")

/datum/gear/uniform/trekmedscids9
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/uniform/trekengds9
	restricted_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician","Head of Security","Blueshield","Cargo Technician", "Shaft Miner", "Quartermaster")

/datum/gear/uniform/trekcmdent
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Bridge Officer")

/datum/gear/uniform/trekmedscient
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/gear/uniform/trekengent
	restricted_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician","Head of Security","Blueshield","Cargo Technician", "Shaft Miner", "Quartermaster")

/datum/gear/uniform/trekfedutil
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Blueshield","Bridge Officer",
							"Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Scientist", "Roboticist",
							"Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician",
							"Cargo Technician", "Shaft Miner")

/datum/gear/uniform/orvcmd
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Bridge Officer")

/datum/gear/uniform/orvmedsci
	restricted_roles = list("Chief Medical Officer", "Medical Doctor", "Chemist", "Virologist", "Paramedic", "Geneticist", "Research Director", "Scientist", "Roboticist", "Brig Physician")

/datum/gear/uniform/orvsec
	restricted_roles = list("Warden", "Detective", "Security Officer", "Head of Security", "Brig Physician", "Blueshield")

// Polychrome GWTB
/datum/gear/uniform/gonercloth
	name = "polychromic trencher uniform"
	path = /obj/item/clothing/under/goner/fake/poly
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
	loadout_initial_colors = list("#E6E6E6")

/datum/gear/uniform/leia_outfit
	name = "Princess Leia Outfit"
	path = /obj/item/clothing/under/misc/leia_outfit
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
	loadout_initial_colors = list("#C61818", "#D4AF37")

/datum/gear/uniform/performer/polychromic
	name = "Polychromic performers one piece"
	path = /obj/item/clothing/under/performer/polychromic
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
	loadout_initial_colors = list("#ffffff")
