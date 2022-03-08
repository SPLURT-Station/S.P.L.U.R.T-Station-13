/datum/job/warden //this is bieng ot overide the default warden stuff
	department_head = list("The Captain")
	department_flag = CORRECTIONS
	head_announce = list(RADIO_CHANNEL_CORRECTIONS)
	supervisors = "the captain"
	selection_color = "#2222ff"
	exp_type_department = EXP_TYPE_CORRECTIONS

	access = list(ACCESS_CORRECTIONS, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM, ACCESS_WARDEN)
	minimal_access = list(ACCESS_CORRECTIONS, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_MINERAL_STOREROOM, ACCESS_WARDEN) // See /datum/job/warden/get_access()

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_COR

/datum/outfit/job/warden
	ears = /obj/item/radio/headset/headset_warden
	box = /obj/item/storage/box/survival
