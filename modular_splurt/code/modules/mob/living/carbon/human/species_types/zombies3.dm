/datum/species/mammal/undead		//basic bitch zombie. Slow, hits hard, easy to hit hard
	id = SPECIES_UMAMMAL
	name = "Zombie Anthro"

	exotic_bloodtype = "Z"
	exotic_blood_color = BLOOD_COLOR_OIL

	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/zombie
	liked_food = RAW | MEAT | GROSS | PINEAPPLE
	disliked_food = TOXIC | JUNKFOOD | SUGAR
	toxic_food = VEGETABLES | FRUIT | GRAIN | DAIRY

	blacklisted = 1

	say_mod = "moans"
	species_language_holder = /datum/language_holder/zombie

	mutant_organs = list(/obj/item/organ/undead_infection/mammal)

	speedmod = 1.5
	armor = -0.3
	coldmod = 0.67
	cold_offset = SYNTH_COLD_OFFSET
	punchdamagelow = 2
	punchdamagehigh = 12
	punchwoundbonus = 6
	siemens_coeff = 0.75		//shockingly resilient

	wings_icon = SPECIES_WINGS_SKELETAL

	species_traits = list(MUTCOLORS,HAIR,EYECOLOR,LIPS,NOTRANSSTING,
					NOZOMBIE, HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,
					HAS_BONE)
	inherent_traits = list(TRAIT_FAKEDEATH,TRAIT_STABLEHEART,TRAIT_STABLELIVER,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,
					TRAIT_NOGUNS,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_NOBREATH,TRAIT_AUXILIARY_LUNGS,
					TRAIT_NOSOFTCRIT,TRAIT_COLDBLOODED,TRAIT_NONATURALHEAL,TRAIT_NOMARROW,TRAIT_NOPULSE,
					TRAIT_NODECAP,TRAIT_MAULER)		//can't gun or naturally heal/regen blood. But can beat up nerds
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_BEAST|MOB_UNDEAD

	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	ignored_by = list(/mob/living/simple_animal/hostile/zombie,
				/mob/living/simple_animal/hostile/skeleton,
				)

	mutant_brain = /obj/item/organ/brain/rotten_brain
	mutant_heart = /obj/item/organ/heart/decayed_heart
	mutanttongue = /obj/item/organ/tongue/zombie
	mutantstomach = /obj/item/organ/stomach/vacuous


	species_category = SPECIES_CATEGORY_UNDEAD

/datum/species/mammal/zombie/spec_life(mob/living/carbon/human/Z)
	. = ..()
	Z.set_screwyhud(SCREWYHUD_HEALTHY)

/datum/species/mammal/zombie/on_species_loss(mob/living/carbon/Z)
	. = ..()
	Z.set_screwyhud(SCREWYHUD_NONE)

/////

/datum/species/insect/undead		//weaker than the rest, but fast and chitinous, personal spacesuit.
	id = SPECIES_UINSECT
	name = "Zombie Bug"

	exotic_bloodtype = "Z"
	exotic_blood_color = BLOOD_COLOR_OIL

	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/zombie
	liked_food = RAW | MEAT | GROSS | PINEAPPLE
	disliked_food = TOXIC | JUNKFOOD | SUGAR
	toxic_food = VEGETABLES | FRUIT | GRAIN | DAIRY

	blacklisted = 1

	say_mod = "moans"
	species_language_holder = /datum/language_holder/zombie

	mutant_organs = list(/obj/item/organ/undead_infection/insect)

	speedmod = 1.2
	armor = -0.1

	punchdamagelow = 4
	punchdamagehigh = 7
	punchwoundbonus = 6
	siemens_coeff = 0.75

	wings_icon = SPECIES_WINGS_SKELETAL

	species_traits = list(MUTCOLORS,HAIR,EYECOLOR,LIPS,NOTRANSSTING,
					NOZOMBIE, HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,
					HAS_BONE)
	inherent_traits = list(TRAIT_FAKEDEATH,TRAIT_STABLEHEART,TRAIT_STABLELIVER,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,
					TRAIT_NOGUNS,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_NOBREATH,TRAIT_AUXILIARY_LUNGS,
					TRAIT_STRONG_GRABBER,TRAIT_COLDBLOODED,TRAIT_NONATURALHEAL,TRAIT_NOMARROW,TRAIT_NOPULSE,
					TRAIT_NODECAP,TRAIT_RESISTCOLD)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_BUG|MOB_UNDEAD

	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	ignored_by = list(/mob/living/simple_animal/hostile/zombie,
				/mob/living/simple_animal/hostile/skeleton,
				)

	mutant_brain = /obj/item/organ/brain/rotten_brain
	mutanteyes = /obj/item/organ/eyes/decayed
	mutant_heart = /obj/item/organ/heart/decayed_heart
	mutanttongue = /obj/item/organ/tongue/zombie
	mutantstomach = /obj/item/organ/stomach/vacuous

	species_category = SPECIES_CATEGORY_UNDEAD

