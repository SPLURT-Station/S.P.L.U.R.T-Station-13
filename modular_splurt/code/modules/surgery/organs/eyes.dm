/obj/item/organ/eyes/spectre
	name = "Spectre eyes"
	desc = "A pair of standard Hammond Robotics BRD-01 eyes"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "cybernetic_eyeballs"

/obj/item/organ/eyes/ipc
	name = "IPC eyes"

/obj/item/organ/eyes/robotic/hypno
	name = "mesmer eyes"
	desc = "Cybernetic eyes with integrated memetic sub-systems. They're full of swirls and bright colors!"

// On add organ
/obj/item/organ/eyes/robotic/hypno/Insert(mob/living/carbon/eye_user, special, drop_if_replaced)
	. = ..()

	// Check parent return
	if(!.)
		return

	// Define ability
	var/datum/action/cooldown/hypnotize/eye_ability

	// Check for pre-existing hypnotic quirk
	if(eye_user.has_quirk(/datum/quirk/Hypnotic_gaze))
		// Locate existing action
		eye_ability = locate() in eye_user.actions

		// Enable brainwash mode, then return
		eye_ability.set_brainwash(TRUE)
		return

	// Create new hypnotic ability
	eye_ability = new

	// Grant action to user
	eye_ability.Grant(eye_user)

	// Add trait
	ADD_TRAIT(eye_user, TRAIT_HYPNOTIC_GAZE, ORGAN_TRAIT)

	// Alert user
	to_chat(eye_user, span_nicegreen("Your [src] begin to glimmer with an entrancing power!"))

	// Add examine text
	RegisterSignal(eye_user, COMSIG_PARENT_EXAMINE, PROC_REF(examine_user))

// On remove organ
/obj/item/organ/eyes/robotic/hypno/Remove(mob/living/carbon/eye_user, special, drop_if_replaced)
	. = ..()

	// Define ability
	var/datum/action/cooldown/hypnotize/eye_ability = locate() in eye_user.actions

	// Check for pre-existing hypnotic quirk
	if(eye_user.has_quirk(/datum/quirk/Hypnotic_gaze))
		// Disable brainwash mode, then return
		eye_ability.set_brainwash(FALSE)
		return

	// Remove ability
	eye_ability.Remove(eye_user)

	// Remove trait
	REMOVE_TRAIT(eye_user, TRAIT_HYPNOTIC_GAZE, ORGAN_TRAIT)

	// Alert user
	to_chat(eye_user, span_warning("You power of suggestion fades."))

	// Remove examine text
	UnregisterSignal(eye_user, COMSIG_PARENT_EXAMINE)

// Organ examine text
/obj/item/organ/eyes/robotic/hypno/proc/examine_user(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	// Add examine text
	examine_list += "[usr.p_their(TRUE)] eyes glimmer with an entrancing power."

//X-Ray Eyes - Extra Functionality

/obj/item/organ/eyes/robotic/xray
	actions_types = list(/datum/action/item_action/organ_action/use) // Use the generic "use" action
	var/xray_active = TRUE

/obj/item/organ/eyes/robotic/xray/ui_action_click()
	toggle_xray()

/obj/item/organ/eyes/robotic/xray/proc/toggle_xray()
	xray_active = !xray_active
	if(xray_active)
		sight_flags |= (SEE_MOBS | SEE_OBJS | SEE_TURFS)
		to_chat(owner, "<span class='notice'>You activate your X-ray vision.</span>")
	else
		sight_flags &= ~(SEE_MOBS | SEE_OBJS | SEE_TURFS)

		to_chat(owner, "<span class='notice'>You deactivate your X-ray vision.</span>")
	owner.update_sight()

//Thermal Eyes - Extra Functionality

/obj/item/organ/eyes/robotic/thermals
	actions_types = list(/datum/action/item_action/organ_action/use)
	var/thermal_active = TRUE

/obj/item/organ/eyes/robotic/thermals/ui_action_click()
	toggle_thermal()

/obj/item/organ/eyes/robotic/thermals/proc/toggle_thermal()
	thermal_active = !thermal_active
	if(thermal_active)
		sight_flags |= SEE_MOBS
		lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		to_chat(owner, "<span class='notice'>You activate your thermal vision.</span>")
	else
		sight_flags &= ~SEE_MOBS
		lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
		to_chat(owner, "<span class='notice'>You deactivate your thermal vision.</span>")
	owner.update_sight()

//Welding shield eyes

/obj/item/organ/eyes/robotic/shield
	actions_types = list(/datum/action/item_action/organ_action/use)
	var/shield_active = TRUE 

/obj/item/organ/eyes/robotic/shield/ui_action_click()
	toggle_shield()

/obj/item/organ/eyes/robotic/shield/proc/toggle_shield()
	shield_active = !shield_active
	if(shield_active)
		flash_protect = 2
		to_chat(owner, "<span class='notice'>You activate your welding shield.</span>")
	else
		flash_protect = 0
		to_chat(owner, "<span class='notice'>You deactivate your welding shield.</span>")
	owner.update_sight()
