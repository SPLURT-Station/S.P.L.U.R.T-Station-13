/obj/effect/proc_holder/spell/aoe_lust
	name = "Eyes of Lust"
	desc = "Watch the lust."
	charge_max = 600 //variable
	cooldown_min = 0
	level_max = 1
	clothes_req = NONE
	antimagic_allowed = TRUE
	action_icon_state = "aoe_lust"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	var/activated = 0

/obj/effect/proc_holder/spell/aoe_lust/cast(list/targets, mob/user = usr)
	if(!ishuman(user))
		return 0
	var/mob/living/carbon/human/H = user
	for(var/mob/living/carbon/human/HH in view(5, H))
		HH.add_lust(50)

