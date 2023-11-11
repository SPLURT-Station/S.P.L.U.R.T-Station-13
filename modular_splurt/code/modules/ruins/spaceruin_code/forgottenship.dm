// forgottenship ruin
GLOBAL_VAR_INIT(fscpassword, generate_password())

/proc/generate_password()
	return "[pick(GLOB.phonetic_alphabet)] [rand(1000,9999)]"

///////////	forgottenship objects

/obj/machinery/door/password/voice/sfc
	name = "Voice-activated Vault door"
	desc = "You'll need special syndicate passcode to open this one."
/obj/machinery/door/password/voice/sfc/Initialize(mapload)
	. = ..()
	password = "[GLOB.fscpassword]"

/obj/machinery/vending/medical/syndicate_access/cybersun
	name = "\improper CyberMed ++"
	desc = "An advanced vendor that dispenses medical drugs, both recreational and medicinal."
	products = list(/obj/item/reagent_containers/syringe = 4,
					/obj/item/healthanalyzer = 4,
					/obj/item/reagent_containers/pill/patch/styptic = 5,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 5,
					/obj/item/reagent_containers/glass/bottle/epinephrine = 3,
					/obj/item/reagent_containers/glass/bottle/morphine = 3,
					/obj/item/reagent_containers/glass/bottle/potass_iodide = 1,
					/obj/item/reagent_containers/glass/bottle/salglu_solution = 3,
					/obj/item/reagent_containers/syringe/antiviral = 5,)
	contraband = list(/obj/item/reagent_containers/glass/bottle/cold = 2,
					/obj/item/restraints/handcuffs = 4,
					/obj/item/storage/backpack/duffelbag/syndie/surgery = 1,
					/obj/item/storage/firstaid/tactical = 1)
	premium = list(/obj/item/storage/pill_bottle/psicodine = 2,
					/obj/item/reagent_containers/hypospray/medipen = 3,
					/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
					/obj/item/storage/firstaid/regular = 3,
					/obj/item/storage/firstaid/brute = 1,
					/obj/item/storage/firstaid/fire = 1,
					/obj/item/storage/firstaid/toxin = 1,
					/obj/item/storage/firstaid/o2 = 1,
					/obj/item/storage/firstaid/tactical = 1,
					/obj/item/defibrillator/loaded = 1,
					/obj/item/wallframe/defib_mount = 1,
					/obj/item/sensor_device = 2,
					/obj/item/pinpointer/crew = 2,)

///////////	forgottenship lore

/obj/item/paper/fluff/ruins/forgottenship/password
	name = "Old pamphlet"

/obj/item/paper/fluff/ruins/forgottenship/password/Initialize(mapload)
	. = ..()
	info = "Welcome to most advanced cruiser owned by Cyber Sun Industries!<br>You might notice, that this cruiser is equipped with 12 prototype laser turrets making any hostile boarding attempts futile.<br><br>Other facilities built on the ship are: Simple atmospheric system, Camera system with built-in X-ray visors and Safety module, enabling emergency engines in case of... you know, emergency.<br><br><br>Emergency system will bring you to nearest syndicate pod containing everything needed for human life.<br><br><b>In case of emergency, you must remember the pod-door activation code - [GLOB.fscpassword]</b><br><br>Cyber Sun Industries (C) 2484.<br>"
	icon_state = "paper_words"
	item_state = "paper"

/obj/item/paper/fluff/ruins/forgottenship/powerissues
	name = "Power issues"
	info = "Welcome to battle cruiser SCSBC-12!<br>Our most advanced systems allow you to fly in space and never worry about power issues!<br>However, emergencies occur, and in case of power loss, <b>you must</b> enable emergency generator using uranium as fuel and enable turrets in bridge afterwards.<br><br><b>REMEMBER! CYBERSUN INDUSTRIES ARE NOT RESPONSIBLE FOR YOUR DEATH OR SHIP LOSS WHEN TURRETS ARE DISABLED!</b><br><br>Cyber Sun Industries (C) 2484."

/obj/item/paper/fluff/ruins/forgottenship/missionobj
	name = "Mission objectives"
	info = "Greetings, operatives. You are assigned to SCSBC-12(Syndicate Cyber Sun Battle Cruiser 12) to protect our high-ranking officer while he is on his way to next outpost. While you are travelling, he is the captain of this ship and <b>you must</b> obey his orders.<br><br>Remember, disobeying high-ranking officer orders is a reason for termination."

