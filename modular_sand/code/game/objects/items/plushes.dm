// Honestly, Saliith was just sad when he made this. Leave this file in the game to let people hug him.
// i agree and support - one of the spriters

/obj/item/toy/plush/lizardplushie/saliith
	name = "Saliith plushie"
	desc = "He looks like he needs a friend."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "saliith"
	gender = MALE
	can_random_spawn = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF // Protected by a higher power
	unstuffable = TRUE // Prevent grenades

/obj/item/toy/plush/lizardplushie/saliith/Initialize(mapload, set_snowflake_id)
	// Check if plush already exists
	if(GLOB.saliith_plushie && (GLOB.saliith_plushie != src))
		return INITIALIZE_HINT_QDEL

	// Appear on orbit menu
	GLOB.poi_list += src

	// Return normally
	. = ..()

/obj/item/toy/plush/lizardplushie/saliith/Destroy()
	// Let's not keep the reference hanging around
	GLOB.poi_list -= src
	. = ..()

/obj/item/toy/plush/lizardplushie/saliith/ComponentInitialize()
	. = ..()

	// Add respawn component
	AddComponent(/datum/component/stationloving)

	// Define pronouns
	var/p_they = p_they()
	var/p_s = p_s()

	// Add custom description
	normal_desc = "[p_they] look[p_s] like [p_they] need[p_s] a friend."

/obj/item/toy/plush/lizardplushie/saliith/examine(mob/user)
	. = ..()

	// Define pronouns
	var/p_them = p_them()
	//var/p_they = p_they()
	//var/p_are = p_are()

	// Check for stuffing
	if(!stuffed)
		// Update examine text and return
		. += span_deadsay("[p_they(TRUE)] [p_are()] dead.")
		return

	// Check if user is Saliith himself
	if(user.ckey == "sandpoot")
		// Update examine text and return
		. += span_deadsay("You feel a sense of familiarity from [p_them].")
		return

	// Check for antag datums
	if((length(user?.mind?.antag_datums) >= 1))
		// Update examine text
		. += span_warning("[src] gives you a menacing glare! Patting [p_them] would be a dangerous mistake.")

/obj/item/toy/plush/lizardplushie/saliith/attack_self(mob/living/carbon/human/user)
	// Check if user exists
	if(!user)
		// Return normally
		return ..()

	// Check if user has a mind
	if(!user.mind)
		// Return normally
		return ..()

	// Define pronouns
	var/p_they = p_they()
	//var/p_their = p_their()
	var/p_s = p_s()

	// Check if user is Saliith himself
	if(user.ckey == "sandpoot")
		// Alert him and return
		to_chat(user, span_notice("[p_they] give[p_s] you a hesitant gaze, but accept[p_s] the gesture anyhow."))
		return ..()

	// Check if user is an antagonist role
	if((length(user?.mind?.antag_datums) >= 1))
		// Check if user is a xenobio changeling
		if(user?.mind?.has_antag_datum(/datum/antagonist/changeling/xenobio))
			// Alert the user
			to_chat(user, span_notice("[src] senses what you really are, but decides to spare you."))

		// Check if user is a brainwashed victim
		else if(user?.mind?.has_antag_datum(/datum/antagonist/brainwashed))
			// Alert the user
			to_chat(user, span_notice("[src] senses that you're not in control of your actions, and offers [p_their()] sympathy."))

		// User is not a whitelisted antagonist
		else
			// Drop the item
			user.dropItemToGround(src)

			// Warn user
			user.visible_message(span_warning("[src] smites [user] with an otherworldly wrath!"), span_boldwarning("You've made a grave mistake."))

			// Get lightning location
			var/turf/turf_target = get_step(get_step(user, NORTH), NORTH)

			// Perform lightning effect
			turf_target.Beam(user, icon_state="lightning[rand(1,12)]", time = 5)
			user.electrocution_animation(40)

			// Play sound effect
			playsound(get_turf(user), 'sound/magic/lightningbolt.ogg', 50, 1)

			// Add fire damage
			user.adjustFireLoss(120)

			// Return
			return

	// User has no antagonist status

	// Alert the user
	to_chat(user, span_notice("[p_they] give[p_s] you a hesitant gaze, but accepts the gesture anyhow."))

	// Return
	return ..()

