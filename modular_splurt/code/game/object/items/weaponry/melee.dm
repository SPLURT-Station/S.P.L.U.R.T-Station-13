/obj/item/melee/baseball_bat
	var/hole = CUM_TARGET_VAGINA

/obj/item/melee/baseball_bat/AltClick(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, "<span class='notice'>Now targetting \the [hole].</span>")

/obj/item/melee/baseball_bat/attack(mob/living/target, mob/living/user)
	if (BODY_ZONE_PRECISE_GROIN && user.a_intent != INTENT_HARM) //ROUGH PRISON HUMILATION YAY
		var/possessive_verb = user.p_their()
		var/message = ""
		var/lust_amt = 0
		if(ishuman(target) && (target?.client?.prefs?.toggles & VERB_CONSENT))
			if(user.zone_selected == BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(target.has_vagina(REQUIRE_EXPOSED))
							message = (user == target) ? pick("fucks [possessive_verb] own pussy with \the [src]","shoves \the [src] into [possessive_verb] pussy", "jams \the [src] into [possessive_verb] pussy") : pick("fucks [target] right in the pussy with \the [src]", "jams \the [src] right into [target]'s pussy")
							lust_amt = NORMAL_LUST
					if(CUM_TARGET_ANUS)
						if(target.has_anus(REQUIRE_EXPOSED))
							message = (user == target) ? pick("fucks [possessive_verb] own ass with \the [src]","shoves \the [src] into [possessive_verb] ass", "jams \the [src] into [possessive_verb] ass") : pick("fucks [target]'s asshole with \the [src]", "jams \the [src] into [target]'s ass")
							lust_amt = NORMAL_LUST
		if(message)
			user.visible_message("<span class='lewd'>[user] [message].</span>")
			target.handle_post_sex(lust_amt, null, user)
			playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
								'modular_sand/sound/interactions/bang5.ogg',
								'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
	else //Standart code
		. = ..()
		if(HAS_TRAIT(user, TRAIT_PACIFISM))
			return
		var/atom/throw_target = get_edge_target_turf(target, user.dir)
		if(homerun_ready)
			user.visible_message("<span class='userdanger'>It's a home run!</span>")
			target.throw_at(throw_target, rand(8,10), 14, user)
			target.ex_act(EXPLODE_HEAVY)
			playsound(get_turf(src), 'sound/weapons/homerun.ogg', 100, TRUE)
			homerun_ready = 0
			return
		else if(!target.anchored)
			var/whack_speed = (prob(60) ? 1 : 4)
			target.throw_at(throw_target, rand(1, 2), whack_speed, user) // sorry friends, 7 speed batting caused wounds to absolutely delete whoever you knocked your target into (and said target)
