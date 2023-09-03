/datum/job/peacekeeper
	title = "Peacekeeper"
	flag = SECPEACE
	department_head = list("Head of Security", "Head of Personel")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 3 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "the head of security, and the head of personel"
	selection_color = "#c02f2f"
	minimal_player_age = 3
	exp_requirements = 100
	exp_type = EXP_TYPE_CREW
	considered_combat_role = FALSE
	alt_titles = list(
		"Slutcurity Trainee",
		"Security Trainee",
		"Security Assistant",
		"Security Cadet",
		"Rookie",
		"Hired Muscle",
		"Bodyguard"
		)
	custom_spawn_text = "<font color='black' size='2'><b> Your job is to keep the peace. Conflict de-escalation through diplomacy is your top priority. Only use your baton as a last resort.</b></font><font color='red' size='4'><b>You are NOT a Security Officer.</b></font>"

	outfit = /datum/outfit/job/peacekeeper
	plasma_outfit = /datum/outfit/plasmaman/peacekeeper

	access = list(ACCESS_BRIG, ACCESS_PEACEKEEPER, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP)
	minimal_access = list(ACCESS_BRIG, ACCESS_PEACEKEEPER, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP) // See /datum/job/officer/get_access()
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CIV

	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPALY_ORDER_SECPEACE
	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/nonviolent, /datum/quirk/paraplegic, /datum/quirk/blindness, /datum/quirk/monophobia)
	threat = 2

/datum/outfit/job/peacekeeper
	name = "Peacekeeper"
	jobtype = /datum/job/peacekeeper

	belt = /obj/item/pda/security
	ears = /obj/item/radio/headset/headset_sec/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	uniform = /obj/item/clothing/under/rank/security/officer/peacekeeper
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/blueshirt
	suit = /obj/item/clothing/suit/armor/vest/peacekeeper
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/bag/security
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(/obj/item/reagent_containers/spray/pepper, /obj/item/clothing/accessory/badge/deputy, /obj/item/holosign_creator/security, /obj/item/choice_beacon/pkbaton)

	backpack = /obj/item/storage/backpack/security/pk
	satchel = /obj/item/storage/backpack/satchel/sec/pk
	duffelbag = /obj/item/storage/backpack/duffelbag/sec/pk
	box = /obj/item/storage/box/survival/security

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/plasmaman/peacekeeper
	name = "Peacekeeper Plasmaman"

	belt = /obj/item/pda/security
	ears = /obj/item/radio/headset/headset_sec/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	r_pocket = /obj/item/storage/bag/security
	l_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(/obj/item/reagent_containers/spray/pepper, /obj/item/clothing/accessory/badge/deputy, /obj/item/holosign_creator/security, /obj/item/choice_beacon/pkbaton)

	box = /obj/item/storage/box/survival/security

	implants = list(/obj/item/implant/mindshield)

/obj/effect/landmark/start/peacekeeper
	name = "Peacekeeper"
	icon_state = "Security Officer"

/*
Peacekeeper Hypospray
*/
/obj/item/reagent_containers/peacehypo
	name = "Peacekeeper hypospray"
	desc = "An advanced chemical synthesizer and injection system, designed for heavy-duty medical equipment."
	icon = 'icons/obj/syringe.dmi'
	item_state = "hypo"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	icon_state = "hypo"
	amount_per_transfer_from_this = 5
	volume = 30
	possible_transfer_amounts = list()
	reagent_value = NO_REAGENTS_VALUE
	var/mode = 1
	var/charge_cost = 0 // Hacky, might work?
	var/charge_tick = 0
	var/recharge_time = 5 //Time it takes for shots to recharge (in seconds)
	var/bypass_protection = 0 //If the hypospray can go through armor or thick material

	var/list/datum/reagents/reagent_list = list()
	var/list/reagent_ids = list(/datum/reagent/peaceborg_confuse, /datum/reagent/peaceborg_tire, /datum/reagent/pax/peaceborg) //Might as well use the Borg's stuff
	var/accepts_reagent_upgrades = FALSE //If upgrades can increase number of reagents dispensed.
	var/list/modes = list() //Basically the inverse of reagent_ids. Instead of having numbers as "keys" and strings as values it has strings as keys and numbers as values.
								//Used as list for input() in shakers.
	var/list/reagent_names = list()

