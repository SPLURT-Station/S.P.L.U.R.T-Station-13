#define BLOODFLEDGE_DRAIN_NUM 50
#define BLOODFLEDGE_COOLDOWN_BITE 60 // Six seconds
#define BLOODFLEDGE_COOLDOWN_REVIVE 3000 // Five minutes
#define BLOODFLEDGE_BANK_CAPACITY (BLOODFLEDGE_DRAIN_NUM * 2)
#define HYPNOEYES_COOLDOWN_NORMAL 3 SECONDS
#define HYPNOEYES_COOLDOWN_BRAINWASH 30 SECONDS

//
// Quirk: Hypnotic Gaze
//

/datum/action/cooldown/hypnotize
	name = "Hypnotize"
	desc = "Stare deeply into someone's eyes, drawing them into a hypnotic slumber."
	button_icon_state = "Hypno_eye"
	icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
	background_icon_state = "bg_alien"
	transparent_when_unavailable = TRUE
	cooldown_time = HYPNOEYES_COOLDOWN_NORMAL

	// Should this create a brainwashed victim?
	// Enabled by using Mesmer Eyes with the quirk
	var/mode_brainwash = FALSE

	// Terminology used
	var/term_hypno = "hypnotize"
	var/term_suggest = "suggestion"

/datum/action/cooldown/hypnotize/IsAvailable(silent)
	. = ..()

	// Check parent return
	if(!.)
		return FALSE

	// Check for carbon owner
	if(!iscarbon(owner))
		// Warn user and return
		to_chat(owner, span_warning("You shouldn't have this ability!"))
		return FALSE

	// Define action owner
	var/mob/living/carbon/human/action_owner = owner

	// Check if owner has eye protection
	if(action_owner.get_eye_protection())
		// Warn the user, then return
		to_chat(action_owner, span_warning("Your eyes need to be visible for this ability to work."))
		return FALSE

	// Define owner's eyes
	var/obj/item/organ/eyes/owner_eyes = owner.getorganslot(ORGAN_SLOT_EYES)

	// Check if eyes exist
	if(!istype(owner_eyes))
		// Warn the user, then return
		to_chat(action_owner, span_warning("You need eyes to use this ability!"))
		return FALSE

	// Check if owner is blind
	if(HAS_TRAIT(action_owner, TRAIT_BLIND))
		// Warn the user, then return
		to_chat(action_owner, span_warning("Your blind [owner_eyes] are of no use."))
		return FALSE

	// All checks passed
	return TRUE

/datum/action/cooldown/hypnotize/proc/set_brainwash(set_to = FALSE)
	// Check if state will change
	if(mode_brainwash == set_to)
		// Do nothing
		return

	// Set new variable
	mode_brainwash = set_to

	// Define toggle message
	var/toggle_message = "experiences an error?"

	// Define log message type
	var/log_message_type = "somehow screwed up"

	// Check if brainwashing
	if(mode_brainwash)
		// Set ability text
		name = "Brainwash"
		desc = "Stare deeply into someone's eyes, and force them to become your loyal slave."

		// Set cooldown time
		cooldown_time = HYPNOEYES_COOLDOWN_BRAINWASH

		// Set terminology
		term_hypno = "brainwash"
		term_suggest = "command"

		// Set message suffix
		toggle_message = "suddenly feels more intense!"

		// Set log message type
		log_message_type = "GAINED"

	// Not brainwashing
	else
		// Set ability text
		name = "Hypnotize"
		desc = "Stare deeply into someone's eyes, drawing them into a hypnotic slumber."

		// Set cooldown time
		cooldown_time = HYPNOEYES_COOLDOWN_NORMAL

		// Set terminology
		term_hypno = "hypnotize"
		term_suggest = "suggestion"

		// Set message suffix
		toggle_message = "fades back to normal levels..."

		// Set log message type
		log_message_type = "LOST"

	// Update buttons
	owner.update_action_buttons()

	// Reset cooldown time
	StartCooldown()

	// Alert user
	to_chat(owner, span_mind_control("Your hypnotic power [toggle_message] You'll need time to adjust before using it again."))

	// Log interaction
	log_admin("[key_name(owner)] [log_message_type] hypnotic brainwashing powers.")

