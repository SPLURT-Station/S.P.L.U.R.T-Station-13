/obj/item/organ/lungs/ipc
	name = "IPC cooling system"
	desc = "Helps regulate the body temperature of synthetic beings. Helpful!"

/obj/item/organ/lungs/vox
	name = "plasma filter"
	desc = "A spongy rib-shaped mass for filtering plasma from the air."
	icon_state = "lungs-plasma"
	breathing_class = BREATH_PLASMA
	maxHealth = INFINITY//I don't understand how plamamen work, so I'm not going to try t give them special lungs atm

/obj/item/organ/lungs/vox/populate_gas_info()
	..()
	gas_max -= GAS_PLASMA