/obj/item/reagent_containers/peacehypo/proc/add_reagent(datum/reagent/reagent)
	reagent_ids |= reagent
	var/datum/reagents/RG = new(30)
	RG.my_atom = src
	reagent_list += RG

	var/datum/reagents/R = reagent_list[reagent_list.len]
	R.add_reagent(reagent, 30)

	modes[reagent] = modes.len + 1
	reagent_names[initial(reagent.name)] = reagent

/obj/item/reagent_containers/peacehypo/Initialize(mapload)
	. = ..()
	for(var/R in reagent_ids)
		add_reagent(R)
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/peacehypo/Destroy()
	QDEL_LIST(reagent_list)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/reagent_containers/peacehypo/process() //Every [recharge_time] seconds, recharge some reagents
	charge_tick++
	if(charge_tick >= recharge_time)
		regenerate_reagents()
		charge_tick = 0

	//update_icon()
	return 1

/obj/item/reagent_containers/peacehypo/proc/regenerate_reagents()
	for(var/i in 1 to reagent_ids.len)
		var/datum/reagents/RG = reagent_list[i]
		if(RG.total_volume < RG.maximum_volume) 	//Don't recharge reagents and drain power if the storage is full.
			RG.add_reagent(reagent_ids[i], 5)		//And fill hypo with reagent.

/obj/item/reagent_containers/peacehypo/attack(mob/living/carbon/M, mob/user)
	var/datum/reagents/R = reagent_list[mode]
	if(!R.total_volume)
		to_chat(user, span_notice("The injector is empty."))
		return
	if(!istype(M))
		return
	if(R.total_volume && M.can_inject(user, 1, user.zone_selected,bypass_protection))
		if(user.a_intent == INTENT_HELP) //Prevents OD'ing people unless on harm intent
			for(var/datum/reagent/RG in R.reagent_list)
				if(M.reagents.has_reagent(RG.type) && !RG.overdose_threshold == 0)
					if(((M.reagents.get_reagent_amount(RG.type)) + amount_per_transfer_from_this > RG.overdose_threshold))
						to_chat(user, span_warning("Injecting [M] with more [RG] would overdose them."))
						return
		to_chat(M, span_warning("You feel a tiny prick!"))
		to_chat(user, span_notice("You inject [M] with the injector."))
		var/fraction = min(amount_per_transfer_from_this/R.total_volume, 1)
		R.reaction(M, INJECT, fraction)
		if(M.reagents)
			var/trans = R.trans_to(M, amount_per_transfer_from_this)
			to_chat(user, span_notice("[trans] unit\s injected.  [R.total_volume] unit\s remaining."))

	var/list/injected = list()
	for(var/datum/reagent/RG in R.reagent_list)
		injected += RG.name
	log_combat(user, M, "injected", src, "(CHEMICALS: [english_list(injected)])")

/obj/item/reagent_containers/peacehypo/attack_self(mob/user)
	var/chosen_reagent = modes[reagent_names[input(user, "What reagent do you want to dispense?") as null|anything in reagent_names]]
	if(!chosen_reagent)
		return
	mode = chosen_reagent
	playsound(loc, 'sound/effects/pop.ogg', 50, 0)
	var/datum/reagent/R = GLOB.chemical_reagents_list[reagent_ids[mode]]
	to_chat(user, span_notice("[src] is now dispensing '[R.name]'."))
	return

/obj/item/reagent_containers/peacehypo/examine(mob/user)
	. = ..()
	. += DescribeContents()

