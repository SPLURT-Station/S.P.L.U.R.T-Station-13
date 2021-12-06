/datum/interaction/lewd/oral/selfsuck
	command = "selfsuck"
	description = "Suck yourself off."
	interaction_sound = null
	require_target_vagina = REQUIRE_NONE
	require_user_penis = REQUIRE_EXPOSED
	user_not_tired = TRUE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "was given head by yourself"
	write_log_target = null

/datum/interaction/lewd/oral/selfsuck/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "penis")

/datum/interaction/lewd/oral/suckvagself
	command = "suckvagself"
	description = "Lick your own pussy."
	interaction_sound = null
	require_user_penis = REQUIRE_NONE
	user_not_tired = TRUE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "Сunni herself off"
	write_log_target = null

/datum/interaction/lewd/oral/suckvagself/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "vagina")

/datum/interaction/lewd/breastfuckself
	command = "Fuck their breasts"
	description = "Fuck your breast"
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_user_breasts = REQUIRE_EXPOSED
	user_not_tired = TRUE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "Breastfuck herself"
	write_log_target = null

/datum/interaction/lewd/breastfuckself/display_interaction(mob/living/carbon/human/user)
	user.do_breastfuck_self(user)
