//Sandstorm edits

/datum/interaction/lewd/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && type == /datum/interaction/lewd))
		return

	if(prob(50))
		target.visible_message(span_lewd("\The <b>[target]</b>'s ass honks!"))

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
		target.visible_message(span_lewd("[pick(honks)]"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message(span_lewd("\The <b>[target]</b>'s clussy honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/blowjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message(span_lewd("\The <b>[target]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s clussy honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/anal/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message(span_lewd("\The <b>[target]</b>'s clussy honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message(span_lewd("\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/facefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/throatfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(istype(target, /mob/living) && user.is_fucking(target, CUM_TARGET_THROAT))
		var/stat_before = target.stat
		target.adjustOxyLoss(3)
		if(target.stat == UNCONSCIOUS && stat_before != UNCONSCIOUS)
			target.visible_message(message = "<font color=red><b>\The [target]</b> passes out on <b>\The [user]</b>'s cock.</span>", ignored_mobs = user.get_unconsenting())
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/handjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/breastfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mount/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		user.visible_message(span_lewd("\The <b>[user]</b>'s clussy honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		target.visible_message(span_lewd("\The <b>[user]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountface/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message(span_lewd("\The <b>[target]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message(span_lewd("\The <b>[target]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nuts/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s balls honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nut_smack/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && type == /datum/interaction/lewd/nut_smack))
		return

	if(prob(50))
		target.visible_message(span_lewd("\The <b>[target]</b>'s balls honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/earfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/eyefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/frotting/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/blacklist = target.client?.prefs.gfluid_blacklist
	var/cached_fluid
	if((milkers?.get_fluid_id() in blacklist) || ((/datum/reagent/blood in blacklist) && ispath(milkers?.get_fluid_id(), /datum/reagent/blood)))
		cached_fluid = milkers?.get_fluid_id()
		milkers?.set_fluid_id(milkers?.default_fluid_id)

	. = ..()

	if(cached_fluid)
		milkers.set_fluid_id(cached_fluid)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/jack/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s clussy honks[pick(" loudly", "")]!"))

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
		user.visible_message(span_lewd("[pick(honks)]"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/blacklist = target.client?.prefs.gfluid_blacklist
	var/cached_fluid
	if((milkers?.get_fluid_id() in blacklist) || ((/datum/reagent/blood in blacklist) && ispath(milkers?.get_fluid_id(), /datum/reagent/blood)))
		cached_fluid = milkers?.get_fluid_id()
		milkers?.set_fluid_id(milkers?.default_fluid_id)

	. = ..()

	if(cached_fluid)
		milkers.set_fluid_id(cached_fluid)

	if(!isclownjob(user))
		return

	var/u_His = user.p_their()
	var/list/honks = list(
		"\The <b>[user]</b>'s honkers produce a loud squeak!",
		"\The <b>[user]</b>'s suck squeezes a honk out of [u_His] own [pick(GLOB.breast_nouns)]!"
	)
	if(prob(50))
		user.visible_message(span_lewd("[pick(honks)]"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nipsuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/obj/item/organ/genital/breasts/milkers = target.getorganslot(ORGAN_SLOT_BREASTS)
	var/blacklist = user.client?.prefs.gfluid_blacklist
	var/cached_fluid
	if((milkers?.get_fluid_id() in blacklist) || ((/datum/reagent/blood in blacklist) && ispath(milkers?.get_fluid_id(), /datum/reagent/blood)))
		cached_fluid = milkers?.get_fluid_id()
		milkers?.set_fluid_id(milkers?.default_fluid_id)

	. = ..()

	if(cached_fluid)
		milkers.set_fluid_id(cached_fluid)

	if(!isclownjob(target) || !milkers)
		return

	var/list/honks = list(
		"\The <b>[target]</b>'s honkers produce a loud squeak!",
		"\The <b>[user]</b>'s suck squeezes a honk out of \the <b>[target]</b>'s [pick(GLOB.breast_nouns)]!"
	)
	if(prob(50))
		user.visible_message(span_lewd("[pick(honks)]"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/kiss/post_interaction(mob/living/user, mob/living/partner)
	. = ..()

	//SPLURT EDIT START:
	// Check if user has TRAIT_KISS_SLUT and increase their lust
	if(HAS_TRAIT(user, TRAIT_KISS_SLUT))
		user.handle_post_sex(NORMAL_LUST, null, partner)

	// Check if partner has TRAIT_KISS_SLUT and increase their lust
	if(HAS_TRAIT(partner, TRAIT_KISS_SLUT))
		partner.handle_post_sex(NORMAL_LUST, null, user)
	//SPLURT EDIT END

/datum/interaction/lewd/kiss/display_interaction(mob/living/user, mob/living/partner)
	. = ..()
	playlewdinteractionsound(partner, pick(
		'modular_splurt/sound/interactions/kiss/kiss1.ogg',
		'modular_splurt/sound/interactions/kiss/kiss2.ogg',
		'modular_splurt/sound/interactions/kiss/kiss3.ogg',
		'modular_splurt/sound/interactions/kiss/kiss4.ogg',
		'modular_splurt/sound/interactions/kiss/kiss5.ogg'), 50, 1, -1, ignored_mobs = user.get_unconsenting())

//Own stuff
/datum/interaction/lewd/oral/selfsuck
	description = "Suck yourself off."
	interaction_sound = null
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	max_distance = 0
	write_log_user = "sucked off"
	write_log_target = null

/datum/interaction/lewd/oral/selfsuck/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "penis")
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/suckvagself
	description = "Lick your own pussy."
	interaction_sound = null
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_VAGINA
	required_from_user_unexposed = NONE
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	max_distance = 0
	write_log_user = "Сunni off"
	write_log_target = null

/datum/interaction/lewd/oral/suckvagself/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "vagina")

/datum/interaction/lewd/breastfuckself
	description = "Fuck your breasts."
	interaction_sound = null
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS | INTERACTION_REQUIRE_BREASTS
	required_from_user_unexposed = NONE
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	max_distance = 0
	write_log_user = "Breastfucked"
	write_log_target = null

/datum/interaction/lewd/breastfuckself/display_interaction(mob/living/carbon/human/user)
	user.do_breastfuck_self(user)
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/belly
	description = "Fuck their belly."
	required_from_target_exposed = INTERACTION_REQUIRE_BELLY
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	write_log_user = "belly fucked"
	write_log_target = "was belly fucked by"

/datum/interaction/lewd/fuck/belly/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.do_bellyfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s belly button honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/deflate_belly
	description = "Deflate belly."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_BELLY
	required_from_user_unexposed = NONE
	interaction_sound = null
	max_distance = 0
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "deflated their belly"
	write_log_target = null

/datum/interaction/lewd/deflate_belly/display_interaction(mob/living/carbon/user)
	var/obj/item/organ/genital/belly/gut = user.getorganslot(ORGAN_SLOT_BELLY)
	if(gut)
		gut.modify_size(-1)

/datum/interaction/lewd/inflate_belly
	description = "Inflate belly"
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_BELLY
	required_from_user_unexposed = NONE
	interaction_sound = null
	max_distance = 0
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "inflated their belly"
	write_log_target = null

/datum/interaction/lewd/inflate_belly/display_interaction(mob/living/carbon/user)
	var/obj/item/organ/genital/belly/gut = user.getorganslot(ORGAN_SLOT_BELLY)
	if(gut)
		gut.modify_size(1)

/datum/interaction/lewd/nuzzle_belly
	description = "Nuzzle their belly."
	required_from_target_exposed = INTERACTION_REQUIRE_BELLY
	required_from_target_unexposed = NONE
	required_from_user_exposed = NONE
	required_from_user_unexposed = NONE
	interaction_sound = null
	max_distance = 1
	write_log_target = "got their belly nuzzled by"
	write_log_user = null

/datum/interaction/lewd/nuzzle_belly/display_interaction(mob/living/user, mob/living/target)
	user.nuzzle_belly(target)

/datum/interaction/lewd/do_breastsmother
	description = "Smother them in your breasts."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_BREASTS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got breast smothered by"
	write_log_user = "breast smothered"

/datum/interaction/lewd/do_breastsmother/display_interaction(mob/living/user, mob/living/target)
	user.do_breastsmother(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_sweat
	description = "Lick their sweat."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_MOUTH
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got their sweat licked by"
	write_log_user = "licked the sweat of"

/datum/interaction/lewd/lick_sweat/display_interaction(mob/living/user, mob/living/target)
	user.lick_sweat(target)

/datum/interaction/lewd/smother_armpit
	description = "Press your armpit against their face."
	max_distance = 1
	interaction_sound = null
	write_log_target = "Got armpit smothered by"
	write_log_user = "Smothered in their armpit"

/datum/interaction/lewd/smother_armpit/display_interaction(mob/living/user, mob/living/target)
	user.smother_armpit(target)

/datum/interaction/lewd/lick_armpit
	description = "Lick their armpit."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_MOUTH
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Got dem armpit ate by"
	write_log_user = "ate the armpit of"

/datum/interaction/lewd/lick_armpit/display_interaction(mob/living/user, mob/living/target)
	user.lick_armpit(target)

/datum/interaction/lewd/fuck_armpit
	description = "Fuck their armpit."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	interaction_sound = null
	write_log_target = "got their armpit fucked by"
	write_log_user = "fucked the armpit of"

/datum/interaction/lewd/fuck_armpit/display_interaction(mob/living/user, mob/living/target)
	user.fuck_armpit(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_pitjob
	description = "Jerk them off with your armpit."
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_unexposed = NONE
	required_from_user_exposed = NONE
	required_from_user_unexposed = NONE
	interaction_sound = null
	write_log_target = "gave a pitjob to"
	write_log_user = "got a pitjob from"

/datum/interaction/lewd/do_pitjob/display_interaction(mob/living/user, mob/living/target)
	user.do_pitjob(target)

	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_boobjob
	description = "Give them a boobjob."
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_BREASTS
	required_from_user_unexposed = NONE
	interaction_sound = null
	max_distance = 1
	write_log_target = "Got a boobjob from"
	write_log_user = "gave a boobjob to"

/datum/interaction/lewd/do_boobjob/display_interaction(mob/living/user, mob/living/target)
	user.do_boobjob(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message(span_lewd("\The <b>[user]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_nuts
	description = "Lick their balls."
	required_from_target_exposed = INTERACTION_REQUIRE_BALLS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_MOUTH
	required_from_user_unexposed = NONE
	interaction_sound = null
	max_distance = 1
	write_log_target = "Got their nuts sucked by"
	write_log_user = "sucked the nuts of"

/datum/interaction/lewd/lick_nuts/display_interaction(mob/living/user, mob/living/target)
	user.lick_nuts(target)

/datum/interaction/lewd/grope_ass
	description = "Grope their ass."
	simple_message = "USER gropes TARGET's ass!"
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_HANDS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Got their ass groped by"
	write_log_target = "ass-groped"

/datum/interaction/lewd/fuck_cock
	description = "Penetrate their cock."
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
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
	description = "Fuck their nipple."
	required_from_target = INTERACTION_REQUIRE_TOPLESS
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	write_log_user = "fucked nipples"
	write_log_target = "got their nipples fucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/nipple_fuck/display_interaction(mob/living/user, mob/living/target)
	user.do_nipfuck(target)

	if(!isclownjob(target) || isclownjob(user))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s [pick(GLOB.breast_nouns)] honk[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck_thighs
	description = "Fuck their thighs."
	require_target_legs = REQUIRE_ANY
	require_target_num_legs = 2
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	write_log_user = "fucked thighs"
	write_log_target = "got their thighs fucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/fuck_thighs/display_interaction(mob/living/user, mob/living/target)
	user.do_thighfuck(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message(span_lewd("\The <b>[user]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_thighjob
	description = "Give them a thighjob."
	require_user_legs = REQUIRE_ANY
	require_user_num_legs = 2
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_unexposed = NONE
	required_from_user_exposed = NONE
	required_from_user_unexposed = NONE
	write_log_user = "Gave a thighjob"
	write_log_target = "Got a thighjob from"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/do_thighjob/display_interaction(mob/living/user, mob/living/target)
	user.do_thighjob(target)

	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message(span_lewd("\The <b>[target]</b>'s [genital_name] honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/clothesplosion
	description = "Explode out of your clothes"
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	interaction_sound = null
	max_distance = 0
	write_log_user = "Exploded out of their clothes"

/datum/interaction/lewd/clothesplosion/display_interaction(mob/living/carbon/user, mob/living/carbon/target)
	if(!istype(user))
		return

	user.clothing_burst(FALSE)

////////////////////////////////////////////////////////////////////////////////////////////////////////
///////// 									U N H O L Y										   /////////
////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/interaction/lewd/unholy
	description = null

/datum/interaction/lewd/unholy/New()
	. = ..()
	interaction_flags |= INTERACTION_FLAG_UNHOLY_CONTENT

/datum/interaction/lewd/unholy/do_facefart
	description = "Fart on their face."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_ANUS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got facefarted by"
	write_log_user = "farted on the face of"

/datum/interaction/lewd/unholy/do_facefart/display_interaction(mob/living/user, mob/living/target)
	user.do_facefart(target)

/datum/interaction/lewd/unholy/do_crotchfart
	description = "Fart on their crotch."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_ANUS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got crotchfarted by"
	write_log_user = "farted on the crotch of"

/datum/interaction/lewd/unholy/do_crotchfart/display_interaction(mob/living/user, mob/living/target)
	user.do_crotchfart(target)

/datum/interaction/lewd/unholy/do_fartfuck
	description = "Fuck their ass + fart."
	required_from_target_exposed = INTERACTION_REQUIRE_ANUS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got fartfucked by"
	write_log_user = "fartfucked"

/datum/interaction/lewd/unholy/do_fartfuck/display_interaction(mob/living/user, mob/living/target)
	user.do_fartfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/unholy/suck_fart
	description = "Suck the farts out of their asshole."
	required_from_target_exposed = INTERACTION_REQUIRE_ANUS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_MOUTH
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got their farts sucked out by"
	write_log_user = "sucked farts"

/datum/interaction/lewd/unholy/suck_fart/display_interaction(mob/living/user, mob/living/target)
	user.suck_fart(target)

/datum/interaction/lewd/unholy/do_faceshit
	description = "Shit on their face."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_ANUS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got shat in the face by"
	write_log_user = "shat in the face of"

/datum/interaction/lewd/unholy/do_faceshit/display_interaction(mob/living/user, mob/living/target)
	user.do_faceshit(target)

/datum/interaction/lewd/unholy/do_crotchshit/
	description = "Shit on their crotch."
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_ANUS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got shat on the croch by"
	write_log_user = "shat on the crotch of"

/datum/interaction/lewd/unholy/do_crotchshit/display_interaction(mob/living/user, mob/living/target)
	user.do_crotchshit(target)

/datum/interaction/lewd/unholy/do_shitfuck
	description = "Fuck their ass + shit."
	required_from_target_exposed = INTERACTION_REQUIRE_ANUS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got shitfucked by"
	write_log_user = "shitfucked"

/datum/interaction/lewd/unholy/do_shitfuck/display_interaction(mob/living/user, mob/living/target)
	user.do_shitfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message(span_lewd("\The <b>[target]</b>'s fun hole honks[pick(" loudly", "")]!"))

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/unholy/suck_shit
	description = "Suck the shit out of their asshole."
	required_from_target_exposed = INTERACTION_REQUIRE_ANUS
	required_from_target_unexposed = NONE
	required_from_user_exposed = INTERACTION_REQUIRE_MOUTH
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got their shit sucked out by"
	write_log_user = "sucked shit"

/datum/interaction/lewd/unholy/suck_shit/display_interaction(mob/living/user, mob/living/target)
	user.suck_shit(target)

/datum/interaction/lewd/unholy/piss_over
	description = "Piss all over them."
	required_from_user = INTERACTION_REQUIRE_BOTTOMLESS
	required_from_target_exposed = NONE
	required_from_target_unexposed = NONE
	required_from_user_exposed = NONE
	required_from_user_unexposed = NONE
	max_distance = 1
	interaction_sound = null
	write_log_target = "got pissed all over by"
	write_log_user = "pissed on"

/datum/interaction/lewd/unholy/piss_over/display_interaction(mob/living/user, mob/living/target)
	user.piss_over(target)

/datum/interaction/lewd/unholy/piss_mouth
	description = "Piss inside their mouth."
	max_distance = 1
	interaction_sound = null
	required_from_user = INTERACTION_REQUIRE_BOTTOMLESS
	required_from_target_exposed = INTERACTION_REQUIRE_MOUTH
	required_from_target_unexposed = NONE
	required_from_user_exposed = NONE
	required_from_user_unexposed = NONE
	write_log_user = "pissed in someone's mouth"
	write_log_target = "got their mouth filled with piss by"

/datum/interaction/lewd/unholy/piss_mouth/display_interaction(mob/living/carbon/user, mob/living/target)
	if(!istype(user))
		to_chat(user, span_warning("You're not a carbon entity."))
		return
	user.piss_mouth(target)