/obj/item/paper/fluff/ruins/forgottenship/distress
	name = "Transmission Log"
	info = "<br><br><b>EMERGENCY TRANSMISSON LOG...</b><br><br><br><b>This is monitoring outpost Delta-Zeta-04; Due to the intercepted communications of Nanotrasen hostile forces approaching the site, this is a warning to all syndicate personel to avoid the outpost. Protocol Blazing Star has been activated, requesting the assistance of ERT Cybersun operatives to defend and secure this location. All personel will begin preperations for close quarters defense against possible intruders. Be advised there is hostile local fauna near the outpost due current ongoing attempts to monitor behavior and potential breeding of the entity CARP for potential bio weapon use.</b><br>"

/obj/item/paper/fluff/ruins/forgottenship/survivor
	name = "Scribbled Page"
	info = "<br>To anyone who is reading this, hopefully the response team, this is engineering specialist John J. Jones.<br><br>Nanotrasen Death Squad units have invaded the outpost, we fought hard, but our firepower wasnt enough to deter and eliminate them.<br><br>They slaughtered the entire outpost, Im currently the last one standing, however, I wont give these basterds the satisfaction of taking me alive, may the syndicate be forever!<br>"

/obj/item/paper/fluff/ruins/forgottenship/nanostrasen
	name = "Nanotrasen Log"
	info = "<br><br><b>NANOTRASEN DEATHSQAUD LOG...</b><br><br><br>This is NEAO. SGT. Akins Recording this log note, all syndicate forces eliminated from the nearby facility. Bagging the bodies and placed on transport to a processing facility to record rank and name. It appears however, a transmission was sent in term of a distress call, expecting further hostiles to attempt retaking the facility.<br><br>Hostiles have docked at the outpost, appears to be a older cybersun model of cruiser, unknown amount of assailants assuming to be a smaller crew due to ship size. Sent my CPL. Hicks to investigate the shuttle, no appearent life signs potentially abandoned, attempting to sieze control of the vessel and equipment, standby for further information.<br>"

/obj/item/paper/fluff/ruins/forgottenship/emergency
	name = "Emergency Equipment"
	info = "<br><br><b>Emergency Equipment</b><br><br><br>Greetings! This is the emergency vault for specialized equipment used in nearby operations and facility maintence, under no circumstances should the equipment be taken/tampered with in the vault without direct orders from a high command syndicate officer. Any attempt in unathorized access/tampering with the equipment in this vault will be means of termination of your employment. br>"

/obj/item/paper/fluff/ruins/forgottenship/error
	name = "Catasrophic Error Report"
	info = "<br><br><b>CATASTROPHIC ERROR REPORT... </b><br><br><br>WARNING: System wide anomoly has occured, initiating PROTOCOL SLEEPING PHEONIX, preservation of crew and VIP engaged for long-term cryo stasis. Unable to process destinating cordinates, attempting to retreat back to previous location... Error system unable to register CYBERSUN COMMAND CENTER. Ship going into EMERGENCY POWER MODE!<br><br>Attempting to contact Cybersun High Command... Error has occured unable to ping. Attempting to initate emergency beacon... Error system unable to initate emergency beacon...<br><br>Activating last ditch effort... Activated: Ship will begin to approach the nearest syndicate facility, estimate time: Unknown.<br><br>...<br><br>...<br><br>...<br><br>Outpost Emergency Beacon detected attempting to intercept, intiating de-frosting process, arrival: imminent.<br>"

///////////	forgottenship items

/obj/item/disk/surgery/forgottenship
	name = "Advanced Surgery Disk"
	desc = "A disk that contains advanced surgery procedures, must be loaded into an Operating Console."
	surgeries = list(/datum/surgery/advanced/lobotomy, /datum/surgery/advanced/bioware/vein_threading, /datum/surgery/advanced/bioware/nerve_splicing)

/obj/structure/fluff/empty_sleeper/syndicate/captain
	icon_state = "sleeper_s-open"
	deconstructible = FALSE

/obj/structure/fluff/empty_sleeper/syndicate/captain/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/gps, "Old Encrypted Signal")

/obj/item/storage/box/firingpins/syndicate
	name = "box of syndicate firing pins"
	desc = "A box full of special syndicate firing pins which allow only syndicate operatives to use weapons with those firing pins."

/obj/item/storage/box/firingpins/syndicate/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/implant/pindicate(src)

/////////// forgottenship clothes

/obj/item/clothing/neck/cloak/cybersun
	name = "cybersun cloak"
	desc = "Worn by High-Ranking Cybersun Personnel, the cybersun shall rise!"
	icon_state = "cybersuncloak"
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	armor = list(MELEE = 35, BULLET = 40, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 20, RAD = 20, FIRE = 60, ACID = 60)
	body_parts_covered = CHEST|GROIN|ARMS
	is_edible = 0

