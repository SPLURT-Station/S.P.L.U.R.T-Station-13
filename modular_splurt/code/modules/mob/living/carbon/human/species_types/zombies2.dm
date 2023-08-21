/* //striked out for now because I dont know what the fuck was planned here but this is breaking blood regain.
/mob/living/carbon/human/handle_blood()
	if(iszombie(src)) //We're basically pudding pops.
		return
	..()

/mob/living/carbon/get_status_tab_items()
	. = ..()
	var/obj/item/organ/heart/decayed_heart/decaying = getorgan(/obj/item/organ/heart/decayed_heart)
	if(decaying)
		. += "Current blood level: [blood_volume]/[BLOOD_VOLUME_MAXIMUM]."
		*/
/datum/species/mammal/undead
// takes 30% more damage but doesn't crit
	id = SPECIES_UMAMMAL
	name = "Undead Anthropomorph"
	exotic_bloodtype = "U"
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/zombie
	liked_food = GROSS | MEAT | RAW
	disliked_food = NONE
	blacklisted = 1
	say_mod = "moans"
	speedmod = 1.5
	armor = -0.3
	coldmod = 0.67
	cold_offset = SYNTH_COLD_OFFSET
	wings_icons = SPECIES_WINGS_SKELETAL
	species_traits = list(DRINKSBLOOD,NOZOMBIE,NOTRANSSTING,MUTCOLORS,EYECOLOR,LIPS,HAIR,HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,HAS_BONE)
	inherent_traits = list(TRAIT_NOPULSE,TRAIT_STABLEHEART,TRAIT_NOBREATH,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_NOSOFTCRIT,TRAIT_FAKEDEATH)
	inherent_biotypes = MOB_UNDEAD|MOB_HUMANOID|MOB_BEAST

	mutanttongue = /obj/item/organ/tongue/zombie

	species_category = SPECIES_CATEGORY_UNDEAD

/datum/species/mammal/undead/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.set_screwyhud(SCREWYHUD_HEALTHY)

	var/obj/item/organ/undead_infection/mammal/M
	M = C.getorganslot(ORGAN_SLOT_ZOMBIE)
	if(!M)
		M = new()
		M.Insert(C)
	var/obj/item/organ/heart/decayed_heart/H
	H = C.getorgan(/obj/item/organ/heart/decayed_heart)
	if(!H)
		H = new()
		H.Insert(C, drop_if_replaced = FALSE)

/datum/species/mammal/undead/spec_life(mob/living/carbon/human/C)
	. = ..()
	C.set_screwyhud(SCREWYHUD_HEALTHY) //just in case of hallucinations
	C.adjustStaminaLoss(-5) //no pain, no fatigue
	return

/datum/species/mammal/undead/on_species_loss(mob/living/carbon/C, datum/species/new_species)
	. = ..()
	C.set_screwyhud(SCREWYHUD_NONE)

/datum/species/insect/undead
// Lighter than other zombies. Spaceproofed
	id = SPECIES_UINSECT
	name = "Undead Insect"
	exotic_bloodtype = "U"
	exotic_blood_color = BLOOD_COLOR_BUG
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/zombie
	liked_food = GROSS | MEAT | RAW
	disliked_food = NONE
	blacklisted = 1
	say_mod = "moans"
	speedmod = 1.2
	coldmod = 0.67
	cold_offset = SYNTH_COLD_OFFSET
	species_traits = list(DRINKSBLOOD,NOZOMBIE,NOTRANSSTING,MUTCOLORS,EYECOLOR,LIPS,HAIR,HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,HAS_BONE)
	inherent_traits = list(TRAIT_NOPULSE,TRAIT_STABLEHEART,TRAIT_NOBREATH,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_FAKEDEATH)
	inherent_biotypes = MOB_UNDEAD|MOB_HUMANOID|MOB_BUG

	mutanteyes = /obj/item/organ/eyes/decayed 	//The lamp has abandoned you, monster
	mutanttongue = /obj/item/organ/tongue/zombie

	species_category = SPECIES_CATEGORY_UNDEAD

/datum/species/insect/undead/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	C.set_screwyhud(SCREWYHUD_HEALTHY)
	. = ..()

	var/obj/item/organ/undead_infection/insect/M
	M = C.getorganslot(ORGAN_SLOT_ZOMBIE)
	if(!M)
		M = new()
		M.Insert(C)
	var/obj/item/organ/eyes/decayed/I
	I = C.getorganslot(ORGAN_SLOT_EYES)
	if(!I)
		I = new()
		I.Insert(C, drop_if_replaced = FALSE)
	var/obj/item/organ/heart/decayed_heart/H
	H = C.getorgan(/obj/item/organ/heart/decayed_heart)
	if(!H)
		H = new()
		H.Insert(C, drop_if_replaced = FALSE)