/datum/species/insect/zombie/spec_life(mob/living/carbon/human/Z)
	. = ..()
	Z.set_screwyhud(SCREWYHUD_HEALTHY)

/datum/species/insect/zombie/on_species_loss(mob/living/carbon/Z)
	. = ..()
	Z.set_screwyhud(SCREWYHUD_NONE)

/////

/datum/species/lizard/undead		//Tanky bitches
	id = SPECIES_GLIZZY
	name = "Zombie Reptile"

	exotic_bloodtype = "Z"
	exotic_blood_color = BLOOD_COLOR_OIL

	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/zombie
	liked_food = RAW | MEAT | GROSS | PINEAPPLE
	disliked_food = TOXIC | JUNKFOOD | SUGAR
	toxic_food = VEGETABLES | FRUIT | GRAIN | DAIRY

	blacklisted = 1

	say_mod = "moans"
	species_language_holder = /datum/language_holder/zombie

	mutant_organs = list(/obj/item/organ/undead_infection/lizard)

	speedmod = 1.8
	brutemod = 0.8
	burnmod = 0.67 //They are fire retardant... because they can't have fire breath

	punchdamagelow = 5
	punchdamagehigh = 14
	punchstunthreshold = 10
	punchwoundbonus = 6
	siemens_coeff = 0.75

	wings_icon = SPECIES_WINGS_SKELETAL

	species_traits = list(MUTCOLORS,HAIR,EYECOLOR,LIPS,NOTRANSSTING,
					NOZOMBIE, HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,
					HAS_BONE)
	inherent_traits = list(TRAIT_FAKEDEATH,TRAIT_STABLEHEART,TRAIT_STABLELIVER,TRAIT_RESISTHEAT,TRAIT_RADIMMUNE,
					TRAIT_NOGUNS,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_NOBREATH,TRAIT_AUXILIARY_LUNGS,
					TRAIT_STRONG_GRABBER,TRAIT_COLDBLOODED,TRAIT_NONATURALHEAL,TRAIT_NOMARROW,TRAIT_NOPULSE,
					TRAIT_NODECAP,TRAIT_MAULER,TRAIT_RESISTHIGHPRESSURE,TRAIT_NOHARDCRIT)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_BUG|MOB_UNDEAD

	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	ignored_by = list(/mob/living/simple_animal/hostile/zombie,
				/mob/living/simple_animal/hostile/skeleton,
				)

	mutant_brain = /obj/item/organ/brain/rotten_brain
	mutant_heart = /obj/item/organ/heart/decayed_heart
	mutanttongue = /obj/item/organ/tongue/zombie
	mutantstomach = /obj/item/organ/stomach/vacuous

	species_category = SPECIES_CATEGORY_UNDEAD

/datum/species/lizard/zombie/spec_life(mob/living/carbon/human/Z)
	. = ..()
	Z.set_screwyhud(SCREWYHUD_HEALTHY)

/datum/species/lizard/zombie/on_species_loss(mob/living/carbon/Z)
	. = ..()
	Z.set_screwyhud(SCREWYHUD_NONE)