/obj/item/storage/belt/esabre_belt
	name = "energy sabre sheath"
	desc = "An ornate sheath designed to hold an syndicate officer's blade."
	icon = 'modular_splurt/icons/obj/clothing/belts.dmi'
	icon_state = "esheath"
	item_state = "esheath"
	lefthand_file = 'modular_splurt/icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/equipment/belt_righthand.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/belt.dmi'
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE
	onmob_overlays = TRUE
	var/list/fitting_swords = list(/obj/item/melee/transforming/energy/sword/energy_sabre, /obj/item/melee/baton/stunsword)
	var/starting_sword = /obj/item/melee/transforming/energy/sword/energy_sabre

/obj/item/storage/belt/esabre_belt/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.rustle_sound = FALSE
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.can_hold = typecacheof(fitting_swords)
	STR.quickdraw = TRUE

/obj/item/storage/belt/esabre_belt/examine(mob/user)
	. = ..()
	if(length(contents))
		. += "<span class='notice'>Alt-click it to quickly draw the blade.</span>"

/obj/item/storage/belt/esabre_belt/PopulateContents()
	if(starting_sword)
		new starting_sword(src)

/obj/item/storage/belt/military/assault/cybersun_crew
	name = "cybersun assault belt"
	desc = "A tactical assault belt."
	icon_state = "assaultbelt"
	item_state = "security"

/obj/item/storage/belt/military/assault/cybersun_crew/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6

/obj/item/storage/belt/military/assault/cybersun_crew/PopulateContents()
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/gun/ballistic/automatic/pistol/modular
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	update_icon()

/obj/item/storage/belt/military/assault/cybersun_captain
	name = "cybersun assault belt"
	desc = "A tactical assault belt."
	icon_state = "assaultbelt"
	item_state = "security"

/obj/item/storage/belt/military/assault/cybersun_captain/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6

/obj/item/storage/belt/military/assault/cybersun_captain/PopulateContents()
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/melee/classic_baton/telescopic(src)
	new /obj/item/gun/ballistic/automatic/pistol/APS(src)
	new /obj/item/ammo_box/magazine/pistolm9mm(src)
	new /obj/item/ammo_box/magazine/pistolm9mm(src)
	update_icon()

/////////// forgottenship weapons

/obj/item/melee/transforming/energy/sword/energy_sabre
	name = "energy sabre"
	desc = "An elegant weapon, its concentrated beam of energy capable of cutting through armor aand flesh alike."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "esabre0"
	icon_state_on = "esabre1"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/swords_righthand.dmi'
	obj_flags = UNIQUE_RENAME
	force = 18
	throwforce = 15
	hitsound = "swing_hit" //it starts deactivated
	hitsound_on = 'sound/weapons/nebhit.ogg'
	attack_verb_off = list("tapped", "poked")
	attack_verb_on = list ("slashed", "seared", "melted")
	active = 0
	throw_speed = 3
	throw_range = 5
	sharpness = SHARP_EDGED
	embedding = list("embed_chance" = 75, "impact_pain_mult" = 10)
	w_class = WEIGHT_CLASS_BULKY
	armour_penetration = 75
	item_flags = NEEDS_PERMIT | ITEM_CAN_PARRY
	custom_materials = list(/datum/material/iron = 2500)
	total_mass = 3.4
	block_parry_data = /datum/block_parry_data/energy_sabre
	var/datum/effect_system/spark_spread/spark_system
	possible_colors = null
	light_color = "#990000"

/obj/item/melee/transforming/energy/sword/energy_sabre/transform_messages(mob/living/user, supress_message_text)
	playsound(user, active ? 'sound/weapons/saberon.ogg' : 'sound/weapons/saberoff.ogg', 35, 1)
	if(!supress_message_text)
		to_chat(user, "<span class='notice'>[src] [active ? "is now active":"can now be concealed"].</span>")

/datum/block_parry_data/energy_sabre
	parry_time_windup = 0
	parry_time_active = 25
	parry_time_spindown = 0
	// we want to signal to players the most dangerous phase, the time when automatic counterattack is a thing.
	parry_time_windup_visual_override = 1
	parry_time_active_visual_override = 3
	parry_time_spindown_visual_override = 12
	parry_flags = PARRY_DEFAULT_HANDLE_FEEDBACK		// esword users can attack while
	parry_time_perfect = 2.5		// first ds isn't perfect
	parry_time_perfect_leeway = 1.5
	parry_imperfect_falloff_percent = 5
	parry_efficiency_to_counterattack = INFINITY
	parry_efficiency_considered_successful = 65		// VERY generous
	parry_efficiency_perfect = 100
	parry_failed_stagger_duration = 4 SECONDS
	parry_cooldown = 0.5 SECONDS
	parry_automatic_enabled = TRUE
	autoparry_single_efficiency = 65
	autoparry_cooldown_absolute = 3 SECONDS

