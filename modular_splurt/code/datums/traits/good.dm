/datum/quirk/tough
	name = "Tough"
	desc = "Your body is abnormally enduring and can take 10% more damage."
	value = 2
	medical_record_text = "Patient has an abnormally high capacity for injury."
	gain_text = span_notice("You feel very sturdy.")
	lose_text = span_notice("You feel less sturdy.")

/datum/quirk/tough/add()
	quirk_holder.maxHealth *= 1.1

/datum/quirk/tough/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 0.909 //close enough

/datum/quirk/ashresistance
	name = "Ashen Resistance"
	desc = "Your body is adapted to the burning sheets of ash that coat volcanic worlds, though the heavy downpours of silt will still tire you."
	value = 2 //Is not actually THAT good. Does not grant breathing and does stamina damage to the point you are unable to attack. Crippling on lavaland, but you'll survive. Is not a replacement for SEVA suits for this reason. Can be adjusted.
	mob_trait = TRAIT_ASHRESISTANCE
	medical_record_text = "Patient has an abnormally thick epidermis."
	gain_text = span_notice("You feel resistant to burning brimstone.")
	lose_text = span_notice("You feel less as if your flesh is more flamamble.")

/* --FALLBACK SYSTEM INCASE THE TRAIT FAILS TO WORK. Do NOT enable this without editing ash_storm.dm to deal stamina damage with ash immunity.
/datum/quirk/ashresistance/add()
	quirk_holder.weather_immunities |= "ash"

/datum/quirk/ashresistance/remove()
	if(!quirk_holder)
		return
	quirk_holder.weather_immunities -= "ash"
*/

/datum/quirk/rad_fiend
	name = "Rad Fiend"
	desc = "You've been blessed by Cherenkov's warming light, causing you to emit a subtle glow at all times. Only -very- intense radiation is capable of penetrating your protective barrier."
	value = 2
	mob_trait = TRAIT_RAD_FIEND
	gain_text = span_notice("You feel empowered by Cherenkov's glow.")
	lose_text = span_notice("You realize that rads aren't so rad.")

/datum/quirk/rad_fiend/add()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	// Add glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = new
	quirk_action.Grant(quirk_mob)

/datum/quirk/rad_fiend/remove()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = locate() in quirk_mob.actions
	quirk_action.Remove(quirk_mob)

	// Remove glow effect
	quirk_mob.remove_filter("rad_fiend_glow")

/datum/quirk/dominant_aura
	name = "Dominant Aura"
	desc = "Your mere presence is assertive enough to appear as powerful to other people, so much in fact that the weaker kind can't help but throw themselves at your feet at the snap of a finger."
	value = 1
	gain_text = span_notice("You feel like making someone your pet.")
	lose_text = span_notice("You feel less assertive.")

/datum/quirk/dominant_aura/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine_holder))
	RegisterSignal(quirk_holder, COMSIG_MOB_EMOTE, PROC_REF(handle_snap))

/datum/quirk/dominant_aura/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)
	UnregisterSignal(quirk_holder, COMSIG_MOB_EMOTE)

