/datum/interaction/lewd/oral
	description = "Go down on them."
	required_from_user = INTERACTION_REQUIRE_MOUTH
	required_from_target_exposed = INTERACTION_REQUIRE_VAGINA
	write_log_user = "gave head to"
	write_log_target = "was given head by"
	interaction_sound = null
	additional_details = list(
		INTERACTION_MAY_CONTAIN_DRINK
	)
	var/fucktarget = "vagina"

/datum/interaction/lewd/oral/blowjob
	description = "Suck them off."
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	fucktarget = "penis"

/datum/interaction/lewd/oral/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/lust_increase = NORMAL_LUST
	var/u_His = user.p_their()
	var/u_He = user.p_they()
	var/u_Were = user.p_theyre()

	if(partner.is_fucking(user, CUM_TARGET_MOUTH))
		if(prob(partner.get_sexual_potency()))
			user.adjustOxyLoss(3)
			message = "goes in deep on \the <b>[partner]</b>."
			lust_increase += 5
		else
			var/improv = FALSE
			switch(fucktarget)
				if("vagina")
					if(partner.has_vagina())
						message = pick(
							"licks \the <b>[partner]</b>'s pussy.",
							"runs [u_His] tongue up the shape of \the <b>[partner]</b>'s pussy.",
							"traces \the <b>[partner]</b>'s slit with [u_His] tongue.",
							"darts the tip of [u_His] tongue around \the <b>[partner]</b>'s clit.",
							"laps slowly at \the <b>[partner]</b>.",
							"kisses \the <b>[partner]</b>'s delicate folds.",
							"tastes \the <b>[partner]</b>.",
						)
					else
						improv = TRUE
				if("penis")
					if(partner.has_penis() || partner.has_strapon())
						var/genital_name = partner.get_penetrating_genital_name()
						message = pick(
							"sucks \the <b>[partner]</b>'s off.",
							"runs [u_His] tongue up the shape of \the <b>[partner]</b>'s [genital_name].",
							"traces \the <b>[partner]</b>'s [genital_name] with [u_His] tongue.",
							"darts the tip of [u_His] tongue around tip of \the <b>[partner]</b>'s [genital_name].",
							"laps slowly at \the <b>[partner]</b>'s shaft.",
							"kisses the base of \the <b>[partner]</b>'s shaft.",
							"takes \the <b>[partner]</b> deeper into [u_His] mouth.",
						)
					else
						improv = TRUE
			if(improv)
				// get confused about how to do the sex
				message = pick(
					"licks \the <b>[partner]</b>.",
					"looks a little unsure of where to lick \the <b>[partner]</b>.",
					"runs [u_His] tongue between \the <b>[partner]</b>'s legs.",
					"kisses \the <b>[partner]</b>'s thigh.",
					"tries [u_His] best with \the <b>[partner]</b>.",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(partner.has_vagina())
					message = pick(
						"buries [u_His] face in \the <b>[partner]</b>'s pussy.",
						"nuzzles \the <b>[partner]</b>'s wet sex.",
						"finds [u_His] face caught between \the <b>[partner]</b>'s thighs.",
						"kneels down between \the <b>[partner]</b>'s legs.",
						"grips \the <b>[partner]</b>'s legs, pushing them apart.",
						"sinks [u_His] face in between \the <b>[partner]</b>'s thighs.",
					)
				else
					improv = TRUE
			if("penis")
				if(partner.has_penis() || partner.has_strapon())
					var/genital_name = partner.get_penetrating_genital_name()
					message = pick(
						"takes \the <b>[partner]</b>'s [genital_name] into [u_His] mouth.",
						"wraps [u_His] lips around \the <b>[partner]</b>'s [genital_name].",
						"finds [u_His] face between \the <b>[partner]</b>'s thighs.",
						"kneels down between \the <b>[partner]</b>'s legs.",
						"grips \the <b>[partner]</b>'s legs, kissing at the tip of [u_His] [genital_name].",
						"goes down on \the <b>[partner]</b>.",
					)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"begins to lick \the <b>[partner]</b>.",
				"starts kissing \the <b>[partner]</b>'s thigh.",
				"sinks down between \the <b>[partner]</b>'s thighs.",
				"briefly flashes a puzzled look from between \the <b>[partner]</b>'s legs.",
				"looks unsure of how to handle \the <b>[partner]</b>'s lack of genitalia.",
				"seems like [u_He] [u_Were] expecting \the <b>[partner]</b> to have a cock or a pussy or ... something.",
			)
			genital = null
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		partner.set_is_fucking(user, CUM_TARGET_MOUTH, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bj1.ogg',
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
	user.visible_message(span_lewd("<b>\The [user]</b> [message]"), ignored_mobs = user.get_unconsenting())
//SPLURT EDIT START
	if(fucktarget == "penis" && partner.can_penetrating_genital_cum())
		partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, user, ORGAN_SLOT_PENIS)
	else if(fucktarget == "vagina" && partner.has_vagina())
		partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, user, ORGAN_SLOT_VAGINA)
//SPLURT EDIT END