/datum/action/cooldown/hypnotize/Trigger()
	. = ..()

	// Check parent return
	if(!.)
		return

	// Define action owner
	var/mob/living/carbon/human/action_owner = owner

	// Define target
	var/grab_target = action_owner.pulling

	// Check for target
	if(!grab_target)
		// Warn the user, then return
		to_chat(action_owner, span_warning("You you need to grab someone first!"))
		return

	// Check for cyborg
	if(iscyborg(grab_target))
		// Warn the user, then return
		to_chat(action_owner, span_warning("You can't [term_hypno] a cyborg!"))
		return

	// Check for alien
	// Taken from eyedropper check
	/*
	if(isalien(grab_target))
		// Warn the user, then return
		to_chat(action_owner, span_warning("[grab_target] doesn\'t seem to have any eyes!"))
		return
	*/

	// Check for carbon human target
	if(!ishuman(grab_target))
		// Warn the user, then return
		to_chat(action_owner, span_warning("That's not a valid creature!"))
		return

	// Check if target is alive
	if(!isliving(grab_target))
		// Warn the user, then return
		to_chat(action_owner, span_warning("You can't [term_hypno] the dead!"))
		return

	// Check for aggressive grab
	if(action_owner.grab_state < GRAB_AGGRESSIVE)
		// Warn the user, then return
		to_chat(action_owner, span_warning("You need a stronger grip before trying to [term_hypno] [grab_target]!"))
		return

	// Define target
	var/mob/living/carbon/human/action_target = grab_target

	// Check if target has a mind
	if(!action_target.mind)
		// Warn the user, then return
		to_chat(action_owner, span_warning("[grab_target] doesn\'t have a compatible mind!"))
		return

	/* Unused: Replaced by get_eye_protection
	// Check if target's eyes are obscured
	// ... by headwear
	if((action_target.head && action_target.head.flags_cover & HEADCOVERSEYES))
		// Warn the user, then return
		to_chat(action_owner, span_warning("[action_target]'s eyes are obscured by [action_target.head]."))
		return

	// ... by a mask
	else if((action_target.wear_mask && action_target.wear_mask.flags_cover & MASKCOVERSEYES))
		// Warn the user, then return
		to_chat(action_owner, span_warning("[action_target]'s eyes are obscured by [action_target.wear_mask]."))
		return

	// ... by glasses
	else if((action_target.glasses && action_target.glasses.flags_cover & GLASSESCOVERSEYES))
		// Warn the user, then return
		to_chat(action_owner, span_warning("[action_target]'s eyes are obscured by [action_target.glasses]."))
		return
	*/

	// Check if target has eye protection
	if(action_target.get_eye_protection())
		// Warn the user, then return
		to_chat(action_owner, span_warning("You have difficulty focusing on [action_target]'s eyes due to some form of protection, and are left unable to [term_hypno] them."))
		to_chat(action_target, span_notice("[action_owner] stares intensely at you, but stops after a moment."))
		return

	// Check if target is blind
	if(HAS_TRAIT(action_target, TRAIT_BLIND))
		// Warn the user, then return
		to_chat(action_owner, span_warning("You stare deeply into [action_target]'s eyes, but see nothing but emptiness."))
		return

	// Check for anti-magic
	// This does not include TRAIT_HOLY
	if(action_target.anti_magic_check())
		// Warn the users, then return
		to_chat(action_owner, span_warning("You stare deeply into [action_target]'s eyes. They stare back at you as if nothing had happened."))
		to_chat(action_target, span_notice("[action_owner] stares intensely into your eyes for a moment. You sense nothing out of the ordinary from them."))
		return

	// Check client pref for hypno
	if(action_target.client?.prefs.cit_toggles & NEVER_HYPNO)
		// Warn the users, then return
		to_chat(action_owner, span_warning("You sense that [action_target] would rather not be hypnotized, and decide to respect their wishes."))
		to_chat(action_target, span_notice("[action_owner] stares into your eyes with a strange conviction, but turns away after a moment."))
		return

	// Check for mindshield implant
	if(HAS_TRAIT(action_target, TRAIT_MINDSHIELD))
		// Warn the users, then return
		to_chat(action_owner, span_warning("You stare deeply into [action_target]'s eyes, but hear a faint buzzing from [action_target.p_their()] head. It seems something is interfering."))
		to_chat(action_target, span_notice("[action_owner] stares intensely into your eyes for a moment, before a buzzing sound emits from your head."))
		return

	// Check for sleep immunity
	// This is required for SetSleeping to trigger
	if(HAS_TRAIT(action_target, TRAIT_SLEEPIMMUNE))
		// Warn the users, then return
		to_chat(action_owner, span_warning("You stare deeply into [action_target]'s eyes, and see nothing but unrelenting energy. You won't be able to subdue [action_target.p_them()] in this state!"))
		to_chat(action_target, span_notice("[action_owner] stares intensely into your eyes, but sees something unusual about you..."))
		return

	// Check for sleep
	if(action_target.IsSleeping())
		// Warn the user, then return
		to_chat(action_owner, span_warning("You can't [term_hypno] [action_target] whilst [action_target.p_theyre()] asleep!"))
		return

	// Check for combat mode
	if(SEND_SIGNAL(action_target, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_ACTIVE))
		// Warn the users, then return
		to_chat(action_owner, span_warning("[action_target] is acting too defensively! You'll need [action_target.p_them()] to lower [action_target.p_their()] guard first!"))
		to_chat(action_target, span_notice("[action_owner] tries to stare into your eyes, but can't get a read on you."))
		return

	// Display chat messages
	to_chat(action_owner, span_notice("You stare deeply into [action_target]'s eyes..."))
	to_chat(action_target, span_warning("[action_owner] stares intensely into your eyes..."))

	// Try to perform action timer
	if(!do_mob(action_owner, action_target, 5 SECONDS))
		// Action timer was interrupted
		// Warn the user, then return
		to_chat(action_owner, span_warning("You lose concentration on [action_target], and fail to [term_hypno] [action_target.p_them()]!"))
		to_chat(action_target, span_notice("[action_owner]'s gaze is broken prematurely, freeing you from any potential effects."))
		return

	// Define blank response
	var/input_consent

	// Check for non-consensual setting
	if(action_target.client?.prefs.nonconpref != "Yes")
		// Non-consensual is NOT enabled
		// Define warning suffix
		var/warning_target = (mode_brainwash ? "You will become a brainwashed victim, and be required to follow all orders given. [action_owner] accepts all responsibility for antagonistic orders." : "These are only suggestions, and you may disobey cases that strongly violate your character.")

		// Prompt target for consent response
		input_consent = alert(action_target, "Will you fall into a hypnotic stupor? This will allow [action_owner] to issue hypnotic [term_suggest]s. [warning_target]", "Hypnosis", "Yes", "No")

	// When consent is denied
	if(input_consent == "No")
		// Warn the users, then return
		to_chat(action_owner, span_warning("[action_target]'s attention breaks, despite the attempt to [term_hypno] [action_target.p_them()]! [action_target.p_they()] clearly don't want this!"))
		to_chat(action_target, span_notice("Your concentration breaks as you realize you have no interest in following [action_owner]'s words!"))
		return

	// Display local message
	action_target.visible_message(span_warning("[action_target] falls into a deep slumber!"), span_danger("Your eyelids gently shut as you fall into a deep slumber. All you can hear is [action_owner]'s voice as you commit to following all of their [term_suggest]s."))

	// Set sleeping
	action_target.SetSleeping(2 MINUTES)

	// Set drowsiness
	action_target.drowsyness = max(action_target.drowsyness, 40)

	// Define warning suffix
	var/warning_owner = (mode_brainwash ? "You are responsible for any antagonistic actions they take as a result of the brainwashing." : "This is only a suggestion, and [action_target.p_they()] may disobey if it violates [action_target.p_their()] character.")

	// Prompt action owner for response
	var/input_suggestion = input("What would you like to suggest [action_target] do? Leave blank to release [action_target.p_them()] instead. [warning_owner]", "Hypnotic [term_suggest]", null, null)

	// Check if input text exists
	if(!input_suggestion)
		// Alert user of no input
		to_chat(action_owner, "You decide not to give [action_target] a [term_suggest].")

		// Remove sleep, then return
		action_target.SetSleeping(0)
		return

	// Sanitize input text
	input_suggestion = sanitize(input_suggestion)

	// Check if brainwash mode
	if(mode_brainwash)
		// Create brainwash objective
		brainwash(action_target, input_suggestion)

	// Not in brainwash mode
	else
		// Display message to target
		to_chat(action_target, span_mind_control("...[input_suggestion]..."))

	// Start cooldown
	StartCooldown()

	// Display message to action owner
	to_chat(action_owner, "You whisper your [term_suggest] in a smooth calming voice to [action_target]")

	// Play a sound effect
	playsound(action_target, 'sound/magic/domain.ogg', 20, 1)

	// Display local message
	action_target.visible_message(span_warning("[action_target] wakes up from their deep slumber!"), span_danger("Your eyelids gently open as you see [action_owner]'s face staring back at you."))

	// Remove sleep, then return
	action_target.SetSleeping(0)
	return

//
// Quirk: Hydra Heads
//

/datum/action/innate/hydra
	name = "Switch head"
	desc = "Switch between each of the heads on your body."
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "art_summon"

/datum/action/innate/hydrareset
	name = "Reset speech"
	desc = "Go back to speaking as a whole."
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "art_summon"

/datum/action/innate/hydrareset/Activate()
	var/mob/living/carbon/human/hydra = owner
	hydra.real_name = hydra.name_archive
	hydra.visible_message(span_notice("[hydra.name] pushes all three heads forwards; they seem to be talking as a collective."), \
							span_notice("You are now talking as [hydra.name_archive]!"), ignored_mobs=owner)

/datum/action/innate/hydra/Activate() //I hate this but its needed
	var/mob/living/carbon/human/hydra = owner
	var/list/names = splittext(hydra.name_archive,"-")
	var/selhead = input("Who would you like to speak as?","Heads:") in names
	hydra.real_name = selhead
	hydra.visible_message(span_notice("[hydra.name] pulls the rest of their heads back; and puts [selhead]'s forward."), \
							span_notice("You are now talking as [selhead]!"), ignored_mobs=owner)

//
// Quirk: Bloodsucker Fledgling / Vampire
//

// Basic action preset
/datum/action/cooldown/bloodfledge
	name = "Broken Bloodfledge Ability"
	desc = "You shouldn't be seeing this!"
	button_icon_state = "power_torpor"
	background_icon_state = "vamp_power_off"
	buttontooltipstyle = "cult"
	icon_icon = 'icons/mob/actions/bloodsucker.dmi'
	button_icon = 'icons/mob/actions/bloodsucker.dmi'
	transparent_when_unavailable = TRUE

// Basic can-use check
/datum/action/cooldown/bloodfledge/IsAvailable(silent = FALSE)
	. = ..()

	// Check parent return
	if(!.)
		return FALSE

	// Check for carbon owner
	if(!iscarbon(owner))
		// Warn user and return
		to_chat(owner, span_warning("You shouldn't have this ability!"))
		return FALSE

	// Check vampire ability mob proc
	if(!owner.allow_vampiric_ability(silent = FALSE))
		return FALSE

	// Action can be used
	return TRUE

// Action: Bite
/datum/action/cooldown/bloodfledge/bite
	name = "Fledgling Bite"
	desc = "Sink your vampiric fangs into the person you are grabbing, and attempt to drink their blood."
	button_icon_state = "power_feed"
	cooldown_time = BLOODFLEDGE_COOLDOWN_BITE
	var/time_interact = 30

	// Reagent holder, used to change reaction type
	var/datum/reagents/blood_bank

