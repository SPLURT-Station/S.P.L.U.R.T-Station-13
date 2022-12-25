/datum/interaction/lewd/facefuck
	description = "Вытрахать рот, используя свой член."
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1
	var/fucktarget = "penis"

/datum/interaction/lewd/facefuck/vag
	description = "Придушить своей киской."
	require_user_penis = null
	require_user_vagina = REQUIRE_EXPOSED
	fucktarget = "vagina"

/datum/interaction/lewd/facefuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/retaliation_message = FALSE

	if(user.is_fucking(partner, CUM_TARGET_MOUTH))
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(
						"втирает свою вагину в лицо \the <b>[partner]</b> и громко вздыхает.",
						"сжимает затылок \the <b>[partner]</b> усилием своих ладоней и начинает тереться о лицо своей киской",
						"прижимает свою киску к языку \the <b>[partner]</b> и тихо постанывает.",
						"скользит ротиком \the <b>[partner]</b> в своей промежности и быстро дышит через нос.",
						"нежно и довольно добродушно смотрит в глаза \the <b>[partner]</b>, когда вдруг его личико накрывается пиздой.",
						"ехидно ухмыляется и покачивает своими бёдрами перед лицом \the <b>[partner]</b>, после чего вжимается в лицо партнёра своей промежностью.",
						)
					if(partner.a_intent == INTENT_HARM)
						partner.adjustBruteLoss(2)
						retaliation_message = pick(
							"испытывает глубокое недовольство от того, что находится там.",
							"изо всех сил пытается вырваться из-под бедер \the [user].",
						)
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					message = pick(
						"грубо трахает \the <b>[partner]</b> в рот с громким чавкающим звуком.",
						"с силой загоняет свои гениталии в самую глотку \the <b>[partner]</b>.",
						"надавливает на дальнюю часть язычка \the <b>[partner]</b> до тех пор, пока не услышит тугой звук от Рвотного Рефлекса.",
						"хватается за волосы \the <b>[partner]</b> и начинает тянуть к основанию своего органа.",
						"смотрит в глаза \the <b>[partner]</b>, когда гениталии прижимается к ожидающему язычку.",
						"сильно вращает своими бёдрами и погружается в рот \the <b>[partner]</b>.",
						)
					if(partner.a_intent == INTENT_HARM)
						partner.adjustBruteLoss(2)
						retaliation_message = pick(
							"смотрит вверх из-под колен \the [user] и раз за разом пытается вывернуться в попытке выбраться.",
							"пытается вырваться из-под ног \the [user].",
						)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"трётся о лицо \the <b>[partner]</b>.",
				"чувствует лицо \the <b>[partner]</b> между своими ножками.",
				"толкается против языка \the <b>[partner]</b>.",
				"хватает \the <b>[partner]</b> за волосы и начинает тянуть к своей собственной промежности",
				"беспомощно смотрит в глаза \the <b>[partner]</b> и вынужденно держится между бёдрами.",
				"с силой прижимает свои бёдра к лицу \the <b>[partner]</b>.",
				)
			if(partner.a_intent == INTENT_HARM)
				partner.adjustBruteLoss(2)
				retaliation_message = pick(
					"смотрит вверх из-под колен \the [user] и раз за разом пытается вывернуться в попытке выбраться.",
					"пытается вырваться из-под ног \the [user].",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = "втирает свою вагину в лицо \the <b>[partner]</b> и громко вздыхает."
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					if(user.is_fucking(partner, CUM_TARGET_THROAT))
						message = "вытягивает свой орган из горла \the <b>[partner]</b> и сладко усмехается."
					else
						message = "засовывает свои гениталии в рот \the <b>[partner]</b>"
				else
					improv = TRUE
		if(improv)
			message = "суёт свою промежность в лицо \the <b>[partner]</b>."
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		user.set_is_fucking(partner, CUM_TARGET_MOUTH, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(retaliation_message)
		user.visible_message("<font color=red><b>\The <b>[partner]</b></b> [retaliation_message]</span>", ignored_mobs = user.get_unconsenting())
	if(fucktarget != "penis" || user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, partner)

/datum/interaction/lewd/throatfuck
	description = "Вытрахать партнёра в глотку."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1

/datum/interaction/lewd/throatfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/retaliation_message = FALSE

	if(user.is_fucking(partner, CUM_TARGET_THROAT))
		message = "[pick(
			"жёстко засовывает свой крепкий орган в горло <b>[partner]</b> и тем самым образом своего партнёра затыкает.",
			"душит <b>[partner]</b>, снова и снова засовывая свой влажный орган по самые яйца.",
			"молотит рот <b>[partner]</b> с чавкающим звуком и раз за разом приземляется своими яйцами аккурат в лицо.")]"
		if(rand(3))
			partner.emote("chokes on \the [user]")
			if(prob(1) && istype(partner)) //Handled on modular_splurt
				partner.adjustOxyLoss(10)
		if(partner.a_intent == INTENT_HARM)
			partner.adjustBruteLoss(3)
			retaliation_message = pick(
				"смотрит вверх из-под колен \the [user] и раз за разом пытается вывернуться в попытке выбраться.",
				"пытается вырваться из-под ног \the [user].",
			)
	else if(user.is_fucking(partner, CUM_TARGET_MOUTH))
		message = "проникает глубже в рот \the <b>[partner]</b> и углубляется вниз по самому горлу."
		var/check = user.getorganslot(ORGAN_SLOT_PENIS)
		if(check)
			genital = check
		user.set_is_fucking(partner, CUM_TARGET_THROAT, genital)
	else
		message = "загоняет свои гениталии глубоко в рот \the <b>[partner]</b> и углубляется вниз по самому горлу."
		var/check = user.getorganslot(ORGAN_SLOT_PENIS)
		if(check)
			genital = check
		user.set_is_fucking(partner, CUM_TARGET_THROAT, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(retaliation_message)
		user.visible_message(message = "<font color=red><b>\The <b>[partner]</b></b> [retaliation_message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_THROAT, partner)
