/datum/interaction/lewd/frotting
	command = "frotting"
	description = "Rub your penis against theirs"
	require_user_penis = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1
	write_log_user = "frotted"
	write_log_target = "was frotted by"
	interaction_sound = null

/datum/interaction/lewd/frotting/display_interaction(mob/living/user, mob/living/target)
	user.do_frot(target)

/datum/interaction/lewd/do_breastfeed
	command = "do_breastfeed"
	description = "Breastfeed them"
	require_user_breasts = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1
	write_log_user = "breastfed"
	write_log_target = "was breastfed by"
	interaction_sound = null

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
	user.do_breastfeed(target)

/**
 * Self Interactions!
 */

/datum/interaction/lewd/jack
	command = "jack"
	description = "Jerk yourself off."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "jerked off"
	write_log_target = null

/datum/interaction/lewd/jack/display_interaction(mob/living/carbon/human/user)
	user.do_jackoff(user)

/datum/interaction/lewd/oral/selfsuck
	command = "selfsuck"
	description = "Suck yourself off."
	interaction_sound = null
	require_target_vagina = REQUIRE_NONE
	require_user_penis = REQUIRE_EXPOSED
	user_not_tired = TRUE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "sucked off"
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
	write_log_user = "Сunni off"
	write_log_target = null

/datum/interaction/lewd/oral/suckvagself/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "vagina")

/datum/interaction/lewd/breastfuckself
	command = "breastfuckself"
	description = "Fuck your breasts"
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_user_breasts = REQUIRE_EXPOSED
	user_not_tired = TRUE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "Breastfucked"
	write_log_target = null

/datum/interaction/lewd/breastfuckself/display_interaction(mob/living/carbon/human/user)
	user.do_breastfuck_self(user)

/datum/interaction/lewd/fingerass_self
	command = "fingerm_self"
	description = "Finger yourself."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_anus = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "fingered"
	write_log_target = null

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/carbon/human/user)
	user.do_fingerass_self(user)

/datum/interaction/lewd/finger_self
	command = "finger_self"
	description = "Finger your own pussy."
	require_user_hands = TRUE
	require_user_vagina = REQUIRE_EXPOSED
	interaction_sound = null
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "fingered the pussy of"
	write_log_target = null

/datum/interaction/lewd/finger_self/display_interaction(mob/living/carbon/human/user)
	user.do_fingering_self(user)

/datum/interaction/lewd/titgrope_self
	command = "titgrope_self"
	description = "Grope your own breasts."
	require_user_hands = TRUE
	require_user_breasts = REQUIRE_ANY
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "groped own breasts"
	write_log_target = null

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/carbon/human/user)
	user.do_titgrope_self(user)

/datum/interaction/lewd/self_nipsuck
	command = "self_nipsuck"
	description = "Suck your own nips."
	require_user_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "sucked their own nips"
	write_log_target = null

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	user.do_breastfeed(user)

/*
/datum/interaction/lewd/remove_self_condom
	command = "remove_self_condom"
	description = "Remove your condom"
	require_user_hands = TRUE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	interaction_sound = 'modular_sand/sound/lewd/latex.ogg'
	max_distance = 0
	write_log_user = "removed their condom"
	write_log_target = null

/datum/interaction/lewd/remove_self_condom/display_interaction(mob/living/carbon/human/user)
	user.remove_condom(user)

/datum/interaction/lewd/remove_other_condom
	command = "remove_other_condom"
	description = "Remove their condom"
	require_user_hands = TRUE
	require_target_penis = REQUIRE_ANY
	interaction_sound = 'modular_sand/sound/lewd/latex.ogg'
	max_distance = 1
	write_log_target = "got his condom removed by"
	write_log_user = null

/datum/interaction/lewd/remove_other_condom/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.remove_condom(target)

/datum/interaction/lewd/remove_self_sounding
	command = "remove_self_sounding"
	description = "Remove your sounding rod"
	require_user_hands = TRUE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	interaction_sound = 'modular_sand/sound/lewd/champ_fingering.ogg'
	max_distance = 0
	write_log_user = "removed his sounding rod"
	write_log_target = null

/datum/interaction/lewd/remove_self_sounding/display_interaction(mob/living/carbon/human/user)
	user.remove_sounding(user)

/datum/interaction/lewd/remove_other_sounding
	command = "remove_other_sounding"
	description = "Remove their sounding rod"
	require_user_hands = TRUE
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = 'modular_sand/sound/lewd/champ_fingering.ogg'
	max_distance = 1
	write_log_target = "got his sounding rod removed by"
	write_log_user = null

/datum/interaction/lewd/remove_other_sounding/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.remove_sounding(target)
*/

/datum/interaction/lewd/remove_self_equipment
	command = "remove_self_equipment"
	description = "Remove your genital's equipment"
	require_user_hands = TRUE
	interaction_sound = null
	max_distance = 0
	user_is_target = TRUE
	write_log_user = "messed with their genital equipment"
	write_log_target = null
	user_is_target = TRUE

/datum/interaction/lewd/remove_self_equipment/display_interaction(mob/living/user)
	if(!iscarbon(user))
		to_chat(user, "<span class='warning'>You don't seem like someone who'd use cock equipment my dude</span>")
		return
	user.remove_equipment(user)

/datum/interaction/lewd/remove_other_equipment
	command = "remove_other_equipment"
	description = "Remove their genital's equipment"
	require_user_hands = TRUE
	interaction_sound = null
	max_distance = 1
	write_log_user = null
	write_log_target = "got their genital's equipment edited by"

/datum/interaction/lewd/remove_other_equipment/display_interaction(mob/living/user, mob/living/target)
	if(!iscarbon(target))
		to_chat(user, "<span class='warning'>[target.p_they()] don't look like someone who'd use balls equipment</span>")
	user.remove_equipment(target)

/datum/interaction/lewd/deflate_belly
	command = "deflate_belly"
	description = "Deflate belly"
	require_user_belly = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 0
	user_is_target = TRUE
	write_log_user = "deflated their belly"
	write_log_target = null

/datum/interaction/lewd/deflate_belly/display_interaction(mob/living/carbon/user)
	var/obj/item/organ/genital/belly/gut = user.getorganslot(ORGAN_SLOT_BELLY)
	if(gut)
		gut.modify_size(-1)

/datum/interaction/lewd/nuzzle_belly
	command = "nuzzle_belly"
	description = "Nuzzle their belly"
	require_target_belly = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "got their belly nuzzled by"
	write_log_user = null

/datum/interaction/lewd/nuzzle_belly/display_interaction(mob/living/user, mob/living/target)
	user.nuzzle_belly(target)