/datum/quirk/dominant_aura/proc/on_examine_holder(atom/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/sub = user
	if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
		return

	examine_list += span_lewd("\nYou can't make eye contact with [quirk_holder.p_them()] before flustering away!")
	if(!TIMER_COOLDOWN_CHECK(user, COOLDOWN_DOMINANT_EXAMINE))
		to_chat(quirk_holder, span_notice("\The [user] tries to look at you but immediately turns away with a red face..."))
		TIMER_COOLDOWN_START(user, COOLDOWN_DOMINANT_EXAMINE, 10 SECONDS)
		sub.dir = turn(get_dir(sub, quirk_holder), pick(-90, 90))
		sub.emote("blush")

/datum/quirk/dominant_aura/proc/handle_snap(datum/source, list/emote_args)
	SIGNAL_HANDLER

	. = FALSE
	var/key = GLOB.emote_list[lowertext(emote_args[EMOTE_ACT])]
	if(TIMER_COOLDOWN_CHECK(quirk_holder, COOLDOWN_DOMINANT_SNAP) || !findtext(key, "snap"))
		return
	for(var/mob/living/carbon/human/sub in hearers(DOMINANT_DETECT_RANGE, quirk_holder))
		if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
			continue
		var/good_x = "pet"
		switch(sub.gender)
			if(MALE)
				good_x = "boy"
			if(FEMALE)
				good_x = "girl"
		switch(key)
			if("snap")
				sub.dir = get_dir(sub, quirk_holder)
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_notice("\The <b>[sub]</b> turns shyly towards \the <b>[quirk_holder]</b>."),
									span_lewd("You stare into \the [quirk_holder] submissively."))
			if("snap2")
				sub.dir = get_dir(sub, quirk_holder)
				sub.KnockToFloor()
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_lewd("\The <b>[sub]</b> submissively throws [sub.p_them()]self on the floor."),
									span_lewd("You throw yourself on the floor like a pathetic beast on <b>[quirk_holder]</b>'s command."))
			if("snap3")
				sub.KnockToFloor()
				step(sub, get_dir(sub, quirk_holder))
				sub.emote(pick("blush", "pant"))
				sub.do_jitter_animation(30) //You're being moved anyways
				sub.visible_message(span_lewd("\The <b>[sub]</b> crawls closer to \the <b>[quirk_holder]</b> on all fours, following [quirk_holder.p_their()] command."),
									span_lewd("You get on your hands and knees and crawl towards \the <b>[quirk_holder]</b> like a good [good_x] would."))
		. = TRUE

	if(.)
		TIMER_COOLDOWN_START(quirk_holder, COOLDOWN_DOMINANT_SNAP, DOMINANT_SNAP_COOLDOWN)

/datum/quirk/arachnid
	name = "Arachnid"
	desc = "Your bodily anatomy allows you to spin webs and cocoons, even if you aren't an arachnid! (Note that this quirk does nothing for members of the arachnid species)"
	value = 1
	medical_record_text = "Patient has attempted to cover the room in webs, claiming to be \"making a nest\"."
	mob_trait = TRAIT_ARACHNID
	gain_text = span_notice("You feel a strange sensation near your anus...")
	lose_text = span_notice("You feel like you can't spin webs anymore...")
	processing_quirk = TRUE

/datum/quirk/arachnid/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		to_chat(H, span_warning("As an arachnid, this quirk does nothing for you, as these abilities are innate to your species."))
		return
	var/datum/action/innate/spin_web/SW = new
	var/datum/action/innate/spin_cocoon/SC = new
	SC.Grant(H)
	SW.Grant(H)

/datum/quirk/arachnid/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		return
	var/datum/action/innate/spin_web/SW = locate(/datum/action/innate/spin_web) in H.actions
	var/datum/action/innate/spin_cocoon/SC = locate(/datum/action/innate/spin_cocoon) in H.actions
	SC?.Remove(H)
	SW?.Remove(H)

/datum/quirk/flutter
	name = "Flutter"
	desc = "You are able to move about freely in pressurized low-gravity environments be it through the use of wings, magic, or some other physiological nonsense."
	value = 1
	mob_trait = TRAIT_FLUTTER

/datum/quirk/cloth_eater
	name = "Clothes Eater"
	desc = "You can eat most apparel to gain a boost in mood, and to gain some nutrients. (Insects already have this.)"
	value = 1
	var/mood_category ="cloth_eaten"
	mob_trait = TRAIT_CLOTH_EATER

/datum/quirk/ropebunny
	name = "Rope Bunny"
	desc = "You have mastered all forms of bondage! You can create bondage rope out of cloth, and bondage bolas out of bondage rope!"
	value = 2

/datum/quirk/ropebunny/add()
	.=..()
	var/mob/living/carbon/human/H = quirk_holder
	if (!H)
		return
	var/datum/action/ropebunny/conversion/C = new
	C.Grant(H)

/datum/quirk/ropebunny/remove()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/ropebunny/conversion/C = locate() in H.actions
	C.Remove(H)
	. = ..()

/datum/quirk/hallowed
	name = "Hallowed"
	desc = "You have been blessed by a higher power or are otherwise imbued with holy energy in some way. Your divine presence drives away magic and the unholy! Holy water will restore your health."
	value = 1 // Maybe up the cost if more is added later.
	mob_trait = TRAIT_HALLOWED
	medical_record_text = "Patient contains an unidentified hallowed material concentrated in their blood. Please consult a chaplain."
	gain_text = span_notice("You feel holy energy starting to flow through your body.")
	lose_text = span_notice("You feel your holy energy fading away...")

