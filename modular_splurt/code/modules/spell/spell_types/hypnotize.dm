

/obj/effect/proc_holder/spell/hypno
	name = "Hypnotize"
	desc = "Hypnotize someone with a phrase."
	charge_max = 1200 //variable
	cooldown_min = 0
	level_max = 1
	clothes_req = NONE
	antimagic_allowed = TRUE
	action_icon_state = "hypno"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	var/mob/living/carbon/human/victim
	var/hypnophrase

/obj/effect/proc_holder/spell/hypno/choose_targets(mob/user = usr)
	perform(user=user)

/obj/effect/proc_holder/spell/hypno/perform(list/targets, recharge = 1, mob/user = usr)
	var/list/possible = list()
	for(var/mob/living/carbon/human/H in view(7, user))
		possible.Add(H)
	victim = input(user, "Choose the one to be hypnotized", "Command") in possible
	hypnophrase = input(user, "Choose the phrase", "Command") as text
	if(QDELETED(src) || QDELETED(user))
		return
	if(!victim)
		revert_cast(user)
		return
	..()

/obj/effect/proc_holder/spell/hypno/cast(list/targets, mob/user = usr)
	addtimer(CALLBACK(victim, /mob/living/carbon.proc/gain_trauma, /datum/brain_trauma/hypnosis, TRAUMA_RESILIENCE_SURGERY, hypnophrase), 10)


