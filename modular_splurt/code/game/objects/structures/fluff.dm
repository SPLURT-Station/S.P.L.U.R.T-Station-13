// Defines for the divine prayer alter
#define PRAYER_TYPE_HEAL_TOUCH "Blessed Touch"
#define PRAYER_TYPE_FLIGHT "Flight"
#define PRAYER_SPELL_HEAL_TOUCH /obj/effect/proc_holder/spell/targeted/touch/blessed_hand

// Prayer alter used by Blessed Blood quirk
/obj/structure/fluff/divine/convertaltar/blessed_altar
	name = "divine prayer altar"
	desc = "There is no believing crew who supplicates for their coworker behind their back that their benefactors do not say: The same be for you too." // Based on Sahih Muslim 2732a
	density = TRUE
	can_buckle = FALSE

	// List of possible prayers
	var/list/possible_prayers = list(PRAYER_TYPE_HEAL_TOUCH, PRAYER_TYPE_FLIGHT)

/obj/structure/fluff/divine/convertaltar/blessed_altar/on_attack_hand(mob/living/carbon/human/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..()

	// Check if human user exists
	if(!istype(user))
		return

	// Check for high level blessed blood
	if(!HAS_TRAIT(user, TRAIT_BLESSED_GLOWING))
		// Warn user and return
		to_chat(user, span_warning("You're not holy enough to use the [src]!"))
		return

	// Prompt for choice
	var/user_input = tgui_input_list(user, "What will you pray for?", "Divine Prayer", possible_prayers)

	// Check for input
	if(!user_input)
		return

	// Sanitize input
	user_input = sanitize(user_input)

	// Validate input for granter blessings
	switch(user_input)
		// Request for flight
		if(PRAYER_TYPE_FLIGHT)
			// Check for existing wings
			if(user.dna?.species.flying_species)
				// Warn user and return
				to_chat(user, span_warning("You already posses the power of flight!"))
				return

		// Request for healing touch spell
		if(PRAYER_TYPE_HEAL_TOUCH)
			// Check for existing spell
			if(locate(PRAYER_SPELL_HEAL_TOUCH) in user.mob_spell_list)
				// Warn user and return
				to_chat(user, span_warning("You already posses the blessed touch!"))
				return

	// Define deity name
	var/deity_name = DEFAULT_DEITY

	// Check for custom name
	if(user.client && user.client.prefs.custom_names["deity"])
		deity_name = user.client.prefs.custom_names["deity"]

	// Display local chat message
	user.visible_message(span_notice("[user] begins praying to [user.p_their()] deity at the [src]."), span_notice("You begin praying to [deity_name] for [user_input]..."))

	// Attempt action timer
	if(!do_after(user, 80, target = src))
		// Warn user and return
		to_chat(user, span_warning("Your focus falters! The prayer is left incomplete!"))
		return

	// Check for active admins
	if(!GLOB.admins.len)
		// Warn user and return
		to_chat(user, span_warning("Your prayers will go unanswered. Try again later."))
		return

	// Alert user of prayer type
	to_chat(user, span_notice("You have prayed to [deity_name] for [user_input]."))

	// Define holy icon
	var/mutable_appearance/icon_holy = mutable_appearance('icons/obj/storage.dmi', "holylight")

	// Define prayer message
	var/prayer_message = span_blessedphrase("[icon2html(icon_holy, GLOB.admins)] [ADMIN_LOOKUPFLW(user)] has prayed to [deity_name] for [user_input] using the [src] at [AREACOORD(src)].")

	// Add response buttons
	prayer_message += span_blessedphrase("\nYou may [ADMIN_SMITE(user)] [user.p_them()] for [user.p_their()] insolence, or (<a href='?_src_=holder;[HrefToken(TRUE)];blessed_request_permit=[REF(src)];blessed_request_target=[REF(user)];blessed_request_type=[REF(user_input)]'>GRANT</a>) [user.p_their()] request.")

	/* Simple method
	// Message admins
	message_admins(prayer_message)
	*/

	// Iterate list of admins
	for(var/client/iteration_client in GLOB.admins)
		// Check if prayers are enabled
		if(!iteration_client.prefs.chat_toggles & CHAT_PRAYER)
			// Ignore user
			continue

		// Display message
		to_chat(iteration_client, prayer_message, confidential = TRUE)

		// Check if prayer sounds are enabled
		if(iteration_client.prefs.toggles & SOUND_PRAYERS)
			// Play chaplain prayer sound
			SEND_SOUND(iteration_client, sound('sound/effects/pray.ogg'))

	// Record feedback
	// If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	SSblackbox.record_feedback("tally", "prayer_altar", 1, "prayer_altar")

/obj/structure/fluff/divine/convertaltar/blessed_altar/proc/accept_request(user,request_type)
	// Check if user exists
	if(!user)
		return

	// Define carbon human target
	var/mob/living/carbon/human/blessing_target = user

	// Check if target is valid
	if(!istype(blessing_target))
		return

	// Check request type
	switch(request_type)
		// Healing touch spell
		if(PRAYER_TYPE_HEAL_TOUCH)
			// Check for existing spell
			if(locate(PRAYER_SPELL_HEAL_TOUCH) in blessing_target.mob_spell_list)
				return

			// Add spell to target
			blessing_target.AddSpell(new PRAYER_SPELL_HEAL_TOUCH(null))

		// Functional wings
		if(PRAYER_TYPE_FLIGHT)
			// Check for DNA
			if(!blessing_target.dna)
				return

			// Check for existing wings
			if(blessing_target.dna?.species.flying_species)
				return

			// Grant wings
			blessing_target.dna.species.GiveSpeciesFlight(blessing_target, FALSE)

		// No valid input
		else
			// Warn user and return
			to_chat(blessing_target, span_boldwarning("Something has gone terribly wrong with the blessing process! Report this to a bluespace technician!"))
			return

	// Alert user of blessing
	to_chat(blessing_target, span_blessedphrase("Your faith has been rewarded with a divine blessing! The power of [request_type] has been bestowed upon you!"))

// Clear defines
#undef PRAYER_TYPE_HEAL_TOUCH
#undef PRAYER_TYPE_FLIGHT
#undef PRAYER_SPELL_HEAL_TOUCH
