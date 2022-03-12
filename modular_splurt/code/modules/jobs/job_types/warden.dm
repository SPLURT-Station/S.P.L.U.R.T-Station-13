/datum/job/warden //this is bieng ot overide the default warden stuff
	department_head = list("The Captain")
	department_flag = CORRECTIONS
	head_announce = list(RADIO_CHANNEL_CORRECTIONS)
	supervisors = "the captain"
	selection_color = "#2222ff"
	exp_type_department = EXP_TYPE_CORRECTIONS
	exp_requirements = 180
	custom_spawn_text = "<font color='red' size='2'><b> Your main tasks revolve around Brig Times and Issuing Parole to well-behaved Prisoners. Ensure that the Permabrig is Secure and Safe enough to contain the Inmates. Execute confirmed Escapees without CC Approval. You may authorize visitations for Prisoners within reason, at your own discretion. Contain Evidence as necessary and issue reasonable brig times in accordance with Space Laws & Severity. Do NOT go out of your way to Patrol or make arrests, nor delegate anything to Security Officers. If you leave the Brig for any reason, ensure you do not stay out long</b></font>"
	access = list(ACCESS_CORRECTIONS, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM, ACCESS_WARDEN, ACCESS_KEYCARD_AUTH, ACCESS_RC_ANNOUNCE, ACCESS_HEADS)
	minimal_access = list(ACCESS_CORRECTIONS, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_MINERAL_STOREROOM, ACCESS_WARDEN, ACCESS_KEYCARD_AUTH, ACCESS_RC_ANNOUNCE, ACCESS_HEADS) // See /datum/job/warden/get_access()

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_COR

/datum/outfit/job/warden
	ears = /obj/item/radio/headset/headset_warden
	box = /obj/item/storage/box/survival
