/datum/interaction/lewd/eyefuck
	description = "Изнасиловать в глаз."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_eyes = REQUIRE_EXPOSED
	max_distance = 1
	write_log_user = "eyefucked"
	write_log_target = "had their eye fucked by"
	extreme = TRUE

/datum/interaction/lewd/eyefuck/eyesocketfuck
	description = "Fuck their eyesocket."
	require_target_eyes = null
	require_target_eyesockets = REQUIRE_EXPOSED
	write_log_user = "eyesocketfucked"
	write_log_target = "had their eyesocket fucked by"

/datum/interaction/lewd/eyefuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.p_their()
	//var/genital_name = user.get_penetrating_genital_name()

	if(user.is_fucking(partner, CUM_TARGET_EYES))
		message = "[pick(
			"крепко обхватывает голову \the <b>[partner]</b>'s и начинает долбиться в глаз.",
			"яростно долбится в череп \the <b>[partner]</b>'s и довольно стонет.",
			"раз за разом толкается в образованную дыру в глазу \the <b>[partner]</b>'s.",
			"заходит своим влажным органом по самые яйца в череп \the <b>[partner]</b>'s снова и снова.")]"
		var/client/cli = partner.client
		var/mob/living/carbon/C = partner
		if(cli && istype(C))
			if(cli.prefs.extremeharm != "No")
				if(prob(15))
					C.bleed(2)
				if(prob(25))
					C.adjustOrganLoss(ORGAN_SLOT_EYES,rand(10,20))
					C.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(7,15))
				if(prob(1) && istype(partner))
					partner.adjustBruteLoss(rand(5,7))
	else
		message = "forcefully slides [u_His] [genital_name] inbetween \the <b>[partner]</b>'s [partner.has_eyes() ? "eyelid":"eyesocket"]."
		user.set_is_fucking(partner, CUM_TARGET_EYES, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/champ1.ogg',
												'modular_sand/sound/interactions/champ2.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting(TRUE))
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_EYES, partner)
	partner.handle_post_sex(LOW_LUST, null, user)