/datum/action/cooldown/bloodfledge/bite/Grant()
	. = ..()

	// Check for voracious
	if(HAS_TRAIT(owner, TRAIT_VORACIOUS))
		// Make times twice as fast
		cooldown_time *= 0.5
		time_interact*= 0.5

	// Create reagent holder
	blood_bank = new(BLOODFLEDGE_BANK_CAPACITY)

/datum/action/cooldown/bloodfledge/bite/Trigger()
	. = ..()

	// Check parent return
	if(!.)
		return

	// Define action owner
	var/mob/living/carbon/action_owner = owner

	// Check for any grabbed target
	if(!action_owner.pulling)
		// Warn the user, then return
		to_chat(action_owner, span_warning("You need a victim first!"))
		return

	// Limit maximum nutrition
	if(action_owner.nutrition >= NUTRITION_LEVEL_FAT)
		// Warn the user, then return
		to_chat(action_owner, span_notice("You are too full to drain any more."))
		return

	// Limit maximum potential nutrition
	if(action_owner.nutrition + BLOODFLEDGE_DRAIN_NUM >= NUTRITION_LEVEL_FAT)
		// Warn the user, then return
		to_chat(action_owner, span_notice("You would become too full by draining any more blood."))
		return

	// Check for muzzle
	if(action_owner.is_muzzled())
		// Warn the user, then return
		to_chat(action_owner, span_notice("You can't bite things while muzzled!"))
		return

	// Check for covered mouth
	if(action_owner.is_mouth_covered())
		// Warn the user, then return
		to_chat(action_owner, span_notice("You can't bite things with your mouth covered!"))
		return

	// Define pulled target
	var/pull_target = action_owner.pulling

	// Define bite target
	var/mob/living/carbon/human/bite_target

	// Define if action owner is dumb
	var/action_owner_dumb = HAS_TRAIT(action_owner, TRAIT_DUMB)

	// Check if the target is carbon
	if(iscarbon(pull_target))
		// Set the bite target
		bite_target = pull_target

	// Or cocooned carbon
	else if(istype(pull_target,/obj/structure/arachnid/cocoon))
		// Define if cocoon has a valid target
		// This cannot use pull_target
		var/possible_cocoon_target = locate(/mob/living/carbon/human) in action_owner.pulling.contents

		// Check defined cocoon target
		if(possible_cocoon_target)
			// Set the bite target
			bite_target = possible_cocoon_target

	// Or a blood tomato
	else if(istype(pull_target,/obj/item/reagent_containers/food/snacks/grown/tomato/blood))
		// Set message based on dumbness
		var/message_tomato_suffix = (action_owner_dumb ? ", and absorb it\'s delicious vegan-friendly blood!" : "! It's not very nutritious.")
		// Warn the user, then return
		to_chat(action_owner, span_danger("You plunge your fangs into [pull_target][message_tomato_suffix]"))
		return

		// This doesn't actually interact with the item

	// Or none of the above
	else
		// Set message based on dumbness
		var/message_invalid_target = (action_owner_dumb ? "You bite at [pull_target], but nothing seems to happen" : "You can't drain blood from [pull_target]!")
		// Warn the user, then return
		to_chat(action_owner, span_warning(message_invalid_target))
		return

	// Define selected zone
	var/target_zone = action_owner.zone_selected

	// Check if target can be penetrated
	// Bypass pierce immunity so feedback can be provided later
	if(!bite_target.can_inject(action_owner, FALSE, target_zone, FALSE, TRUE))
		// Warn the user, then return
		to_chat(action_owner, span_warning("There\'s no exposed flesh or thin material in that region of [bite_target]'s body. You're unable to bite them!"))
		return

	// Check targeted body part
	var/obj/item/bodypart/bite_bodypart = bite_target.get_bodypart(target_zone)

	// Define zone name
	var/target_zone_name = "flesh"

	// Define if target zone has special effects
	var/target_zone_effects = FALSE

	// Define if zone should be checked
	// Uses dismember check to determine if it can be missing
	// Missing limbs are assumed to be dismembered
	var/target_zone_check = bite_bodypart?.can_dismember() || TRUE

	// Set zone name based on region
	// Also checks for some protections
	switch(target_zone)
		if(BODY_ZONE_HEAD)
			target_zone_name = "neck"

		if(BODY_ZONE_CHEST)
			target_zone_name = "shoulder"

		if(BODY_ZONE_L_ARM)
			target_zone_name = "left arm"

		if(BODY_ZONE_R_ARM)
			target_zone_name = "right arm"

		if(BODY_ZONE_L_LEG)
			target_zone_name = "left thigh"

		if(BODY_ZONE_R_LEG)
			target_zone_name = "right thigh"

		if(BODY_ZONE_PRECISE_EYES)
			// Check if eyes exist and are exposed
			if(!bite_target.has_eyes(REQUIRE_EXPOSED))
				// Warn user and return
				to_chat(action_owner, span_warning("You can't find [bite_target]'s eyes to bite them!"))
				return

			// Set region data normally
			target_zone_name = "eyes"
			target_zone_check = FALSE
			target_zone_effects = TRUE

		if(BODY_ZONE_PRECISE_MOUTH)
			// Check if mouth exists and is exposed
			if(!(bite_target.has_mouth() && bite_target.mouth_is_free()))
				to_chat(action_owner, span_warning("You can't find [bite_target]'s lips to bite them!"))
				return

			// Set region data normally
			target_zone_name = "lips"
			target_zone_check = FALSE
			target_zone_effects = TRUE

		if(BODY_ZONE_PRECISE_GROIN)
			target_zone_name = "groin"
			target_zone_check = FALSE

		if(BODY_ZONE_PRECISE_L_HAND)
			target_zone_name = "left wrist"

		if(BODY_ZONE_PRECISE_R_HAND)
			target_zone_name = "right wrist"

		if(BODY_ZONE_PRECISE_L_FOOT)
			target_zone_name = "left ankle"

		if(BODY_ZONE_PRECISE_R_FOOT)
			target_zone_name = "right ankle"

	// Check if target should be checked
	if(target_zone_check)
		// Check if bodypart exists
		if(!bite_bodypart)
			// Warn user and return
			to_chat(action_owner, span_warning("[bite_target] doesn't have a [target_zone_name] for you to bite!"))
			return

		// Check if bodypart is organic
		if(!bite_bodypart.is_organic_limb())
			// Display local message
			action_owner.visible_message(span_danger("[action_owner] tries to bite [bite_target]'s [target_zone_name], but is unable to penetrate the mechanical prosthetic!"), span_warning("You attempt to bite [bite_target]'s [target_zone_name], but can't penetrate the mechanical prosthetic!"))

			// Warn user
			to_chat(bite_target, span_warning("[action_owner] tries to bite your [target_zone_name], but is unable to penetrate the mechanical prosthetic!"))

			// Play metal hit sound
			playsound(bite_target, "sound/effects/clang[pick(1,2)].ogg", 30, 1, -2)

			// Start cooldown early to prevent spam
			StartCooldown()

			// Return without further effects
			return

	// Check for anti-magic
	if(bite_target.anti_magic_check(FALSE, TRUE, FALSE, 0))
		// Check for a dumb user
		if(action_owner_dumb)
			// Display local message
			action_owner.visible_message(span_danger("[action_owner] tries to bite [bite_target]'s [target_zone_name], but bursts into flames just as [action_owner.p_they()] come[action_owner.p_s()] into contact with [bite_target.p_them()]!"), span_userdanger("Surges of pain course through your body as you attempt to bite [bite_target]! What were you thinking?"))

			// Warn target
			to_chat(bite_target, span_warning("[action_owner] tries to bite you, but bursts into flames just as [action_owner.p_they()] come[action_owner.p_s()] into contact with you!"))

			// Stop grabbing
			action_owner.stop_pulling()

			// Ignite action owner
			action_owner.adjust_fire_stacks(2)
			action_owner.IgniteMob()

			// Return with no further effects
			return

		// Warn the user and target, then return
		to_chat(bite_target, span_warning("[action_owner] tries to bite your [target_zone_name], but stops before touching you!"))
		to_chat(action_owner, span_warning("[bite_target] is blessed! You stop just in time to avoid catching fire."))
		return

	// Check for garlic necklace or garlic in the bloodstream
	if(!blood_sucking_checks(bite_target, TRUE, TRUE))
		// Check for a dumb user
		if(action_owner_dumb)
			// Display local message
			action_owner.visible_message(span_danger("[action_owner] tries to bite [bite_target]'s [target_zone_name], but immediately recoils in disgust upon touching [bite_target.p_them()]!"), span_userdanger("An intense wave of disgust washes over your body as you attempt to bite [bite_target]! What were you thinking?"))

			// Warn target
			to_chat(bite_target, span_warning("[action_owner] tries to bite your [target_zone_name], but recoils in disgust just as [action_owner.p_they()] come[action_owner.p_s()] into contact with you!"))

			// Stop grabbing
			action_owner.stop_pulling()

			// Add disgust
			action_owner.adjust_disgust(10)

			// Vomit
			action_owner.vomit()

			// Return with no further effects
			return

		// Warn the user and target, then return
		to_chat(bite_target, span_warning("[action_owner] leans in to bite your [target_zone_name], but is warded off by your Allium Sativum!"))
		to_chat(action_owner, span_warning("You sense that [bite_target] is protected by Allium Sativum, and refrain from biting [bite_target.p_them()]."))
		return

	// Define bite target's blood volume
	var/target_blood_volume = bite_target.blood_volume

	// Check for sufficient blood volume
	if(target_blood_volume < BLOODFLEDGE_DRAIN_NUM)
		// Warn the user, then return
		to_chat(action_owner, span_warning("There's not enough blood in [bite_target]!"))
		return

	// Check if total blood would become too low
	if((target_blood_volume - BLOODFLEDGE_DRAIN_NUM) <= BLOOD_VOLUME_OKAY)
		// Check for a dumb user
		if(action_owner_dumb)
			// Warn the user, but allow
			to_chat(action_owner, span_warning("You pay no attention to [bite_target]'s blood volume, and bite [bite_target.p_their()] [target_zone_name] without hesitation."))

		// Check for aggressive grab
		else if(action_owner.grab_state < GRAB_AGGRESSIVE)
			// Warn the user, then return
			to_chat(action_owner, span_warning("You sense that [bite_target] is running low on blood. You'll need a tighter grip on [bite_target.p_them()] to continue."))
			return

		// Check for pacifist
		else if(HAS_TRAIT(action_owner, TRAIT_PACIFISM))
			// Warn the user, then return
			to_chat(action_owner, span_warning("You can't drain any more blood from [bite_target] without hurting [bite_target.p_them()]!"))
			return

	// Check for pierce immunity
	if(HAS_TRAIT(bite_target, TRAIT_PIERCEIMMUNE))
		// Display local chat message
		action_owner.visible_message(span_danger("[action_owner] tries to bite down on [bite_target]'s [target_zone_name], but can't seem to pierce [bite_target.p_them()]!"), span_danger("You try to bite down on [bite_target]'s [target_zone_name], but are completely unable to pierce [bite_target.p_them()]!"))

		// Warn bite target
		to_chat(bite_target, span_userdanger("[action_owner] tries to bite your [target_zone_name], but is unable to piece you!"))

		// Return without further effects
		return

	// Check for target zone special effects
	if(target_zone_effects)
		// Check if biting eyes or mouth
		if((target_zone == BODY_ZONE_PRECISE_EYES) || (target_zone == BODY_ZONE_PRECISE_MOUTH))
			// Check if biting target with proto-type face
			// Snout type is a string that cannot use subtype search
			if(findtext(bite_target.dna?.features["mam_snouts"], "Synthetic Lizard"))
				// Display local chat message
				action_owner.visible_message(span_notice("[action_owner]'s fangs clank harmlessly against [bite_target]'s face screen!"), span_notice("Your fangs clank harmlessly against [bite_target]'s face screen!"))

				// Play glass tap sound
				playsound(bite_target, 'sound/effects/Glasshit.ogg', 30, 1, -2)

				// Start cooldown early to prevent spam
				StartCooldown()

				// Return without further effects
				return

		// Check for strange bite regions
		switch(target_zone)
			// Zone is eyes
			if(BODY_ZONE_PRECISE_EYES)
				// Define target's eyes
				var/obj/item/organ/eyes/target_eyes = bite_target.getorganslot(ORGAN_SLOT_EYES)

				// Check if eyes exist
				if(target_eyes)
					// Display warning
					to_chat(bite_target, span_userdanger("Your [target_eyes] rupture in pain as [action_owner]'s fangs pierce their surface!"))

					// Blur vision
					bite_target.blur_eyes(10)

					// Add organ damage
					target_eyes.applyOrganDamage(20)

			// Zone is mouth
			if(BODY_ZONE_PRECISE_MOUTH)
				// Cause temporary stuttering
				bite_target.stuttering = 10

	// Display local chat message
	action_owner.visible_message(span_danger("[action_owner] bites down on [bite_target]'s [target_zone_name]!"), span_danger("You bite down on [bite_target]'s [target_zone_name]!"))

	// Play a bite sound effect
	playsound(action_owner, 'sound/weapons/bite.ogg', 30, 1, -2)

	// Check if bite target species has blood
	if(NOBLOOD in bite_target.dna?.species?.species_traits)
		// Warn the user and target
		to_chat(bite_target, span_warning("[action_owner] bit your [target_zone_name] in an attempt to drain your blood, but couldn't find any!"))
		to_chat(action_owner, span_warning("[bite_target] doesn't have any blood to drink!"))

		// Start cooldown early to prevent sound spam
		StartCooldown()

		// Return without effects
		return

	// Warn bite target
	to_chat(bite_target, span_userdanger("[action_owner] has bitten your [target_zone_name], and is trying to drain your blood!"))

	// Try to perform action timer
	if(!do_after(action_owner, time_interact, target = bite_target))
		// When failing
		// Display a local chat message
		action_owner.visible_message(span_danger("[action_owner]'s fangs are prematurely torn from [bite_target]'s [target_zone_name], spilling some of [bite_target.p_their()] blood!"), span_danger("Your fangs are prematurely torn from [bite_target]'s [target_zone_name], spilling some of [bite_target.p_their()] blood!"))

		// Bite target "drops" 20% of the blood
		// This creates large blood splatter
		bite_target.bleed((BLOODFLEDGE_DRAIN_NUM*0.2), FALSE)

		// Play splatter sound
		playsound(get_turf(target), 'sound/effects/splat.ogg', 40, 1)

		// Check for masochism
		if(!HAS_TRAIT(bite_target, TRAIT_MASO))
			// Force bite_target to play the scream emote
			bite_target.emote("scream")

		// Log the biting action failure
		log_combat(action_owner,bite_target,"bloodfledge bitten (interrupted)")

		// Add target's blood to quirk holder and themselves
		bite_target.add_mob_blood(bite_target)
		action_owner.add_mob_blood(bite_target)

		// Check if body part is valid for bleeding
		// This reuses the dismember-able check
		if(target_zone_check)
			// Cause minor bleeding
			bite_bodypart.generic_bleedstacks += 2

			// Apply minor damage
			bite_bodypart.receive_damage(brute = rand(4,8), sharpness = SHARP_POINTY)

		// Start cooldown early
		// This is to prevent bite interrupt spam
		StartCooldown()

		// Return
		return

	// Variable for species with non-blood blood volumes
	var/blood_valid = TRUE

	// Variable for gaining blood volume
	var/blood_transfer = FALSE

	// Name of blood volume to be taken
	// Action owner assumes blood until after drinking
	var/blood_name = "blood"

	// Check if target has exotic blood
	if(bite_target.dna?.species?.exotic_bloodtype)
		// Define blood types for owner and target
		var/blood_type_owner = action_owner.dna?.species?.exotic_bloodtype
		var/blood_type_target = bite_target.dna?.species?.exotic_bloodtype

		// Define if blood types match
		var/blood_type_match = (blood_type_owner == blood_type_target ? TRUE : FALSE)

		// Check if types matched
		if(blood_type_match)
			// Add positive mood
			SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_exotic_match", /datum/mood_event/drank_exotic_matched)

		// Switch for target's blood type
		switch(blood_type_target)
			// Synth blood
			if("S")
				// Mark blood as invalid
				blood_valid = FALSE

				// Set blood type name
				blood_name = "coolant"

				// Check if blood types match
				if(blood_type_match)
					// Allow transferring blood from this
					blood_transfer = TRUE

				// Blood types do not match
				else
					// Warn the user
					to_chat(action_owner, span_warning("That didn't taste like blood at all..."))

					// Add disgust
					action_owner.adjust_disgust(2)

					// Cause negative mood
					SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_synth", /datum/mood_event/drankblood_synth)

			// Slime blood
			if("GEL")
				// Mark blood as invalid
				blood_valid = FALSE

				// Allow transferring blood from this
				blood_transfer = TRUE

				// Set blood type name
				blood_name = "slime"

				// Check if blood types match
				if(!blood_type_match)
					// Cause negative mood
					SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_slime", /datum/mood_event/drankblood_slime)

			// Bug blood
			if("BUG")
				// Set blood type name
				blood_name = "hemolymph"

				// Check if blood types match
				if(!blood_type_match)
					// Mark blood as invalid
					blood_valid = FALSE

					// Cause negative mood
					SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_insect", /datum/mood_event/drankblood_insect)

			// Xenomorph blood
			if("X*")
				// Set blood type name
				blood_name = "xeno blood"

				// Check if blood types match
				if(!blood_type_match)
					// Mark blood as invalid
					blood_valid = FALSE

					// Cause negative mood
					SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_xeno", /datum/mood_event/drankblood_xeno)

			// Lizard blood
			if("L")
				// Set blood type name
				blood_name = "reptilian blood"

	// End of exotic blood checks

	// Define user's remaining capacity to absorb blood
	var/blood_volume_difference = BLOOD_VOLUME_MAXIMUM - action_owner.blood_volume
	var/drained_blood = min(target_blood_volume, BLOODFLEDGE_DRAIN_NUM, blood_volume_difference)

	// Transfer reagents from target to action owner
	// Limited to a maximum 10% of bite amount (default 10u)
	bite_target.reagents.trans_to(action_owner, (drained_blood*0.1))

	// Alert the bite target and local user of success
	// Yes, this is AFTER the message for non-valid blood
	to_chat(bite_target, span_danger("[action_owner] has taken some of your [blood_name]!"))
	to_chat(action_owner, span_notice("You've drained some of [bite_target]'s [blood_name]!"))

	// Check if action owner received valid (nourishing) blood
	if(blood_valid)
		// Add blood reagent to reagent holder
		blood_bank.add_reagent(/datum/reagent/blood/, drained_blood, bite_target.get_blood_data())

		// Set reaction type to INGEST
		blood_bank.reaction(action_owner, INGEST)

		// Transfer reagent to action owner
		blood_bank.trans_to(action_owner, drained_blood)

		// Remove all reagents
		blood_bank.remove_all()

	// Check if blood transfer should occur
	else if(blood_transfer)
		// Check if action holder's blood volume limit was exceeded
		if(action_owner.blood_volume >= BLOOD_VOLUME_MAXIMUM)
			// Warn user
			to_chat(action_owner, span_warning("You body cannot integrate any more [blood_name]. The remainder will be lost."))

		// Blood volume limit was not exceeded
		else
			// Alert user
			to_chat(action_owner, span_notice("You body integrates the [blood_name] directly, instead of processing it into nutrition."))

		// Transfer blood directly
		bite_target.transfer_blood_to(action_owner, drained_blood, TRUE)

		// Set drain amount to none
		// This prevents double removal
		drained_blood = 0

	// Valid blood was not received
	// No direct blood transfer occurred
	else
		// Warn user of failure
		to_chat(action_owner, span_warning("Your body cannot process the [blood_name] into nourishment!"))

	// Remove blood from bite target
	bite_target.blood_volume = clamp(target_blood_volume - drained_blood, 0, BLOOD_VOLUME_MAXIMUM)

	// Play a heartbeat sound effect
	// This was changed to match bloodsucker
	playsound(action_owner, 'sound/effects/singlebeat.ogg', 30, 1, -2)

	// Log the biting action success
	log_combat(action_owner,bite_target,"bloodfledge bitten (successfully), transferring [blood_name]")

	// Mood events
	// Check if bite target is dead or undead
	if((bite_target.stat >= DEAD) || (bite_target.mob_biotypes & MOB_UNDEAD))
		// Warn the user
		to_chat(action_owner, span_warning("The rotten [blood_name] tasted foul."))

		// Add disgust
		action_owner.adjust_disgust(2)

		// Cause negative mood
		SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_dead", /datum/mood_event/drankblood_dead)

	// Check if bite target's blood has been depleted
	if(!bite_target.blood_volume)
		// Warn the user
		to_chat(action_owner, span_warning("You've depleted [bite_target]'s [blood_name] supply!"))

		// Cause negative mood
		SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_killed", /datum/mood_event/drankkilled)

	// Check if bite target has cursed blood
	if(HAS_TRAIT(bite_target, TRAIT_CURSED_BLOOD))
		// Check action owner for cursed blood
		var/owner_cursed = HAS_TRAIT(action_owner, TRAIT_CURSED_BLOOD)

		// Set chat message based on action owner's trait status
		var/warn_message = (owner_cursed ? "You taste the unholy touch of a familiar curse in [bite_target]\'s blood." : "You experience a sensation of intense dread just after drinking from [bite_target]. Something about their blood feels... wrong.")

		// Alert user in chat
		to_chat(action_owner, span_notice(warn_message))

		// Set mood type based on curse status
		var/mood_type = (owner_cursed ? /datum/mood_event/drank_cursed_good : /datum/mood_event/drank_cursed_bad)

		// Cause mood event
		SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_cursed_blood", mood_type)

	// Start cooldown
	StartCooldown()

