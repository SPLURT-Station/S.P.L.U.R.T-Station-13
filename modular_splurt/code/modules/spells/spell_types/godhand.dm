/obj/item/melee/touch_attack/blessed_hand
	name = "\improper blessed touch"
	desc = "If the crew who are called by your deity's name humble themselves, and turn from their wicked ways, then your deity will hear from on high and absolve them of sin." // Based on 2 Chronicles 7:14
	icon = 'modular_splurt/icons/mob/actions/misc_actions.dmi'
	icon_state = "blessed_touch_hand"
	catchphrase = "Deus Caritas Est!"
	on_use_sound = 'sound/magic/Staff_Healing.ogg'
	lefthand_file = 'modular_splurt/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/items_righthand.dmi'
	item_state = "burning_holy_hand"

/obj/item/melee/touch_attack/blessed_hand/afterattack(atom/movable/target, mob/living/carbon/user, proximity)
	// Check for speech
	if(!user.can_speak_vocal())
		// Warn user and return
		to_chat(user, span_warning("You can't get the words out!"))
		return

	// Check for mob target
	if(!ismob(target))
		// Return silently
		return

	// Check for proximity
	if(target == user)
		// Warn user and return
		to_chat(user, span_warning("You can't use this ability on yourself!"))
		return

	// Check for proximity
	if(!proximity)
		// Warn user and return
		to_chat(user, span_warning("You're too far away from [target]!"))
		return

	// Check for human target
	if(!ishuman(target))
		// Warn user and return
		to_chat(user, span_warning("You can't use this ability on [target]!"))
		return

	// Define carbon target
	var/mob/living/carbon/human/spell_target = target

	// Check target for anti-magic
	if(spell_target.anti_magic_check())
		// Warn in local chat
		spell_target.visible_message(span_warning("[spell_target] emits a bright flash of light as [spell_target.p_they()] deflect your touch! Your powers are useless against [spell_target.p_them()]!"), span_warning("[spell_target] emits a flash of light as [spell_target.p_they()] deflect [user]'s touch!"))

		// Create a flash
		user.flash_act()

		// Define used body part
		var/obj/item/bodypart/spell_bodypart = user.get_holding_bodypart_of_item(src)

		// Check if body part exists
		if(spell_bodypart)
			// Damage body part by 10
			spell_bodypart.receive_damage(burn = 10)

		// Return as completed interaction
		return ..()

	// Check for cursed blood, bloodfledge, or undead
	if(HAS_TRAIT(spell_target, TRAIT_CURSED_BLOOD) || HAS_TRAIT(spell_target, TRAIT_BLOODFLEDGE) || (spell_target.mob_biotypes & MOB_UNDEAD))
		// Check for non-aggressive intent
		if(user.a_intent != INTENT_HARM)
			// Warn user and target
			to_chat(user, span_warning("You refrain from attempting to bless [spell_target], as the divine touch could harm [spell_target.p_them()]!"))
			to_chat(spell_target, span_warning("[user] reaches towards you with a golden burning hand, but recoils just before touching you."))

			// Return without effects
			return

		// Intent is aggressive
		else
			// Warn in local chat
			spell_target.visible_message(span_warning("[spell_target] bursts into flames as [user]'s blessed touch attempts to purify them!"), span_warning("You attempt purify the sin from [spell_target] with your holy touch!"))

			// Add fire stacks to target
			spell_target.adjust_fire_stacks(3)

			// Ignite target
			spell_target.IgniteMob()

			// Log interaction
			log_combat(spell_target, user, "blessed touch ignited")

			// Return as completed interaction
			return ..()

	// Define revival policy message
	var/revival_policy_message

	// Define deity name
	var/deity_name = DEFAULT_DEITY

	// Check for custom name
	if(user.client && user.client.prefs.custom_names["deity"])
		deity_name = user.client.prefs.custom_names["deity"]

	// Check if target is alive
	if(spell_target.stat != DEAD)
		// Fully heal
		spell_target.fully_heal(TRUE)

		// Log interaction
		spell_target.log_message("fully healed by [user]'s divine touch.", LOG_ADMIN)

	// Check for hellbound or suicide
	else if(spell_target.hellbound || spell_target.suiciding)
		// Warn user and return
		to_chat(user, span_warning("[deity_name] refuses to help [spell_target]! [spell_target.p_they()] [spell_target.p_are()] beyond any form of salvation!"))
		return

	// Check for no revival
	else if(HAS_TRAIT(spell_target, TRAIT_NOCLONE))
		// Warn user and return
		to_chat(user, span_warning("[spell_target]'s soul has departed from this world!"))
		return

	// Target is not alive
	else
		// Revive with full heal
		spell_target.revive(TRUE, TRUE)

		// Play gasp emote
		spell_target.emote("gasp")

		// Display golden ring
		new /obj/effect/temp_visual/ratvar/sigil/transgression(get_turf(spell_target))

		// Set policy message
		var/list/policies = CONFIG_GET(keyed_list/policy)
		revival_policy_message = policies[POLICYCONFIG_ON_DEFIB_INTACT]

		// Log interaction
		spell_target.log_message("revived to full health by [user]'s divine touch.", LOG_ADMIN)

	// Display revival message
	// Based on 2 Chronicles 7:14
	spell_target.visible_message(span_nicegreen("[user] has called upon [deity_name] to save [spell_target] from sin! [user.p_they(TRUE)] [user.p_have()] been heard from on high, and [user.p_their()] faith rewarded!"))

	// Check if revival message should be shown
	if(revival_policy_message)
		// Display policy message to target
		to_chat(spell_target, revival_policy_message)

	// Display cooldown warning message to user
	to_chat(user, span_notice("You feel the holy power drain from your hand as the blessing is completed. [deity_name] will restore the ability after some time has passed."))

	// Return normally
	return ..()
