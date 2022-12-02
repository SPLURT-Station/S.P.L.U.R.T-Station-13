/datum/job/stowaway
	title = "Stowaway"
	flag = STOW
	department_head = "No-one"
	department_flag = NONE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "no-one"
	selection_color = "#dfdfdf"
	minimal_player_age = 3
	exp_requirements = 100
	exp_type = EXP_TYPE_CREW
	considered_combat_role = FALSE
	alt_titles = list("Maintenance Rat")
	custom_spawn_text = "<font color='black' size='2'><b>You don't remember how you got here, only that you stowed away on a Cargo shuttle. You must survive with only what you have, and what you can find.</b></font><font color='red' size='4'><b>You are NOT an Antag, and you are NOT Crew. Security may arrest you for trespassing on the Station, you may NOT fight back, but try not to get caught. This role is soley for playing tag with security for sex.</b></font>"
	threat = 0.5

	outfit = /datum/outfit/job/stowaway
	plasma_outfit = /datum/outfit/plasmaman/stowaway

/datum/outfit/job/stowaway
	name = "Stowaway"
	jobtype = /datum/job/stowaway

	belt = /obj/item/storage/belt/utility/full
	uniform = /obj/item/clothing/under/color/grey
	l_pocket = /obj/item/flashlight
	id = /obj/item/card/id/stolen

/datum/outfit/plasmaman/stowaway
	name = "Plasmaman Stowaway"

	belt = /obj/item/storage/belt/utility/full
	uniform = /obj/item/clothing/under/plasmaman
	head = /obj/item/clothing/head/helmet/space/plasmaman
	l_pocket = /obj/item/flashlight
	id = /obj/item/card/id/stolen

/obj/item/card/id/stolen
	name = "stolen ID card"
	desc = "A stolen ID with no name, no rank, and only Maintenance access. Try not to lose this."
	registered_name = null
	assignment = null
	bank_support = ID_NO_BANK_ACCOUNT //No vending machines for you
	access = list(ACCESS_MAINT_TUNNELS)

/obj/effect/landmark/start/stowaway
	name = "Stowaway"
	icon_state = "Assistant"
