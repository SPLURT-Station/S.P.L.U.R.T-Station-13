/obj/item/hand_item
	item_flags = DROPDEL | ABSTRACT | HAND_ITEM


/obj/item/hand_item/circlegame
	name = "circled hand"
	desc = "If somebody looks at this while it's below your waist, you get to bop them."
	icon_state = "madeyoulook"
	force = 0
	throwforce = 0
	attack_verb = list("bopped")

/obj/item/hand_item/circlegame/Initialize(mapload)
	. = ..()
	var/mob/living/owner = loc
	if(!istype(owner))
		return
	RegisterSignal(owner, COMSIG_PARENT_EXAMINE, .proc/ownerExamined)

/obj/item/hand_item/circlegame/Destroy()
	var/mob/owner = loc
	if(istype(owner))
		UnregisterSignal(owner, COMSIG_PARENT_EXAMINE)
	return ..()

/obj/item/hand_item/circlegame/dropped(mob/user)
	UnregisterSignal(user, COMSIG_PARENT_EXAMINE)		//loc will have changed by the time this is called, so Destroy() can't catch it
	// this is a dropdel item.
	return ..()

/// Stage 1: The mistake is made
/obj/item/hand_item/circlegame/proc/ownerExamined(mob/living/owner, mob/living/sucker)
	SIGNAL_HANDLER

	if(!istype(sucker) || !in_range(owner, sucker))
		return
	addtimer(CALLBACK(src, .proc/waitASecond, owner, sucker), 4)

/// Stage 2: Fear sets in
/obj/item/hand_item/circlegame/proc/waitASecond(mob/living/owner, mob/living/sucker)
	if(QDELETED(sucker) || QDELETED(src) || QDELETED(owner))
		return

	if(owner == sucker) // big mood
		to_chat(owner, "<span class='danger'>Wait a second... you just looked at your own [src.name]!</span>")
		addtimer(CALLBACK(src, .proc/selfGottem, owner), 10)
	else
		to_chat(sucker, "<span class='danger'>Wait a second... was that a-</span>")
		addtimer(CALLBACK(src, .proc/GOTTEM, owner, sucker), 6)

