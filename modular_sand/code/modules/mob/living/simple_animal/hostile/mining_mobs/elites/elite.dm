/obj/structure/elite_tumor
	potentialspawns = list(/mob/living/simple_animal/hostile/asteroid/elite/broodmother,
								/mob/living/simple_animal/hostile/asteroid/elite/pandora,
								/mob/living/simple_animal/hostile/asteroid/elite/legionnaire,
								/mob/living/simple_animal/hostile/asteroid/elite/herald,
								/mob/living/simple_animal/hostile/asteroid/elite/drakeling,
								/mob/living/simple_animal/hostile/asteroid/elite/candy,
								/mob/living/simple_animal/hostile/asteroid/elite/minerpriest)

/obj/structure/elite_tumor/priest
	potentialspawns = list(/mob/living/simple_animal/hostile/asteroid/elite/minerpriest)

/mob/living/simple_animal/hostile/asteroid/elite
	can_talk = TRUE
	speak_emote = list("growls")

/mob/living/simple_animal/hostile/asteroid/elite/death(gibbed)
	gibbed = FALSE
	..(gibbed)

/obj/item/tumor_shard/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(istype(target, /mob/living/simple_animal/hostile/asteroid/elite) && proximity_flag)
		var/mob/living/simple_animal/hostile/asteroid/elite/E = target
		if(E.stat != DEAD || E.sentience_type != SENTIENCE_BOSS || !E.key)
			user.visible_message(span_notice("It appears [E] is unable to be revived right now.  Perhaps try again later."))
			return
		E.faction = list("neutral")
		E.revive(full_heal = TRUE, admin_revive = TRUE)
		user.visible_message(span_notice("[user] stabs [E] with [src], reviving it."))
		E.playsound_local(get_turf(E), 'sound/effects/magic.ogg', 40, 0)
		to_chat(E, "<span class='userdanger'>You have been revived by [user].  You owe [user] a great debt.  Assist [user.p_them()] in achieving [user.p_their()] goals, regardless of risk.</span")
		to_chat(E, span_big(span_bold("Note that you now share the loyalties of [user].  You are expected not to intentionally sabotage their faction unless commanded to!")))
		E.maxHealth *= 0.5
		E.health = E.maxHealth
		E.desc = "[E.desc]  However, this one appears appears less wild in nature, and calmer around people."
		E.sentience_type = SENTIENCE_ORGANIC
		E.owner = user
		qdel(src)
	else
		to_chat(user, span_info("[src] only works on the corpse of a sentient lavaland elite."))
