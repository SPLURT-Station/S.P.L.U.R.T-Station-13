//THIS FILE IS FOR THE CRUSHER!!

/obj/item/kinetic_crusher/rusted
	name = "rusted proto-kinetic crusher"
	desc = "An early design of the proto-kinetic accelerator, this crusher seems to not have seen any actual use in quite a while - its blade all rusted and dull. Still seems to work though."
	icon = 'modular_splurt/icons/obj/mining.dmi'
	item_state = "crusher0"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/hammers_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/hammers_righthand.dmi'
	icon_state = "mining_hammer_rust"
	charge_time = 20
	detonation_damage = 40
	backstab_bonus = 15
	brightness_on = 4

/obj/item/kinetic_crusher/rusted/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 160, 35) //no lol
	AddComponent(/datum/component/two_handed, force_unwielded=0, force_wielded=15)