/// Stage 3A: We face our own failures
/obj/item/hand_item/circlegame/proc/selfGottem(mob/living/owner)
	if(QDELETED(src) || QDELETED(owner))
		return

	playsound(get_turf(owner), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
	owner.visible_message("<span class='danger'>[owner] shamefully bops [owner.p_them()]self with [owner.p_their()] [src.name].</span>", "<span class='userdanger'>You shamefully bop yourself with your [src.name].</span>", \
		"<span class='hear'>You hear a dull thud!</span>")
	log_combat(owner, owner, "bopped", src.name, "(self)")
	owner.do_attack_animation(owner)
	owner.apply_damage(100, STAMINA)
	owner.Knockdown(10)
	qdel(src)

/// Stage 3B: We face our reckoning (unless we moved away or they're incapacitated)
/obj/item/hand_item/circlegame/proc/GOTTEM(mob/living/owner, mob/living/sucker)
	if(QDELETED(sucker))
		return

	if(QDELETED(src) || QDELETED(owner))
		to_chat(sucker, "<span class='warning'>Nevermind... must've been your imagination...</span>")
		return

	if(!in_range(owner, sucker) || !(owner.mobility_flags & MOBILITY_USE))
		to_chat(sucker, "<span class='notice'>Phew... you moved away before [owner] noticed you saw [owner.p_their()] [src.name]...</span>")
		return

	to_chat(owner, "<span class='warning'>[sucker] looks down at your [src.name] before trying to avert [sucker.p_their()] eyes, but it's too late!</span>")
	to_chat(sucker, "<span class='danger'><b>[owner] sees the fear in your eyes as you try to look away from [owner.p_their()] [src.name]!</b></span>")

	owner.face_atom(sucker)
	if(owner.client)
		owner.client.give_award(/datum/award/achievement/misc/gottem, owner) // then everybody clapped

	playsound(get_turf(owner), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
	owner.do_attack_animation(sucker)

	if(HAS_TRAIT(owner, TRAIT_HULK))
		owner.visible_message("<span class='danger'>[owner] bops [sucker] with [owner.p_their()] [src.name] much harder than intended, sending [sucker.p_them()] flying!</span>", \
			"<span class='danger'>You bop [sucker] with your [src.name] much harder than intended, sending [sucker.p_them()] flying!</span>", "<span class='hear'>You hear a sickening sound of flesh hitting flesh!</span>", ignored_mobs=list(sucker))
		to_chat(sucker, "<span class='userdanger'>[owner] bops you incredibly hard with [owner.p_their()] [src.name], sending you flying!</span>")
		sucker.apply_damage(50, STAMINA)
		sucker.Knockdown(50)
		log_combat(owner, sucker, "bopped", src.name, "(setup- Hulk)")
		var/atom/throw_target = get_edge_target_turf(sucker, owner.dir)
		sucker.throw_at(throw_target, 6, 3, owner)
	else
		owner.visible_message("<span class='danger'>[owner] bops [sucker] with [owner.p_their()] [src.name]!</span>", "<span class='danger'>You bop [sucker] with your [src.name]!</span>", \
			"<span class='hear'>You hear a dull thud!</span>", ignored_mobs=list(sucker))
		sucker.apply_damage(15, STAMINA)
		log_combat(owner, sucker, "bopped", src.name, "(setup)")
		to_chat(sucker, "<span class='userdanger'>[owner] bops you with [owner.p_their()] [src.name]!</span>")
	qdel(src)

/obj/item/hand_item/slapper
	name = "slapper"
	desc = "This is how real men fight."
	icon_state = "latexballon"
	item_state = "nothing"
	force = 0
	throwforce = 0
	attack_verb = list("slapped")
	hitsound = 'sound/effects/snap.ogg'

/obj/item/hand_item/slapper/attack(mob/M, mob/living/carbon/human/user)
	if(ishuman(M))
		var/mob/living/carbon/human/L = M
		if(L && L.dna && L.dna.species)
			L.dna.species.stop_wagging_tail(M)
	user.do_attack_animation(M)
	playsound(M, 'sound/weapons/slap.ogg', 50, TRUE, -1)
	user.visible_message("<span class='danger'>[user] slaps [M]!</span>",
	"<span class='notice'>You slap [M]!</span>",\
	"<span class='hear'>You hear a slap.</span>")
	return

/obj/item/hand_item/slapper/on_offered(mob/living/carbon/offerer)
	. = TRUE

	if(!(locate(/mob/living/carbon) in orange(1, offerer)))
		visible_message(span_danger("[offerer] raises [offerer.p_their()] arm, looking around for a high-five, but there's no one around!"), \
			span_warning("You post up, looking for a high-five, but finding no one within range!"), null, 2)
		return

	offerer.visible_message(span_notice("[offerer] raises [offerer.p_their()] arm, looking for a high-five!"), \
		span_notice("You post up, looking for a high-five!"), null, 2)
	offerer.apply_status_effect(STATUS_EFFECT_OFFERING, src, /atom/movable/screen/alert/give/highfive)

/// Yeah broh! This is where we do the high-fiving (or high-tenning :o)
/obj/item/hand_item/slapper/on_offer_taken(mob/living/carbon/offerer, mob/living/carbon/taker)
	. = TRUE

	var/open_hands_taker
	var/slappers_giver
	for(var/i in taker.held_items) // see how many hands the taker has open for high'ing
		if(isnull(i))
			open_hands_taker++

	if(!open_hands_taker)
		to_chat(taker, span_warning("You can't high-five [offerer] with no open hands!"))
		SEND_SIGNAL(taker, COMSIG_ADD_MOOD_EVENT, "high_five", /datum/mood_event/high_five_full_hand) // not so successful now!
		return

	for(var/i in offerer.held_items)
		var/obj/item/hand_item/slapper/slap_check = i
		if(istype(slap_check))
			slappers_giver++

	if(slappers_giver >= 2) // we only check this if it's already established the taker has 2+ hands free
		offerer.visible_message(span_notice("[taker] enthusiastically high-tens [offerer]!"), span_nicegreen("Wow! You're high-tenned [taker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), ignored_mobs=taker)
		to_chat(taker, span_nicegreen("You give high-tenning [offerer] your all!"))
		playsound(offerer, 'sound/weapons/slap.ogg', 100, TRUE, 1)
		SEND_SIGNAL(offerer, COMSIG_ADD_MOOD_EVENT, "high_five", /datum/mood_event/high_ten)
		SEND_SIGNAL(taker, COMSIG_ADD_MOOD_EVENT, "high_five", /datum/mood_event/high_ten)
	else
		offerer.visible_message(span_notice("[taker] high-fives [offerer]!"), span_nicegreen("All right! You're high-fived by [taker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), ignored_mobs=taker)
		to_chat(taker, span_nicegreen("You high-five [offerer]!"))
		playsound(offerer, 'sound/weapons/slap.ogg', 50, TRUE, -1)
		SEND_SIGNAL(offerer, COMSIG_ADD_MOOD_EVENT, "high_five", /datum/mood_event/high_five)
		SEND_SIGNAL(taker, COMSIG_ADD_MOOD_EVENT, "high_five", /datum/mood_event/high_five)
	qdel(src)

/// Gangster secret handshakes.
/obj/item/hand_item/slapper/secret_handshake
	name = "Secret Handshake"
	icon_state = "recruit"
	icon = 'icons/obj/gang/actions.dmi'
	/// References the active families gamemode handler (if one exists), for adding new family members to.
	var/datum/gang_handler/handler
	/// The typepath of the gang antagonist datum that the person who uses the package should have added to them -- remember that the distinction between e.g. Ballas and Grove Street is on the antag datum level, not the team datum level.
	var/gang_to_use
	/// The team datum that the person who uses this package should be added to.
	var/datum/team/gang/team_to_use

/// Adds the user to the family that this package corresponds to, dispenses the free_clothes of that family, and adds them to the handler if it exists.
/obj/item/hand_item/slapper/secret_handshake/proc/add_to_gang(mob/living/user, original_name)
	var/datum/antagonist/gang/swappin_sides = new gang_to_use()
	swappin_sides.original_name = original_name
	swappin_sides.handler = handler
	user.mind.add_antag_datum(swappin_sides, team_to_use)
	var/policy = get_policy(ROLE_FAMILIES)
	if(policy)
		to_chat(user, policy)
	team_to_use.add_member(user.mind)
	swappin_sides.equip_gangster_in_inventory()
	if (!isnull(handler) && !handler.gangbangers.Find(user.mind)) // if we have a handler and they're not tracked by it
		handler.gangbangers += user.mind

/// Checks if the user is trying to use the package of the family they are in, and if not, adds them to the family, with some differing processing depending on whether the user is already a family member.
/obj/item/hand_item/slapper/secret_handshake/proc/attempt_join_gang(mob/living/user)
	if(!user?.mind)
		return
	var/datum/antagonist/gang/is_gangster = user.mind.has_antag_datum(/datum/antagonist/gang)
	var/real_name_backup = user.real_name
	if(is_gangster)
		if(is_gangster.my_gang == team_to_use)
			return
		real_name_backup = is_gangster.original_name
		is_gangster.my_gang.remove_member(user.mind)
		user.mind.remove_antag_datum(/datum/antagonist/gang)
	add_to_gang(user, real_name_backup)

/obj/item/hand_item/slapper/secret_handshake/on_offer_taken(mob/living/carbon/offerer, mob/living/carbon/taker)
	. = TRUE
	if (!(null in taker.held_items))
		to_chat(taker, span_warning("You can't get taught the secret handshake if [offerer] has no free hands!"))
		return

	if(HAS_TRAIT(taker, TRAIT_MINDSHIELD))
		to_chat(taker, "You attended a seminar on not signing up for a gang and are not interested.")
		return

	var/datum/antagonist/gang/is_gangster = taker.mind.has_antag_datum(/datum/antagonist/gang)
	if(is_gangster?.starter_gangster)
		if(is_gangster.my_gang == team_to_use)
			to_chat(taker, "You started your family. You don't need to join it.")
			return
		to_chat(taker, "You started your family. You can't turn your back on it now.")
		return

	offerer.visible_message(span_notice("[taker] is taught the secret handshake by [offerer]!"), span_nicegreen("All right! You've taught the secret handshake to [taker]!"), span_hear("You hear a bunch of weird shuffling and flesh slapping sounds!"), ignored_mobs=taker)
	to_chat(taker, span_nicegreen("You get taught the secret handshake by [offerer]!"))
	var/datum/antagonist/gang/owner_gang_datum = offerer.mind.has_antag_datum(/datum/antagonist/gang)
	handler = owner_gang_datum.handler
	gang_to_use = owner_gang_datum.type
	team_to_use = owner_gang_datum.my_gang
	attempt_join_gang(taker)
	qdel(src)

/obj/item/hand_item/kisser
	name = "kiss"
	desc = "I want you all to know, everyone and anyone, to seal it with a kiss."
	icon = 'icons/mob/animal.dmi'
	icon_state = "heart"
	/// The kind of projectile this version of the kiss blower fires
	var/kiss_type = /obj/item/projectile/kiss
	/// TRUE if the user was aiming anywhere but the mouth when they offer the kiss, if it's offered
	var/cheek_kiss

/obj/item/hand_item/kisser/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	// . |= AFTERATTACK_PROCESSED_ITEM
	/*
	if(HAS_TRAIT(user, TRAIT_GARLIC_BREATH))
		kiss_type = /obj/projectile/kiss/french

	if(HAS_TRAIT(user, TRAIT_CHEF_KISS))
		kiss_type = /obj/projectile/kiss/chef
	*/

	var/obj/item/projectile/blown_kiss = new kiss_type(get_turf(user))
	user.visible_message("<b>[user]</b> blows \a [blown_kiss] at [target]!", span_notice("You blow \a [blown_kiss] at [target]!"))

	//Shooting Code:
	blown_kiss.original = target
	blown_kiss.fired_from = user
	blown_kiss.pixels_per_second = TILES_TO_PIXELS(7) // Speed of blown kiss
	blown_kiss.firer = user // don't hit ourself that would be really annoying
	blown_kiss.impacted = list(user = TRUE) // just to make sure we don't hit the wearer
	blown_kiss.preparePixelProjectile(target, user)
	blown_kiss.fire()
	qdel(src)

/obj/item/hand_item/kisser/death
	name = "kiss of death"
	desc = "If looks could kill, they'd be this."
	color = COLOR_BLACK
	kiss_type = /obj/item/projectile/kiss/death

/obj/item/projectile/kiss
	name = "kiss"
	icon = 'icons/mob/animal.dmi'
	icon_state = "heart"
	hitsound = 'sound/effects/kiss.ogg'
	hitsound_wall = 'sound/effects/kiss.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage_type = BRUTE
	damage = 0
	nodamage = TRUE // love can't actually hurt you
	armour_penetration = 100 // but if it could, it would cut through even the thickest plate
	flag = MAGIC // and most importantly, love is magic~

/obj/item/projectile/kiss/fire(angle, atom/direct_target)
	if(firer)
		name = "[name] blown by [firer]"
	return ..()

/obj/item/projectile/kiss/Impact(atom/A)
	if(damage > 0 || !isliving(A)) // if we do damage or we hit a nonliving thing, we don't have to worry about a harmless hit because we can't wrongly do damage anyway
		return ..()

	harmless_on_hit(A)
	qdel(src)
	return FALSE

/**
 * To get around shielded modsuits & such being set off by kisses when they shouldn't, we take a page from hallucination projectiles
 * and simply fake our on hit effects. This lets kisses remain incorporeal without having to make some new trait for this one niche situation.
 * This fake hit only happens if we can deal damage and if we hit a living thing. Otherwise, we just do normal on hit effects.
 */
/obj/item/projectile/kiss/proc/harmless_on_hit(mob/living/living_target)
	playsound(get_turf(living_target), hitsound, 100, TRUE)
	if(!suppressed)  // direct
		living_target.visible_message(span_danger("[living_target] is hit by \a [src]."), span_userdanger("You're hit by \a [src]!"), vision_distance=COMBAT_MESSAGE_RANGE)

	/*
	living_target.add_mob_memory(/datum/memory/kissed, deuteragonist = firer)
	living_target.add_mood_event("kiss", /datum/mood_event/kiss, firer, suppressed)
	if(isliving(firer))
		var/mob/living/kisser = firer
		kisser.add_mob_memory(/datum/memory/kissed, protagonist = living_target, deuteragonist = firer) */

	try_fluster(living_target)

/obj/item/projectile/kiss/proc/try_fluster(mob/living/living_target)
	// people with the social anxiety quirk can get flustered when hit by a kiss
	if(!HAS_TRAIT(living_target, TRAIT_ANXIOUS) || (living_target.stat > SOFT_CRIT) || living_target.is_blind())
		return

	if(HAS_TRAIT(living_target, TRAIT_FEARLESS) || prob(50)) // 50% chance for it to apply, also immune while on meds
		return

	var/other_msg
	var/self_msg
	var/roll = rand(1, 3)
	switch(roll)
		if(1)
			other_msg = "stumbles slightly, turning a bright red!"
			self_msg = "You lose control of your limbs for a moment as your blood rushes to your face, turning it bright red!"
			living_target.confused += (rand(5, 10))
		if(2)
			other_msg = "stammers softly for a moment before choking on something!"
			self_msg = "You feel your tongue disappear down your throat as you fight to remember how to make words!"
			addtimer(CALLBACK(living_target, /atom/movable.proc/say, pick("Uhhh...", "O-oh, uhm...", "I- uhhhhh??", "What?")), rand(0.5 SECONDS, 1.5 SECONDS))
			living_target.stuttering += rand(5, 15)
		if(3)
			other_msg = "locks up with a stunned look on [living_target.p_their()] face, staring at [firer ? firer : "the ceiling"]!"
			self_msg = "Your brain completely fails to process what just happened, leaving you rooted in place staring [firer ? "at [firer]" : "the ceiling"] for what feels like an eternity!"
			living_target.face_atom(firer)
			living_target.Stun(rand(1 SECONDS, 3 SECONDS))

	living_target.visible_message(span_notice("<b>[living_target]</b> [other_msg]"), span_userdanger("Whoa! [self_msg]"))

/obj/item/projectile/kiss/death
	name = "kiss of death"
	nodamage = FALSE // okay i kinda lied about love not being able to hurt you
	damage = 15
	wound_bonus = 0
	sharpness = SHARP_POINTY
	color = COLOR_BLACK

/obj/item/projectile/kiss/death/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(!iscarbon(target))
		return
	var/mob/living/carbon/heartbreakee = target
	var/obj/item/organ/heart/dont_go_breakin_my_heart = heartbreakee.getorganslot(ORGAN_SLOT_HEART)
	dont_go_breakin_my_heart.applyOrganDamage(15)
