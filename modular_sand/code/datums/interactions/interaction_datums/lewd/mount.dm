/datum/interaction/lewd/mount
	description = "Поза наездницы | Женская доминация - Вагинальная."
	interaction_sound = null
	require_user_vagina = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/mount/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	var/genital_name = partner.get_penetrating_genital_name()

	if(partner.is_fucking(user, CUM_TARGET_VAGINA))
		message = "[pick("использует [genital_name] <b>[partner]</b> по прямому назначению и тихо стонет.",
			"с силой загоняет [genital_name] <b>[partner]</b> в свою собственную киску и довольно облизывается.")]"
	else
		message = "резко всовывает [genital_name] <b>[partner]</b> в своё влагалище и удовлетворённо выдыхает."
		partner.set_is_fucking(user, CUM_TARGET_VAGINA, partner.getorganslot(ORGAN_SLOT_PENIS))
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, user)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, partner)

/datum/interaction/lewd/mountass
	description = "Поза Наездинцы | Женская Доминация - Анальная."
	interaction_sound = null
	require_user_anus = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/mountass/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//.var/u_His = user.p_their()
	var/genital_name = partner.get_penetrating_genital_name()

	if(partner.is_fucking(user, CUM_TARGET_ANUS))
		message = "[pick("использует [genital_name] <b>[partner]</b> по прямому назначению и тихо стонет.",
			"с силой загоняет [genital_name] <b>[partner]</b> в своё анальное колечко и довольно облизывается.")]"
	else
		message = "резко всовывает [genital_name] <b>[partner]</b> в своё анальное кольцо и удовлетворённо выдыхает."
		partner.set_is_fucking(user, CUM_TARGET_ANUS, partner.getorganslot(ORGAN_SLOT_PENIS))
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, user)
	user.handle_post_sex(NORMAL_LUST, null, partner)

/datum/interaction/lewd/mountface
	description = "Потереться своей задницей о лицо партнёра."
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/mountface/display_interaction(mob/living/user, mob/living/partner)
	var/message

	//var/u_His = user.p_their()

	if(user.is_fucking(partner, GRINDING_FACE_WITH_ANUS))
		message = "[pick("втирает свою задницу в лицо <b>[partner]</b> и ехидно ухмыляется.",
			"потирается своей задницей о лицо <b>[partner]</b> и тихо усмехается.")]"
	else
		message = "[pick(
			"хватается за голову <b>[partner]</b> и с силой вжимает её между своих ягодиц.",
			"присаживается своей задницей прямо на лицо <b>[partner]</b> и начинает тереться о физиономию.")]"
		user.set_is_fucking(partner, GRINDING_FACE_WITH_ANUS, null)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/squelch1.ogg',
						'modular_sand/sound/interactions/squelch2.ogg',
						'modular_sand/sound/interactions/squelch3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(LOW_LUST, null, partner)

/datum/interaction/lewd/thighs
	description = "Придушить своего партнёра членом."
	max_distance = 1
	require_user_penis = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	interaction_sound = null
	write_log_user = "thigh-trapped (penis)"
	write_log_target = "was smothered (penis) by"
	var/fucktarget = "penis"

/datum/interaction/lewd/thighs/vagina
	description = "Придушить своего партнёра киской."
	require_user_penis = REQUIRE_NONE
	require_user_vagina = REQUIRE_EXPOSED
	write_log_user = "thigh-trapped (vagina)"
	write_log_target = "was smothered (vagina) by"
	fucktarget = "vagina"

/datum/interaction/lewd/thighs/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/lust_increase = 1

	//var/u_His = user.p_their()
	//var/t_His = partner.p_their()
	//var/t_Him = partner.p_them()
	//var/t_Hes = partner.p_theyre()

	if(user.is_fucking(partner, THIGH_SMOTHERING))
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(list(
						"давит лицо <b>[partner]</b> между своих бёдер и полностью блокирует обзор.",
						"трётся об лицо <b>[partner]</b>, размазывая влагу со своей киски по нему."))
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					var/genital_name = user.get_penetrating_genital_name()
					message = pick(list("давит лицо <b>[partner]</b> между своих бёдер и полностью блокирует обзор.",
						"прижимает [genital_name] прямо к лицу <b>[partner]</b> и крепко сжимает свои бёдра, хитро улыбаясь.",
						"просовывает [genital_name] в беспомощный рот <b>[partner]</b> и надёжно фиксирует лицо между своими бёдрами."))
				else
					improv = TRUE
		if(improv)
			message = "трется своим пахом вверх и вниз по лицу <b>[partner]</b>."
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(list(
						"похотливо облизывается и поправляет своё положение на личике <b>[partner]</b>, после чего пару раз сжимает свои бёдра, потирая влажную щель о ротик и носик <b>[partner]</b>.",
						"обхватывает голову <b>[partner]</b> и с усилием вжимает в свой бутон."))
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					message = pick(list(
						"похотливо облизывается и поправляет своё положение на личике <b>[partner]</b>, после чего пару раз сжимает свои бёдра, выделяя немного предэякулята на лицо <b>[partner]</b>.",
						"обхватывает голову <b>[partner]</b> и с усилием вжимает в свою промежность, в процессе растирая свои гениталии о личико <b>[partner]</b>."))
				else
					improv = TRUE
		if(improv)
			message = "ловко смыкает ноги вокруг головы <b>[partner]</b> и с силой начинает душить."
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		user.set_is_fucking(partner, THIGH_SMOTHERING, genital)

	var/file = pick('modular_sand/sound/interactions/bj10.ogg',
					'modular_sand/sound/interactions/bj3.ogg',
					'modular_sand/sound/interactions/foot_wet1.ogg',
					'modular_sand/sound/interactions/foot_dry3.ogg')
	playlewdinteractionsound(get_turf(user), file, 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(lust_increase, THIGH_SMOTHERING, partner)
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	if(fucktarget != "penis" || user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, partner)