/obj/item/toy/plush/lizardplushie/saliith/attackby(obj/item/item_used, mob/living/user, params)
	// Check for sharp object
	if(item_used.get_sharpness())
		// Warn in local chat
		visible_message(span_warning("[src] knocks \the [item_used] out of [user]'s hands!"), span_warning("[src] knocks \the [item_used] out of your hands!"))

		// Drop the item
		user.dropItemToGround(item_used)

		// Throw the item away
		item_used.throw_at(pick(oview(7,get_turf(src))),10,1)

		// Return
		return

	// Check if user is Saliith himself
	if(user.ckey == "sandpoot")
		// Return with no effects
		return ..()

	// Check for grenade
	if(istype(item_used, /obj/item/grenade))
		// Warn in local chat
		visible_message(span_warning("[src] forces \the [item_used] into [user]'s mouth!"), span_warning("[src] forces \the [item_used] into your mouth!"))

		// Define the grenade item
		var/obj/item/grenade/item_grenade = item_used

		// Move grenade to the user
		item_grenade.forceMove(user)

		// Set the detonation time
		item_grenade.preprime(volume = 10)

		// Return
		return

	// Return normally
	return ..()

/obj/item/toy/plush/lizardplushie/saliith/ex_act(severity, target, origin)
	return

/obj/item/toy/plush/plushling/plushie_absorb(obj/item/toy/plush/victim)
	// Check if target is the Saliith plushie
	if(istype(victim, /obj/item/toy/plush/lizardplushie/saliith))
		// Warn in local chat
		visible_message(span_warning("[victim] violently parries the impostor! [src] is utterly annihilated!"))

		// Create a gib effect
		new /obj/effect/gibspawner(get_turf(src))

		// Delete the plushling
		qdel(src)

		// Return
		return

	// Return normally
	return ..()

/obj/item/toy/plush/love(obj/item/toy/plush/Kisser, mob/living/user)
	// Define saliith plush
	var/plush_saliith = /obj/item/toy/plush/lizardplushie/saliith

	// Check if interaction involves the Saliith plush
	if(istype(src, plush_saliith) || istype(Kisser, plush_saliith))
		// Check if user is Saliith himself
		if(user.ckey == "sandpoot")
			// Return normally
			return ..()

		// User is not Saliith
		// Warn in local chat
		user.visible_message(span_warning("[user] tried to force [Kisser] to kiss [src] against their will, and has been yeeted!"), span_warning("You try to force [Kisser] to kiss [src], but get yeeted instead!"))

		// Display voice of god message
		say("YEET", spans = list("colossus","yell"))

		// Play sound
		playsound(get_turf(src), 'sound/magic/clockwork/invoke_general.ogg', 200, TRUE, 5)

		// Drop the plushies if held
		if(src in user.held_items)
			user.dropItemToGround(src)
		if(Kisser in user.held_items)
			user.dropItemToGround(Kisser)

		// Launch user away
		var/turf/yeet_target = get_edge_target_turf(user, pick(GLOB.alldirs))
		user.throw_at(yeet_target, 10, 14)
		log_combat(src, user, "plush yeeted")

		// Return
		return

	// Interaction does not involve Saliith
	// Return normally
	return ..()

// Pinpointer for plushie toy
/obj/item/pinpointer/plushie_saliith
	name = "Saliith plushie pinpointer"
	desc = "A handheld tracking device that locates Saliith's plushie."
	icon = 'modular_sand/icons/obj/device.dmi'
	icon_state = "pinpointer_saliith"

/obj/item/pinpointer/plushie_saliith/scan_for_target()
	set_target(GLOB.saliith_plushie, src)

// cube guy thing. beware, very silly

/obj/item/toy/plush/cube
	name = "Cubical plushie"
	desc = "That's one weird looking plushie."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "cube"
	squeak_override = list('sound/effects/footstep/rustystep1.ogg' = 1)
