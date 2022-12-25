/datum/interaction/lewd/earfuck
	description = "Изнасиловать в ухо."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_ears = REQUIRE_EXPOSED
	max_distance = 1
	write_log_user = "earfucked"
	write_log_target = "had their ear fucked by"
	extreme = TRUE

/datum/interaction/lewd/earfuck/earsocketfuck
	description = "Fuck their earsocket."
	require_target_ears = null
	require_target_earsockets = REQUIRE_EXPOSED
	write_log_user = "earsocket fucked"
	write_log_target = "had their earsocket fucked by"

/datum/interaction/lewd/earfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.is_fucking(partner, CUM_TARGET_EARS))
		message = "[pick(
			"долбится в ушную раковину \the <b>[partner]</b>.",
			"резко и довольно глубоко вводит свой орган в череп \the <b>[partner]</b>",
			"раз за разом толкается в ушную раковину \the <b>[partner]</b>.",
			"заходит своим влажным органом по самые яйца в череп \the <b>[partner]</b> снова и снова.")]"
		var/client/cli = partner.client
		var/mob/living/carbon/C = partner
		if(cli && istype(C))
			if(cli.prefs.extremeharm != "No")
				if(prob(15))
					C.bleed(2)
				if(prob(25))
					C.adjustOrganLoss(ORGAN_SLOT_EARS, rand(10,20))
					C.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(7,15))
				if(prob(1) && istype(partner))
					partner.adjustBruteLoss(rand(5,7))
	else
		message = "с силой загоняет свой орган внутрь ушной раковины \the <b>[partner]</b> и громко вздыхает."
		user.set_is_fucking(partner, CUM_TARGET_EARS, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/champ1.ogg',
												'modular_sand/sound/interactions/champ2.ogg'), 50, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting(TRUE))
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_EARS, partner)
	partner.handle_post_sex(LOW_LUST, null, user)
