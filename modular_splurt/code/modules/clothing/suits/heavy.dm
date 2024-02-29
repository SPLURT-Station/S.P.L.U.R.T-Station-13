//CBRN gear

/obj/item/clothing/suit/cbrn
	name = "civilian CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has civilian colors."
	icon_state = "cbrnsuitciv"
	item_state = "cbrnsuitciv"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/doubleoxygen, /obj/item/tank/internals/oxygen, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/geiger_counter)
	slowdown = 1
	armor = list("melee" = 5, "bullet" = 0, "laser" = 5,"energy" = 5, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100)
	strip_delay = 60
	equip_delay_other = 60
	flags_inv = HIDEJUMPSUIT|HIDETAUR
	resistance_flags = ACID_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_ALL_TAURIC

/obj/item/clothing/suit/cbrn/engineering
	name = "engineering CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has engineering colors."
	icon_state = "cbrnsuiteng"
	item_state = "cbrnsuiteng"

/obj/item/clothing/suit/cbrn/security
	name = "engineering CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has security colors."
	icon_state = "cbrnsuitsec"
	item_state = "cbrnsuitsec"

/obj/item/clothing/suit/cbrn/medical
	name = "medical CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has medical colors."
	icon_state = "cbrnsuitmed"
	item_state = "cbrnsuitmed"

/obj/item/clothing/suit/cbrn/cargo
	name = "cargo CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has cargo colors."
	icon_state = "cbrnsuitcargo"
	item_state = "cbrnsuitcargo"

/obj/item/clothing/suit/cbrn/science
	name = "science CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has science colors."
	icon_state = "cbrnsuitsci"
	item_state = "cbrnsuitsci"

/obj/item/clothing/suit/cbrn/service
	name = "service CBRN suit"
	desc = "Chemical, Biological, Radiological and Nuclear. A suit design for harsh environmental conditions short of no atmosphere. This one has service colors."
	icon_state = "cbrnsuitserv"
	item_state = "cbrnsuitserv"

//MOPP gear and Advance MOPP gear

