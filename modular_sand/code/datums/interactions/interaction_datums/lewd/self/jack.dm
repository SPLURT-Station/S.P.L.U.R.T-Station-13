/datum/interaction/lewd/jack
	description = "Jerk yourself off."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "jerked off"
	write_log_target = null

	additional_details = list(
		list(
			"info" = "You can fill a container if you hold it in your hand or pull it",
			"icon" = "flask",
			"color" = "transparent"
			)
	)

/datum/interaction/lewd/jack/display_interaction(mob/living/user)
	var/message
	var/t_His = user.p_their()
	var/t_Him = user.p_them()
	var/genital_name = user.get_penetrating_genital_name()

	var/obj/item/reagent_containers/liquid_container

	var/obj/item/cached_item = user.get_active_held_item()
	if(istype(cached_item, /obj/item/reagent_containers))
		liquid_container = cached_item
	else
		cached_item = user.pulling
		if(istype(cached_item, /obj/item/reagent_containers))
			liquid_container = cached_item

	if(user.is_fucking(user, CUM_TARGET_HAND, user.getorganslot(ORGAN_SLOT_PENIS)))
		message = "[pick("jerks [t_Him]self off",
			"works [t_His] shaft",
			"strokes [t_His] [genital_name]",
			"wanks [t_His] [genital_name] hard")]"
	else
		message = "[pick("wraps [t_His] hand around [t_His] [genital_name]",
			"starts to stroke [t_His] [genital_name]",
			"starts playing with [t_His] [genital_name]")]"
		user.set_is_fucking(user, CUM_TARGET_HAND, user.getorganslot(ORGAN_SLOT_PENIS))
	if(liquid_container)
		message += " over \the [liquid_container]"

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message(span_lewd("<b>\The [user]</b> [message]."), ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, liquid_container ? liquid_container : user, ORGAN_SLOT_PENIS) //SPLURT edit