// Action: Revive
/datum/action/cooldown/bloodfledge/revive
	name = "Fledgling Revive"
	desc = "Expend all of your remaining energy to escape death."
	button_icon_state = "power_strength"
	cooldown_time = BLOODFLEDGE_COOLDOWN_REVIVE

/datum/action/cooldown/bloodfledge/revive/Trigger()
	. = ..()

	// Check parent return
	if(!.)
		return

	// Define mob
	var/mob/living/carbon/human/action_owner = owner

	// Early check for being dead
	// Users are most likely to click this while alive
	if(action_owner.stat != DEAD)
		// Warn user in chat
		to_chat(action_owner, "You can't use this ability while alive!")

		// Return
		return

	// Define failure message
	var/revive_failed

	// Condition: Mob isn't in a closed coffin
	if(!istype(action_owner.loc, /obj/structure/closet/crate/coffin))
		revive_failed += "\n- You need to be in a closed coffin!"

	// Condition: Insufficient nutrition (blood)
	if(action_owner.nutrition <= NUTRITION_LEVEL_STARVING)
		revive_failed += "\n- You don't have enough blood left!"

	/*
	 * Removed to buff revivals
	 *
	// Condition: Can be revived
	// This is used by revive(), and must be checked here to prevent false feedback
	if(!action_owner.can_be_revived())
		revive_failed += "\n- Your body is too weak to sustain life!"

	// Condition: Damage limit, brute
	if(action_owner.getBruteLoss() >= MAX_REVIVE_BRUTE_DAMAGE)
		revive_failed += "\n- Your body is too battered!"

	// Condition: Damage limit, burn
	if(action_owner.getFireLoss() >= MAX_REVIVE_FIRE_DAMAGE)
		revive_failed += "\n- Your body is too badly burned!"
	*/

	// Condition: Suicide
	if(action_owner.suiciding)
		revive_failed += "\n- You chose this path."

	// Condition: No revivals
	if(HAS_TRAIT(action_owner, TRAIT_NOCLONE))
		revive_failed += "\n- You only had one chance."

	// Condition: Demonic contract
	if(action_owner.hellbound)
		revive_failed += "\n- The soul pact must be honored."

	// Check for failure
	if(revive_failed)
		// Set combined message
		revive_failed = span_warning("You can't revive right now because: [revive_failed]")

		// Alert user in chat of failure
		to_chat(action_owner, revive_failed)

		// Return
		return

	// Check if health is too low to use revive()
	if(action_owner.health <= HEALTH_THRESHOLD_DEAD)
		// Set health high enough to revive
		// Based on defib.dm

		// Define damage values
		var/damage_brute = action_owner.getBruteLoss()
		var/damage_burn = action_owner.getFireLoss()
		var/damage_tox = action_owner.getToxLoss()
		var/damage_oxy = action_owner.getOxyLoss()
		var/damage_clone = action_owner.getCloneLoss()
		var/damage_brain = action_owner.getOrganLoss(ORGAN_SLOT_BRAIN)

		// Define total damage
		var/damage_total = damage_brute + damage_burn + damage_tox + damage_oxy + damage_brain + damage_clone

		// Define to prevent redundant math
		var/health_half_crit = action_owner.health - HALFWAYCRITDEATH

		// Adjust damage types
		action_owner.adjustOxyLoss(health_half_crit * (damage_oxy / damage_total), 0)
		action_owner.adjustToxLoss(health_half_crit * (damage_tox / damage_total), 0)
		action_owner.adjustFireLoss(health_half_crit * (damage_burn / damage_total), 0)
		action_owner.adjustBruteLoss(health_half_crit * (damage_brute / damage_total), 0)
		action_owner.adjustCloneLoss(health_half_crit * (damage_clone / damage_total), 0)
		action_owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, health_half_crit * (damage_brain / damage_total))

		// Update health
		action_owner.updatehealth()

	// Check if revival is possible
	// This is used by revive(), and must be checked here to prevent false feedback
	if(!action_owner.can_be_revived())
		// Warn user
		to_chat(action_owner, span_warning("Despite your body's best attempts at mending, it remains too weak to revive! Something this terrible shouldn't be possible!"))

		// Start cooldown anyway, since healing was performed
		StartCooldown()

		// Return without revival
		return

	// Define time dead
	// Used for revive policy
	var/time_dead = world.time - action_owner.timeofdeath

	// Revive the action owner
	action_owner.revive()

	// Alert the user in chat of success
	action_owner.visible_message(span_notice("An ominous energy radiates from the [action_owner.loc]..."), span_warning("You've expended all remaining blood to bring your body back to life!"))

	// Play a haunted sound effect
	playsound(action_owner, 'sound/hallucinations/growl1.ogg', 30, 1, -2)

	// Remove all nutrition (blood)
	action_owner.set_nutrition(0)

	// Apply daze effect
	action_owner.Daze(20)

	// Define time limit for revival
	// Determines memory loss, using defib time and policies
	var/revive_time_limit = CONFIG_GET(number/defib_cmd_time_limit) * 10

	// Define revive time threshold
	// Late causes memory loss, according to policy
	var/time_late = revive_time_limit && (time_dead > revive_time_limit)

	// Define policy to use
	var/list/policies = CONFIG_GET(keyed_list/policy)
	var/time_policy = time_late? policies[POLICYCONFIG_ON_DEFIB_LATE] : policies[POLICYCONFIG_ON_DEFIB_INTACT]

	// Check if policy exists
	if(time_policy)
		// Alert user in chat of policy
		to_chat(action_owner, time_policy)

	// Log the revival and effective policy
	action_owner.log_message("revived using a vampire quirk ability after being dead for [time_dead] deciseconds. Considered [time_late? "late" : "memory-intact"] revival under configured policy limits.", LOG_GAME)

	// Start cooldown
	StartCooldown()

