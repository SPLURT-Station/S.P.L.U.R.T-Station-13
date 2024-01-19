/datum/design/pin_electronic
	name = "Electronic Firing Pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation. NT safety regulations require all new designs to incorporate one."
	id = "pin_electronic"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
