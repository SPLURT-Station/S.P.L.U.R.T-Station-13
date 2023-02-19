#define BLOODFLEDGE_DRAIN_NUM 50
#define BLOODFLEDGE_COOLDOWN_BITE 60

//
// Quirk: Hypnotic Gaze
//

/datum/action/innate/Hypnotize
	name = "Hypnotize"
	desc = "Stare deeply into someone's eyes, drawing them into a hypnotic slumber."
	button_icon_state = "Hypno_eye"
	icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
	background_icon_state = "bg_alien"

/datum/action/innate/Hypnotize/Activate()
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
		to_chat(action_owner, span_warning("You can't hypnotize a cyborg!"))
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
		to_chat(action_owner, span_warning("You can't hypnotize the dead!"))
		return

	// Check for aggressive grab
	if(action_owner.grab_state < GRAB_AGGRESSIVE)
		// Warn the user, then return
		to_chat(action_owner, span_warning("You need a stronger grip before trying this!"))
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
		to_chat(action_owner, span_warning("You have difficulty focusing on [action_target]'s eyes due to some form of protection, and are left unable to hypnotize them."))
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
		to_chat(action_owner, span_warning("You can't hypnotize [action_target] whilst [action_target.p_theyre()] asleep!"))
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
		to_chat(action_owner, span_warning("You lose concentration on [action_target], and fail to hypnotize [action_target.p_them()]!"))
		to_chat(action_target, span_notice("[action_owner]'s gaze is broken prematurely, freeing you from any potential effects."))
		return

	// Define blank response
	var/input_consent

	// Check for non-consensual setting
	if(action_target.client?.prefs.nonconpref != "Yes")
		// Non-consensual is NOT enabled
		// Prompt target for consent response
		input_consent = alert(action_target, "Will you fall into a hypnotic stupor? This will allow [action_owner] to issue hypnotic suggestions.", "Hypnosis", "Yes", "No")

	// When consent is denied
	if(input_consent == "No")
		// Warn the users, then return
		to_chat(action_owner, span_warning("[action_target]'s attention breaks, despite the attempt to hypnotize [action_target.p_them()]! [action_target.p_they()] clearly don't want this!"))
		to_chat(action_target, span_notice("Your concentration breaks as you realize you have no interest in following [action_owner]'s words!"))
		return

	// Display local message
	action_target.visible_message(span_warning("[action_target] falls into a deep slumber!"), span_danger("Your eyelids gently shut as you fall into a deep slumber. All you can hear is [action_owner]'s voice as you commit to following all of their suggestions."))

	// Set sleeping
	action_target.SetSleeping(1200)

	// Set drowsiness
	action_target.drowsyness = max(action_target.drowsyness, 40)

	// Prompt action owner for response
	var/input_suggestion = input("What would you like to suggest [action_target] do? Leave blank to release [action_target.p_them()] instead.", "Hypnotic suggestion", null, null)
		
	// Check if input text exists
	if(!input_suggestion)
		// Alert user of no input
		to_chat(action_owner, "You decide not to give [action_target] a suggestion.")

		// Remove sleep, then return
		action_target.SetSleeping(0)
		return

	// Sanitize input text
	input_suggestion = sanitize(input_suggestion)

	// Display message to users
	to_chat(action_owner, "You whisper your suggestion in a smooth calming voice to [action_target]")
	to_chat(action_target, span_hypnophrase("...[input_suggestion]..."))

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
/datum/action/bloodfledge
	name = "Broken Bloodfledge Ability"
	desc = "You shouldn't be seeing this!"
	button_icon_state = "power_torpor"
	background_icon_state = "vamp_power_off"
	buttontooltipstyle = "cult"
	icon_icon = 'icons/mob/actions/bloodsucker.dmi'
	button_icon = 'icons/mob/actions/bloodsucker.dmi'

// Action: Bite
/datum/action/bloodfledge/bite
	name = "Fledgling Bite"
	desc = "Sink your vampiric fangs into the person you are grabbing, and attempt to drink their blood."
	button_icon_state = "power_feed"
	var/drain_cooldown = 0