///////////////////////////////////////////////////////////////////////////////////////////////////////
			///Weird fucking procs///
/mob/living/carbon/human/handle_blood(delta_time, times_fired)
	if(iszombie(src)) //We're basically pudding pops.
		return
	..()

/datum/component/edible/TakeBite(mob/living/eater, mob/living/feeder)

	var/atom/owner = parent

	if(!owner?.reagents)
		return FALSE
	if(eater.satiety > -200)
		eater.satiety -= junkiness
	playsound(eater.loc,'sound/items/eatfood.ogg', rand(10,50), TRUE)

	var/obj/item/organ/stomach/vacuous/stomach = eater.getorganslot(ORGAN_SLOT_STOMACH)
	if(stomach && (istype(stomach, /obj/item/organ/stomach/vacuous)))
		if(istype(owner, /obj/item/organ) || istype(owner, /obj/item/bodypart) || istype(owner, list(
														/obj/item/reagent_containers/food/snacks/meat/slab/human,
														/obj/item/reagent_containers/food/snacks/meat/rawcutlet/plain/human,
														/obj/item/reagent_containers/food/snacks/meat/cutlet/plain/human,
														/obj/item/reagent_containers/food/snacks/meat/steak/plain/human,
														/obj/item/reagent_containers/food/snacks/kebab/human,
														/obj/item/reagent_containers/food/snacks/burger/human,
														)))
			SEND_SIGNAL(parent, COMSIG_FOOD_EATEN, eater, feeder)
			var/fraction = min(bite_consumption / owner.reagents.total_volume, 1)
			owner.reagents.reaction(eater, INGEST, fraction)
			owner.reagents.trans_to(eater, bite_consumption, 1, 0, 0, FALSE)
			eater.blood_volume += bite_consumption
			bitecount++
			On_Consume(eater)
			checkLiked(fraction, eater)

			//Invoke our after eat callback if it is valid
			if(after_eat)
				after_eat.Invoke(eater, feeder)

		return TRUE
	. = ..()

/obj/item/bodypart/Initialize(mapload)
	. = ..()
	var/list/food_reagents = list(/datum/reagent/consumable/nutriment = 20)
	if(status & BODYPART_ORGANIC)
		AddComponent(/datum/component/edible, food_reagents, null, RAW | MEAT | GROSS, null, 10, null, null, null, null)
	START_PROCESSING(SSobj, src)

///////////////////////////////////////////////////////////////////////////////////////////////////////
			///Weird fucking organs///
/obj/item/organ/eyes/decayed
	name = "shabriri grapes"
	desc = "Delectably tender and sweet, yet searing..."
	organ_flags = ORGAN_EXTERNAL
	//Budget night_vision... Fear the sun, you monster
	lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	see_in_dark = 6
	flash_protect = -2
//////

/obj/item/organ/brain/rotten_brain
	name = "rotten brain"
	desc = "Flies seem to be attracted to it..."
	organ_flags = ORGAN_VITAL|ORGAN_EXTERNAL|ORGAN_NO_SPOIL

/////
/obj/item/organ/heart/decayed_heart
	name = "rotten heart"
	desc = "A rotting mass of twisted viscera."
	organ_flags = ORGAN_EXTERNAL|ORGAN_NO_SPOIL

	low_threshold_passed = "<span class='info'>Something forgotten weakens within your chest.</span>"
	high_threshold_passed = "<span class='warning'>A chill of death stalks you.</span>"
	now_fixed = "<span class='cult'>It comforts you once more.</span>"
	high_threshold_cleared = "<span class='info'>The ghastly cold crawls back.</span>"

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
					owner.visible_message("<span class='danger'>With a hideous, rattling moan, [owner] shudders back to life!</span>")
				owner.update_stat()
				owner.update_health_hud()
		if(owner.blood_volume <= BLOOD_VOLUME_SURVIVE)
			reviving = FALSE
			return
	if(owner?.health <= HEALTH_THRESHOLD_DEAD && owner?.blood_volume >= BLOOD_VOLUME_SURVIVE && !reviving)
		reviving = TRUE
		to_chat(owner, "<span class='cult'>Existence is a curious matter... Exercise restraint, your mortal shell is our greatest triumph.</span>")

