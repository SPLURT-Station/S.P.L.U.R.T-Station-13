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
	var/mob/living/carbon/T //hypnosis target
	var/mob/living/carbon/human/H //Person with the quirk

/datum/action/innate/Hypnotize/Activate()
	var/mob/living/carbon/human/H = owner

	if(!H.pulling || !isliving(H.pulling) || H.grab_state < GRAB_AGGRESSIVE)
		to_chat(H, span_warning("You need to aggressively grab someone to hypnotize them!"))
		return

	var/mob/living/carbon/T = H.pulling

	if(T.IsSleeping())
		to_chat(H, "You can't hypnotize [T] whilst they're asleep!")
		return

	to_chat(H, span_notice("You stare deeply into [T]'s eyes..."))
	to_chat(T, span_warning("[H] stares intensely into your eyes..."))
	if(!do_mob(H, T, 12 SECONDS))
		return

	if(H.pulling !=T || H.grab_state < GRAB_AGGRESSIVE)
		return

	if(!(H in view(1, H.loc)))
		return

	if(!(T.client?.prefs.cit_toggles & HYPNO))
		return

	var/response = alert(T, "Do you wish to fall into a hypnotic sleep?(This will allow [H] to issue hypnotic suggestions)", "Hypnosis", "Yes", "No")

	if(response == "Yes")
		T.visible_message(span_warning("[T] falls into a deep slumber!"), "<span class = 'danger'>Your eyelids gently shut as you fall into a deep slumber. All you can hear is [H]'s voice as you commit to following all of their suggestions.</span>")

		T.SetSleeping(1200)
		T.drowsyness = max(T.drowsyness, 40)
		T = H.pulling
		var/response2 = alert(H, "Would you like to release your subject or give them a suggestion?", "Hypnosis", "Suggestion", "Release")

		if(response2 == "Suggestion")
			if(get_dist(H, T) > 1)
				to_chat(H, "You must stand in whisper range of [T].")
				return

			var/text = input("What would you like to suggest?", "Hypnotic suggestion", null, null)
			text = sanitize(text)
			if(!text)
				return

			to_chat(H, "You whisper your suggestion in a smooth calming voice to [T]")
			to_chat(T, span_hypnophrase("...[text]..."))

			T.visible_message(span_warning("[T] wakes up from their deep slumber!"), "<span class ='danger'>Your eyelids gently open as you see [H]'s face staring back at you.</span>")
			T.SetSleeping(0)
			T = null
			return

		if(response2 == "Release")
			T.SetSleeping(0)
			return
	else
		T.visible_message(span_warning("[T]'s attention breaks, despite the attempt to hypnotize them! They clearly don't want this!"), "<span class ='warning'>Your concentration breaks as you realise you have no interest in following [H]'s words!</span>")
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

/datum/action/werewolf
	name = "Transform"
	desc = "Transform into your wolf form."
	icon_icon = 'modular_splurt/icons/mob/actions/misc_actions.dmi'
	button_icon_state = "Transform"
	var/transformed = FALSE
	var/list/old_features = list("species" = SPECIES_HUMAN, "legs" = "Plantigrade", "size" = 1, "bark")

/datum/action/werewolf/Trigger()
	. = ..()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/genital/penis/P = H.getorganslot(ORGAN_SLOT_PENIS)
	var/obj/item/organ/genital/breasts/B = H.getorganslot(ORGAN_SLOT_BREASTS)
	var/obj/item/organ/genital/vagina/V = H.getorganslot(ORGAN_SLOT_VAGINA)
	H.shake_animation(2)
	if(!transformed) // transform them
		H.visible_message(span_danger("[H] shivers, their flesh bursting with a sudden growth of thick fur and their features contorting to that of a beast's, fully transforming them into a werewolf!"))
		H.set_species(/datum/species/mammal, 1)
		H.dna.species.mutant_bodyparts["mam_tail"] = "Wolf"
		H.dna.species.mutant_bodyparts["legs"] = "Digitigrade"
		H.Digitigrade_Leg_Swap(FALSE)
		H.dna.species.mutant_bodyparts["mam_snouts"] = "Mammal, Thick"
		H.dna.features["mam_ears"] = "Wolf"
		H.dna.features["mam_tail"] = "Wolf"
		H.dna.features["mam_snouts"] = "Mammal, Thick"
		H.dna.features["legs"] = "Digitigrade"
		H.update_size(get_size(H) + 0.5)
		H.set_bark("bark")
		H.custom_species = "Werewolf"
		if(!(H.dna.species.species_traits.Find(DIGITIGRADE)))
			H.dna.species.species_traits += DIGITIGRADE
		H.update_body()
		H.update_body_parts()
		if(B)
			B.color = "#[H.dna.features["mcolor"]]"
			B.update()
		if(P)
			P.shape = "Knotted"
			P.color = "#ff7c80"
			P.update()
			P.modify_size(6)
		if(V)
			V.shape = "Furred"
			V.color = "#[H.dna.features["mcolor"]]"
			V.update()
	else // untransform them
		H.visible_message(span_danger("[H] shrinks, their wolfish features quickly receding."))
		H.set_species(old_features["species"], TRUE)
		H.set_bark(old_features["bark"])
		H.dna.features["mam_ears"] = old_features["mam_ears"]
		H.dna.features["mam_snouts"] = old_features["mam_snouts"]
		H.dna.features["mam_tail"] = old_features["mam_tail"]
		H.dna.features["legs"] = old_features["legs"] //i hate legs i hate legs i hate legs i hate legs i hate legs i hate legs i hate legs
		if(old_features["legs"] == "Plantigrade")
			H.dna.species.species_traits -= DIGITIGRADE
			H.Digitigrade_Leg_Swap(TRUE)
			H.dna.species.mutant_bodyparts["legs"] = old_features["legs"]
		H.update_body()
		H.update_body_parts()
		H.update_size(get_size(H) - 0.5)
		if(B)
			B.color = "#[old_features["breasts_color"]]"
			B.update()
		if(H.has_penis())
			P.shape = old_features["cock_shape"]
			P.color = "#[old_features["cock_color"]]"
			P.update()
			P.modify_size(-6)
		if(H.has_vagina())
			V.shape = old_features["vag_shape"]
			V.color = "#[old_features["vag_color"]]"
			V.update()
			V.update_size()
	transformed = !transformed

/datum/action/werewolf/Grant()// on grant sets some variables
	. = ..()
	var/mob/living/carbon/human/H = owner
	old_features = H.dna.features.Copy()
	old_features["species"] = H.dna.species.type
	old_features["size"] = get_size(H)
	old_features["bark"] = H.vocal_bark_id


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

//
// Quirk: Gargoyle
//

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
