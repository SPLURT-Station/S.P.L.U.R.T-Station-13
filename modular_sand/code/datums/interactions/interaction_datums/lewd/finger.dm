/datum/interaction/lewd/finger
	description = "Поиграться с вагиной партнёра своим пальцем."
	require_user_hands = TRUE
	require_target_vagina = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/finger/display_interaction(mob/living/user, mob/living/partner)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [pick("охотно играется с киской \the <b>[partner]</b>.",
		"возбуждённо выдыхает и всовывает палец во влагалище <b>[partner]</b>.",
		"разрабатывает влагалище <b>[partner]</b> при помощи своего собственного пальчика.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, user)

/datum/interaction/lewd/fingerass
	description = "Поиграться с задницей партнёра своим пальцем."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_anus = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/fingerass/display_interaction(mob/living/user, mob/living/partner)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("погружает палец в сфинктер <b>[partner]</b>.",
		"суёт палец в анальное колечко <b>[partner]</b>.",
		"разрабатывает анальное кольцо <b>[partner]</b> при помощи собственного пальца.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, user)
