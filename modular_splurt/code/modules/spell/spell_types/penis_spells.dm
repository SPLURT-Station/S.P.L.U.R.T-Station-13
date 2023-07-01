
/obj/effect/proc_holder/spell/targeted/touch/penis_max
	name = "Penis Grower"
	desc = "This spell charges your hand with vile energy that can be used to grow penises."
	hand_path = /obj/item/melee/touch_attack/penis_max
	school = "evocation"
	charge_max = 600
	cooldown_min = 200 //100 deciseconds reduction per rank
	action_icon_state = "penis-increased"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	clothes_req = NONE

/obj/item/melee/touch_attack/penis_max
	name = "\improper penis increase touch"
	desc = "This hand of mine glows with an erotic power!"
	catchphrase = "Dicogrand!!"
	on_use_sound = 'sound/magic/disintegrate.ogg'
	icon_state = "disintegrate"
	item_state = "disintegrate"

/obj/item/melee/touch_attack/penis_max/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!proximity || target == user || !ismob(target) || !iscarbon(user) || user.lying || user.handcuffed) //exploding after touching yourself would be bad
		return
	if(!user.can_speak_vocal())
		to_chat(user, "<span class='notice'>You can't get the words out!</span>")
		return
	var/mob/M = target
	do_sparks(4, FALSE, M.loc)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.client.prefs.magicalpref == "Yes")
			var/obj/item/organ/genital/penis/P = H.getorganslot(ORGAN_SLOT_PENIS)
			P.modify_size(30)
			spawn(15 MINUTES)
				P.modify_size(-30)
	return ..()







/obj/effect/proc_holder/spell/targeted/touch/penis
	name = "Penis Grower"
	desc = "This spell charges your hand with vile energy that can be used to grow penises."
	hand_path = /obj/item/melee/touch_attack/penis
	school = "evocation"
	charge_max = 600
	cooldown_min = 200 //100 deciseconds reduction per rank
	action_icon_state = "penis-increase"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	clothes_req = NONE


/obj/item/melee/touch_attack/penis
	name = "\improper penis increase touch"
	desc = "This hand of mine glows with an erotic power!"
	catchphrase = "Dicogrand!!"
	on_use_sound = 'sound/magic/disintegrate.ogg'
	icon_state = "disintegrate"
	item_state = "disintegrate"

/obj/item/melee/touch_attack/penis/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!proximity || target == user || !ismob(target) || !iscarbon(user) || user.lying || user.handcuffed) //exploding after touching yourself would be bad
		return
	if(!user.can_speak_vocal())
		to_chat(user, "<span class='notice'>You can't get the words out!</span>")
		return
	var/mob/M = target
	do_sparks(4, FALSE, M.loc)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.client.prefs.magicalpref == "Yes")
			var/obj/item/organ/genital/penis/P = H.getorganslot(ORGAN_SLOT_PENIS)
			P.modify_size(10)
			spawn(15 MINUTES)
				P.modify_size(-10)
	return ..()




