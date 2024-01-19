// MODULAR SPLURT CHANGES OF ALREADY EXISTING DESIGNS
/datum/design/rcd_loaded
	name = "Rapid Construction Device (RCD)"

/datum/design/rld_mini/New()
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000, /datum/material/plastic = 1000, /datum/material/gold = 1000)
	departmental_flags |=  DEPARTMENTAL_FLAG_SCIENCE


// NEW DESIGNS:

/datum/design/rld
	name = "Rapid Light Device (RLD)"
	desc = "A device used to rapidly provide lighting sources to an area. Reload with metal, plasteel, glass or compressed matter cartridges."
	id = "rld"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/glass = 10000, /datum/material/plastic = 2000, /datum/material/gold = 2000)
	build_path = /obj/item/construction/rld
	category = list("Tool Designs")
	departmental_flags =  DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE
