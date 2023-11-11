/datum/interaction/lewd/titgrope_self
	description = "Grope your own breasts."
	require_user_hands = TRUE
	require_user_breasts = REQUIRE_ANY
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "groped own breasts"
	write_log_target = null

	additional_details = list(
		list(
			"info" = "You can fill a container if you hold it in your hand or pull it",
			"icon" = "flask",
			"color" = "transparent"
			)
	)

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/user)
	var/message
	var/t_His = user.p_their()

	var/obj/item/reagent_containers/liquid_container

	var/obj/item/cached_item = user.get_active_held_item()
	if(istype(cached_item, /obj/item/reagent_containers))
		liquid_container = cached_item
	else
		cached_item = user.pulling
		if(istype(cached_item, /obj/item/reagent_containers))
			liquid_container = cached_item

	if(user.a_intent == INTENT_HARM)
		message = pick("aggressively gropes [t_His] breast",
					"grabs [t_His] breasts",
					"tightly squeezes [t_His] breasts",
					"slaps at [t_His] breasts",
					"gropes [t_His] breasts roughly")
	else
		message = pick("gently gropes [t_His] breast",
					"softly squeezes [t_His] breasts",
					"grips [t_His] breasts",
					"runs a few fingers over [t_His] breast",
					"delicately teases [t_His] nipple",
					"traces a touch across [t_His] breast")

	if(prob(5 + user.get_lust()))
		user.visible_message(span_lewd("<b>\The [user]</b> [pick(
				"shivers in arousal.",
				"moans quietly.",
				"breathes out a soft moan.",
				"gasps.",
				"shudders softly.",
				"trembles as [t_His] hands run across bare skin.")]"))

	if(liquid_container)
		message += " over \the [liquid_container]"

		var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
		var/milktype = milkers?.fluid_id

		if(milkers && milktype)
			var/modifier
			switch(milkers.size)
				if(3 to 5)
					modifier = 2
				if(6 to 8)
					modifier = 3
				else
					if(milkers.size_to_state() in GLOB.breast_values)
						modifier = clamp(GLOB.breast_values[milkers.size_to_state()] - 5, 0, INFINITY)
					else
						modifier = 1
			liquid_container.reagents.add_reagent(milktype, rand(1,3 * modifier))

	user.visible_message(message = span_lewd("<b>\The [user]</b> [message]."), ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)

/datum/interaction/lewd/self_nipsuck
	description = "Suck your own nips."
	require_user_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "sucked their own nips"
	write_log_target = null

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	var/message
	var/u_His = user.p_their()
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/milktype = milkers?.fluid_id
	var/modifier
	var/list/lines

	if(!milkers || !milktype)
		return

	var/datum/reagent/milk = find_reagent_object_from_type(milktype)

	var/milktext = milk.name

	lines = list(
		"brings [u_His] own milk tanks to [u_His] mouth and sucks deeply into them.",
		"takes a big sip of [u_His] own fresh [lowertext(milktext)].",
		"fills [u_His] own mouth with a big gulp of [u_His] warm [lowertext(milktext)]."
	)

	message = span_lewd("\The <b>[user]</b> [pick(lines)]")
	user.visible_message(message, ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)

	switch(milkers.size)
		if("c", "d", "e")
			modifier = 2
		if("f", "g", "h")
			modifier = 3
		else
			if(milkers.size in GLOB.breast_values)
				modifier = clamp(GLOB.breast_values[milkers.size] - 5, 0, INFINITY)
			else
				modifier = 1
	user.reagents.add_reagent(milktype, rand(1,3 * modifier) * user.get_fluid_mod(milkers)) //SPLURT edit
