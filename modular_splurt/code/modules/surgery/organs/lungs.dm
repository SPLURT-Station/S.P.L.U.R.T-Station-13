/obj/item/organ/lungs/ipc
	name = "IPC cooling system"
	desc = "Helps regulate the body temperature of synthetic beings. Helpful!"

/obj/item/organ/lungs/vox
	name = "vox lungs"
	desc = "A set of lungs adapted to filter nitrogen. They're filled with.. dust."
	icon_state = "lungs-x"
	breathing_class = BREATH_NITROGEN
	maxHealth = INFINITY//I don't understand how plamamen work, so I'm not going to try t give them special lungs atm

/obj/item/organ/lungs/vox/populate_gas_info()
	..()
	gas_max += GAS_O2
