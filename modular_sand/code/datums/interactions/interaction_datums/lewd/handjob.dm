/datum/interaction/lewd/handjob
	description = "Подрочить партнёру."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/handjob/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	var/genital_name = partner.get_penetrating_genital_name()

	if(partner.is_fucking(user, CUM_TARGET_HAND))
		message = "[pick("вздрачивает гениталии <b>[partner]</b>.",
			"активно работает своей ладонью и стимулирует член <b>[partner]</b>.",
			"пыхтит и яростно дрочит [genital_name] <b>[partner]</b>.")]"
	else
		message = "[pick("крепко обхватывает и сжимает своей рукой [genital_name] <b>[partner]</b>.",
			"максимально активно играется с <b>[partner]</b>, в процессе вздрачивая [genital_name].")]"
		partner.set_is_fucking(user, CUM_TARGET_HAND, partner.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