/datum/species/insect/undead/spec_life(mob/living/carbon/human/C)
	. = ..()
	C.set_screwyhud(SCREWYHUD_HEALTHY) //just in case of hallucinations
	C.adjustStaminaLoss(-5) //no pain, no fatigue
	return

/datum/species/insect/undead/on_species_loss(mob/living/carbon/C, datum/species/new_species)
	C.set_screwyhud(SCREWYHUD_NONE)
	..()

/datum/species/lizard/undead
// heavy and lumbering. 20%less brute/33%less burn. Slow and weak to the cold
	id = SPECIES_GLIZZY
	name = "Undead Lizard"
	exotic_bloodtype = "U"
	exotic_blood_color = BLOOD_COLOR_LIZARD
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/zombie
	liked_food = GROSS | MEAT | RAW
	blacklisted = 1
	say_mod = "moans"
	speedmod = 1.8
	brutemod = 0.8
	burnmod = 0.67 //They are fire retardant... because they can't have fire breath
	species_traits = list(DRINKSBLOOD,NOZOMBIE,NOTRANSSTING,MUTCOLORS,EYECOLOR,LIPS,HAIR,HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,HAS_BONE)
	inherent_traits = list(TRAIT_NOPULSE,TRAIT_STABLEHEART,TRAIT_NOBREATH,TRAIT_RESISTHEAT,TRAIT_RESISTHIGHPRESSURE,TRAIT_RADIMMUNE,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_NOHARDCRIT,TRAIT_FAKEDEATH)
	inherent_biotypes = MOB_UNDEAD|MOB_HUMANOID|MOB_REPTILE

	mutanttongue = /obj/item/organ/tongue/zombie

	species_category = SPECIES_CATEGORY_UNDEAD

/datum/species/lizard/undead/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	C.set_screwyhud(SCREWYHUD_HEALTHY)
	. = ..()

	var/obj/item/organ/undead_infection/lizard/M
	M = C.getorganslot(ORGAN_SLOT_ZOMBIE)
	if(!M)
		M = new()
		M.Insert(C)
	var/obj/item/organ/heart/decayed_heart/H
	H = C.getorgan(/obj/item/organ/heart/decayed_heart)
	if(!H)
		H = new()
		H.Insert(C, drop_if_replaced = FALSE)

/datum/species/lizard/undead/spec_life(mob/living/carbon/human/C)
	. = ..()
	C.set_screwyhud(SCREWYHUD_HEALTHY) //just in case of hallucinations
	C.adjustStaminaLoss(-5) //no pain, no fatigue
	return

/datum/species/lizard/undead/on_species_loss(mob/living/carbon/C, datum/species/new_species)
	C.set_screwyhud(SCREWYHUD_NONE)
	..()

//

/obj/item/organ/brain/rotten_brain
	name = "rotten brain"
	desc = "Flies seem to be attracted to it..."
	organ_flags = ORGAN_VITAL|ORGAN_EXTERNAL|ORGAN_NO_SPOIL

/obj/item/organ/eyes/decayed
	name = "shabriri grapes"
	desc = "Delectably tender and sweet, yet searing..."
	organ_flags = ORGAN_EXTERNAL
	//Budget night_vision... Fear the sun, you monster
	lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	see_in_dark = 6
	flash_protect = -2

/obj/item/organ/heart/decayed_heart
	name = "rotten heart"
	desc = "A rotting mass of twisted viscera."
	organ_flags = ORGAN_EXTERNAL

	low_threshold_passed = span_info("Something forgotten weakens within your chest.")
	high_threshold_passed = span_warning("A chill of death stalks you.")
	now_fixed = span_cult("It comforts you once more.")
	high_threshold_cleared = span_info("The ghastly cold crawls back.")

	beating = FALSE
	var/reviving = FALSE

/obj/item/organ/heart/decayed_heart/on_find(mob/living/finder)
	to_chat(finder, "<span class='warning'>Inside the chest is a sinewous \
		mass of blood and viscera, sculpted crudely to resemble some \
		makeshift heart.</span>")