//
// Quirk: Werewolf
//

/datum/action/cooldown/werewolf
	name = "Werewolf Ability"
	desc = "Do something related to werewolves."
	icon_icon = 'modular_splurt/icons/mob/actions/misc_actions.dmi'
	button_icon_state = "Transform"
	check_flags = AB_CHECK_RESTRAINED | AB_CHECK_STUN | AB_CHECK_CONSCIOUS | AB_CHECK_ALIVE
	cooldown_time = 5 SECONDS
	transparent_when_unavailable = TRUE

/datum/action/cooldown/werewolf/transform
	name = "Toggle Werewolf Form"
	desc = "Transform in or out of your wolf form."
	var/transformed = FALSE
	var/species_changed = FALSE
	var/werewolf_gender = "Lycan"
	var/list/old_features

/datum/action/cooldown/werewolf/transform/Grant()
	. = ..()

	// Define carbon owner
	var/mob/living/carbon/action_owner_carbon = owner

	// Define parent quirk
	var/datum/quirk/werewolf/quirk_data = locate() in action_owner_carbon.roundstart_quirks

	// Check if data was copied
	if(!quirk_data)
		// Log error and return
		log_game("Failed to get species data for werewolf action!")
		return

	// Define stored features
	old_features = quirk_data.old_features.Copy()

	// Define action owner
	var/mob/living/carbon/human/action_owner = owner

	// Set species gendered name
	switch(action_owner.gender)
		if(MALE)
			werewolf_gender = "Wer"
		if(FEMALE)
			werewolf_gender = "Wīf"
		if(PLURAL)
			werewolf_gender = "Hie"
		if(NEUTER)
			werewolf_gender = "Þing"

