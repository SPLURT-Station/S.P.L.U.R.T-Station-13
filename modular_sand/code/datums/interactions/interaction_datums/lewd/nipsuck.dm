/datum/interaction/lewd/nipsuck
	description = "Пососать соски своего партнёра."
	require_target_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	write_log_user = "sucked nipples"
	write_log_target = "had their nipples sucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/nipsuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if((user.a_intent == INTENT_HELP) || (user.a_intent == INTENT_DISARM))
		user.visible_message(
				pick("<span class='lewd'>\The <b>[user]</b> аккуратно хватается за груди партнёра и нежно обсасывает [pick("сосок", "соски")] \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> поглаживает груди партнёра, аккуратно хватаясь своими губами за [pick("сосок", "соски")] \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> в улыбке облизывает [pick("сосок", "соски")] \the <b>[target]</b> и усмехается.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,2 * modifier))

	if(user.a_intent == INTENT_HARM)
		user.visible_message(
				pick("<span class='lewd'>\The <b>[user]</b> с силой обхватывает груди партнёра и грубо посасывает [pick("сосок", "соски")] \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> хватается губами за [pick("сосок", "соски")], касается зубками \the <b>[target]</b>'s и начинает грубо посасывать.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,3 * modifier)) //aggressive sucking leads to high rewards

	if(user.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'>\The <b>[user]</b> крепко обхватывает груди партнёра и активно обсасывает [pick("сосок", "соски")] \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> поглаживает груди партнёра и крепко хватается своими губами за [pick("сосок", "соски")] \the <b>[target]</b>.</span>",
					"<span class='lewd'>\The <b>[user]</b> игриво облизывает [pick("сосок", "соски")] \the <b>[target]</b> и ехидно ухмыляется.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,3 * modifier)) //aggressive sucking leads to high rewards

	if(prob(5 + target.get_lust()))
		if(target.a_intent == INTENT_HELP)
			user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> дрожит от возбуждения.</span>",
					"<span class='lewd'>\The <b>[target]</b> тихо стонет.</span>",
					"<span class='lewd'>\The <b>[target]</b> выдыхает тихий довольный стон.</span>",
					"<span class='lewd'>\The <b>[target]</b> мурлычет и звучно вздыхает.</span>",
					"<span class='lewd'>\The <b>[target]</b> тихонько вздрагивает.</span>",
					"<span class='lewd'>\The <b>[target]</b> возбуждённо проводит пальцем вдоль своей груди.</span>",
					"<span class='lewd'>\The <b>[target]</b> дрожит от возбуждения и довольно выдыхает, когда \the <b>[user]</b> наслаждается содержимым грудей.</span>"))
			if(target.get_lust() < 5)
				target.set_lust(5)
	if(target.a_intent == INTENT_DISARM)
		if (target.restrained())
			user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> игриво извивается в попытке снять физические ограничения.</span>",
					"<span class='lewd'>\The <b>[target]</b> хихикает, вырываясь из рук <b>[user]</b>.</span>",
					"<span class='lewd'>\The <b>[target]</b> скользит в сторону от приближающегося <b>[user]</b>.</span>",
					"<span class='lewd'>\The <b>[target]</b> с отсутствующим сопротивлением толкает обнажённую грудь вперёд в руки <b>[user]</b>.</span>.</span>"))
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
		if (target.restrained())
			user.adjustBruteLoss(5)
			user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> грубо отталкивает <b>[user]</b> в попытке снять физические огранения.</span>",
					"<span class='lewd'>\The <b>[target]</b> сердито впивается в руку <b>[user]</b>.</span>",
					"<span class='lewd'>\The <b>[target]</b> яростно борется с <b>[user]</b> и щёлкает своей челюсть в попытке укусить.</span>",
					"<span class='lewd'>\The <b>[target]</b> впивается в предплечье <b>[user]</b> роговыми пластинками.</span>",
					"<span class='lewd'>\The <b>[target]</b> шлёпает <b>[user]</b> по руке.</span>"))
		else
			user.adjustBruteLoss(5)
			user.visible_message(
				pick("<span class='lewd'>\The <b>[target]</b> грубо отталкивает <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> сердито впивается в руку <b>[user]</b>.</span>",
				"<span class='lewd'>\The <b>[target]</b> яростно борется с <b>[user]</b> и щёлкает своей челюсть в попытке укусить.</span>",
				"<span class='lewd'>\The <b>[target]</b> впивается в предплечье <b>[user]</b> роговыми пластинками.</span>",
				"<span class='lewd'>\The <b>[target]</b> шлёпает <b>[user]</b> по руке.</span>"))

	target.dir = get_dir(target, user)
	user.dir = get_dir(user, target)
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	return
