/mob/living/proc/do_frot(mob/living/target)
	var/message
	var/t_His = p_their()

	message = "rubs [t_His] penis against [target]'s."
	set_is_fucking(target, CUM_TARGET_PENIS, getorganslot(ORGAN_SLOT_PENIS))
	visible_message("<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, target)
	target.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, src)

/mob/living/proc/do_breastfeed(mob/living/target)
	var/message
	var/u_His = p_their()
	var/u_He = p_they()
	var/t_His = target.p_their()
	var/obj/item/organ/genital/breasts/milkers = getorganslot(ORGAN_SLOT_BREASTS)
	var/milktype = milkers?.fluid_id
	var/modifier
	var/list/lines

	if(!milkers || !milktype)
		return
	var/datum/reagent/b_fluid = new milktype

	if(target == src)
		lines = list(
			"brings [u_His] own milktanks to [u_His] mouth and sucks deeply into them",
			"takes a big sip of [u_His] own fresh [b_fluid.name]",
			"fills [u_His] own mouth with a big gulp of [u_His] warm [b_fluid.name]"
		)
	else
		lines = list(
			"pushes [u_His] breasts against \the <b>[target]</b>'s mouth, squirting [u_His] warm [b_fluid.name] into [t_His] mouth",
			"fills \the <b>[target]</b>'s mouth with warm, sweet [b_fluid.name] as [u_He] squeezes [u_His] boobs, panting",
			"lets a large stream of [u_His] own abundant [b_fluid.name] coat the back of \the <b>[target]</b>'s throat"
		)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(src, pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)

	switch(milkers.size)
		if("c", "d", "e")
			modifier = 2
		if("f", "g", "h")
			modifier = 3
		else
			if(milkers.size in milkers.breast_values)
				modifier = clamp(milkers.breast_values[milkers.size] - 5, 0, INFINITY)
			else
				modifier = 1
	target.reagents.add_reagent(milktype, rand(1,3 * modifier))

/mob/living/proc/do_jackoff(mob/living/user)
	var/message
	var/t_His = p_their()
	var/t_Him = p_them()

	if(user.is_fucking(src, CUM_TARGET_HAND))
		message = "[pick("jerks [t_Him]self off.",
			"works [t_His] shaft.",
			"strokes [t_His] penis.",
			"wanks [t_His] cock hard.")]"
	else
		message = "[pick("wraps [t_His] hand around [t_His] cock.",
			"starts to stroke [t_His] cock.",
			"starts playing with [t_His] cock.")]"
		user.set_is_fucking(src, CUM_TARGET_HAND, user.getorganslot(ORGAN_SLOT_PENIS) ? user.getorganslot(ORGAN_SLOT_PENIS) : null)

	playlewdinteractionsound(src, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, src)

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
		message = "pushes [t_His] breasts together and presses their dick between them."
		set_is_fucking(user, CUM_TARGET_BREASTS, getorganslot(ORGAN_SLOT_PENIS) ? getorganslot(ORGAN_SLOT_PENIS) : null)

	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, user)

/mob/living/proc/do_fingerass_self(mob/living/user)
	var/t_His = p_their()
	var/t_Him = p_them()

	visible_message(message = "<span class='lewd'><b>\The [src]</b> [pick("fingers [t_Him]self.",
		"fingers [t_His] asshole.",
		"fingers [t_Him]self hard.")]</span>", ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, src)

/mob/living/proc/do_fingering_self(mob/living/user)
	var/t_His = p_their()

	visible_message(message = "<span class='lewd'><b>\The [src]</b> [pick("fingers [t_His] pussy deep.",
		"fingers [t_His] pussy.",
		"plays with [t_His] pussy.",
		"fingers [t_His] own pussy hard.")]</span>", ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, src)

