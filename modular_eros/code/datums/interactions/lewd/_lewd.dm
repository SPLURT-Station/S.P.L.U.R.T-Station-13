/mob/living/proc/do_oral_self(mob/living/user, var/fucktarget = "penis")
	var/message
	var/obj/item/organ/genital/peepee = null
	var/lust_increase = NORMAL_LUST
	var/t_His = p_their()
	var/t_Him = p_them()

	if(user.is_fucking(src, CUM_TARGET_MOUTH))
		if(prob(user.get_sexual_potency()))
			if(istype(src, /mob/living)) // Argh.
				var/mob/living/H = src
				H.adjustOxyLoss(3)
			message = "sucks [t_Him]self off"
			lust_increase += 5
		else
			var/improv = FALSE
			switch(fucktarget)
				if("vagina")
					if(user.has_vagina())
						message = pick(
							"licks [t_His] pussy.",
							"runs their tongue up the shape of [t_His] pussy.",
							"traces [t_His] slit with their tongue.",
							"darts the tip of their tongue around [t_His] clit.",
							"laps slowly at [t_Him].",
							"kisses [t_His] delicate folds.",
							"tastes [t_Him].",
						)
					else
						improv = TRUE
				if("penis")
					if(user.has_penis())
						message = pick(
							"sucks [t_Him] off.",
							"runs their tongue up the shape of [t_His] cock.",
							"traces [t_His] cock with their tongue.",
							"darts the tip of their tongue around tip of [t_His] cock.",
							"laps slowly at [t_His] shaft.",
							"kisses the base of [t_His] shaft.",
							"takes [t_Him] deeper into their mouth.",
						)
					else
						improv = TRUE
			if(improv)
				// get confused about how to do the sex
				message = pick(
					"licks [t_Him].",
					"looks a little unsure of where to lick [t_Him].",
					"runs their tongue between [t_His] legs.",
					"kisses [t_His] thigh.",
					"tries their best with [t_Him].",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(
						"buries their face in [t_His] pussy.",
						"nuzzles [t_His] wet sex.",
						"finds their face caught between [t_His] thighs.",
						"kneels down between [t_His] legs.",
						"grips [t_His] legs, pushing them apart.",
						"sinks their face in between [t_His] thighs.",
					)
				else
					improv = TRUE
			if("penis")
				if(user.has_penis())
					message = pick(
						"takes [t_His] cock into their mouth.",
						"wraps their lips around [t_His] cock.",
						"finds their face between [t_His] thighs.",
						"kneels down between [t_His] legs.",
						"grips [t_His] legs, kissing at the tip of their cock.",
						"goes down on [t_Him].",
					)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"begins to lick [t_His].",
				"starts kissing [t_His] thigh.",
				"sinks down between [t_His] thighs.",
				"briefly flashes a puzzled look from between [t_His] legs.",
				"looks unsure of how to handle [t_His] lack of genitalia.",
				"seems like they were expecting [t_His] to have a cock or a pussy or ... something.",
			)
			peepee = null
		else
			if(ishuman(user))
				var/mob/living/carbon/human/pardner = user
				switch(fucktarget)
					if("vagina")
						peepee = pardner.getorganslot(ORGAN_SLOT_VAGINA)
					if("penis")
						peepee = pardner.getorganslot(ORGAN_SLOT_PENIS)
		user.set_is_fucking(src, CUM_TARGET_MOUTH, peepee)

	playlewdinteractionsound(get_turf(src), pick('modular_sand/sound/interactions/bj1.ogg',
									'modular_sand/sound/interactions/bj2.ogg',
									'modular_sand/sound/interactions/bj3.ogg',
									'modular_sand/sound/interactions/bj4.ogg',
									'modular_sand/sound/interactions/bj5.ogg',
									'modular_sand/sound/interactions/bj6.ogg',
									'modular_sand/sound/interactions/bj7.ogg',
									'modular_sand/sound/interactions/bj8.ogg',
									'modular_sand/sound/interactions/bj9.ogg',
									'modular_sand/sound/interactions/bj10.ogg',
									'modular_sand/sound/interactions/bj11.ogg'), 50, 1, -1)
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	user.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, src)
	lust_increase = NORMAL_LUST //RESET IT REE

/mob/living/proc/do_breastfuck_self(mob/living/user)
	var/message
	var/t_His = p_their()
	
	if(is_fucking(user, CUM_TARGET_BREASTS))
		message = "[pick("fucks [t_His] breasts.",
			"grinds their cock between [t_His] boobs.",
			"thrusts into [t_His] tits.",
			"grabs [t_His] breasts together and presses their dick between them.")]"
	else
		message = "pushes [t_His]breasts together and presses their dick between them."
		set_is_fucking(user, CUM_TARGET_BREASTS, getorganslot(ORGAN_SLOT_PENIS) ? getorganslot(ORGAN_SLOT_PENIS) : null)

	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, user)