/////
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

/obj/item/organ/zombie_infection/Destroy()
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
			to_chat(owner, "<span class='danger'>You feel sick...</span>")
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
	owner.visible_message("<span class='danger'>[owner] suddenly convulses, as [owner.p_they()][stand_up ? " stagger to [owner.p_their()] feet and" : ""] gain a ravenous hunger in [owner.p_their()] eyes!</span>", "<span class='cultlarge'>* But it refused</span>")
	playsound(owner.loc, 'sound/hallucinations/far_noise.ogg', 50, 1)
	owner.do_jitter_animation(living_transformation_time)
	owner.Stun(living_transformation_time)

/obj/item/organ/undead_infection/mammal
	old_species = /datum/species/mammal

/obj/item/organ/undead_infection/insect
	old_species = /datum/species/insect

/obj/item/organ/undead_infection/lizard
	old_species = /datum/species/lizard

//////
/obj/item/organ/stomach/vacuous
	name = "ichor-stained stomach"
	desc = "A burden you may choose to carry."
	organ_flags = ORGAN_EXTERNAL|ORGAN_NO_SPOIL

	disgust_metabolism = 0.5

	healing_factor = STANDARD_ORGAN_HEALING
	decay_factor = STANDARD_ORGAN_DECAY

	low_threshold_passed = "<span class='info'>Your stomach flashes with pain before subsiding. Food doesn't seem like a good idea right now.</span>"
	high_threshold_passed = "<span class='warning'>Your stomach flares up with constant pain- you can hardly stomach the idea of food right now!</span>"
	high_threshold_cleared = "<span class='info'>The pain in your stomach dies down for now, but food still seems unappealing.</span>"
	low_threshold_cleared = "<span class='info'>The last bouts of pain in your stomach have died out.</span>"

/obj/item/organ/stomach/vacuous/Insert(mob/living/carbon/Z, special, drop_if_replaced)
	. = ..()
	ADD_TRAIT(owner, TRAIT_NO_PROCESS_FOOD, "Zombism")

/obj/item/organ/stomach/vacuous/Remove(special)
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_NO_PROCESS_FOOD, "Zombism")

/obj/item/organ/stomach/vacuous/on_life()
	var/mob/living/carbon/human/Z = owner
	Starvation(HUNGER_FACTOR)
	handle_disgust(Z)
	return

/obj/item/organ/stomach/vacuous/proc/Starvation(hunger_rate)
	var/datum/component/mood/mood = owner.GetComponent(/datum/component/mood)
	if(mood && mood.sanity > SANITY_DISTURBED)
		hunger_rate *= max(0.5, 1 - 0.002 * mood.sanity)
	hunger_rate *= (owner.nutrition / 50)

	owner.blood_volume = clamp(owner.blood_volume - hunger_rate, BLOOD_VOLUME_SURVIVE, NUTRITION_LEVEL_FULL)
	owner.set_nutrition(min(owner.blood_volume, NUTRITION_LEVEL_FULL))

///////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/language_holder/zombie
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/ghoulish = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/ghoulish = list(LANGUAGE_ATOM))

/datum/language/ghoulish
	name = "Ghoulish"
	desc = "The utterings of the dead and damned."
	speech_verb = "gargles"
	ask_verb = "gags"
	exclaim_verb = "retches"
	whisper_verb = "trills"
	key = "?"
	syllables = list("grhhg", "ghrohg", "grgugh", "grrhh", "hghh", "rghghh", "gghhh", "ggrh", "aghrh")
	sentence_chance = 0		//Wut?
	space_chance = 0		//Huh?
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD | NO_STUTTER | TONGUELESS_SPEECH
	restricted = TRUE
	allow_repeated_syllables = FALSE
	icon_state = "aphasia"

///////////////////////////////////////////////////////////////////////////////////////////////////////
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

	to_chat(H, "<span class='cult'>mors tua, vita mea.</span>")
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