/obj/item/organ/heart/decayed_heart/on_life(seconds, times_fired)
	. = ..()
	if(owner.health <= HEALTH_THRESHOLD_CRIT)
		if(reviving || islizard(owner) && !reviving) //Strong lizard blood.
			if(owner.blood_volume >= BLOOD_VOLUME_SURVIVE)
				owner.blood_volume -= 3
				if(owner.getOxyLoss())
					owner.adjustOxyLoss(-5)
				if(owner.getBruteLoss())
					owner.adjustBruteLoss(-3)
				if(owner.getFireLoss())
					owner.adjustFireLoss(-3)
				if(owner.getToxLoss())
					owner.adjustToxLoss(-1)
		if(owner.health >= HEALTH_THRESHOLD_CRIT)
			reviving = FALSE

/obj/item/organ/heart/decayed_heart/on_death(seconds, times_fired)
	. = ..()
	if(reviving && owner)
		if(owner.blood_volume >= BLOOD_VOLUME_SURVIVE)
			owner.blood_volume -= 1.5
			if(owner.health <= HEALTH_THRESHOLD_FULLCRIT)
				if(owner.getOxyLoss())
					owner.adjustOxyLoss(-3)
				if(owner.getBruteLoss())
					owner.adjustBruteLoss(-1.5)
				if(owner.getFireLoss())
					owner.adjustFireLoss(-1.5)
				if(owner.getToxLoss())
					owner.adjustToxLoss(-1)
			if(owner.health >= HEALTH_THRESHOLD_FULLCRIT)
				owner.revive()
				if(owner.stat == !DEAD) // incase any weird shit where they can't revive
					owner.visible_message(span_danger("[owner] suddenly convulses back to life!"))
				owner.update_stat()
				owner.update_health_hud()
		if(owner.blood_volume <= BLOOD_VOLUME_SURVIVE)
			reviving = FALSE
			return
	if(owner?.health <= HEALTH_THRESHOLD_DEAD && owner?.blood_volume >= BLOOD_VOLUME_SURVIVE)
		reviving = TRUE
		to_chat(owner, span_alertwarning("Your broken shell is stitching itself back together..."))

/obj/item/organ/undead_infection
	name = "festering ooze"
	desc = "A black web of pus and viscera."
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_ZOMBIE
	icon_state = "blacktumor"
	var/causes_damage = TRUE
	var/datum/species/old_species = /datum/species/human
	var/living_transformation_time = 30
	var/converts_living = FALSE

	var/revive_time_min = 450
	var/revive_time_max = 700
	var/timer_id

/obj/item/organ/undead_infection/Initialize(mapload)
	. = ..()
	if(iscarbon(loc))
		Insert(loc)
	GLOB.zombie_infection_list += src

/obj/item/organ/undead_infection/Destroy()
	GLOB.zombie_infection_list -= src
	. = ..()

/obj/item/organ/undead_infection/Insert(var/mob/living/carbon/M, special = FALSE, drop_if_replaced = TRUE)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/organ/undead_infection/Remove(special = FALSE)
	if(owner)
		if(iszombie(owner) && old_species)
			owner.set_species(old_species)
		if(timer_id)
			deltimer(timer_id)
	. = ..()
	STOP_PROCESSING(SSobj, src) //Required to be done after the parent call to avoid conflicts with organ decay.

/obj/item/organ/undead_infection/on_find(mob/living/finder)
	to_chat(finder, "<span class='warning'>Inside the head is a disgusting black \
		web of pus and viscera, bound tightly around the brain like some \
		biological harness.</span>")

/obj/item/organ/undead_infection/process(special = FALSE)
	if(!owner)
		return
	if(!(src in owner.internal_organs))
		INVOKE_ASYNC(src,.proc/Remove,owner)
	if(owner.mob_biotypes && MOB_MINERAL && MOB_UNDEAD)//We are already dead inside
		. = ..()
		STOP_PROCESSING(SSobj, src)
		return
	if (causes_damage && !iszombie(owner) && owner.stat != DEAD)
		owner.adjustToxLoss(1)
		if (prob(10))
			to_chat(owner, span_danger("You feel sick..."))
	if(timer_id)
		return
	if(owner.suiciding)
		return
	if(owner.stat != DEAD && !converts_living)
		return
	if(!owner.getorgan(/obj/item/organ/brain))
		return
	if(!iszombie(owner))
		REMOVE_TRAIT(owner, TRAIT_NODEATH, DISEASE_TRAIT)
		to_chat(owner, "<span class='cult'>Something isn't right.  \
		Your heart has stopped...</span>")
		var/revive_time = rand(revive_time_min, revive_time_max)
		var/flags = TIMER_STOPPABLE
		timer_id = addtimer(CALLBACK(src, .proc/zombify), revive_time, flags)