/datum/quirk/hallowed/add()
	// Define quirk mob.
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Give the holy trait.
	ADD_TRAIT(quirk_mob, TRAIT_HOLY, "quirk_hallowed")

	// Give the antimagic trait.
	ADD_TRAIT(quirk_mob, TRAIT_ANTIMAGIC, "quirk_hallowed")

	// Makes the user holy.
	quirk_mob.mind.isholy = TRUE

	// Add examine text.
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine_holder))

/datum/quirk/hallowed/remove()
	// Define quirk mob.
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove the holy trait.
	REMOVE_TRAIT(quirk_mob, TRAIT_HOLY, "quirk_hallowed")

	// Remove the antimagic trait.
	REMOVE_TRAIT(quirk_mob, TRAIT_ANTIMAGIC, "quirk_hallowed")

	// Makes the user not holy.
	quirk_mob.mind.isholy = FALSE

	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text.
/datum/quirk/hallowed/proc/on_examine_holder(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.p_they(TRUE)] radiates divine power..."

/datum/quirk/vacuum_resistance
    name = "Vacuum Resistance"
    desc = "Your body, whether due to technology, magic, or genetic engineering - is specially adapted to withstand and operate in the vacuum of space. You may still need a source of breathable air, however."
    value = 3
    gain_text = span_notice("Your physique attunes to the silence of space, now able to operate in zero pressure.")
    lose_text = span_notice("Your physiology reverts as your spacefaring gifts lay dormant once more.")
    var/list/perks = list(TRAIT_RESISTCOLD, TRAIT_RESISTLOWPRESSURE, TRAIT_LOWPRESSURECOOLING)

/datum/quirk/vacuum_resistance/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	for(var/perk in perks)
		ADD_TRAIT(H, perk, ROUNDSTART_TRAIT)

/datum/quirk/vacuum_resistance/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	for(var/perk in perks)
		REMOVE_TRAIT(H, perk, ROUNDSTART_TRAIT)

/datum/quirk/restorative_metabolism
	name = "Restorative Metabolism"
	desc = "Your body possesses a differentiated reconstutitive ability, allowing you to slowly recover from injuries. Note, however, that critical injuries, wounds or genetic damage will still require medical attention."
	value = 3
	mob_trait = TRAIT_RESTORATIVE_METABOLISM
	gain_text = span_notice("You feel a surge of reconstutitive vitality coursing through your body...")
	lose_text = span_notice("You sense your enhanced reconstutitive ability fading away...")
	processing_quirk = TRUE

/datum/quirk/restorative_metabolism/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder

	// The only_organic flag allows robotic biotypes to not be excluded.
	H.adjustBruteLoss(-0.5, only_organic = FALSE) //The healing factor will only regenerate fully if not burnt beyond a specific threshold.
	H.adjustFireLoss(-0.25,  only_organic = FALSE)
	if(H.getBruteLoss() > 0 && H.getFireLoss() <= 50 || H.getFireLoss() > 0 && H.getFireLoss() <= 50)
		H.adjustBruteLoss(-0.5, forced = TRUE, only_organic = FALSE)
		H.adjustFireLoss(-0.25, forced = TRUE, only_organic = FALSE)
	/* Doesn't heal robotic toxin damage (only_organic = FALSE not needed for tox),
	another adjustToxLoss check with toxins_type = TOX_SYSCORRUPT,
	(or just adding TOX_OMNI to the already existing one) could be added to heal robotic corruption,
	but would make robotic species unbalanced.
	*/
	else if (H.getToxLoss() <= 90)
		H.adjustToxLoss(-0.3, forced = TRUE)

/datum/quirk/bloodfledge
	name = "Bloodsucker Fledgling"
	desc = "You are a fledgling belonging to ancient Bloodsucker bloodline. While the blessing has yet to fully convert you, some things have changed. Only blood will sate your hungers, and holy energies will cause your flesh to char. <b>This is NOT an antagonist role!</b>"
	value = 2
	medical_record_text = "Patient exhibits onset symptoms of a sanguine curse."
	mob_trait = TRAIT_BLOODFLEDGE
	gain_text = span_notice("You feel a sanguine thirst.")
	lose_text = span_notice("You feel the sanguine thirst fade away.")
	processing_quirk = FALSE // Handled by crates.dm

