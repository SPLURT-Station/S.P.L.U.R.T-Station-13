/obj/effect/proc_holder/spell/self/aoe_lust
	name = "Area Lust"
	desc = "Make the people nearby horny."
	charge_max = 600 //variable
	cooldown_min = 0
	clothes_req = NONE
	antimagic_allowed = TRUE
	action_icon_state = "aoe_lust"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	var/activated = 0
	clothes_req = NONE

/obj/effect/proc_holder/spell/self/aoe_lust/cast(mob/living/carbon/human/user)
	for(var/mob/living/carbon/human/HH in view(5, user))
		if(HH?.client?.prefs?.magicalpref == "No")
			continue
		HH.add_lust(50)

