

/obj/effect/proc_holder/spell/grope
	name = "Grope"
	desc = "Spawns magical hands of groping."
	charge_max = 1200 //variable
	cooldown_min = 0
	level_max = 1
	clothes_req = NONE
	antimagic_allowed = TRUE
	action_icon_state = "grope"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	var/mob/living/carbon/human/victim

/obj/effect/proc_holder/spell/grope/choose_targets(mob/user = usr)
	perform(user=user)

/obj/effect/proc_holder/spell/grope/perform(list/targets, recharge = 1, mob/user = usr)
	var/list/possible = list()
	for(var/mob/living/carbon/human/H in view(7, user))
		possible.Add(H)
	victim = input(user, "Choose the one to be groped", "Command") in possible
	if(QDELETED(src) || QDELETED(user))
		return
	if(!victim)
		revert_cast(user)
		return
	..()

/obj/effect/proc_holder/spell/grope/cast(list/targets, mob/user = usr)
	victim.be_groped(user)

/mob/living/carbon/human
	var/is_being_groped = 0

/mob/living/carbon/human/proc/be_groped(var/mob/living/carbon/human/H)
	is_being_groped = H
	update_groped_icon()

/mob/living/carbon/human/proc/update_groped_icon()
	if(is_being_groped)
		var/mutable_appearance/new_groping_overlay = mutable_appearance('modular_splurt/icons/effects/sex_spells.dmi', "grope overlay", -GROPING_LAYER)
		overlays_standing[GROPING_LAYER] = new_groping_overlay
		apply_overlay(GROPING_LAYER)
	else
		overlays_standing[GROPING_LAYER] = null
		return 0

/mob/living/carbon/human/Life()
	. = ..()
	if(is_being_groped)
		if(prob(50))
			var/datum/interaction/lewd/titgrope/TG = new
			TG.do_action(is_being_groped, src)
			qdel(TG)
		else
			var/datum/interaction/lewd/finger/FI = new
			FI.do_action(is_being_groped, src)
			qdel(FI)


/datum/quirk/sex_magician
	name = "Sex Magician"
	desc = "You can cast sexual spells into others."
	value = 1
	mob_trait = TRAIT_SEXSPELLS
	gain_text = "<span class='notice'>You can cast sexual spells.</span>"
	lose_text = "<span class='danger'>You forget how to cast sexual spells.</span>"
	medical_record_text = "Patient brain scans show a highly-developed into sexual spells."

/datum/quirk/sex_magician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/effect/proc_holder/spell/grope/S = new /obj/effect/proc_holder/spell/grope
	H.mind.AddSpell(S)