/datum/action/bloodfledge/bite/Trigger()
	. = ..()

	// Check for carbon owner
	if(!iscarbon(owner))
		return

	// Define action owner
	var/mob/living/carbon/action_owner = owner

	// Check for cooldown
	if(drain_cooldown >= world.time)
		// Warn the user, then return
		to_chat(action_owner, span_notice("That ability isn't ready yet."))
		return

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

	// Define pulled target
	var/pull_target = action_owner.pulling

	// Define bite target
	var/mob/living/carbon/bite_target

	// Check if the target is carbon
	if(iscarbon(pull_target))
		// Set the bite target
		bite_target = pull_target

	// Or cocooned carbon
	else if(istype(pull_target,/obj/structure/arachnid/cocoon))
		// Define if cocoon has a valid target
		// This cannot use pull_target
		var/possible_cocoon_target = locate(/mob/living/carbon) in action_owner.pulling.contents

		// Check defined cocoon target
		if(possible_cocoon_target)
			// Set the bite target
			bite_target = possible_cocoon_target

	// Or a blood tomato
	else if(istype(pull_target,/obj/item/reagent_containers/food/snacks/grown/tomato/blood))
		// Warn the user, then return
		to_chat(action_owner, span_danger("You plunge your fangs into [pull_target]! It's not very nutritious."))
		return

		// This doesn't actually interact with the item

	// Or none of the above
	else
		// Warn the user, then return
		to_chat(action_owner, span_warning("You can't drain blood from [pull_target]!"))
		return

	// Check for anti-magic
	if(bite_target.anti_magic_check(FALSE, TRUE, FALSE, 0))
		// Warn the user and target, then return
		to_chat(bite_target, span_warning("[action_owner] tries to bite you, but stops before touching you!"))
		to_chat(action_owner, span_warning("[bite_target] is blessed! You stop just in time to avoid catching fire."))
		return

	// Check for garlic necklace or garlic in the bloodstream
	if(!blood_sucking_checks(bite_target, TRUE, TRUE))
		// Warn the user and target, then return
		to_chat(bite_target, span_warning("[action_owner] tries to bite you, but is warded off by your Allium Sativum!"))
		to_chat(action_owner, span_warning("You sense that [bite_target] is protected by Allium Sativum, and refrain from biting them."))
		return

	// Define bite target's blood volume
	var/target_blood_volume = bite_target.blood_volume

	// Check for sufficient blood volume
	if(!target_blood_volume)
		// Warn the user, then return
		to_chat(action_owner, span_warning("There's not enough blood in [bite_target]!"))
		return

	// Check if total blood would become too low
	if((target_blood_volume - BLOODFLEDGE_DRAIN_NUM) <= BLOOD_VOLUME_OKAY)
		// Check for aggressive grab
		if(action_owner.grab_state < GRAB_AGGRESSIVE)
			// Warn the user, then return
			to_chat(action_owner, span_warning("You sense that [bite_target] is running low on blood. You'll need a tighter grip on [bite_target.p_them()] to continue."))
			return

		// Check for pacifist
		if(HAS_TRAIT(action_owner, TRAIT_PACIFISM))
			// Warn the user, then return
			to_chat(action_owner, span_warning("You can't drain any more blood from [bite_target] without hurting [bite_target.p_them()]!"))
			return

	// Set cooldown and action times
	var/time_cooldown = BLOODFLEDGE_COOLDOWN_BITE
	var/time_interact = 30

	// Check for voracious
	if(HAS_TRAIT(action_owner, TRAIT_VORACIOUS))
		// Make times twice as fast
		time_cooldown *= 0.5
		time_interact*= 0.5

	// Set cooldown
	drain_cooldown = world.time + time_cooldown

	// Display local chat message
	action_owner.visible_message(span_danger("[action_owner] begins to bite down on [bite_target]'s neck!"))

	// Warn bite target
	to_chat(bite_target, span_userdanger("[action_owner] has bitten your neck, and is trying to drain your blood!"))

	// Play a bite sound effect
	playsound(action_owner, 'sound/weapons/bite.ogg', 30, 1, -2)

	// Try to perform action timer
	if(!do_after(action_owner, time_interact, target = bite_target))
		// When failing
		// Display a local chat message
		action_owner.visible_message(span_danger("[action_owner]'s fangs are prematurely torn from [bite_target]'s neck, spilling [bite_target.p_their()] blood!"))

		// Bite target "drops" the blood
		// This creates large blood splatter
		bite_target.bleed(BLOODFLEDGE_DRAIN_NUM, FALSE)

		// Play splatter sound
		playsound(get_turf(target), 'sound/effects/splat.ogg', 40, 1)

		// Check for masochism
		if(!HAS_TRAIT(bite_target, TRAIT_MASO))
			// Force bite_target to play the scream emote
			bite_target.emote("scream")

		// Log the biting action failure
		log_combat(action_owner,bite_target,"bloodfledge bitten (interrupted)")

		// Return
		return

	// Check if bite target species has blood
	if(NOBLOOD in bite_target.dna.species.species_traits)
		// Warn the user and target, then return
		to_chat(bite_target, span_warning("[action_owner] tried to drain you, but didn't find any blood!"))
		to_chat(action_owner, span_warning("[bite_target] doesn't have any blood to drink!"))
		return

	// Create blood splatter
	bite_target.add_splatter_floor(get_turf(bite_target), TRUE)

	// Checks for exotic species blood below

	// Variable for species with non-blood blood volumes
	var/blood_valid = TRUE

	// Variable for gaining blood volume
	var/blood_transfer = FALSE

	// Name of blood volume to be taken
	// Action owner assumes blood until after drinking
	var/blood_name = "blood"

	// Check bite target for synth blood
	if(bite_target.mob_biotypes & MOB_ROBOTIC)
		// Mark blood as invalid
		blood_valid = FALSE

		// Set blood type name
		blood_name = "coolant"

		// Check if the action owner is also a synth
		if (action_owner.mob_biotypes & MOB_ROBOTIC)
			// Allow gaining blood from this
			blood_transfer = TRUE

		// Action owner is not a synth
		else
			// Warn the user
			to_chat(action_owner, span_warning("That didn't taste like blood at all..."))

			// Add disgust
			action_owner.adjust_disgust(2)

			// Cause negative mood
			SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_synth", /datum/mood_event/drankblood_synth)

	// Check if bite target is a slime
	if (isslimeperson(bite_target))
		// Mark blood as invalid
		blood_valid = FALSE

		// Set blood type name
		blood_name = "slime"

		// Check if the action owner is also a slime
		if(isslimeperson(action_owner))
			// Allow gaining blood from this
			blood_transfer = TRUE

		// Action owner is not a slime
		else
			// Warn the user
			to_chat(action_owner, span_warning("You feel a sloshing presence inside you, but it dies out after a few moments."))

			// Add disgust
			action_owner.adjust_disgust(2)

			// Cause negative mood
			SEND_SIGNAL(action_owner, COMSIG_ADD_MOOD_EVENT, "bloodfledge_drank_slime", /datum/mood_event/drankblood_slime)

	// End of species blood checks

	// Define user's remaining capacity to absorb blood
	var/blood_volume_difference = BLOOD_VOLUME_MAXIMUM - action_owner.blood_volume
	var/drained_blood = min(target_blood_volume, BLOODFLEDGE_DRAIN_NUM, blood_volume_difference)

	// Remove blood from bite target
	bite_target.blood_volume = clamp(target_blood_volume - drained_blood, 0, BLOOD_VOLUME_MAXIMUM)

	// Perform a blood transfer
	// This is done to transfer compatible diseases
	// Grants nothing, unless blood transfer variable is set
	bite_target.transfer_blood_to(action_owner, (blood_transfer ? drained_blood : 0), TRUE)

	// Check if action owner received valid (nourishing) blood
	if(blood_valid)
		// Add blood reagent to the user
		action_owner.reagents.add_reagent(/datum/reagent/blood/, drained_blood)

	// Alert the bite target and local user of success
	// Yes, this is AFTER the message for non-valid blood
	to_chat(bite_target, span_danger("[action_owner] has taken some of your [blood_name]!"))
	to_chat(action_owner, span_notice("You've drained some of [bite_target]'s [blood_name]!"))

	// Alert the action holder if blood volume limit was exceeded
	if(blood_transfer && (action_owner.blood_volume >= BLOOD_VOLUME_MAXIMUM))
		to_chat(action_owner, span_warning("You body fails to absorb any more [blood_name]. The remainder has been lost."))

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