/datum/action/cooldown/werewolf/transform/Trigger()
	. = ..()

	// Check if unavailable
	// Checks the parent function's return value
	if(!.)
		// Messages will not display here
		return FALSE

	// Define action owner
	var/mob/living/carbon/human/action_owner = owner

	// Check for restraints
	if(!CHECK_MOBILITY(action_owner, MOBILITY_USE))
		// Warn user, then return
		action_owner.visible_message(span_warning("You cannot transform while restrained!"))
		return

	// Define citadel organs
	var/obj/item/organ/genital/penis/organ_penis = action_owner.getorganslot(ORGAN_SLOT_PENIS)
	var/obj/item/organ/genital/breasts/organ_breasts = action_owner.getorganslot(ORGAN_SLOT_BREASTS)
	var/obj/item/organ/genital/vagina/organ_vagina = action_owner.getorganslot(ORGAN_SLOT_VAGINA)

	// Play shake animation
	action_owner.shake_animation(2)

	// Transform into wolf form
	if(!transformed)
		// Define current species type
		var/datum/species/owner_species = action_owner.dna.species.type

		// Check if species has changed
		if(old_features["species"] != owner_species)
			// Set old species
			old_features["species"] = owner_species

		// Define species prefix
		var/custom_species_prefix

		// Check if species is mammal (anthro)
		if(ismammal(action_owner))
			// Do nothing!

		// Check if species is already a mammal sub-type
		else if(ispath(owner_species, /datum/species/mammal))
			// Do nothing!

		// Check if species is a jelly
		else if(isjellyperson(action_owner))
			// Set species prefix
			custom_species_prefix = "Jelly "

		// Check if species is a jelly subtype
		else if(ispath(owner_species, /datum/species/jelly))
			// Set species prefix
			custom_species_prefix = "Slime "

		// Species is not a mammal
		else
			// Change species
			action_owner.set_species(/datum/species/mammal, 1)

			// Set species changed
			species_changed = TRUE

		// Set species features
		action_owner.dna.custom_species = "[custom_species_prefix][werewolf_gender]wulf"
		action_owner.dna.species.mutant_bodyparts["mam_tail"] = "Otusian"
		action_owner.dna.species.mutant_bodyparts["legs"] = "Digitigrade"
		action_owner.Digitigrade_Leg_Swap(FALSE)
		action_owner.dna.species.mutant_bodyparts["mam_snouts"] = "Sergal"
		action_owner.dna.features["mam_ears"] = "Jackal"
		action_owner.dna.features["mam_tail"] = "Otusian"
		action_owner.dna.features["mam_snouts"] = "Sergal"
		action_owner.dna.features["legs"] = "Digitigrade"
		action_owner.dna.features["insect_fluff"] = "Hyena"
		action_owner.update_size(clamp(get_size(action_owner) + 0.5, RESIZE_MICRO, RESIZE_MACRO))
		action_owner.set_bark("bark")
		if(old_features["taur"] != "None")
			action_owner.dna.features["taur"] = "Canine"
		if(!(action_owner.dna.species.species_traits.Find(DIGITIGRADE)))
			action_owner.dna.species.species_traits += DIGITIGRADE
		action_owner.update_body()
		action_owner.update_body_parts()

		// Update possible citadel organs
		if(organ_breasts)
			organ_breasts.color = "#[action_owner.dna.features["mcolor"]]"
			organ_breasts.update()
		if(organ_penis)
			organ_penis.shape = "Knotted"
			organ_penis.color = "#ff7c80"
			organ_penis.update()
			organ_penis.modify_size(6)
		if(organ_vagina)
			organ_vagina.shape = "Furred"
			organ_vagina.color = "#[action_owner.dna.features["mcolor"]]"
			organ_vagina.update()

	// Un-transform from wolf form
	else
		// Check if species was already mammal (anthro)
		if(!species_changed)
			// Do nothing!

		// Species was not a mammal
		else
			// Revert species
			action_owner.set_species(old_features["species"], TRUE)

			// Clear species changed flag
			species_changed = FALSE

		// Revert species trait
		action_owner.set_bark(old_features["bark"])
		action_owner.dna.custom_species = old_features["custom_species"]
		action_owner.dna.features["mam_ears"] = old_features["mam_ears"]
		action_owner.dna.features["mam_snouts"] = old_features["mam_snouts"]
		action_owner.dna.features["mam_tail"] = old_features["mam_tail"]
		action_owner.dna.features["legs"] = old_features["legs"]
		action_owner.dna.features["insect_fluff"] = old_features["insect_fluff"]
		action_owner.dna.species.eye_type = old_features["eye_type"]
		if(old_features["taur"] != "None")
			action_owner.dna.features["taur"] = old_features["taur"]
		if(old_features["legs"] == "Plantigrade")
			action_owner.dna.species.species_traits -= DIGITIGRADE
			action_owner.Digitigrade_Leg_Swap(TRUE)
			action_owner.dna.species.mutant_bodyparts["legs"] = old_features["legs"]
		action_owner.update_body()
		action_owner.update_body_parts()
		action_owner.update_size(clamp(get_size(action_owner) - 0.5, RESIZE_MICRO, RESIZE_MACRO))

		// Revert citadel organs
		if(organ_breasts)
			organ_breasts.color = "#[old_features["breasts_color"]]"
			organ_breasts.update()
		if(action_owner.has_penis())
			organ_penis.shape = old_features["cock_shape"]
			organ_penis.color = "#[old_features["cock_color"]]"
			organ_penis.update()
			organ_penis.modify_size(-6)
		if(action_owner.has_vagina())
			organ_vagina.shape = old_features["vag_shape"]
			organ_vagina.color = "#[old_features["vag_color"]]"
			organ_vagina.update()
			organ_vagina.update_size()

	// Set transformation message
	var/owner_p_their = action_owner.p_their()
	var/toggle_message = (!transformed ? "[action_owner] shivers, [owner_p_their] flesh bursting with a sudden growth of thick fur as [owner_p_their] features contort to that of a beast, fully transforming [action_owner.p_them()] into a werewolf!" : "[action_owner] shrinks, [owner_p_their] wolfish features quickly receding.")

	// Alert in local chat
	action_owner.visible_message(span_danger(toggle_message))

	// Toggle transformation state
	transformed = !transformed

	// Start cooldown
	StartCooldown()

	// Return success
	return TRUE

