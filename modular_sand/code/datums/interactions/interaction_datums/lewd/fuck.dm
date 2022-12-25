/datum/interaction/lewd/fuck
	description = "Проникнуть в вагину своего партнёра."
	require_user_penis = REQUIRE_EXPOSED
	require_target_vagina = REQUIRE_EXPOSED
	write_log_user = "fucked"
	write_log_target = "was fucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/fuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	var/genital_name = user.get_penetrating_genital_name()

	if(user.is_fucking(partner, CUM_TARGET_VAGINA))
		message = "[pick(
			"долбится в киску <b>[partner]</b>.",
			"проникает во влагалище <b>[partner]</b>",
			"глубоко вводит свой [genital_name] в кисоньку <b>[partner]</b>.",
			"с силой загоняет свои гениталии в вагину <b>[partner]</b> и шлёпается своими яйцами.")]"
	else
		message = "вводит свой [genital_name] в лоно <b>[partner]</b>."
		user.set_is_fucking(partner, CUM_TARGET_VAGINA, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, partner)
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, user)

/datum/interaction/lewd/fuck/anal
	description = "Трахнуть в задницу."
	require_target_vagina = null
	require_target_anus = REQUIRE_EXPOSED

/datum/interaction/lewd/fuck/anal/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	//var/t_His = partner.p_their()
	var/genital_name = user.get_penetrating_genital_name()

	if(user.is_fucking(partner, CUM_TARGET_ANUS))
		message = "[pick(
			"долбится в задницу <b>[partner]</b>.",
			"проникает в попку <b>[partner]</b>.",
			"глубоко вводит свой [genital_name] в анальное колечко <b>[partner]</b>.",
			"с силой загоняет свои гениталии в анальное отверстие <b>[partner]</b> и шлёпается своими яйцами.")]"
	else
		message = "[pick(
			"грубо трахает \the <b>[partner]</b> в задницу с громким чавкающим звуком.",
			"хватается за волосы \the <b>[partner]</b> и начинает тянуть к самому основанию своего органа.",
			"сильно вращает своими бёдрами и погружается внутрь сфинктера \the <b>[partner]</b>.")]"
		user.set_is_fucking(partner, CUM_TARGET_ANUS, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, partner)
	partner.handle_post_sex(NORMAL_LUST, null, user)

/datum/interaction/lewd/breastfuck
	description = "Совокупиться с сиськами партнёра."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_breasts = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/breastfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	var/genital_name = user.get_penetrating_genital_name()

	if(user.is_fucking(partner, CUM_TARGET_BREASTS))
		message = "[pick(
			"продалбливается между титьками <b>[partner]</b>.",
			"проникает между сиськами <b>[partner]</b>.",
			"вводит свой [genital_name] в пространство между грудями <b>[partner]</b>.",
			"с силой загоняет свои гениталии между сиськами <b>[partner]</b> и шлёпается своими яйцами о грудину.")]"
	else
		message = "игриво толкает <b>[partner]</b>, крепко хватается за груди и сжимает ими свой [genital_name]."
		user.set_is_fucking(partner, CUM_TARGET_BREASTS, user.getorganslot(ORGAN_SLOT_PENIS))


	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, partner)

/datum/interaction/lewd/footfuck
	description = "Потереться своим членом о ботинок партнёра."
	interaction_sound = null
	require_target_num_feet = 1
	require_target_feet = REQUIRE_ANY
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/footfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	var/genital_name = user.get_penetrating_genital_name()

	//var/shoes = partner.get_shoes(TRUE)

	if(user.is_fucking(partner, CUM_TARGET_FEET))
		message = "[pick("трётся своим членом о ботинок <b>[partner]</b>.",
			"потирается своим членом о ботинок <b>[partner]</b>.",
			"мастурбирует, в процессе потираясь о ботинок <b>[partner]</b>.")]"
	else
		message = "[pick("позиционирует свой [genital_name] на ботинок <b>[partner]</b> и начинает потираться.",
			"выставляет свой [genital_name] на ботинки ботинок <b>[partner]</b> и начинает тот стимулировать.",
			"держит свой [genital_name] своими руками и наконец-то начинает тереться о ботинок <b>[partner]</b>.")]"
		user.set_is_fucking(partner, CUM_TARGET_FEET, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, partner)

/datum/interaction/lewd/footfuck/double
	description = "Потереться своим членом о ботинки партнёра."
	require_target_num_feet = 2

/datum/interaction/lewd/footfuck/double/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	var/genital_name = user.get_penetrating_genital_name()

	var/shoes = partner.get_shoes()

	if(user.is_fucking(partner, CUM_TARGET_FEET))
		message = "[pick("трётся своим членом о [shoes ? shoes : pick("ботинок", "ботинки")] <b>[partner]</b>.",
			"потирается своим членом о [shoes ? shoes : pick("ботинок", "ботинки")] <b>[partner]</b>.",
			"мастурбирует, в процессе потираясь о [shoes ? shoes : pick("ботинок", "ботинки")] <b>[partner]</b>.")]"
	else
		message = "[pick("позиционирует свой [genital_name] на [shoes ? shoes : pick("ботинок", "ботинки")] <b>[partner]</b> и начинает потираться.",
			"выставляет свой [genital_name] на ботинки [shoes ? shoes : pick("ботинок", "ботинки")] <b>[partner]</b> и начинает тот стимулировать.",
			"держит свой [genital_name] своими руками и наконец-то начинает тереться о [shoes ? shoes : pick("ботинок", "ботинки")] <b>[partner]</b>.")]"
		user.set_is_fucking(partner, CUM_TARGET_FEET, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, partner)

/datum/interaction/lewd/footfuck/vag
	description = "Потереться своей вагиной о ботинок партнёра."
	interaction_sound = null
	require_target_num_feet = 1
	require_target_feet = REQUIRE_ANY
	require_user_vagina = REQUIRE_EXPOSED
	require_user_penis = REQUIRE_NONE
	max_distance = 1

/datum/interaction/lewd/footfuck/vag/display_interaction(mob/living/user, mob/living/partner)
	var/message

	//var/u_His = user.p_their()

	//var/shoes = partner.get_shoes(TRUE)

	if(user.is_fucking(partner, CUM_TARGET_FEET))
		message = "[pick("трётся своей киской о ботинок <b>[partner]</b>.",
			"игриво потирается своим клитором о ботинок <b>[partner]</b> и довольно вздыхает.",
			"мастурбирает о ботинок <b>[partner]</b> и громко постанывает.")]"
	else
		message = "[pick("с силой держится за ножку своего партнёра и активно трётся своей вагиной о ботинок <b>[partner]</b>.",
			"замедляет свои движения на ботинке <b>[partner]</b>, засекает влагу на обуви и ехидно усмехается.",
			"выставляет вагину на ботинок <b>[partner]</b> и начинает ту стимулировать. Как же радуется!")]"
		user.set_is_fucking(partner, CUM_TARGET_FEET, user.getorganslot(ORGAN_SLOT_VAGINA))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, partner)
