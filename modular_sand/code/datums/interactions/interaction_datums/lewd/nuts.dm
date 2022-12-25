/datum/interaction/lewd/nuts
	description = "Потереться своими семенниками о лицо партнёра."
	interaction_sound = null
	require_user_balls = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1
	write_log_user = "make-them-suck-their-nuts"
	write_log_target = "was made to suck nuts by"

/datum/interaction/lewd/nuts/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/lust_increase = 1

	if(user.is_fucking(partner, NUTS_TO_FACE))
		message = pick(list(
			"хватается за затылок <b>[partner]</b> и с силой тянет к своей промежности.",
			"суёт свои яйца прямо в лицо <b>[partner]</b> и широко ухмыляется.",
			"грубо суёт свои семенники прямо в рот <b>[partner]</b> с самодовольным настроем.",
			"вытаскивает покрытые слюнкой семенники из осквернённого рта <b>[partner]</b>, а затем вытирает влагу об лицо <b>[partner]</b>."))
	else
		message = pick(list(
			"втискивает свой палец сбоку в челюсти <b>[partner]</b> и с лёгкостью её разжимает, после чего использует вторую свою руку, чтобы засунуть свои семенники внутрь!",
			"встает так, чтобы пах находился в нескольких сантиметрах от лица <b>[partner]</b>, затем толкает свои бедра вперед и начинает тереться своими яйцами об лицо <b>[partner]</b>."))
		user.set_is_fucking(partner, NUTS_TO_FACE, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg',), 70, 1, -1) //These files don't even exist but nobody noticed because double-quotes were used instead of single.
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, partner)

/datum/interaction/lewd/nut_smack
	description = "Smack their nuts."
	interaction_sound = 'modular_sand/sound/interactions/slap.ogg'
	simple_message = "USER с ухмылкой бьёт семенники TARGET!"
	require_target_balls = REQUIRE_EXPOSED
	needs_physical_contact = TRUE
	max_distance = 1
	write_log_user = "slapped-nuts"
	write_log_target = "had their nuts slapped by"
