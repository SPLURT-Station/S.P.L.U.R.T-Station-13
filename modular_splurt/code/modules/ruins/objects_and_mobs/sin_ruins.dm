// Greed slot machine
/obj/structure/cursed_slot_machine/interact(mob/living/carbon/human/user)
	// Check for blessed blood quirk
	if(HAS_TRAIT(user, TRAIT_BLESSED_BLOOD))
		// Define diety name
		var/diety_name = "a spiritual presence"

		// Check for custom name
		if(user.client && user.client.prefs.custom_names["deity"])
			diety_name = user.client.prefs.custom_names["deity"]

		// Warn user
		// Based on Matthew 6:19-20 and Matthew 6:24
		to_chat(user, span_userdanger("As your hand touches the lever, you feel [diety_name] forsake you. Your treasures will live in the flesh, where moth and rust destroy and where thieves break in and steal. No one can serve two masters, for either he will hate the one and love the other, or he will be devoted to the one and despise the other. You cannot serve [diety_name] and money."))

		// Check for high holiness level
		// This penalty transfers all money to cargo, then deletes the account
		if(HAS_TRAIT(user, TRAIT_BLESSED_GLOWING))
			// Define ID card
			var/obj/item/card/id/sinner_id = user.get_idcard()

			// Check if ID exists
			if(!sinner_id)
				return ..()

			// Define bank account
			var/datum/bank_account/sinner_account = sinner_id.registered_account

			// Check if account exists
			if(!sinner_account)
				return ..()

			// Define payments account
			var/datum/bank_account/paycheck_account = SSeconomy.get_dep_account(ACCOUNT_CAR)

			// Transfer all money to cargo
			paycheck_account.transfer_money(sinner_account, sinner_account.account_balance)

			// Unlink account
			sinner_id.registered_account = null

			// Delete account
			qdel(sinner_account)

		// Remove blessed blood
		user.remove_quirk(/datum/quirk/blessed_blood)

	// Return normally
	. = ..()

// Gluttony wall
/obj/effect/gluttony/CanAllowThrough(atom/movable/mover, turf/target)
	// Check for human
	if(ishuman(mover))
		// Define user
		var/mob/living/carbon/human/holy_mover = mover

		// Check for blessed blood
		if(HAS_TRAIT(holy_mover, TRAIT_BLESSED_BLOOD))
			// Check for required nutrition level
			if(holy_mover.nutrition >= NUTRITION_LEVEL_FAT)
				// Define diety name
				var/diety_name = "a spiritual presence"

				// Check for custom name
				if(holy_mover.client && holy_mover.client.prefs.custom_names["deity"])
					diety_name = holy_mover.client.prefs.custom_names["deity"]

				// Warn user
				// Based on Philippians 3:19
				to_chat(holy_mover, span_userdanger("As you push through [src], you feel [diety_name] forsake you. Your destiny is destruction, your god is your stomach, and your glory is in your shame."))

				// Check for high holiness level
				// This penalty prevents digesting or tasting food
				if(HAS_TRAIT(holy_mover, TRAIT_BLESSED_GLOWING))
					// Add traits for no eating and no taste
					ADD_TRAIT(holy_mover, TRAIT_NO_PROCESS_FOOD, "blessed_blood_sinner")
					ADD_TRAIT(holy_mover, TRAIT_AGEUSIA, "blessed_blood_sinner")

				// Remove blessed blood
				holy_mover.remove_quirk(/datum/quirk/blessed_blood)

	// Return normally
	. = ..()

// Pride mirror
/obj/structure/mirror/magic/pride/curse(mob/user)
	// Check for human
	if(ishuman(user))
		// Define user
		var/mob/living/carbon/human/sinner = user

		// Check for blessed blood
		if(HAS_TRAIT(sinner, TRAIT_BLESSED_BLOOD))
			// Warn user
			// Based on Proverbs 16:18
			to_chat(sinner, span_userdanger("Pride goes before destruction, and a haughty spirit before a fall."))

			// Remove blessed blood
			sinner.remove_quirk(/datum/quirk/blessed_blood)

	// Return normally
	. = ..()

// Envy knife
/obj/item/kitchen/knife/envy/afterattack(atom/movable/AM, mob/living/carbon/human/user, proximity)
	// Check for user with blessed blood quirk
	if(istype(user) && HAS_TRAIT(user, TRAIT_BLESSED_BLOOD))
		// Define diety name
		var/diety_name = "a spiritual presence"

		// Check for custom name
		if(user.client && user.client.prefs.custom_names["deity"])
			diety_name = user.client.prefs.custom_names["deity"]

		// Warn user
		// Based on Proverbs 14:30
		to_chat(user, span_userdanger("As you wield the knife, you feel [diety_name] forsake you. A tranquil heart gives life to the flesh, but envy makes the bones rot."))

		// Check for high holiness level
		// This penalty 'makes the bones rot'
		if(HAS_TRAIT(user, TRAIT_BLESSED_GLOWING))
			// Add bone hurting juice
			user.reagents.add_reagent(/datum/reagent/toxin/bonehurtingjuice, 30)

		// Remove blessed blood
		user.remove_quirk(/datum/quirk/blessed_blood)

	// Return normally
	. = ..()