/datum/quirk/bloodfledge/add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Add quirk traits
	ADD_TRAIT(quirk_mob,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(quirk_mob,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

	// Set skin tone, if possible
	if(!quirk_mob.dna.skin_tone_override)
		quirk_mob.skin_tone = "albino"

	// Add quirk language
	quirk_mob.grant_language(/datum/language/vampiric, TRUE, TRUE, LANGUAGE_BLOODSUCKER)

	// Register examine text
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, PROC_REF(quirk_examine_bloodfledge))

/datum/quirk/bloodfledge/post_add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Define and grant ability Bite
	var/datum/action/cooldown/bloodfledge/bite/act_bite = new
	act_bite.Grant(quirk_mob)

	// Check for synthetic
	// Robotic mobs have technical issues with adjusting damage
	if(quirk_mob.mob_biotypes & MOB_ROBOTIC)
		// Warn user
		to_chat(quirk_mob, span_warning("As a synthetic lifeform, your components are only able to grant limited sanguine abilities! Regeneration and revival are not possible."))

	// User is not synthetic
	else
		// Define and grant ability Revive
		var/datum/action/cooldown/bloodfledge/revive/act_revive = new
		act_revive.Grant(quirk_mob)

/datum/quirk/bloodfledge/on_process()
	// Processing is currently only used for coffin healing
	// This is started and stopped by a proc in crates.dm

	// Define potential coffin
	var/quirk_coffin = quirk_holder.loc

	// Check if the current area is a coffin
	if(istype(quirk_coffin, /obj/structure/closet/crate/coffin))
		// Define quirk mob
		var/mob/living/carbon/human/quirk_mob = quirk_holder

		// Quirk mob must be injured
		if(quirk_mob.health >= quirk_mob.maxHealth)
			// Warn user
			to_chat(quirk_mob, span_notice("[quirk_coffin] does nothing more to help you, as your body is fully mended."))

			// Stop processing and return
			STOP_PROCESSING(SSquirks, src)
			return

		// Nutrition (blood) level must be above STARVING
		if(quirk_mob.nutrition <= NUTRITION_LEVEL_STARVING)
			// Warn user
			to_chat(quirk_mob, span_warning("[quirk_coffin] requires blood to operate, which you are currently lacking. Your connection to the other-world fades once again."))

			// Stop processing and return
			STOP_PROCESSING(SSquirks, src)
			return

		// Define initial health
		var/health_start = quirk_mob.health

		// Heal brute and burn
		// Accounts for robotic limbs
		quirk_mob.heal_overall_damage(2,2)
		// Heal oxygen
		quirk_mob.adjustOxyLoss(-2)
		// Heal clone
		quirk_mob.adjustCloneLoss(-2)

		// Check for slime race
		// NOT a slime
		if(!isslimeperson(quirk_mob))
			// Heal toxin
			quirk_mob.adjustToxLoss(-2)
		// IS a slime
		else
			// Grant toxin (heals slimes)
			quirk_mob.adjustToxLoss(2)

		// Update health
		quirk_mob.updatehealth()

		// Determine healed amount
		var/health_restored = quirk_mob.health - health_start

		// Remove nutrition (blood) as compensation for healing
		// Amount is equal to 50% of healing done
		quirk_mob.adjust_nutrition(health_restored*-1)

	// User is not in a coffin
	// This should not occur without teleportation
	else
		// Warn user
		to_chat(quirk_holder, span_warning("Your connection to the other-world is broken upon leaving the [quirk_coffin]!"))

		// Stop processing
		STOP_PROCESSING(SSquirks, src)

/datum/quirk/bloodfledge/remove()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove quirk traits
	REMOVE_TRAIT(quirk_mob, TRAIT_NO_PROCESS_FOOD, ROUNDSTART_TRAIT)
	REMOVE_TRAIT(quirk_mob, TRAIT_NOTHIRST, ROUNDSTART_TRAIT)

	// Remove quirk ability action datums
	var/datum/action/cooldown/bloodfledge/bite/act_bite = locate() in quirk_mob.actions
	var/datum/action/cooldown/bloodfledge/revive/act_revive = locate() in quirk_mob.actions
	act_bite.Remove(quirk_mob)
	act_revive.Remove(quirk_mob)

	// Remove quirk language
	quirk_mob.remove_language(/datum/language/vampiric, TRUE, TRUE, LANGUAGE_BLOODSUCKER)

	// Unregister examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

/datum/quirk/bloodfledge/on_spawn()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Create vampire ID card
	var/obj/item/card/id/vampire/id_vampire = new /obj/item/card/id/vampire(get_turf(quirk_holder))

	// Update card information
	id_vampire.registered_name = quirk_mob.real_name
	id_vampire.update_label(addtext(id_vampire.registered_name, "'s Bloodfledge"))

	// Determine banking ID information
	for(var/bank_account in SSeconomy.bank_accounts)
		// Define current iteration's account
		var/datum/bank_account/account = bank_account

		// Check for match
		if(account.account_id == quirk_mob.account_id)
			// Add to cards list
			account.bank_cards += src

			// Assign account
			id_vampire.registered_account = account

			// Stop searching
			break

	// Try to add ID to backpack
	var/id_in_bag = quirk_mob.equip_to_slot_if_possible(id_vampire, ITEM_SLOT_BACKPACK) || FALSE

	// Text for where the item was sent
	var/id_location = (id_in_bag ? "in your backpack" : "at your feet" )

	// Alert user in chat
	// This should not post_add, because the ID is added by on_spawn
	to_chat(quirk_holder, span_boldnotice("There is a bloodfledge's ID card [id_location], linked to your station account. It functions as a spare ID, but lacks job access."))

/datum/quirk/bloodfledge/proc/quirk_examine_bloodfledge(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	SIGNAL_HANDLER

	// Check if human examiner exists
	if(!istype(examiner))
		return

	// Check if examiner is dumb
	if(HAS_TRAIT(examiner, TRAIT_DUMB))
		// Return with no effects
		return

	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Define hunger texts
	var/examine_hunger_public
	var/examine_hunger_secret

	// Check hunger levels
	switch(quirk_mob.nutrition)
		// Hungry
		if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
			examine_hunger_secret = "[quirk_holder.p_they(TRUE)] [quirk_holder.p_are()] blood starved!"
			examine_hunger_public = "[quirk_holder.p_they(TRUE)] seem[quirk_holder.p_s()] on edge from something."

		// Starving
		if(0 to NUTRITION_LEVEL_STARVING)
			examine_hunger_secret = "[quirk_holder.p_they(TRUE)] [quirk_holder.p_are()] in dire need of blood!"
			examine_hunger_public = "[quirk_holder.p_they(TRUE)] [quirk_holder.p_are()] radiating an aura of frenzied hunger!"

		// Invalid hunger
		else
			// Return with no message
			return

	// Check if examiner shares the quirk
	if(isbloodfledge(examiner))
		// Add detection text
		examine_list += span_info("[quirk_holder.p_their(TRUE)] hunger makes it easy to identify [quirk_holder.p_them()] as a fellow Bloodsucker Fledgling!")

		// Add hunger text
		examine_list += span_warning(examine_hunger_secret)

	// Check if public hunger text exists
	else
		// Add hunger text
		examine_list += span_warning(examine_hunger_public)

/datum/quirk/breathless
	name = "Breathless"
	desc = "Whether due to genetic engineering, technology, or bluespace magic, you no longer require air to function. This also means that administering life-saving manuevers such as CPR would be impossible."
	value = 3
	medical_record_text = "Patient's biology demonstrates no need for breathing."
	gain_text = span_notice("You no longer need to breathe.")
	lose_text = span_notice("You need to breathe again...")
	processing_quirk = TRUE

/datum/quirk/breathless/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NOBREATH,ROUNDSTART_TRAIT)

/datum/quirk/breathless/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NOBREATH, ROUNDSTART_TRAIT)

/datum/quirk/breathless/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjustOxyLoss(-3) /* Bandaid-fix for a defibrillator "bug",
	Which causes oxy damage to stack for mobs that don't breathe */