/obj/item/reagent_containers/peacehypo/proc/DescribeContents()
	var/empty = 1

	for(var/datum/reagents/RS in reagent_list)
		var/datum/reagent/R = locate() in RS.reagent_list
		if(R)
			. += span_notice("It currently has [R.volume] unit\s of [R.name] stored.")
			empty = 0

	if(empty)
		. += span_warning("It is currently empty! Allow some time for the internal syntheszier to produce more.")

/* End Peacekeeper Hypo
*/

// Peacekeeper Bags
/obj/item/storage/backpack/security/pk
	name = "peacekeeper backpack"
	desc = "It's a very robust backpack in peacekeeper colors."
	icon_state = "pkpack"
	item_state = "pkpack"

/obj/item/storage/backpack/satchel/sec/pk
	name = "peacekeeper satchel"
	desc = "A robust satchel for peacekeeper related needs."
	icon_state = "satchel-pk"
	item_state = "satchel-pk"

/obj/item/storage/backpack/duffelbag/sec/pk
	name = "peacekeeper duffel bag"
	desc = "A large duffel bag for holding extra peacekeeper supplies."
	icon_state = "duffel-pk"
	item_state = "duffel-pk"

// Baton Beacon

/obj/item/choice_beacon/pkbaton
	name = "personal weapon beacon"
	desc = "Use this to summon your personal baton!"

/obj/item/choice_beacon/pkbaton/generate_display_names()
	var/static/list/pkbaton_list
	if(!pkbaton_list)
		pkbaton_list = list()
		var/list/templist = subtypesof(/obj/item/storage/secure/briefcase/pkbaton/) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			pkbaton_list[initial(A.name)] = A
	return pkbaton_list

/obj/item/storage/secure/briefcase/pkbaton/stunbaton
	name = "\improper Stun Baton box"
	desc = "A storage case for a high-tech Stun baton. Pick up that can."

/obj/item/storage/secure/briefcase/pkbaton/stunbaton/PopulateContents()
	new /obj/item/melee/baton/loaded(src)

/obj/item/storage/secure/briefcase/pkbaton/detbaton
	name = "\improper Nightstick box"
	desc = "A storage case for a nightstick. A beat-cop classic."

/obj/item/storage/secure/briefcase/pkbaton/detbaton/PopulateContents()
	new /obj/item/melee/classic_baton(src)

/obj/item/storage/secure/briefcase/pkbaton/prova
	name = "\improper Prova box"
	desc = "A storage case for a Prova. Teach them the way of John Prodman."

/obj/item/storage/secure/briefcase/pkbaton/prova/PopulateContents()
	new /obj/item/melee/baton/prova(src)
	new /obj/item/stock_parts/cell/high/plus(src)

/obj/item/storage/secure/briefcase/pkbaton/tbaton
	name = "\improper Telescopic Baton box"
	desc = "Storage box containing a single telescopic baton, just like the big boy riot police get!"

/obj/item/storage/secure/briefcase/pkbaton/tbaton/PopulateContents()
	new /obj/item/melee/classic_baton/telescopic(src)

// Peacekeeper Locker

/obj/structure/closet/secure_closet/peacekeeper
	name = "peacekeeper's locker"
	req_access = list(ACCESS_PEACEKEEPER)
	icon_state = "bs"
	icon = 'modular_splurt/icons/obj/closet.dmi'

/obj/structure/closet/secure_closet/peacekeeper/PopulateContents()
	..()
	new /obj/item/clothing/head/helmet/blueshirt(src)
	new /obj/item/clothing/suit/armor/vest/peacekeeper(src)
	new /obj/item/clothing/under/rank/security/officer/peacekeeper(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/storage/box/zipties(src)
	new /obj/item/radio/off(src)

// Station things

/area/security/pk
	name = "Peacekeeper Office"
	icon_state = "security"
