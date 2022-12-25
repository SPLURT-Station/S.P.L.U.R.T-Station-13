/datum/interaction/lewd/fingerass_self
	description = "Поиграться с задницей."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_anus = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "fingered self"
	write_log_target = null

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/user)

	user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("погружает палец в свой же сфинктер.",
		"суёт палец в своё анальное колечко.",
		"разрабатывает своё анальное кольцо при помощи собственного пальца.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)

/datum/interaction/lewd/finger_self
	description = "Поиграться со своей вагиной."
	require_user_hands = TRUE
	require_user_vagina = REQUIRE_EXPOSED
	interaction_sound = null
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "fingered own pussy"
	write_log_target = null

/datum/interaction/lewd/finger_self/display_interaction(mob/living/user)

	user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("погружает палец в свою киску.",
		"тихо выдыхает и всовывает палец в своё влагалище.",
		"играется со своей киской.",
		"разрабатывает своё влагалище при помощи своего собственного пальчика.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