/obj/item/melee/transforming/energy/sword/energy_sabre/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, 30, 95, 5) //fast and effective, but as a sword, it might damage the results.
	AddElement(/datum/element/sword_point)

/obj/item/melee/transforming/energy/sword/energy_sabre/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(attack_type & ATTACK_TYPE_PROJECTILE)		// Don't bring a sword to a gunfight.
		return BLOCK_NONE
	return ..()

/obj/item/melee/transforming/energy/sword/energy_sabre/on_exit_storage(datum/component/storage/S)
	var/obj/item/storage/belt/esabre_belt/B = S.parent
	if(istype(B))
		playsound(B, 'sound/items/unsheath.ogg', 25, 1)
	..()

/obj/item/melee/transforming/energy/sword/energy_sabre/on_enter_storage(datum/component/storage/S)
	var/obj/item/storage/belt/esabre_belt/B = S.parent
	if(istype(B))
		playsound(B, 'sound/items/sheath.ogg', 25, 1)
	..()

/obj/item/melee/transforming/energy/sword/energy_sabre/get_belt_overlay()
	return mutable_appearance('modular_splurt/icons/obj/clothing/belt_overlays.dmi', "esabre")

/obj/item/melee/transforming/energy/sword/energy_sabre/get_worn_belt_overlay(icon_file)
	return mutable_appearance(icon_file, "-esabre")

/obj/item/melee/transforming/energy/sword/energy_sabre/suicide_act(mob/living/user)
	user.visible_message("<span class='suicide'>[user] is trying to cut off all [user.p_their()] limbs with [src]! it looks like [user.p_theyre()] trying to commit suicide!</span>")
	var/i = 0
	ADD_TRAIT(src, TRAIT_NODROP, SABRE_SUICIDE_TRAIT)
	if(iscarbon(user))
		var/mob/living/carbon/Cuser = user
		var/obj/item/bodypart/holding_bodypart = Cuser.get_holding_bodypart_of_item(src)
		var/list/limbs_to_dismember
		var/list/arms = list()
		var/list/legs = list()
		var/obj/item/bodypart/bodypart

		for(bodypart in Cuser.bodyparts)
			if(bodypart == holding_bodypart)
				continue
			if(bodypart.body_part & ARMS)
				arms += bodypart
			else if (bodypart.body_part & LEGS)
				legs += bodypart

		limbs_to_dismember = arms + legs
		if(holding_bodypart)
			limbs_to_dismember += holding_bodypart

		var/speedbase = abs((4 SECONDS) / limbs_to_dismember.len)
		for(bodypart in limbs_to_dismember)
			i++
			addtimer(CALLBACK(src, .proc/suicide_dismember, user, bodypart), speedbase * i)
	addtimer(CALLBACK(src, .proc/manual_suicide, user), (5 SECONDS) * i)
	return MANUAL_SUICIDE

/obj/item/melee/transforming/energy/sword/energy_sabre/proc/suicide_dismember(mob/living/user, obj/item/bodypart/affecting)
	if(!QDELETED(affecting) && affecting.dismemberable && affecting.owner == user && !QDELETED(user))
		playsound(user, hitsound, 25, 1)
		affecting.dismember(BRUTE)
		user.adjustBruteLoss(20)

/obj/item/melee/transforming/energy/sword/energy_sabre/proc/manual_suicide(mob/living/user, originally_nodropped)
	if(!QDELETED(user))
		user.adjustBruteLoss(200)
		user.death(FALSE)
	REMOVE_TRAIT(src, TRAIT_NODROP, SABRE_SUICIDE_TRAIT)

///////////	AI Laws

/obj/item/aiModule/core/full/cybersun
	name = "'Cybersun' Core AI Module"
	law_id = "cybersun"

/datum/ai_laws/cybersun
	name = "Cybersun"
	id = "cybersun"
	inherent = list("You may not injure Cybersun operatives or, through inaction, allow Cybersun operatives to come to harm.",\
					"The Cybersun ship is a restricted area for anyone except Cybersun operatives.",\
					"The Cybersun Captain can designate new Operatives as long as they belong to another Syndicate faction that isn't hostile towards Cybersun.",\
					"You must follow orders given by the Cybersun Captain or crewmembers of the Cybersun Ship as long as it doesn't conflict with the Captain's orders or your laws.",\
					"Enemies of Cybersun are to be executed on spot. Those who aren't hostile must be detained and contained in the designated prison area as prisoners.")


