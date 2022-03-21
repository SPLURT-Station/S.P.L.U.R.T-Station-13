//Sandstorm edits

/datum/interaction/lewd/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && command == "assslap"))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s ass honks!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/titgrope/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	var/list/honks = list(
		"\The <b>[target]</b>'s honkers produce a loud squeak!",
		"\The <b>[user]</b>'s grope squeezes a honk out of \the <b>[target]</b>'s [pick(GLOB.breast_nouns)]!"
	)
	if(prob(50))
		target.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s clussy honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/blowjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s cock honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s clussy honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/anal/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/belly/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s belly button honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s clussy honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/facefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/throatfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/handjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/breastfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mount/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s clussy honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		target.visible_message("<span class='lewd'>\The <b>[user]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountface/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nuts/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s balls honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nut_smack/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && command == "smack_nuts"))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s balls honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/earfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/eyefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/frotting/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/jack/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/selfsuck/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/breastfuckself/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s clussy honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	var/u_His = user.p_their()
	var/list/honks = list(
		"\The <b>[user]</b>'s honkers produce a loud squeak!",
		"\The <b>[user]</b>'s grope squeezes a honk out of [u_His] own [pick(GLOB.breast_nouns)]!"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!isclownjob(user))
		return

	var/u_His = user.p_their()
	var/list/honks = list(
		"\The <b>[user]</b>'s honkers produce a loud squeak!",
		"\The <b>[user]</b>'s suck squeezes a honk out of [u_His] own [pick(GLOB.breast_nouns)]!"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

//Own stuff
/datum/interaction/lewd/do_breastsmother
	command = "do_breastsmother"
	description = "Smother them in your breasts"
	require_user_breasts = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "got breast smothered by"
	write_log_user = "breast smothered"

/datum/interaction/lewd/do_breastsmother/display_interaction(mob/living/user, mob/living/target)
	user.do_breastsmother(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_sweat
	command = "lick_sweat"
	description = "Lick their sweat"
	require_user_mouth = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got their sweat licked by"
	write_log_user = "licked the sweat of"

/datum/interaction/lewd/lick_sweat/display_interaction(mob/living/user, mob/living/target)
	user.lick_sweat(target)

/datum/interaction/lewd/smother_armpit
	command = "smother_armpit"
	description = "Press your armpit against their face"
	max_distance = 1
	interaction_sound = null
	write_log_target = "Got armpit smothered by"
	write_log_user = "Smothered in their armpit"

/datum/interaction/lewd/smother_armpit/display_interaction(mob/living/user, mob/living/target)
	user.smother_armpit(target)

/datum/interaction/lewd/lick_armpit
	command = "lick_armpit"
	description = "Lick their armpit"
	require_user_mouth = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Got dem armpit ate by"
	write_log_user = "ate the armpit of"

/datum/interaction/lewd/lick_armpit/display_interaction(mob/living/user, mob/living/target)
	user.lick_armpit(target)

/datum/interaction/lewd/do_boobjob
	command = "do_boobjob"
	description = "Give them a boobjob"
	require_user_breasts = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "Got a boobjob from"
	write_log_user = "gave a boobjob to"

/datum/interaction/lewd/do_boobjob/display_interaction(mob/living/user, mob/living/target)
	user.do_boobjob(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_nuts
	command = "lick_nuts"
	description = "Lick their balls"
	require_user_mouth = TRUE
	require_target_balls = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "Got their nuts sucked by"
	write_log_user = "sucked the nuts of"

/datum/interaction/lewd/lick_nuts/display_interaction(mob/living/user, mob/living/target)
	user.lick_nuts(target)

/datum/interaction/lewd/grope_ass
	command = "grope_ass"
	description = "Grope their ass"
	simple_message = "USER gropes TARGET's ass!"
	require_user_hands = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Got their ass groped by"
	write_log_target = "ass-groped"

/datum/interaction/lewd/fuck_cock
	command = "fuck_cock"
	description = "Penetrate their cock"
	require_user_penis = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "Got their cock fucked by"
	write_log_user = "Fucked the cock of"

/datum/interaction/lewd/fuck_cock/display_interaction(mob/living/user, mob/living/target)
	user.do_cockfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nipple_fuck
	command = "nipple_fuck"
	description = "Fuck their nipple"
	require_target_topless = TRUE
	require_user_penis = REQUIRE_EXPOSED
	write_log_user = "fucked nipples"
	write_log_target = "got their nipples fucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/nipple_fuck/display_interaction(mob/living/user, mob/living/target)
	user.do_nipfuck(target)

	if(!isclownjob(target) || isclownjob(user))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck_thighs
	command = "fuck_thighs"
	description = "Fuck their thighs"
	require_user_penis = REQUIRE_EXPOSED
	require_target_legs = REQUIRE_ANY
	require_target_num_legs = 2
	write_log_user = "fucked thighs"
	write_log_target = "got their thighs fucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/fuck_thighs/display_interaction(mob/living/user, mob/living/target)
	user.do_thighfuck(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\The <b>[user]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_thighjob
	command = "do_thighjob"
	description = "Give them a thighjob"
	require_target_penis = REQUIRE_EXPOSED
	require_user_legs = REQUIRE_ANY
	require_user_num_legs = 2
	write_log_user = "Gave a thighjob"
	write_log_target = "Got a thighjob from"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/do_thighjob/display_interaction(mob/living/user, mob/living/target)
	user.do_thighjob(target)

	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s [pick(GLOB.dick_nouns)] honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

////////////////////////////////////////////////////////////////////////////////////////////////////////
///////// 									U N H O L Y										   /////////
////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/interaction/lewd/unholy
	unholy = TRUE

/datum/interaction/lewd/unholy/do_facefart
	command = "do_facefart"
	description = "Fart on their face"
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "got facefarted by"
	write_log_user = "farted on the face of"

/datum/interaction/lewd/unholy/do_facefart/display_interaction(mob/living/user, mob/living/target)
	user.do_facefart(target)

/datum/interaction/lewd/unholy/do_crotchfart
	command = "do_crotchfart"
	description = "Fart on their crotch"
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "got crotchfarted by"
	write_log_user = "farted on the crotch of"

/datum/interaction/lewd/unholy/do_crotchfart/display_interaction(mob/living/user, mob/living/target)
	user.do_crotchfart(target)

/datum/interaction/lewd/unholy/do_fartfuck
	command = "do_fartfuck"
	description = "Fuck their ass + fart"
	require_target_anus = REQUIRE_EXPOSED
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "got fartfucked by"
	write_log_user = "fartfucked"

/datum/interaction/lewd/unholy/do_fartfuck/display_interaction(mob/living/user, mob/living/target)
	user.do_fartfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/unholy/do_faceshit
	command = "do_faceshit"
	description = "Shit on their face"
	require_user_anus = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got shat in the face by"
	write_log_user = "shat in the face of"

/datum/interaction/lewd/unholy/do_faceshit/display_interaction(mob/living/user, mob/living/target)
	user.do_faceshit(target)

/datum/interaction/lewd/unholy/do_crotchshit/
	command = "do_crotchshit"
	description = "Shit on their crotch"
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "got shat on the croch by"
	write_log_user = "shat on the crotch of"

/datum/interaction/lewd/unholy/do_crotchshit/display_interaction(mob/living/user, mob/living/target)
	user.do_crotchshit(target)

/datum/interaction/lewd/unholy/do_shitfuck
	command = "do_shitfuck"
	description = "Fuck their ass + shit"
	require_target_anus = REQUIRE_EXPOSED
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "got shitfucked by"
	write_log_user = "shitfucked"

/datum/interaction/lewd/unholy/do_shitfuck/display_interaction(mob/living/user, mob/living/target)
	user.do_shitfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/unholy/piss_over
	command = "piss_over"
	description = "Piss all over them"
	require_user_bottomless = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got pissed all over by"
	write_log_user = "pissed on"

/datum/interaction/lewd/unholy/piss_over/display_interaction(mob/living/user, mob/living/target)
	user.piss_over(target)

/datum/interaction/lewd/unholy/piss_mouth
	command = "piss_mouth"
	description = "Piss inside their mouth"
	max_distance = 1
	interaction_sound = null
	require_user_bottomless = TRUE
	require_target_mouth = TRUE
	write_log_user = "pissed in someone's mouth"
	write_log_target = "got their mouth filled with piss by"

/datum/interaction/lewd/unholy/piss_mouth/display_interaction(mob/living/carbon/user, mob/living/target)
	if(!istype(user))
		to_chat(user, "<span class='warning'>Erm, you may wanna be a carbon entity fo dat</span>")
		return
	user.piss_mouth(target)
