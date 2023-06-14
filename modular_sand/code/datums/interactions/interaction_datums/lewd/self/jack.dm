/datum/interaction/lewd/jack
	description = "Jerk yourself off."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "jerked off"
	write_log_target = null

/datum/interaction/lewd/jack/display_interaction(mob/living/user)
	var/message
	var/t_His = user.p_their()
	var/t_Him = user.p_them()
	var/genital_name = user.get_penetrating_genital_name()

	if(user.is_fucking(user, CUM_TARGET_HAND))
		message = "[pick("jerks [t_Him]self off.",
			"works [t_His] shaft.",
			"strokes [t_His] [genital_name].",
			"wanks [t_His] [genital_name] hard.")]"
	else
		message = "[pick("wraps [t_His] hand around [t_His] [genital_name].",
			"starts to stroke [t_His] [genital_name].",
			"starts playing with [t_His] [genital_name].")]"
		user.set_is_fucking(user, CUM_TARGET_HAND, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message(message = span_lewd("<b>\The [user]</b> [message]"), ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user, ORGAN_SLOT_PENIS) //SPLURT edit
