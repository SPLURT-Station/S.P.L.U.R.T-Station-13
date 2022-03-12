
/obj/item/card/id/departmental_budget
	icon = 'modular_splurt/icons/obj/permits.dmi'

/obj/item/card/id/departmental_budget/cor
	department_ID = ACCOUNT_COR
	department_name = ACCOUNT_COR_NAME

/obj/machinery/telecomms/server/presets/corrections
	id = "Correctional Server"
	freq_listening = list(FREQ_CORRECTIONS)
	autolinkers = list("corrections")

/datum/job/correctional
	title = "Correctional Officer"
	flag = CORRECOFF
	department_head = list("Warden")
	department_flag = CORRECTIONS
	faction = "Station"
	supervisors = "the warden"
	total_positions = 3
	spawn_positions = 3
	selection_color = "#3333FF"
	minimal_player_age = 7
	exp_type = EXP_TYPE_CREW
	considered_combat_role = TRUE
	alt_titles = list("Prison Guard", "Prison Officer", "Brig Officer", "Brig Guard")
	custom_spawn_text = "<font color='red' size='2'><b>You are here to guard the Brig & Armory, rehabilitate prisoners, and process new inmates. Your Head of Staff is the Warden, and you respond to his orders first and foremost. You are not a part of Security and you may not transfer to it. You are not to respond to any Security Calls outside of the Brig unless on Amber Alert or Higher. The Brig and Prison always comes first!</b></font>"

	outfit = /datum/outfit/job/correctional
	plasma_outfit = /datum/outfit/plasmaman/correctional

	access = list(ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_WEAPONS, ACCESS_CORRECTIONS, ACCESS_BRIG, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP)
	minimal_access = list(ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_WEAPONS, ACCESS_CORRECTIONS, ACCESS_BRIG, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP)
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_COR

	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CORRECTIONAL_OFFICER
	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/nonviolent, /datum/quirk/paraplegic, /datum/quirk/blindness, /datum/quirk/monophobia, /datum/quirk/insanity)
	threat = 3


/datum/outfit/job/correctional
	name = "Correctional Officer"
	jobtype = /datum/job/correctional
	belt = /obj/item/pda/security
	ears = /obj/item/radio/headset/headset_correctional/alt
	uniform = /obj/item/clothing/under/rank/security/officer/correctional
	head = /obj/item/clothing/head/beret/sec/peacekeeper/cap
	gloves = /obj/item/clothing/gloves/correctional
	suit = /obj/item/clothing/suit/armor/vest/stabvest
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs/cable
	r_pocket = /obj/item/assembly/flash/handheld
	backpack = /obj/item/storage/backpack/corrections
	satchel = /obj/item/storage/backpack/satchel/corrections
	duffelbag = /obj/item/storage/backpack/duffelbag/corrections
	box = /obj/item/storage/box/survival

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/melee/classic_baton/nightstick)

/datum/outfit/plasmaman/correctional
	name = "Correctional Officer"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security //need to make custom sprites for the plasmaman
	uniform = /obj/item/clothing/under/plasmaman/security
	ears = /obj/item/radio/headset/headset_correctional/alt


/obj/item/radio/headset/headset_correctional
	name = "correctional bowman headset"
	desc = "This is used by Correctional staff."
	icon_state = "sec_headset"
	item_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_correctional

/obj/item/radio/headset/headset_correctional/alt
	name = "correctional bowman headset"
	desc = "This is used by Correctional staff. It protects from flashbangs"
	icon_state = "sec_headset_alt"
	item_state = "sec_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_correctional
	bowman = TRUE

/obj/item/encryptionkey/headset_correctional
	name = "Correctional radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_CORRECTIONS = 1)

/obj/effect/landmark/start/correctional
	name = "Correctional Officer"
	icon_state = "Security Officer"

/obj/item/radio/headset/headset_warden
	name = "warden bowman headset"
	desc = "This is used by the warden. It protects from flashbangs"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_warden
	command = TRUE
	bowman = TRUE

/obj/item/encryptionkey/headset_warden
	name = "warden radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_CORRECTIONS = 1, RADIO_CHANNEL_SECURITY = 1)