/obj/item/clothing/suit/cbrn/mopp
	name = "MOPP suit"
	desc = "Mission Oriented Protective Posture. A suit design for harsh combat conditions short of no atmosphere. It has armor sowed into it."
	icon_state = "moppsuit"
	item_state = "moppsuit"
	allowed = list(/obj/item/flashlight, /obj/item/gun/ballistic/revolver, /obj/item/gun/ballistic/automatic, /obj/item/gun/ballistic/automatic/pistol, /obj/item/gun/energy, /obj/item/gun/ballistic/shotgun,  /obj/item/tank/internals/doubleoxygen, /obj/item/tank/internals/oxygen, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/geiger_counter)
	slowdown = 0.5
	armor = list("melee" = 35, "bullet" = 50, "laser" = 30,"energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100) //I can tell I will have to fucking balance this... several times it feels like -Radar

/obj/item/clothing/suit/cbrn/mopp/advance
	name = "advance MOPP suit"
	desc = "Mission Oriented Protective Posture. A suit design for harsh combat conditions short of no atmosphere. This is an advance version for Non-ERT Central Command Staff."
	slowdown = 0 // This is suppose to be advance, hopefully not too OP
	armor = list("melee" = 40, "bullet" = 60, "laser" = 40,"energy" = 30, "bomb" = 20, "bio" = 110, "rad" = 110, "fire" = 50, "acid" = 110) //Scale with standard MOPP suits as this effects all ERT suits
	clothing_flags = NONE

/obj/item/clothing/suit/cbrn/mopp/advance/commander
	name = "advance MOPP suit 'Commander'"
	desc = "Mission Oriented Protective Posture. A suit design for harsh combat conditions short of no atmosphere. This is an advance version for ERT Commanders."
	icon_state = "moppsuitertcom"
	item_state = "moppsuitertcom"

/obj/item/clothing/suit/cbrn/mopp/advance/security
	name = "advance MOPP suit 'Security'"
	desc = "Mission Oriented Protective Posture. A suit design for harsh combat conditions short of no atmosphere. This is an advance version for ERT Security members."
	icon_state = "moppsuitertsec"
	item_state = "moppsuitertsec"

/obj/item/clothing/suit/cbrn/mopp/advance/medical
	name = "advance MOPP suit 'Medical'"
	desc = "Mission Oriented Protective Posture. A suit design for harsh combat conditions short of no atmosphere. This is an advance version for ERT Medical members."
	icon_state = "moppsuitertmed"
	item_state = "moppsuitertmed"

/obj/item/clothing/suit/cbrn/mopp/advance/engi
	name = "advance MOPP suit 'Engineer'"
	desc = "Mission Oriented Protective Posture. A suit design for harsh combat conditions short of no atmosphere. This is an advance version for ERT Engineering members."
	icon_state = "moppsuiterteng"
	item_state = "moppsuiterteng"

//CBRN/MOPP tanks

/obj/item/tank/internals/doubleoxygen
	name = "double oxygen tank"
	desc = "Two tanks of oxygen stuck together. Double the oxygen double the fun"
	icon_state = "oxygencbrn"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/items_righthand.dmi'
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE
	force = 10
	dog_fashion = null
	volume = 140

/obj/item/tank/internals/doubleoxygen/populate_gas()
	air_contents.set_moles(GAS_O2, (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))
	return


/obj/item/tank/internals/plasmamandouble
	name = "double plasma internals tank"
	desc = "A double tank of plasma gas designed specifically for use as internals, particularly for plasma-based lifeforms. If you're not a Plasmaman, you probably shouldn't use this."
	icon_state = "plasmaman_tankcbrn"
	item_state = "plasmaman_tankcbrn"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/items_righthand.dmi'
	force = 10
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE
	dog_fashion = null
	volume = 140

/obj/item/tank/internals/plasmamandouble/populate_gas()
	air_contents.set_moles(GAS_PLASMA, (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))
	return

/obj/item/tank/internals/doublenitrogen
	name = "double nitrogen tank"
	desc = "Two tanks of nitrogen stuck together. Double the nitrogen double the fun"
	icon_state = "nitrogencbrn"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/items_righthand.dmi'
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE
	force = 10
	dog_fashion = null
	volume = 140

/obj/item/tank/internals/doublenitrogen/populate_gas()
	air_contents.set_moles(GAS_N2, (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))
	return

//research nods

/datum/design/cbrn/cbrncivi
	name = "Civilian CBRN Suit"
	desc = "A civilian CBRN suit."
	id = "cbrn_civi"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 500, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cbrn/cbrnsec
	name = "Security CBRN Suit"
	desc = "A security CBRN suit."
	id = "cbrn_sec"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn/security
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cbrn/cbrnengi
	name = "Engineering CBRN Suit"
	desc = "A engineering CBRN suit."
	id = "cbrn_engi"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn/engineering
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/cbrn/cbrnser
	name = "Service CBRN Suit"
	desc = "A service CBRN suit."
	id = "cbrn_serv"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn/service
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/cbrn/cbrncargo
	name = "Cargo CBRN Suit"
	desc = "A cargo CBRN suit."
	id = "cbrn_cargo"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn/cargo
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/cbrn/cbrnsci
	name = "Science CBRN Suit"
	desc = "A science CBRN suit."
	id = "cbrn_sci"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn/science
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/cbrn/cbrnmed
	name = "Medical CBRN Suit"
	desc = "A medical CBRN suit."
	id = "cbrn_med"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 600)
	build_path = /obj/item/clothing/suit/cbrn/medical
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cbrn/moppsuit
	name = "MOPP Suit"
	desc = "A security MOPP suit."
	id = "mopp_suit"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 600, /datum/material/uranium = 100, /datum/material/iron = 800)
	build_path = /obj/item/clothing/suit/cbrn/mopp
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cbrn/oxytank
	name = "Double Oxygen Tank"
	desc = "A Double Oxygen."
	id = "cbrn_oxy"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/tank/internals/doubleoxygen
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cbrn/plasmatank
	name = "Double Plasma Tank"
	desc = "A CBRN hood."
	id = "cbrn_plasma"
	build_type = PROTOLATHE
	materials = list( /datum/material/plasma = 200, /datum/material/iron = 200)
	build_path = /obj/item/tank/internals/plasmamandouble
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cbrn/nitrotank
	name = "Double Nitrogen Tank"
	desc = "A Double Nitrogen tank."
	id = "cbrn_nitrogen"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/tank/internals/doublenitrogen
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/techweb_node/cbrn
	id = "cbrn"
	display_name = "CBRN gear"
	description = "Chemical, Biological, Radiological and Nuclear protective gear"
	prereq_ids = list("engineering")
	design_ids = list("cbrn_civi", "cbrn_sec", "cbrn_engi", "cbrn_serv", "cbrn_cargo", "cbrn_sci", "cbrn_med", "cbrn_mask", "cbrn_boots", "cbrn_gloves", "cbrn_glovesengi", "cbrn_hood", "cbrn_oxy", "cbrn_plasma","cbrn_nitrogen")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)

/datum/techweb_node/mopp
	id = "mopp"
	display_name = "MOPP gear"
	description = "Mission Oriented Protective Posture gear, meant for sec."
	prereq_ids = list("cbrn")
	design_ids = list("mopp_suit", "mopp_mask", "mopp_boots", "mopp_gloves", "mopp_hood")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)