/mob/living/proc/do_titgrope_self(mob/living/user)
	var/message
	var/t_His = p_their()

	if(user.a_intent == INTENT_HARM)
		message = "[pick("aggressively gropes [t_His] breast.",
					"grabs [t_His] breasts.",
					"tightly squeezes [t_His] breasts.",
					"slaps at [t_His] breasts.",
					"gropes [t_His] breasts roughly.")]"
	else
		message = "[pick("gently gropes [t_His] breast.",
					"softly squeezes [t_His] breasts.",
					"grips [t_His] breasts.",
					"runs a few fingers over [t_His] breast.",
					"delicately teases [t_His] nipple.",
					"traces a touch across [t_His] breast.")]"
	if(prob(5 + user.get_lust()))
		visible_message(message = "<span class='lewd'><b>\The [src]</b> [pick("shivers in arousal.",
				"moans quietly.",
				"breathes out a soft moan.",
				"gasps.",
				"shudders softly.",
				"trembles as [t_His] hands run across bare skin.")]</span>")
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, src)
/*
/mob/living/proc/remove_condom(mob/living/carbon/user)
	var/list/cock_names = list("rod", "bitchbreaker", "cock", "penis", "schlong")
	var/s_His = p_their()
	var/t_He = user.p_they()
	if(src == user)
		if(P.equipment[GENITAL_EQUIPEMENT_CONDOM])
			user.visible_message(message = "<span class='lewd'><b>\The [user]</b> slides the condom out of [s_His] [pick(cock_names)]</span>",
			self_message = "<span class='lewd'>You feel the condom slide off your [pick(cock_names)]</span>",
			ignored_mobs = get_unconsenting()
			)
			P.equipment.Remove(GENITAL_EQUIPEMENT_CONDOM)
			new /obj/item/clothing/head/condom(user.loc)
		else
			to_chat(src, "<span class='warning'>You need a condom for that!</span>")
	else
		if(P.condom)
			user.visible_message(message = "<span class='lewd'><b>\The [src]</b> tries to remove the condom off of [user]'s [pick(cock_names)]",
			self_message = "<span class='lewd'><b>\The [src]</b> gently takes your [pick(cock_names)] and starts sliding the condom off of it</span>",
			ignored_mobs = get_unconsenting()
			)
			if(!do_mob(src, user, 4 SECONDS))
				return
			user.visible_message(message = "<span class='lewd'><b>\The [src]</b> slides the condom out of [user]'s [pick(cock_names)]!</span>",
			self_message = "<span class='lewd'>You feel [src]'s warm hand slide the condom out of your [pick(cock_names)]</span>",
			ignored_mobs = get_unconsenting()
			)
			P.condom = FALSE
			new /obj/item/clothing/head/condom(user.loc)
		else
			to_chat(src, "<span class='warning'>[t_He] needs a condom for that!<span>")
*/
/*
/obj/item/organ/genital/proc/remove_sounding(mob/living/carbon/remover)
	if(!equipment[GENITAL_EQUIPMENT_SOUNDING])
		to_chat(remover, "<span class='warning'>There doesn't seem to be a sounding rod in here</span>")
		return

	if(remover == owner)
		owner.visible_message(message = "<span class='lewd'><b>\The [owner]</b> slides the sounding rod out of [owner.p_their()] [name]</span>",
		self_message = "<span class='lewd'>You feel the sounding rod slide out of your [name]</span>",
		ignored_mobs = get_unconsenting()
		)
	else




/mob/living/carbon/proc/remove_sounding(mob/living/carbon/human/user)
	var/list/cock_names = list("rod", "bitchbreaker", "cock", "penis", "schlong")
	var/obj/item/organ/genital/penis/P
	var/s_His = p_their()
	var/t_He = user.p_they()
	if(src == user)
		P = getorganslot(ORGAN_SLOT_PENIS)
		if(P.sounding)
			visible_message(message = "<span class='lewd'><b>\The [src]</b> slides the sounding rod out of [s_His] [pick(cock_names)]</span>",
			self_message = "<span class='lewd'>You feel the sounding rod slide off your [pick(cock_names)]'s urethra</span>",
			ignored_mobs = get_unconsenting()
			)
			P.sounding = FALSE
			new /obj/item/genital_equipment/sounding/used_sounding(loc)
		else
			to_chat(src, "<span class='warning'>You need a sounding rod for that!</span>")
	else
		P = user.getorganslot(ORGAN_SLOT_PENIS)
		if(P.sounding)
			user.visible_message(message = "<span class='lewd'><b>\The [src]</b> tries to remove the sounding rod from [user]'s [pick(cock_names)]",
			self_message = "<span class='lewd'><b>\The [src]</b> gently takes your [pick(cock_names)] and starts sliding the sounding rod out of its urethra</span>",
			ignored_mobs = get_unconsenting()
			)
			if(!do_mob(src, user, 4 SECONDS))
				return
			user.visible_message(message = "<span class='lewd'><b>\The [src]</b> slides the sounding rod out of [user]'s [pick(cock_names)]!</span>",
			self_message = "<span class='lewd'>You feel your urethra relax and throb as [src]'s warm hand slides the sounding rod out of your [pick(cock_names)]</span>",
			ignored_mobs = get_unconsenting()
			)
			P.sounding = FALSE
			new /obj/item/genital_equipment/sounding/used_sounding(user.loc)
		else
			to_chat(src, "<span class='warning'>[t_He] needs a sounding rod for that!<span>")
*/

/mob/living/proc/remove_equipment(mob/living/carbon/target)
	var/obj/item/organ/genital/holder = pick_receiving_organ(target, HAS_EQUIPMENT, "Remove equipment", "What genital?")
	if(!holder)
		to_chat(src, "<span class='warning'> You need exposed genitals!</b>")
		return
	if(!LAZYLEN(holder.equipment))
		to_chat(src, "<span class='warning'>You'll have to put something in it first, since it seems to be clean</span>")
		return

	var/obj/item/gimme = input(src, "What do you want to remove?", "Remove equipment", null) as null|anything in holder.equipment
	if(gimme)
		holder.remove_equipment(src, gimme)

/mob/living/proc/nuzzle_belly(mob/living/target)
	var/message
	var/u_His = p_their()
	var/list/belly_names = list("stomach", "belly", "gut", "midsection", "rolls")
	var/list/nuzzles = list(
		"rubs [u_His] face all accross [target]'s [pick(belly_names)]",
		"nuzzles [target]'s [pick(belly_names)][pick(list(" lovingly", ""))]",
		"shoves [u_His] face into [target]'s [pick(belly_names)] and gives it kisses all over",
		"licks right into [target]'s [pick(list("belly button", "navel"))]"
		)

	message = "<span class='lewd'><b>\The [src]</b> [pick(nuzzles)]. </span>"
	visible_message(message, ignored_mobs = get_unconsenting())
