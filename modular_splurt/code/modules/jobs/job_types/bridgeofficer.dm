/datum/job/bridgeofficer
	title = "Bridge Officer" // A courpse shared the same name as was causing issiues
	flag = BRDIGEOFF //Wanted to use BO but.. that broke the blob. Woops
	department_head = list("Captain", "Head of Personnel")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The captain and the head of personnel"
	selection_color = "#aac1ee"
	req_admin_notify = 0
	minimal_player_age = 20
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SERVICE
	considered_combat_role = FALSE
	outfit = /datum/outfit/job/bridgeofficer
	plasma_outfit = /datum/outfit/plasmaman/bridgeofficer
	//SPLURT CHANGES (Changes the custom spawn text for the Bridge Officer)
	custom_spawn_text = "<font color='red'>You are an assistant who's primary focus is serving the Heads of Staff. Nothing more. Nothing less.</font>"
	access = list(ACCESS_HEADS, ACCESS_MAINT_TUNNELS, ACCESS_BRIDGE_OFFICER, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH)
	minimal_access = list(ACCESS_HEADS, ACCESS_MAINT_TUNNELS, ACCESS_BRIDGE_OFFICER, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CIV
	alt_titles = list("Command Secretary", "Command Officer", "Bridge Secretary", "Ensign", "Bridge Bitch", "Bridge Stud", "Bridge Pet", "Bridge Advisor", "Bridge Intern")
	display_order = JOB_DISPLAY_ORDER_BO
	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/prosopagnosia, /datum/quirk/insanity)
	threat = 1

/datum/outfit/job/bridgeofficer
	name = "Bridge Officer"
	jobtype = /datum/job/bridgeofficer
	id = /obj/item/card/id/silver
	belt = /obj/item/clipboard
	ears = /obj/item/radio/headset/headset_bo
	uniform = /obj/item/clothing/under/rank/bridgeofficer
	head = /obj/item/clothing/head/bridgeofficer
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/sneakers/brown
	l_pocket = /obj/item/pda
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cheap = 1)

/datum/outfit/plasmaman/bridgeofficer
	name = "Bridge Officer Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman
	uniform = /obj/item/clothing/under/plasmaman
	ears = /obj/item/radio/headset/headset_bo

/obj/item/radio/headset/headset_bo
	name = "bridge officer headset"
	desc = "This is used by bridge officers."
	icon_state = "com_headset"
	item_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_bo
	command = TRUE

/obj/item/radio/headset/headset_bo/bowman
	name = "bridge officer bowman headset"
	desc = "This is used by bridge officers. It protects from flashbangs"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	bowman = TRUE

/obj/item/encryptionkey/headset_bo
	name = "bridge officer radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/effect/landmark/start/bridgeofficer
	name = "Bridge Officer"
	icon_state = "Head of Personnel"
