/mob/living/carbon/human
	var/uncovered = 0

/obj/effect/proc_holder/spell/targeted/touch/uncover
	name = "Uncover"
	desc = "This spell charges your hand with vile energy that can be used to uncover victims."
	hand_path = /obj/item/melee/touch_attack/uncover
	school = "evocation"
	charge_max = 600
	cooldown_min = 200 //100 deciseconds reduction per rank
	action_icon_state = "uncover"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	clothes_req = NONE

/obj/item/melee/touch_attack/uncover
	name = "\improper uncover touch"
	desc = "This hand of mine glows with an erotic power!"
	catchphrase = "Dicogrand!!"
	on_use_sound = 'sound/magic/disintegrate.ogg'
	icon_state = "disintegrate"
	item_state = "disintegrate"

/obj/item/melee/touch_attack/uncover/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!proximity || target == user || !ismob(target) || !iscarbon(user) || user.lying || user.handcuffed) //exploding after touching yourself would be bad
		return
	if(!user.can_speak_vocal())
		to_chat(user, "<span class='notice'>You can't get the words out!</span>")
		return
	var/mob/M = target
	do_sparks(4, FALSE, M.loc)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H?.client?.prefs?.magicalpref == "Yes")
			for(var/obj/item/W in H)
				H.dropItemToGround(W, 1)
			if(!H.uncovered)
				H.uncovered = 1
			else
				H.uncovered = 0
			spawn(10 MINUTES)
				H.uncovered = 0
	return ..()