/obj/item/organ/undead_infection/proc/zombify(mob/living/M, mob/living/carbon/user)
	timer_id = null

	if(!converts_living && owner.stat != DEAD)
		return

	if(!iszombie(owner))
		switch(old_species)
			if(/datum/species/mammal)
				owner.set_species(/datum/species/mammal/undead)
			if(/datum/species/insect)
				owner.set_species(/datum/species/insect/undead)
			if(/datum/species/lizard)
				owner.set_species(/datum/species/lizard/undead)
			else
				owner.set_species(/datum/species/zombie)

	var/stand_up = (owner.stat == DEAD) || (owner.stat == UNCONSCIOUS)

	//Fully heal the zombie's damage the first time they rise
	owner.setToxLoss(0, 0)
	owner.setOxyLoss(0, 0)
	owner.heal_overall_damage(INFINITY, INFINITY, INFINITY, FALSE, FALSE, TRUE)
	REMOVE_TRAIT(owner, TRAIT_DEATHCOMA, DISEASE_TRAIT)

	if(!owner.revive())
		return

	owner.grab_ghost()
	owner.visible_message(span_danger("[owner] suddenly convulses, as [owner.p_they()][stand_up ? " stagger to [owner.p_their()] feet and" : ""] gain a ravenous hunger in [owner.p_their()] eyes!"), span_cultlarge("* But it refused"))
	playsound(owner.loc, 'sound/hallucinations/far_noise.ogg', 50, 1)
	owner.do_jitter_animation(living_transformation_time)
	owner.Stun(living_transformation_time)
//	to_chat(owner, span_alertalien("You are now a zombie! You claw and bite, turning your fellow crewmembers into friends that help spread the plague."))
//	to_chat(owner, span_alertwarning("You are a zombie. Please act like one. Letting the crew remove the tumor inside your brain is a dick move to whoever infected you. Please do not do it."))

/obj/item/organ/undead_infection/mammal
	old_species = /datum/species/mammal

/obj/item/organ/undead_infection/insect
	old_species = /datum/species/insect

/obj/item/organ/undead_infection/lizard
	old_species = /datum/species/lizard

/datum/reagent/draughtofundeath
	name = "Essence of Living Death"
	description = "Smells of asphodels and wormwood."
	color = "#89c955" //RGB: 94, 255, 59
	metabolization_rate = INFINITY
	taste_description = "bitter regret"
	value = REAGENT_VALUE_GLORIOUS

/datum/reagent/draughtofundeath/on_mob_life(mob/living/carbon/human/H, mob/living/carbon/C, datum/species/old_species)
	..()
	if(iszombie(H))
		metabolization_rate = 0 //We are born from it.
		return
	addtimer(CALLBACK(H, /mob/living/carbon/human/proc/undeath, "undeath"), 60 SECONDS)
	if(!istype(H))
		return
	var/datum/disease/D = new /datum/disease/heart_failure/livingdeath
	H.ForceContractDisease(D)

	CHECK_DNA_AND_SPECIES(H)

	if(NOZOMBIE in H.dna.species.species_traits)
		return

	var/obj/item/organ/undead_infection/infection
	infection = H.getorganslot(ORGAN_SLOT_ZOMBIE)
	if(!infection)
		infection = new()
		infection.Insert(H)

	to_chat(H, span_cult("mors tua, vita mea."))
	H.playsound_local(H, 'sound/effects/singlebeat.ogg', 100, 0)
	return

/mob/living/carbon/human/proc/undeath(mob/living/M)
	if(stat == DEAD)
		return
	else
		emote("deathgasp")
		tod = STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)
	fakedeath(DISEASE_TRAIT, TRUE)
	update_stat()

/datum/disease/heart_failure/livingdeath
	visibility_flags = HIDDEN_PANDEMIC
	disease_flags = CAN_CARRY
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS

	form = "Anomaly"
	name = "Immortal Ambition"
	desc = "A newly freed soul desperately clinging onto any source of life..."
	cure_text = "404 file not found"

	stage_prob = 10
	severity = DISEASE_SEVERITY_BIOHAZARD
	process_dead = TRUE

/obj/item/reagent_containers/pill/planz
	name = "Plan Z"
	desc = "All out of options, are we?"
	icon_state = "pill5"
	color = "#830000"
	list_reagents = list(/datum/reagent/draughtofundeath = 1)