//
// Quirk: Gargoyle
//

/datum/action/gargoyle/transform
	name = "Transform"
	desc = "Transform into a statue, regaining energy in the process. Additionally, you will slowly heal while in statue form."
	icon_icon = 'icons/mob/actions/actions_changeling.dmi'
	button_icon_state = "ling_camouflage"
	var/obj/structure/statue/gargoyle/current = null


/datum/action/gargoyle/transform/Trigger()
	.=..()
	var/mob/living/carbon/human/H = owner
	var/datum/quirk/gargoyle/T = locate() in H.roundstart_quirks
	if(!T.cooldown)
		if(!T.transformed)
			if(!isturf(H.loc))
				return 0
			var/obj/structure/statue/gargoyle/S = new(H.loc, H)
			S.name = "statue of [H.name]"
			H.bleedsuppress = 1
			S.copy_overlays(H)
			var/newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))
			S.add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)
			current = S
			T.transformed = 1
			T.cooldown = 30
			T.paused = 0
			S.dir = H.dir
			return 1
		else
			qdel(current)
			T.transformed = 0
			T.cooldown = 30
			T.paused = 0
			H.visible_message(span_warning("[H]'s skin rapidly softens, returning them to normal!"), span_userdanger("Your skin softens, freeing your movement once more!"))
	else
		to_chat(H, span_warning("You have transformed too recently; you cannot yet transform again!"))
		return 0

/datum/action/gargoyle/check
	name = "Check"
	desc = "Check your current energy levels."
	icon_icon = 'icons/mob/actions/actions_clockcult.dmi'
	button_icon_state = "Linked Vanguard"

/datum/action/gargoyle/check/Trigger()
	.=..()
	var/mob/living/carbon/human/H = owner
	var/datum/quirk/gargoyle/T = locate() in H.roundstart_quirks
	to_chat(H, span_warning("You have [T.energy]/100 energy remaining!"))

/datum/action/gargoyle/pause
	name = "Preserve"
	desc = "Become near-motionless, thusly conserving your energy until you move from your current tile. Note, you will lose a chunk of energy when you inevitably move from your current position, so you cannot abuse this!"
	icon_icon = 'icons/mob/actions/actions_flightsuit.dmi'
	button_icon_state = "flightsuit_lock"

/datum/action/gargoyle/pause/Trigger()
	.=..()
	var/mob/living/carbon/human/H = owner
	var/datum/quirk/gargoyle/T = locate() in H.roundstart_quirks

	if(!T.paused)
		T.paused = 1
		T.position = H.loc
		to_chat(H, span_warning("You are now conserving your energy; this effect will end the moment you move from your current position!"))
		return
	else
		to_chat(H, span_warning("You are already conserving your energy!"))

//Quirk: Cosmetic Glow
//Copy and pasted. Cry about it.
/datum/action/cosglow
	name = "Broken Glow Action"
	desc = "Report this to a coder."
	icon_icon = 'icons/effects/effects.dmi'
	button_icon_state = "static"

/datum/action/cosglow/update_glow
	name = "Modify Glow"
	desc = "Change your glow color."
	button_icon_state = "blank"

	// Glow color to use
	var/glow_color

	// Thickness of glow outline
	var/glow_range


/datum/action/cosglow/update_glow/Grant()
	. = ..()

	// Define user mob
	var/mob/living/carbon/human/action_mob = owner

	// Add outline effect
	action_mob.add_filter("rad_fiend_glow", 1, list("type" = "outline", "color" = glow_color+"30", "size" = glow_range))

/datum/action/cosglow/update_glow/Remove()
	. = ..()

	// Define user mob
	var/mob/living/carbon/human/action_mob = owner

	// Remove glow
	action_mob.remove_filter("rad_fiend_glow")

