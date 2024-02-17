/datum/design/flashdark
	name = "Flashdark"
	desc= "A strange device manufactured with mysterious elements that somehow emits darkness."
	id = "flashdark"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2250, /datum/material/glass = 2250, /datum/material/plasma = 2250)
	build_path = /obj/item/flashlight/flashdark
	reagents_list = list(/datum/reagent/liquid_dark_matter = 10)
	category = list("Misc", "Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/spraycan_bluespace
	name = "Bluespace Spray Can"
	desc= "A spray can infused with bluespace technology, that is also able to change the color of the sprayed object's innate light emissions."
	id = "spraycan_bluespace"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2250, /datum/material/glass = 2250, /datum/material/bluespace = 500)
	build_path = /obj/item/toy/crayon/spraycan/bluespace
	category = list("Misc", "Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE
