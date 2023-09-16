// Xenochimera thing mostly
#define REVIVING_NOW		-1
#define REVIVING_DONE		0
#define REVIVING_READY		1


/datum/species/mammal/xenochimera
	name = "Xenochimera"
	id = SPECIES_XENOCHIMERA
	mutant_bodyparts = list("mcolor" = "FFFFFF", "mcolor2" = "FFFFFF", "mcolor3" = "FFFFFF", "mam_snouts" = "None", "mam_tail" = "None", "mam_ears" = "None", "deco_wings" = "None",
						"taur" = "None", "horns" = "None", "legs" = "Plantigrade", "meat_type" = "Mammalian")
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,LIPS,WINGCOLOR,HAS_FLESH,HAS_BONE)
	mutanteyes = /obj/item/organ/eyes/night_vision
	brutemod = 0.8		//About as tanky to brute as a Unathi. They'll probably snap and go feral when hurt though.
	burnmod =  1.15	//As vulnerable to burn as a Tajara.

/datum/species/mammal/xenochimera/on_species_gain(mob/living/carbon/human/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		C.verbs += /mob/living/carbon/human/proc/reconstitute_form
		C.verbs += /mob/living/carbon/human/proc/sonar_ping
		C.verbs += /mob/living/carbon/human/proc/tie_hair
		C.add_movespeed_modifier(/datum/movespeed_modifier/xenochimera)

/datum/species/mammal/xenochimera/spec_life(mob/living/carbon/human/H)
	//If they're KO'd/dead, or reviving, they're probably not thinking a lot about much of anything.
	//if(!H.stat || !(H.revive_ready == REVIVING_NOW || H.revive_ready == REVIVING_DONE))
	//	handle_feralness(H)

	//While regenerating
	if(H.revive_ready == REVIVING_NOW || H.revive_ready == REVIVING_DONE)
		H.Paralyze(1000)
		var/regen_sounds = list(
		'modular_splurt/sound/effects/regen_1.ogg',
		'modular_splurt/sound/effects/regen_2.ogg',
		'modular_splurt/sound/effects/regen_4.ogg',
		'modular_splurt/sound/effects/regen_3.ogg',
		'modular_splurt/sound/effects/regen_5.ogg'
		)
		if(prob(2)) // 2% chance of playing squelchy noise while reviving, which is run roughly every 2 seconds/tick while regenerating.
			playsound(H, pick(regen_sounds), 30)
			H.visible_message("<span class='danger'><p><font size=4>[H.name]'s motionless form shudders grotesquely, rippling unnaturally.</font></p></span>")

	//Cold/pressure effects when not regenerating
	else
		var/datum/gas_mixture/environment = H.loc.return_air()
		var/pressure2 = environment.return_pressure()
		var/adjusted_pressure2 = H.calculate_affecting_pressure(pressure2)

		//Very low pressure damage
		if(adjusted_pressure2 <= 20)
			H.take_overall_damage(LOW_PRESSURE_DAMAGE, 0)


		//Cold hurts and gives them pain messages, eventually weakening and paralysing, but doesn't damage or trigger feral.
		//NB: 'body_temperature' used here is the 'setpoint' species var
		var/body_temperature = 310.15
		var/temp_diff = body_temperature - H.bodytemperature
		if(temp_diff >= 50)
			H.eye_blurry = max(5,H.eye_blurry)

/datum/movespeed_modifier/xenochimera
	multiplicative_slowdown = -0.1

/mob/living/carbon/human/proc/reconstitute_form() //Scree's race ability.in exchange for: No cloning.
	set name = "Reconstitute Form"
	set category = "Abilities"

	// Sanity is mostly handled in chimera_regenerate()
	if(stat == DEAD)
		var/confirm = tgui_alert(usr, "Are you sure you want to regenerate your corpse? This process can take up to thirty minutes.", "Confirm Regeneration", list("Yes", "No"))
		if(confirm == "Yes")
			chimera_regenerate()
	else if (quickcheckuninjured())
		var/confirm = tgui_alert(usr, "Are you sure you want to regenerate? As you are uninjured this will only take 30 seconds and match your appearance to your character slot.", "Confirm Regeneration", list("Yes", "No"))
		if(confirm == "Yes")
			chimera_regenerate()
	else
		var/confirm = tgui_alert(usr, "Are you sure you want to completely reconstruct your form? This process can take up to fifteen minutes, depending on how hungry you are, and you will be unable to move.", "Confirm Regeneration", list("Yes", "No"))
		if(confirm == "Yes")
			chimera_regenerate()

/mob/living/carbon/human/proc/tie_hair()
	set name = "Tie Hair"
	set desc = "Style your hair."
	set category = "IC"

	if(incapacitated())
		to_chat(src, "<span class='warning'>You can't mess with your hair right now!</span>")
		return

	if(hair_style)
		var/selected_string
		var/list/datum/sprite_accessory/hair/valid_hairstyles = list()
		for(var/hair_string in GLOB.hair_styles_list)
			valid_hairstyles.Add(hair_string)
		selected_string = tgui_input_list(usr, "Select a new hairstyle", "Your hairstyle", valid_hairstyles)
		if(incapacitated())
			to_chat(src, "<span class='warning'>You can't mess with your hair right now!</span>")
			return
		else if(selected_string && hair_style != selected_string)
			hair_style = selected_string
			regenerate_icons()
			visible_message("<span class='notice'>[src] pauses a moment to style their hair.</span>")
		else
			to_chat(src, "<span class ='notice'>You're already using that style.</span>")

/mob/living/carbon/human
	var/revive_ready = REVIVING_READY	// Only used for creatures that have the xenochimera regen ability, so far.
	var/revive_finished = 0				// Only used for xenochimera regen, allows us to find out when the regen will finish.

/mob/living/carbon/human/proc/chimera_regenerate()
	//If they're already regenerating
	switch(revive_ready)
		if(REVIVING_NOW)
			to_chat(src, "You are already reconstructing, just wait for the reconstruction to finish!")
			return
		if(REVIVING_DONE)
			to_chat(src, "Your reconstruction is done, but you need to hatch now.")
			return
	if(revive_ready > world.time)
		to_chat(src, "You can't use that ability again so soon!")
		return

	var/time = min(900, (120+780/(1 + nutrition/100))) //capped at 15 mins, roughly 6 minutes at 250 (yellow) nutrition, 4.1 minutes at 500 (grey), cannot be below 2 mins
	if (quickcheckuninjured()) //if you're completely uninjured, then you get a speedymode - check health first for quickness
		time = 30

	//Clicked regen while dead.
	if(stat == DEAD)

		//reviving from dead takes extra nutriment to be provided from outside OR takes twice as long and consumes extra at the end
		if(!nutrition > 0)
			time = time*2

		to_chat(src, "You begin to reconstruct your form. You will not be able to move during this time. It should take aproximately [round(time)] seconds.")

		//Scary spawnerization.
		revive_ready = REVIVING_NOW
		revive_finished = (world.time + time SECONDS) // When do we finish reviving? Allows us to find out when we're done, called by the alert currently.
		throw_alert("regen", /atom/movable/screen/alert/xenochimera/reconstitution)
		spawn(time SECONDS)
			// check to see if they've been fixed by outside forces in the meantime such as defibbing
			if(stat != DEAD)
				to_chat(src, "<span class='notice'>Your body has recovered from its ordeal, ready to regenerate itself again.</span>")
				revive_ready = REVIVING_READY //reset their cooldown
				clear_alert("regen")
				throw_alert("hatch", /atom/movable/screen/alert/xenochimera/readytohatch)

			// Was dead, still dead.
			else
				to_chat(src, "<span class='notice'>Consciousness begins to stir as your new body awakens, ready to hatch.</span>")
				verbs |= /mob/living/carbon/human/proc/hatch
				revive_ready = REVIVING_DONE
				clear_alert("regen")
				throw_alert("hatch", /atom/movable/screen/alert/xenochimera/readytohatch)


	//Clicked regen while NOT dead
	else
		to_chat(src, "You begin to reconstruct your form. You will not be able to move during this time. It should take aproximately [round(time)] seconds.")

		//Waiting for regen after being alive
		revive_ready = REVIVING_NOW
		revive_finished = (world.time + time SECONDS) // When do we finish reviving? Allows us to find out when we're done, called by the alert currently.
		throw_alert("regen", /atom/movable/screen/alert/xenochimera/reconstitution)
		spawn(time SECONDS)

			//Slightly different flavour messages
			if(stat != DEAD || nutrition > 0)
				to_chat(src, "<span class='notice'>Consciousness begins to stir as your new body awakens, ready to hatch..</span>")
			else
				to_chat(src, "<span class='warning'>Consciousness begins to stir as your battered body struggles to recover from its ordeal..</span>")
			verbs |= /mob/living/carbon/human/proc/hatch
			revive_ready = REVIVING_DONE

			clear_alert("regen")
			throw_alert("hatch", /atom/movable/screen/alert/xenochimera/readytohatch)

/mob/living/carbon/human/proc/hatch()
	set name = "Hatch"
	set category = "Abilities"

	if(revive_ready != REVIVING_DONE)
		//Hwhat?
		verbs -= /mob/living/carbon/human/proc/hatch
		return

	var/confirm = tgui_alert(usr, "Are you sure you want to hatch right now? This will be very obvious to anyone in view.", "Confirm Regeneration", list("Yes", "No"))
	if(confirm == "Yes")

		//Dead when hatching
		if(stat == DEAD)

			//Reviving from ded takes extra nutrition - if it isn't provided from outside sources, it comes from you
			if(!nutrition > 0)
				nutrition=nutrition * 0.75
			chimera_hatch()

			visible_message("<span class='warning'><p><font size=4>The former corpse staggers to its feet, all its former wounds having vanished...</font></p></span>") //Bloody hell...
			clear_alert("hatch")
			return

		//Alive when hatching
		else
			chimera_hatch()

			visible_message("<span class='warning'><p><font size=4>[src] rises to \his feet.</font></p></span>") //Bloody hell...
			clear_alert("hatch")

/mob/living/carbon/human/proc/chimera_hatch()
	verbs -= /mob/living/carbon/human/proc/hatch
	to_chat(src, "<span class='notice'>Your new body awakens, bursting free from your old skin.</span>")
	//Modify and record values (half nutrition and braindamage)
	var/old_nutrition = nutrition
	var/uninjured=quickcheckuninjured()
	//I did have special snowflake code, but this is easier.
	revive()
	cure_husk()


	if(!uninjured)
		nutrition = old_nutrition * 0.5
		//Drop everything
		for(var/obj/item/W in src)
			dropItemToGround(W, 1)
		//Visual effects
		var/T = get_turf(src)

		new /obj/effect/gibspawner/human(T, src)
		visible_message("<span class='danger'><p><font size=4>The lifeless husk of [src] bursts open, revealing a new, intact copy in the pool of viscera.</font></p></span>") //Bloody hell...

	else //lower cost for doing a quick cosmetic revive
		nutrition = old_nutrition * 0.9

	//Unfreeze some things
	//does_not_breathe = FALSE
	//update_canmove()
	//weakened = 2
	SetParalyzed(0)
	revive_ready = world.time + 10 MINUTES //set the cooldown CHOMPEdit: Reduced this to 10 minutes, you're playing with fire if you're reviving that often.


/atom/movable/screen/alert/xenochimera/reconstitution
	name = "Reconstructing Form"
	desc = "You're still rebuilding your body! Click the alert to find out how long you have left."
	icon_state = "regenerating"

 // Commenting this out for now, will revisit later once I can figure out how to override Click() appropriately.
/atom/movable/screen/alert/xenochimera/reconstitution/Click()
	if(ishuman(usr)) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
		var/mob/living/carbon/human/H = usr
		if(istype(H.dna.species, /datum/species/mammal/xenochimera))
			if(H.revive_ready == REVIVING_NOW)
				to_chat(usr, "We are currently reviving, and will be done in [(H.revive_finished - world.time) / 10] seconds.")
			else if(H.revive_ready == REVIVING_DONE)
				to_chat(usr, "You should have a notification + alert for this! Bug report that this is still here!")


/atom/movable/screen/alert/xenochimera/readytohatch
	name = "Ready to Hatch"
	desc = "You're done reconstructing your cells! Click me to Hatch!"
	icon_state = "hatch_ready"

	// Commenting this out for now, will revisit later once I can figure out how to override Click() appropriately.
/atom/movable/screen/alert/xenochimera/readytohatch/Click()
	if(ishuman(usr)) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
		var/mob/living/carbon/human/H = usr
		if(istype(H.dna.species, /datum/species/mammal/xenochimera))
			if(H.revive_ready == REVIVING_DONE) // Sanity check.
				H.hatch() // Hatch.


/mob/living/carbon/human/proc/quickcheckuninjured()
	if (getBruteLoss() || getFireLoss() || getToxLoss() || getOxyLoss()) //fails if they have any of the main damage types
		return FALSE
	return TRUE

#undef REVIVING_NOW
#undef REVIVING_DONE
#undef REVIVING_READY

