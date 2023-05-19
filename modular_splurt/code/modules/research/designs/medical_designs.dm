/datum/design/implant_slave
	name = "Slave Implant Case"
	desc = "A glass case containing an implant."
	id = "implant_slave"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/implantcase/slave
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/implant_gfluid
	name = "Genital Fluid Implant Case"
	desc = "A glass case containing an implant"
	id = "implant_gfluid"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/implantcase/genital_fluid
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/implant_hide_backpack
	name = "Storage Concealment Implant Case"
	desc = "A glass case containing an implant"
	id = "implant_hide_backpack"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/implantcase/hide_backpack
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/implantradio
	name = "Radio Implant Case"
	desc = "A glass case containing an implant"
	id = "impant_radio"
	build_path = /obj/item/implantcase/radio
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SECURITY

/datum/design/nanogel
	category = list("Misc", "Medical Designs")

//Cybernetic organs

/datum/design/cybernetic_liver
	category = list("Cybernetics", "Medical Designs")

/datum/design/cybernetic_heart
	category = list("Cybernetics", "Medical Designs")

/datum/design/cybernetic_lungs
	category = list("Cybernetics", "Medical Designs")

/datum/design/cybernetic_stomach
	category = list("Cybernetics", "Medical Designs")

/datum/design/cybernetic_tongue
	category = list("Cybernetics", "Medical Designs")

/datum/design/cybernetic_ears
	category = list("Cybernetics", "Medical Designs")

/datum/design/cybernetic_ears_u
	category = list("Cybernetics", "Medical Designs")

/datum/design/cyberimp_welding
	category = list("Cybernetics", "Medical Designs")

/datum/design/cyberimp_gloweyes
	category = list("Cybernetics", "Medical Designs")

/datum/design/cyberimp_xray
	category = list("Cybernetics", "Medical Designs")

/datum/design/cyberimp_thermals
	category = list("Cybernetics", "Medical Designs")

// Derivative of glow eyes
/datum/design/cyberimp_gloweyes/cyberimp_hypnoeyes
	name = "Mesmer Eyes"
	desc = "Cybernetic eyes with integrated memetic sub-systems."
	id = "ci-hypnoeyes"
	build_path = /obj/item/organ/eyes/robotic/hypno

//Cybernetic implants

/datum/design/cyberimp_breather
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_surgical
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_toolset
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_shield
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_janitor
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_service
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_medical_hud
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_security_hud
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_diagnostic_hud
	name = "Diagnostic HUD Implant"
	desc = "These cybernetic eyes will display a diagnostic HUD over everything you see. Wiggle eyes to control."
	id = "ci-diaghud"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 50
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/silver = 500, /datum/material/gold = 500)
	build_path = /obj/item/organ/cyberimp/eyes/hud/diagnostic
	category = list("Implants", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cyberimp_antidrop
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_antistun
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_nutriment
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_nutriment_plus
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_reviver
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_thrusters
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_toolset_advanced
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_surgical_advanced
	category = list("Implants", "Medical Designs")

/datum/design/cyberimp_robot_radshielding
	category = list("IPC Organs", "Medical Designs")

/datum/design/cyberimp_power_cord
	category = list("IPC Organs", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

//Prosthetics

/datum/design/basic_l_arm
	category = list("Prosthetics", "Medical Designs")

/datum/design/basic_r_arm
	category = list("Prosthetics", "Medical Designs")

/datum/design/basic_l_leg
	category = list("Prosthetics", "Medical Designs")

/datum/design/basic_r_leg
	category = list("Prosthetics", "Medical Designs")

/datum/design/adv_r_leg
	category = list("Prosthetics", "Medical Designs")

/datum/design/adv_l_leg
	category = list("Prosthetics", "Medical Designs")

/datum/design/adv_l_arm
	category = list("Prosthetics", "Medical Designs")

/datum/design/adv_r_arm
	category = list("Prosthetics", "Medical Designs")
