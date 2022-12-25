/datum/interaction/lewd/kiss
	description = "Поцеловать."
	require_user_mouth = TRUE
	require_target_mouth = TRUE
	write_log_user = "kissed"
	write_log_target = "was kissed by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/kiss/post_interaction(mob/living/user, mob/living/partner)
	. = ..()
	if(user.get_lust() < 5)
		user.set_lust(5)
	if(partner.get_lust() < 5)
		partner.set_lust(5)

/datum/interaction/lewd/kiss/display_interaction(mob/living/user, mob/living/partner)
	if(user.get_lust() >= 3)
		user.visible_message("<span class='lewd'>\The <b>[user]</b> дарит интенсивный и весьма агрессивный поцелуй для \the <b>[partner]</b>.</span>")
	else
		user.visible_message("<span class='lewd'>\The <b>[user]</b> прижимается губами к \the <b>[partner]</b>, облизывает их своим язычком и глубоко их целует.</span>")
