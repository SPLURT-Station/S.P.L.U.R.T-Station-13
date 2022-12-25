/datum/interaction/lewd/frotting
	description = "Потереться своим членом о член партнёра."
	require_user_penis = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1
	write_log_user = "frotted"
	write_log_target = "was frotted by"
	interaction_sound = null

/datum/interaction/lewd/frotting/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/t_His = user.p_their()
	var/genital_name = user.get_penetrating_genital_name()

	message = "потирает свой [genital_name] о [genital_name] <b>[partner]</b>."
	user.set_is_fucking(partner, CUM_TARGET_PENIS, user.getorganslot(ORGAN_SLOT_PENIS))
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, partner)
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, user)

/datum/interaction/lewd/tribadism
	description = "Потереться своей киской о киску партнёра."
	interaction_sound = null
	require_target_vagina = REQUIRE_EXPOSED
	require_user_vagina = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/tribadism/display_interaction(mob/living/user, mob/living/partner)
	var/message

	//var/u_His = user.p_their()

	if(partner.is_fucking(user, CUM_TARGET_VAGINA))
		message = "[pick("трётся своей киской с <b>[partner]</b>.",
			"с силой трёт своей киской о киску <b>[partner]</b>.",
			"вжимается в киску <b>[partner]</b> с чавкающим звуком.",
			"игриво развлекается с <b>[partner]</b>, обтираясь своей киской о киску партнёра.")]"
	else
		message = "грубо прижимает свою киску к киске <b>[partner]</b>."
		partner.set_is_fucking(user, CUM_TARGET_VAGINA, partner.getorganslot(ORGAN_SLOT_VAGINA))
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/squelch1.ogg',
						'modular_sand/sound/interactions/squelch2.ogg',
						'modular_sand/sound/interactions/squelch3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, user)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, partner)
