//Sandstorm edits

/datum/interaction/lewd/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && type == /datum/interaction/lewd))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Задница <b>[target]</b> смешно хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/titgrope/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	var/list/honks = list(
		"Сиськи <b>[target]</b> забавно пищат!",
		"\<b>[user]</b> крепко сжимает \<b>[target]</b> за её [pick(GLOB.breast_nouns)] и они громко пищат!"
	)
	if(prob(50))
		target.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\<b>[target]</b> неуклюже хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/blowjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		// var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>\[genital_name] <b>[target]</b> громко хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\<b>[target]</b> неуклюже хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/anal/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>Задница <b>[target]</b> громко хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\<b>[target]</b> неуклюже хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Задница <b>[target]</b> громко хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/facefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = target.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'><b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/throatfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(istype(target, /mob/living) && user.is_fucking(target, CUM_TARGET_THROAT))
		var/stat_before = target.stat
		target.adjustOxyLoss(3)
		if(target.stat == UNCONSCIOUS && stat_before != UNCONSCIOUS)
			target.visible_message(message = "<font color=red><b>\[target]</b> потеряла сознание, проглатывая член <b>\[src]</b>.</span>", ignored_mobs = user.get_unconsenting())
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'><b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/handjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'><b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/breastfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\ [pick(GLOB.breast_nouns)] <b>[target]</b> забавно хонкают!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mount/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		user.visible_message("<span class='lewd'>\ Киска <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		target.visible_message("<span class='lewd'>\ Задница <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountface/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\ Задница <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		//var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>\ <b>[target]</b> забавно хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		//var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>\ <b>[target]</b> забавно хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nuts/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\ Яички <b>[user]</b> забавно хонкают!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nut_smack/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && type == /datum/interaction/lewd/nut_smack))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>\ Яички <b>[user]</b> забавно хонкают!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/earfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/eyefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

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
		user.visible_message("<span class='lewd'>\ [pick(GLOB.breast_nouns)] <b>[target]</b> забавно хонкают!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/jack/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\ Задница <b>[user]</b> громко хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\ Киска <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	//var/u_His = user.p_their()
	var/list/honks = list(
		"<span class='lewd'>\ Сиськи <b>[user]</b> громко пищат!</span>",
		"<span class='lewd'>\ <b>[user]</b> издаёт громкое пищание своими [pick(GLOB.breast_nouns)]!</span>"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

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

	//var/u_His = user.p_their()
	var/list/honks = list(
		"<span class='lewd'>\ Сиськи <b>[target]</b> громко пищат!</span>",
		"<span class='lewd'>\ <b>[target]</b> издаёт громкое пищание своими [pick(GLOB.breast_nouns)]!</span>"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

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
		"<span class='lewd'>\ Сиськи <b>[target]</b> громко пищат!</span>",
		"<span class='lewd'>\ <b>[target]</b> издаёт громкое пищание своими [pick(GLOB.breast_nouns)]!</span>"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

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
	description = "Отсосать самому себе."
	interaction_sound = null
	require_target_vagina = REQUIRE_NONE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "Отсосал(а) сам(а) себе"
	write_log_target = null

/datum/interaction/lewd/oral/selfsuck/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "penis")
	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/suckvagself
	description = "Отлизать свою киску."
	interaction_sound = null
	require_user_penis = REQUIRE_NONE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "отлизал(а) свою собственную киску"
	write_log_target = null

/datum/interaction/lewd/oral/suckvagself/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "vagina")

/datum/interaction/lewd/breastfuckself
	description = "Трахнуть свои сиськи."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_user_breasts = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "Трахнул(а) свои сиськи."
	write_log_target = null

/datum/interaction/lewd/breastfuckself/display_interaction(mob/living/carbon/human/user)
	user.do_breastfuck_self(user)
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\ [pick(GLOB.breast_nouns)] <b>[user]</b> забавно хонкают!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/belly
	description = "Трахнуть в пупок."
	require_target_vagina = REQUIRE_NONE
	require_target_belly = REQUIRE_EXPOSED
	write_log_user = "трахнул(а) в пупок"
	write_log_target = "был(а) трахнут(а) в пупок"

/datum/interaction/lewd/fuck/belly/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.do_bellyfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\ Живот <b>[target]</b> громко хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/deflate_belly
	description = "Уменьшить живот."
	require_user_belly = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 0
	user_is_target = TRUE
	write_log_user = "уменьшил(а) свой живот."
	write_log_target = null

/datum/interaction/lewd/deflate_belly/display_interaction(mob/living/carbon/user)
	var/obj/item/organ/genital/belly/gut = user.getorganslot(ORGAN_SLOT_BELLY)
	if(gut)
		gut.modify_size(-1)

/datum/interaction/lewd/nuzzle_belly
	description = "Тыкнуться носом в живот партнёра."
	require_target_belly = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "К её/его животу прижался носом"
	write_log_user = "прижался носом к животу"

/datum/interaction/lewd/nuzzle_belly/display_interaction(mob/living/user, mob/living/target)
	user.nuzzle_belly(target)

/datum/interaction/lewd/do_breastsmother
	description = "Придушить лицо партнёра своей грудью."
	require_user_breasts = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "был(а) придушен(а) грудью"
	write_log_user = "придушил(а) грудью"

/datum/interaction/lewd/do_breastsmother/display_interaction(mob/living/user, mob/living/target)
	user.do_breastsmother(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\ [pick(GLOB.breast_nouns)] <b>[target]</b> забавно хонкают!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_sweat
	description = "Слизывать пот партнёра."
	require_user_mouth = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Её/его пот был слизан"
	write_log_user = "слизывал(а) пот"

/datum/interaction/lewd/lick_sweat/display_interaction(mob/living/user, mob/living/target)
	user.lick_sweat(target)

/datum/interaction/lewd/smother_armpit
	description = "Зажать лицо партнёра в свою подмышку."
	max_distance = 1
	interaction_sound = null
	write_log_target = "Был(а) зажат(а) лицом в подмышку"
	write_log_user = "Зажал(а) своей подмышкой лицо"

/datum/interaction/lewd/smother_armpit/display_interaction(mob/living/user, mob/living/target)
	user.smother_armpit(target)

/datum/interaction/lewd/lick_armpit
	description = "Вылизать подмышку партнёра."
	require_user_mouth = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Её/его подмышка была вылизана"
	write_log_user = "вылизал(а) подмышку"

/datum/interaction/lewd/lick_armpit/display_interaction(mob/living/user, mob/living/target)
	user.lick_armpit(target)

/datum/interaction/lewd/fuck_armpit
	description = "Трахнуть подмышку партнёра."
	require_user_penis = REQUIRE_EXPOSED
	interaction_sound = null
	write_log_target = "был(-а) трахнут(-а) в подмышку"
	write_log_user = "трахнул(-а) подмышку"

/datum/interaction/lewd/fuck_armpit/display_interaction(mob/living/user, mob/living/target)
	user.fuck_armpit(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_pitjob
	description = "Вздрочнуть пенис партнёра своей подмышкой."
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	write_log_target = "получил(-а) мастурбацию подмышкой от"
	write_log_user = "вздрочнул(-а) своей подмышкой пенис"

/datum/interaction/lewd/do_pitjob/display_interaction(mob/living/user, mob/living/target)
	user.do_pitjob(target)

	if(!isclownjob(target))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[user]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_boobjob
	description = "Вздрочнуть пенис партнёра своей грудью."
	require_user_breasts = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "получил(-а) мастурбацию сиськами от"
	write_log_user = "вздрочнул(-а) своими сиськами пенис"

/datum/interaction/lewd/do_boobjob/display_interaction(mob/living/user, mob/living/target)
	user.do_boobjob(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>\[pick(GLOB.breast_nouns)] <b>[target]</b> забавно хонкают!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_nuts
	description = "Полизать яички партнёра."
	require_user_mouth = TRUE
	require_target_balls = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "Её/его яйца были вылизаны"
	write_log_user = "Отлизал(а) яйца"

/datum/interaction/lewd/lick_nuts/display_interaction(mob/living/user, mob/living/target)
	user.lick_nuts(target)

/datum/interaction/lewd/grope_ass
	description = "Полапать задницу."
	simple_message = "USER сжимает задницу TARGET!"
	require_user_hands = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "Был(а) потискан(а) за задницу"
	write_log_user = "потискал(а) задницу"

/datum/interaction/lewd/fuck_cock
	description = "Трахнуть в уретру."
	require_user_penis = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "Был трахнут(-а) в уретру"
	write_log_user = "Трахнул(-а) уретру"

/datum/interaction/lewd/fuck_cock/display_interaction(mob/living/user, mob/living/target)
	user.do_cockfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nipple_fuck
	description = "Трахнуть в соски"
	require_target_topless = TRUE
	require_user_penis = REQUIRE_EXPOSED
	write_log_user = "трахнул(а) соски"
	write_log_target = "был(а) трахнут(а) в соски"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/nipple_fuck/display_interaction(mob/living/user, mob/living/target)
	user.do_nipfuck(target)

	if(!isclownjob(target) || isclownjob(user))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\[pick(GLOB.breast_nouns)] <b>[target]</b> [pick(GLOB.breast_nouns)] забавно хонкают!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck_thighs
	description = "Просунуть между бёдрами партнёра"
	require_user_penis = REQUIRE_EXPOSED
	require_target_legs = REQUIRE_ANY
	require_target_num_legs = 2
	write_log_user = "трахнул бёдра"
	write_log_target = "был(а) трахнут(а) между бёдрами"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/fuck_thighs/display_interaction(mob/living/user, mob/living/target)
	user.do_thighfuck(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		//var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>\ <b>[target]</b> забавно хонкает!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_thighjob
	description = "Вздрочнуть орган партнёра бёдрами."
	require_target_penis = REQUIRE_EXPOSED
	require_user_legs = REQUIRE_ANY
	require_user_num_legs = 2
	write_log_user = "вздрочнул(-а) бёдрами пенис"
	write_log_target = "получил(-а) мастурбацию бёдрами от"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/do_thighjob/display_interaction(mob/living/user, mob/living/target)
	user.do_thighjob(target)

	if(!isclownjob(target))
		return

	if(prob(50))
		//var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>\ <b>[target]</b> забавно хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

////////////////////////////////////////////////////////////////////////////////////////////////////////
///////// 									U N H O L Y										   /////////
////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/interaction/lewd/unholy
	unholy = TRUE

/datum/interaction/lewd/unholy/do_facefart
	description = "Напердеть на лицо."
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "на его промежность напердел"
	write_log_user = "перданул на лицо"
	extreme = TRUE

/datum/interaction/lewd/unholy/do_facefart/display_interaction(mob/living/user, mob/living/target)
	user.do_facefart(target)

/datum/interaction/lewd/unholy/do_crotchfart
	description = "Напердеть на промежность."
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "на его промежность напердел"
	write_log_user = "перданул на промежность"
	extreme = TRUE

/datum/interaction/lewd/unholy/do_crotchfart/display_interaction(mob/living/user, mob/living/target)
	user.do_crotchfart(target)

/datum/interaction/lewd/unholy/do_fartfuck
	description = "Трахнуть в задницу с пердежом"
	require_target_anus = REQUIRE_EXPOSED
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "был(а) трахнут(а) в задницу с пердежом"
	write_log_user = "трахнул(а) в задницу с пердежом"
	extreme = TRUE

/datum/interaction/lewd/unholy/do_fartfuck/display_interaction(mob/living/user, mob/living/target)
	user.do_fartfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\ Задница <b>[target]</b> смешно хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/unholy/suck_fart
	description = "Высосать газы из задницы ртом."
	require_user_mouth = TRUE
	require_target_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "его газы высосал из задницы"
	write_log_user = "высосал газы из задницы"
	extreme = TRUE

/datum/interaction/lewd/unholy/suck_fart/display_interaction(mob/living/user, mob/living/target)
	user.suck_fart(target)

/datum/interaction/lewd/unholy/do_faceshit
	description = "Насрать на лицо."
	require_user_anus = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "его лицо было обосрано"
	write_log_user = "насрал на лицо"
	extreme = TRUE

/datum/interaction/lewd/unholy/do_faceshit/display_interaction(mob/living/user, mob/living/target)
	user.do_faceshit(target)

/datum/interaction/lewd/unholy/do_crotchshit/
	description = "Насрать на промежность."
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "его промежность была обосрана"
	write_log_user = "насрал на промежность"
	extreme = TRUE

/datum/interaction/lewd/unholy/do_crotchshit/display_interaction(mob/living/user, mob/living/target)
	user.do_crotchshit(target)

/datum/interaction/lewd/unholy/do_shitfuck
	description = "Трахнуть в задницу с говнецом"
	require_target_anus = REQUIRE_EXPOSED
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "трахнут в задницу с говнецом"
	write_log_user = "трахнул в задницу с говнецом"
	extreme = TRUE

/datum/interaction/lewd/unholy/do_shitfuck/display_interaction(mob/living/user, mob/living/target)
	user.do_shitfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>\ Жопа <b>[target]</b>забавно хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/unholy/suck_shit
	description = "Высосать говно из задницы."
	require_user_mouth = TRUE
	require_target_anus = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "его говно высосал из задницы"
	write_log_user = "высосал говно из задницы"
	extreme = TRUE

/datum/interaction/lewd/unholy/suck_shit/display_interaction(mob/living/user, mob/living/target)
	user.suck_shit(target)

/datum/interaction/lewd/unholy/piss_over
	description = "Обоссать с ног до головы."
	require_user_bottomless = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "получает золотой дождь от"
	write_log_user = "нассал на"
	extreme = TRUE

/datum/interaction/lewd/unholy/piss_over/display_interaction(mob/living/user, mob/living/target)
	user.piss_over(target)

/datum/interaction/lewd/unholy/piss_mouth
	description = "Нассать в рот."
	max_distance = 1
	interaction_sound = null
	require_user_bottomless = TRUE
	require_target_mouth = TRUE
	write_log_user = "ссыт в чей-то рот"
	write_log_target = "наполняет свой рот мочой"
	extreme = TRUE

/datum/interaction/lewd/unholy/piss_mouth/display_interaction(mob/living/carbon/user, mob/living/target)
	if(!istype(user))
		to_chat(user, "<span class='warning'>Ты уверен что твоя физиология позволяет это?</span>")
		return
	user.piss_mouth(target)
