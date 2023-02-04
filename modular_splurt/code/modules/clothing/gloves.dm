/obj/item/clothing/gloves/cbrn
	name = "CBRN gloves"
	desc = "Chemical, Biological, Radiological and Nuclear. Thick black gloves design for working in hazardous environments. Warning not shock proof."
	icon_state = "black"
	item_state = "blackgloves"
	siemens_coefficient = 1
	permeability_coefficient = 0.05
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = ACID_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	armor = list("melee" = 5, "bullet" = 0, "laser" = 5,"energy" = 5, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100)
	strip_mod = 1.5
	is_edible = 0

/obj/item/clothing/gloves/cbrn/engineer
	name = "engineer CBRN gloves"
	siemens_coefficient = 0
	desc = "Chemical, Biological, Radiological and Nuclear. Thick black gloves design for working in hazardous environments. Improved for engineering hazards"

/obj/item/clothing/gloves/cbrn/mopp
	name = "MOPP gloves"
	desc = "Mission Oriented Protective Posture. Thick black gloves design for working in hazardous combat environments. Still not shock proof"
	icon_state = "combat"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 100)

/obj/item/clothing/gloves/cbrn/mopp/advance
	name = "advance MOPP gloves"
	desc = "Mission Oriented Protective Posture. Thick black gloves design for working in hazardous combat environments. Advance variants for Central Command staff and ERT team. Insulated."
	icon_state = "combat"
	siemens_coefficient = 0
	armor = list("melee" = 15, "bullet" = 0, "laser" = 15,"energy" = 15, "bomb" = 20, "bio" = 110, "rad" = 110, "fire" = 60, "acid" = 110)

// research nods
/datum/design/cbrn/cbrngloves
	name = "CBRN Gloves"
	desc = "A pair of CBRN gloves."
	id = "cbrn_gloves"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cbrn/cbrnglovesengi
	name = "Engineering CBRN Gloves"
	desc = "A pair of engineering CBRN gloves."
	id = "cbrn_glovesengi"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 55, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn/engineer
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/cbrn/moppgloves
	name = "MOPP Gloves"
	desc = "A pair of MOPP gloves."
	id = "mopp_gloves"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn/mopp
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