/datum/action/cosglow/update_glow/Trigger()
	. = ..()

	// Define user mob
	var/mob/living/carbon/human/action_mob = owner

	// Ask user for color input
	var/input_color = input(action_mob, "Select a color to use for your glow outline.", "Select Glow Color", glow_color) as color|null

	// Check if color input was given
	// Reset to stored color when not given input
	glow_color = (input_color ? input_color : glow_color)

	// Ask user for range input
	var/input_range = input(action_mob, "How much do you glow? Value may range between 1 to 2.", "Select Glow Range", glow_range) as num|null

	// Check if range input was given
	// Reset to stored color when not given input
	// Input is clamped in the 1-4 range
	glow_range = (input_range ? clamp(input_range, 0, 4) : glow_range) //More customisable, so you know when you're looking at someone with Radfiend (doom) or a normal player.

	// Update outline effect
	action_mob.remove_filter("rad_fiend_glow")
	action_mob.add_filter("rad_fiend_glow", 1, list("type" = "outline", "color" = glow_color+"30", "size" = glow_range))

//
// Quirk: Rad Fiend
//

/datum/action/rad_fiend
	name = "Broken Rad Action"
	desc = "Report this to a coder."
	icon_icon = 'icons/effects/effects.dmi'
	button_icon_state = "static"

/datum/action/rad_fiend/update_glow
	name = "Modify Glow"
	desc = "Change your radioactive glow color."
	button_icon_state = "blank"

	// Glow color to use
	var/glow_color = "#39ff14" // Neon green

	// Thickness of glow outline
	var/glow_range = 2


/datum/action/rad_fiend/update_glow/Grant()
	. = ..()

	// Define user mob
	var/mob/living/carbon/human/action_mob = owner

	// Add outline effect
	action_mob.add_filter("rad_fiend_glow", 1, list("type" = "outline", "color" = glow_color+"30", "size" = glow_range))

/datum/action/rad_fiend/update_glow/Remove()
	. = ..()

	// Define user mob
	var/mob/living/carbon/human/action_mob = owner

	// Remove glow
	action_mob.remove_filter("rad_fiend_glow")

/datum/action/rad_fiend/update_glow/Trigger()
	. = ..()

	// Define user mob
	var/mob/living/carbon/human/action_mob = owner

	// Ask user for color input
	var/input_color = input(action_mob, "Select a color to use for your glow outline.", "Select Glow Color", glow_color) as color|null

	// Check if color input was given
	// Reset to stored color when not given input
	glow_color = (input_color ? input_color : glow_color)

	// Ask user for range input
	var/input_range = input(action_mob, "How much do you glow? Value may range between 1 to 2.", "Select Glow Range", glow_range) as num|null

	// Check if range input was given
	// Reset to stored color when not given input
	// Input is clamped in the 1-4 range
	glow_range = (input_range ? clamp(input_range, 1, 4) : glow_range)

	// Update outline effect
	action_mob.remove_filter("rad_fiend_glow")
	action_mob.add_filter("rad_fiend_glow", 1, list("type" = "outline", "color" = glow_color+"30", "size" = glow_range))

/datum/action/ropebunny/conversion
	name = "Convert Bondage"
	desc = "Convert five cloth into bondage rope, or convert bondage ropes into bondage bolas."
	icon_icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	button_icon_state = "ballgag"

/datum/action/ropebunny/conversion/Trigger()
	.=..()
	var/mob/living/carbon/human/H = owner
	var/obj/item/I = H.get_active_held_item()

	if(istype(I,/obj/item/stack/sheet/cloth))
		var/obj/item/stack/sheet/cloth/C = I
		if(C.amount < 5)
			to_chat(H, span_warning("There is not enough cloth left to make more rope!"))
			return
		else
			C.amount -= 5
			new /obj/item/restraints/bondage_rope(H.loc)
			to_chat(H, span_warning("You successfully create a set of bondage ropes."))
			return
	if(istype(I,/obj/item/restraints/bondage_rope))
		new /obj/item/shibola(H.loc)
		to_chat(H, span_warning("You successfully create a shibari bola."))
		qdel(I)
		return
	else
		to_chat(H, span_warning("You must either be holding cloth or a bondage rope to use this ability!"))

/mob/living/proc/alterlimbs()
	set name = "Alter Limbs"
	set desc = "Remove or attach a limb!"
	set category = "IC"
	set src in view(usr.client)

	var/mob/living/carbon/human/U = usr
	var/mob/living/carbon/human/C = src

	var/obj/item/I = U.get_active_held_item()
	if(istype(I,/obj/item/bodypart))
		var/obj/item/bodypart/L = I
		if(!C.Adjacent(U))
			to_chat(U, span_warning("You must be adjacent to [C] to do this!"))
			return
		if(C.get_bodypart(L.body_zone))
			to_chat(U, span_warning("[C] already has a limb attached there!"))
			return
		C.visible_message(span_warning("[U] is attempting to attach [L] onto [C]!"), span_userdanger("[U] is attempting to re-attach one of your limbs!"))
		if(do_after(U, 40, target = C) && C.Adjacent(U))
			L.attach_limb(C)
			C.visible_message(span_warning("[U] successfully attaches [L] onto [C]"), span_userdanger("[U] has successfully attached a [L.name] onto you; you can use that limb again!"))
			return
		else
			to_chat(U, span_warning("You and [C] must both stand still for you to remove one of their limbs!"))
			return
	else
		if(!C.Adjacent(U))
			to_chat(U, span_warning("You must be adjacent to [C] to do this!"))
			return
		if(U.zone_selected == BODY_ZONE_CHEST || U.zone_selected == BODY_ZONE_HEAD)
			to_chat(U, span_warning("You must target either an arm or a leg!"))
			return
		if(U.zone_selected == BODY_ZONE_PRECISE_GROIN || U.zone_selected == BODY_ZONE_PRECISE_EYES || U.zone_selected == BODY_ZONE_PRECISE_MOUTH)
			to_chat(U, span_warning("There is no limb here; select an arm or a leg!"))
			return
		if(!C.get_bodypart(U.zone_selected))
			to_chat(U, span_warning("They are already missing that limb!"))
			return
		C.visible_message(span_warning("[U] is attempting to remove one of [C]'s limbs!"), span_userdanger("[U] is attempting to disconnect one of your limbs!"))
		var/obj/item/bodypart/B = C.get_bodypart(U.zone_selected)
		if(C.Adjacent(U) && do_after(U, 40, target = C))
			var/obj/item/bodypart/D = C.get_bodypart(U.zone_selected)
			if(B != D)
				to_chat(U, span_warning("You cannot target a different limb while already removing another!"))
				return
			D.drop_limb()
			C.update_equipment_speed_mods()
			C.visible_message(span_warning("[U] smoothly disconnects [C]'s [D.name]!"), span_userdanger("[U] has forcefully disconnected your [D.name]!"))
			return
		else
			to_chat(U, span_warning("You and [C] must both stand still for you to remove one of their limbs!"))
			return

/datum/action/cooldown/toggle_distant
	name = "Toggle Distant"
	desc = "Allows you to let your headpat-guard down, or put it back up."
	icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
	button_icon_state = "pain_max"

/datum/action/cooldown/toggle_distant/Trigger()
	. = ..()
	if(!.)
		return

	var/mob/living/carbon/human/action_owner = owner

	if(HAS_TRAIT(action_owner, TRAIT_DISTANT))
		REMOVE_TRAIT(action_owner, TRAIT_DISTANT, ROUNDSTART_TRAIT)
		to_chat(action_owner, span_notice("You let your headpat-guard down!"))
	else
		ADD_TRAIT(action_owner, TRAIT_DISTANT, ROUNDSTART_TRAIT)
		to_chat(action_owner, span_warning("You let your headpat-guard up!"))

#undef HYPNOEYES_COOLDOWN_NORMAL
#undef HYPNOEYES_COOLDOWN_BRAINWASH
