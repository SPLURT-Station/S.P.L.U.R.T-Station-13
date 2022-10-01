//Savannah-Ivanov
/datum/design/savannah_ivanov_chassis
	name = "Exosuit Chassis (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/savannah_ivanov
	materials = list(/datum/material/iron=20000)
	construction_time = 100
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_torso
	name = "Exosuit Torso (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_torso
	materials = list(/datum/material/iron=20000,/datum/material/glass = 7500)
	construction_time = 200
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_head
	name = "Exosuit Head (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_head
	materials = list(/datum/material/iron=6000,/datum/material/glass = 10000)
	construction_time = 100
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_left_arm
	name = "Exosuit Left Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_left_arm
	materials = list(/datum/material/iron=15000)
	construction_time = 150
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_right_arm
	name = "Exosuit Right Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_right_arm
	materials = list(/datum/material/iron=15000)
	construction_time = 150
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_chassis
	name = "Exosuit Chassis (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/savannah_ivanov
	materials = list(/datum/material/iron=25000)
	construction_time = 100
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_torso
	name = "Exosuit Torso (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_torso
	materials = list(/datum/material/iron=25000, /datum/material/glass = 10000,/datum/material/silver=10000)
	construction_time = 300
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_head
	name = "Exosuit Head (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_head
	materials = list(/datum/material/iron=10000,/datum/material/glass = 15000,/datum/material/silver=2000)
	construction_time = 200
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_left_arm
	name = "Exosuit Left Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_left_arm
	materials = list(/datum/material/iron=10000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_right_arm
	name = "Exosuit Right Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_right_arm
	materials = list(/datum/material/iron=10000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_left_leg
	name = "Exosuit Left Leg (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_left_leg
	materials = list(/datum/material/iron=15000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_right_leg
	name = "Exosuit Right Leg (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_right_leg
	materials = list(/datum/material/iron=15000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Savannah-Ivanov")

/datum/design/savannah_ivanov_armor
	name = "Exosuit Armor (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_armor
	materials = list(/datum/material/iron=30000,/datum/material/uranium=25000,/datum/material/titanium=20000)
	construction_time = 600
	category = list("Savannah-Ivanov")

/////////////////////
/////Synth Organs////
/////////////////////

/datum/design/ipc_heart
	name = "IPC Heart"
	desc = "An electronic pump that regulates hydraulic functions, the electronics have EMP shielding."
	id = "ipc_heart"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/heart/ipc
	category = list("IPC Organs")

/datum/design/ipc_lungs
	name = "IPC Cooling System"
	desc = "Helps regulate the body temperature of synthetics. Helpful!"
	id = "ipc_lungs"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/lungs/ipc
	category = list("IPC Organs")

/datum/design/ipc_liver
	name = "IPC Reagent Processing Liver"
	desc = "Handles the processing of reagents in synthetics."
	id = "ipc_liver"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/liver/ipc
	category = list("IPC Organs")

/datum/design/ipc_stomach
	name = "IPC Cell"
	desc = "Effectively the robot equivalent of a stomach, handling power storage."
	id = "ipc_stomach"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/stomach/ipc
	category = list("IPC Organs")

/datum/design/ipc_eyes
	name = "IPC Eyes"
	desc = "A little difficult to see without these."
	id = "ipc_eyes"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/eyes/ipc
	category = list("IPC Organs")

/datum/design/ipc_ears
	name = "IPC Auditory Sensors"
	desc = "A pair of microphones intended to be installed in an IPC head, that grant the ability to hear."
	id = "ipc_ears"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/ears/ipc
	category = list("IPC Organs")

/datum/design/ipc_tongue
	name = "IPC Positronic Voicebox"
	desc = "A voice synthesizer used by IPCs to smoothly interface with organic lifeforms."
	id = "ipc_tongue"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/tongue/robot/ipc
	category = list("IPC Organs")

/datum/design/ipc_brain
	name = "IPC Positronic Brain"
	desc = "A cube of shining metal, four inches to a side and covered in shallow grooves. It has an IPC serial number engraved on the top. It is usually slotted into the head of synthetic crewmembers."
	id = "ipc_brain"
	build_type = MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 300, /datum/material/silver = 500, /datum/material/gold = 400)
	build_path = /obj/item/organ/brain/ipc
	category = list("IPC Organs")