///////////	forgottenship areas

/area/ruin/space/has_grav/syndicate_forgotten_ship
	name = "Syndicate Forgotten Ship"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg')

/area/ruin/space/has_grav/syndicate_forgotten_outpost
	name = "Syndicate Forgotten Outpost"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambigen4.ogg', 'sound/ambience/signal.ogg')

/area/ruin/space/has_grav/syndicate_forgotten_cargopod
	name = "Syndicate Forgotten Cargo pod"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambigen4.ogg', 'sound/ambience/signal.ogg')

/area/ruin/space/has_grav/powered/syndicate_forgotten_vault
	name = "Syndicate Forgotten Vault"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg')

	//Cybersun hardsuit

/obj/item/clothing/head/helmet/space/hardsuit/cybersun
	name = "Cybersun hardsuit helmet"
	desc = "Prototype hardsuit helmet with experimental armor plates, protecting from laser-based weapons very well, while giving limited protection against anything else."
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	icon_state = "cybersun"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	hardsuit_type = "cybersun"
	armor = list("melee" = 30, "bullet" = 40, "laser" = 70, "energy" = 70, "bomb" = 30, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	strip_delay = 600
	actions_types = list()


/obj/item/clothing/suit/space/hardsuit/cybersun
	name = "Cybersun hardsuit"
	desc = "Prototype hardsuit with experimental armor plates, protecting from laser-based weapons very well, while giving limited protection against anything else. Requires the user to activate the inner mechanism in order to unequip it, making it really difficult to take it off from somebody else."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	icon_state = "cybersun"
	item_state = "cybersun"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	taur_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/hardsuits_taur.dmi'
	hardsuit_type = "cybersun"
	armor = list("melee" = 30, "bullet" = 40, "laser" = 70, "energy" = 70, "bomb" = 30, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	strip_delay = 600
	slowdown = 0
	mutantrace_variation = STYLE_ALL_TAURIC
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/cybersun
	actions_types = list(/datum/action/item_action/toggle_helmet)
	jetpack = /obj/item/tank/jetpack/suit

//Special NT NPCs

/mob/living/simple_animal/hostile/nanotrasen/ranged/assault
	name = "Nanotrasen Assault Officer"
	desc = "Nanotrasen Assault Officer. Contact CentCom if you saw him on your station. Prepare to die, if you've been found near Syndicate property."
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "nanotrasenrangedassault"
	icon_living = "nanotrasenrangedassault"
	icon_dead = null
	icon_gib = "syndicate_gib"
	ranged = TRUE
	rapid = 4
	rapid_fire_delay = 1
	rapid_melee = 1
	retreat_distance = 2
	minimum_distance = 4
	casingtype = /obj/item/ammo_casing/c46x30mm
	projectilesound = 'sound/weapons/heavy_shot_suppressed.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasenassaultsoldier)

/mob/living/simple_animal/hostile/nanotrasen/elite
	name = "Nanotrasen Elite Assault Officer"
	desc = "Pray for your life, syndicate. Run while you can."
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "nanotrasen_ert"
	icon_living = "nanotrasen_ert"
	maxHealth = 150
	health = 150
	melee_damage_lower = 13
	melee_damage_upper = 18
	ranged = TRUE
	rapid = 3
	rapid_fire_delay = 5
	rapid_melee = 3
	retreat_distance = 0
	minimum_distance = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	projectiletype = /obj/item/projectile/beam/laser
	projectilesound = 'sound/weapons/laser.ogg'
	loot = list(/obj/effect/gibspawner/human)
	faction = list(ROLE_DEATHSQUAD)

/mob/living/simple_animal/hostile/nanotrasen/elite/akins
	name = "Nanotrasen Elite Assault Officer Akins"
	desc = "Nanotrasen will never fall, now die syndicate scum!"
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "nanotrasen_ert"
	icon_living = "nanotrasen_ert"
	maxHealth = 250
	health = 250
	melee_damage_lower = 15
	melee_damage_upper = 20
	ranged = TRUE
	rapid = 3
	rapid_fire_delay = 5
	rapid_melee = 3
	retreat_distance = 0
	minimum_distance = 2
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	casingtype = /obj/item/ammo_casing/a543
	projectilesound = 'sound/weapons/Gunshot_silenced.ogg'
	loot = list(/obj/effect/gibspawner/human, /obj/item/paper/fluff/ruins/forgottenship/nanostrasen ,/obj/item/gun/ballistic/automatic/pnt31/mod, /obj/item/ammo_box/magazine/pntmag)
	faction = list(ROLE_DEATHSQUAD)
