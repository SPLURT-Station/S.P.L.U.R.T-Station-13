/datum/job/blueshield
	title = "Blueshield"
	flag = BLUESHIELD
	department_head = list("Central Command")
	department_flag = ENGSEC
	faction = "Station"
	head_announce = list(RADIO_CHANNEL_COMMAND)
	supervisors = "central command"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aac1ee"
	minimal_player_age = 7
	exp_requirements = 300
	exp_type = EXP_TYPE_COMMAND
	considered_combat_role = TRUE //Brigger then shit yes it is
	exp_type_department = EXP_TYPE_COMMAND
	alt_titles = list("Command Security", "Command Guard", "Command Bodyguard", "Blueguard", "Blueshit")
	custom_spawn_text = "<font color='red' size='4'><b> YOU ARE NOT PART OF COMMAND. YOU WILL NEVER BE PART OF COMMAND. YOU ARE NOT PART OF CENTRAL COMMAND. IF YOU ACT LIKE YOU ARE, YOU WILL NEVER PLAY BLUESHIELD EVER AGAIN.</b></font>"

	outfit = /datum/outfit/job/blueshield
	plasma_outfit = /datum/outfit/plasmaman/blueshield

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_RESEARCH,  ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_MEDICAL, ACCESS_WEAPONS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO, ACCESS_HEADS, ACCESS_MAILSORTING, ACCESS_ENGINE, ACCESS_HOS, ACCESS_CE, ACCESS_HOP, ACCESS_CMO, ACCESS_QM, ACCESS_RD, ACCESS_CAPTAIN, ACCESS_BLUESHIELD)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_RESEARCH,  ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_MEDICAL, ACCESS_WEAPONS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_MINERAL_STOREROOM, ACCESS_CARGO, ACCESS_HEADS, ACCESS_MAILSORTING, ACCESS_ENGINE, ACCESS_HOS, ACCESS_CE, ACCESS_HOP, ACCESS_CMO, ACCESS_QM, ACCESS_RD, ACCESS_CAPTAIN, ACCESS_BLUESHIELD)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BLUESHIELD
	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/nonviolent, /datum/quirk/paraplegic, /datum/quirk/blindness, /datum/quirk/monophobia, /datum/quirk/insanity)
	threat = 3


/datum/outfit/job/blueshield
	name = "Blueshield"
	jobtype = /datum/job/blueshield

	belt = /obj/item/pda/security
	ears = /obj/item/radio/headset/headset_blueshield
	uniform = /obj/item/clothing/under/rank/blueshield
	head = /obj/item/clothing/head/helmet/blueshirt/blueshield
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	glasses = /obj/item/clothing/glasses/hud/blueshield
	suit = /obj/item/clothing/suit/armor/vest/bluesheid
	shoes = /obj/item/clothing/shoes/jackboots
	suit_store = /obj/item/kitchen/knife/combat
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(/obj/item/storage/firstaid/regular, /obj/item/reagent_containers/spray/pepper)

	backpack = /obj/item/storage/backpack/blueshield
	satchel = /obj/item/storage/backpack/satchel/blueshield
	duffelbag = /obj/item/storage/backpack/duffelbag/blueshield
	box = /obj/item/storage/box/survival

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/storage/firstaid/regular, /obj/item/kitchen/knife/combat)

/datum/outfit/plasmaman/blueshield
	name = "Blueshield"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security/blueshield //Ported the ones from fucking Skyrat
	uniform = /obj/item/clothing/under/plasmaman/security/blueshield
	ears = /obj/item/radio/headset/headset_blueshield

/obj/item/radio/headset/headset_blueshield
	name = "blueshield bowman headset"
	desc = "This is used by the blueshield. It protects from flashbangs"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_blueshield
	bowman = TRUE
	command = TRUE


/obj/item/encryptionkey/headset_blueshield
	name = "blueshield radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_MEDICAL = 1)

/obj/effect/landmark/start/blueshield
	name = "Blueshield"
	icon_state = "Security Officer"

/area/command/blueshieldoffice
	name = "Blueshield's Office"
	icon_state = "bridge"

/area/command/blueshielquarters
	name = "Blueshield's Quarters"
	icon_state = "bridge"

///Subtype of CQC. Only used for the Blueshit.
/datum/martial_art/cqc/blueshield
	name = "Close Quarters Combat, Blueshield edition"
	var/list/valid_areas = list(/area/command/bridge, /area/command/heads_quarters/captain, /area/command/heads_quarters/captain/private)

///Prevents use if the Blueshit  is not on the bridge or the captain'soffice .
/datum/martial_art/cqc/blueshield/can_use(mob/living/owner) //this is used to make Bluehsield CQC only work in bridge
	if(!is_type_in_list(get_area(owner), valid_areas))
		return FALSE
	return ..()


/datum/outfit/job/blueshield/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()
	if(visualsOnly)
		return
	var/datum/martial_art/cqc/blueshield/justablue = new
	justablue.teach(H)
