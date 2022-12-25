/datum/interaction/lewd/do_breastfeed
	description = "Накормить грудью."
	require_user_breasts = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1
	write_log_user = "breastfed"
	write_log_target = "was breastfed by"
	interaction_sound = null

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
	var/message
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/milktype = milkers?.fluid_id
	var/modifier
	var/list/lines

	if(!milkers || !milktype)
		return

	var/datum/reagent/milk = find_reagent_object_from_type(milktype)

	var/milktext = milk.name

	lines = list(
		"прижимает свою грудь ко рту <b>[target]</b>, направляет свой сосок на язык и выплёскивает тёплое '[lowertext(milktext)]'",
		"наполняет рот \the <b>[target]</b> тёплым и довольно сладким на первовкусие '[lowertext(milktext)]', когда в свою очередь партнёр сжимает сиськи и тяжело дышит",
		"позволяет большому количеству '[lowertext(milktext)]' орошить горло \the <b>[target]</b>'s!"
	)

	message = "<span class='lewd'>\The <b>[user]</b> [pick(lines)]</span>"
	user.visible_message(message, ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
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

/datum/interaction/lewd/titgrope
	description = "Сжать грудь партнёра."
	require_user_hands = TRUE
	require_target_breasts = REQUIRE_ANY
	write_log_user = "groped"
	write_log_target = "was groped by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/titgrope/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.a_intent == INTENT_HELP)
		user.visible_message(
				pick("<span class='lewd'>\The <b>[user]</b> нежно ощупывает грудь \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> мягко хватается за груди \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> сжимает грудь \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> проводит несколькими пальцами вдоль груди \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> деликатно сжимает сосок \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> возбуждённо проводит пальцем вдоль груди \the <b>[target]</b>.</span>"))
	if(user.a_intent == INTENT_HARM)
		user.visible_message(
				pick("<span class='lewd'>\The <b>[user]</b> с силой сжимает груди \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> резко хватается за сиськи \the <b>[target]</b>!</span>",
					"<span class='lewd'>\The <b>[user]</b> крепко сжимает грудь \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> шлёпает по сиськам \the <b>[target]</b>!</span>",
					"<span class='lewd'>\The <b>[user]</b> максимально грубо сжимает груди \the <b>[target]</b>.</span>"))
	if(prob(5 + target.get_lust()))
		if(target.a_intent == INTENT_HELP)
			user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> дрожит от возбуждения.</span>",
					"<span class='lewd'>\The <b>[target]</b> тихо стонет.</span>",
					"<span class='lewd'>\The <b>[target]</b> выдыхает тихий довольный стон.</span>",
					"<span class='lewd'>\The <b>[target]</b> мурлычет и звучно вздыхает.</span>",
					"<span class='lewd'>\The <b>[target]</b> тихонько вздрагивает.</span>",
					"<span class='lewd'>\The <b>[target]</b> возбуждённо проводит пальцем вдоль своей груди.</span>"))
			if(target.get_lust() < 5)
				target.set_lust(5)
		if(target.a_intent == INTENT_DISARM)
			if (target.restrained())
				user.visible_message(
					pick("<span class='lewd'>\The <b>[target]</b> игриво извивается в попытке снять физические ограничения.</span>",
						"<span class='lewd'>\The <b>[target]</b> хихикает, вырываясь из рук <b>[user]</b>.</span>",
						"<span class='lewd'>\The <b>[target]</b> скользит в сторону от приближающегося <b>[user]</b>.</span>",
						"<span class='lewd'>\The <b>[target]</b> с отсутствующим сопротивлением толкает обнажённую грудь вперёд в руки <b>[user]</b>.</span>"))
			else
				user.visible_message(
					pick("<span class='lewd'>\The <b>[target]</b> игриво бьёт <b>[user]</b> по руке.</span>",
						"<span class='lewd'>\The <b>[target]</b> хихикает, вырываясь из рук <b>[user]</b>.</span>",
						"<span class='lewd'>\The <b>[target]</b> нежно проводит рукой <b>[user]</b>'s вдоль обнажённых грудей.</span>",
						"<span class='lewd'>\The <b>[target]</b> толкает обнажённую грудь вперёд и дразняще проводит несколькими пальцами <b>[user]</b> по своему соску.</span>"))
			if(target.get_lust() < 10)
				target.add_lust(1)
	if(target.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> крепко сжимает запястье <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> впивается ногтями в руку <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> хватает <b>[user]</b> за запястье буквально на секунду.</span>"))
	if(target.a_intent == INTENT_HARM)
		user.adjustBruteLoss(5)
		user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> грубо отталкивает <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> сердито впивается в руку <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> яростно борется с <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> впивается в предплечье <b>[user]</b> роговыми пластинками.</span>",
				"<span class='lewd'>\The <b>[target]</b> шлёпает <b>[user]</b> по руке.</span>"))
	return