// Action: Revive
/datum/action/bloodfledge/revive
	name = "Fledgling Revive"
	desc = "Expend all of your remaining energy to escape death."
	button_icon_state = "power_strength"

/datum/action/bloodfledge/revive/Trigger()
	. = ..()

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
		else if(owner_species in subtypesof(/datum/species/mammal))
			// Do nothing!

		// Check if species is a jelly
		else if(isjellyperson(action_owner))
			// Set species prefix
			custom_species_prefix = "Jelly "

		// Check if species is a jelly subtype
		else if(owner_species in subtypesof(/datum/species/jelly))
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
		action_owner.update_size(get_size(action_owner) + 0.5)
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
		action_owner.update_size(get_size(action_owner) - 0.5)

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

			// Define statue color
			var/newcolor

			// Check for blessed blood
			if(HAS_TRAIT(H, TRAIT_BLESSED_BLOOD))
				// Set name
				S.name = "gilded statue of [H.name]"

				// Set color
				newcolor = list(rgb(255,215,0), rgb(211,211,211), rgb(66,59,24), rgb(0,0,0))
				
				// Check for blessed blood glow trait
				if(HAS_TRAIT(H, TRAIT_BLESSED_GLOWING))
					// Add holy glow
					S.set_light(2, 2, LIGHT_COLOR_HOLY_MAGIC)
					
					// Update description
					S.desc = "A brilliantly radiant statue of [H.name], which is overflowing with divine power!"
			else
				S.name = "statue of [H.name]"
				newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))

			H.bleedsuppress = 1
			S.copy_overlays(H)
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
