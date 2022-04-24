/**
 * Who is the liar but he who denies that Jesus is the Christ? This is the antichrist, he who denies the Father and the Son.
 * - John 2:22
 */
/datum/status_effect/pregnancy
	id = "pregnancy"
	duration = -1
	tick_interval = 2 SECONDS
	//type of baby the mother will plop out - needs to be subtype of /mob/living
	var/baby_type = /mob/living/carbon/human
	//weakref to the father, if there is any
	var/datum/weakref/father
	//world.time when gregnancy started
	var/pregnancy_start = 0
	//last world.time we ticked on
	var/last_tick = 0
	//this stores the old belly size in case king ass ripper already had a huge, gluttonous belly
	var/old_belly_size = 0
	//this boolean is for identifying whether this crime against nature is a live birth or oviposition
	var/oviposition = FALSE
	//this boolean is for saving whether or not we should inflate the belly if appropriate
	var/pregnancy_inflation = TRUE
	//whether or not our babby looks like us - if false, then it's gonna be like dad
	var/like_mother_like_son = TRUE
	//to avoid spam
	var/stop_spamming_birth = FALSE

/datum/status_effect/pregnancy/on_creation(mob/living/new_owner, baby_type, mob/living/father)
	if(baby_type)
		if(!ispath(baby_type, /mob/living))
			stack_trace("Invalid baby_type given to [type] status effect!")
			qdel(src)
			return
		src.baby_type = baby_type
	if(father)
		if(!istype(father))
			stack_trace("Invalid father given to [type] status effect!")
			qdel(src)
			return
		src.father = WEAKREF(father)
	return ..()

/datum/status_effect/pregnancy/on_apply()
	. = ..()
	if(owner.stat <= DEAD)
		return FALSE
	pregnancy_start = world.time
	RegisterSignal(owner, COMSIG_MOB_DEATH, .proc/fetus_mortus)
	ADD_TRAIT(owner, TRAIT_PREGNANT, PREGNANCY_TRAIT)
	if(ishuman(owner))
		return human_pragency_start(owner)

/datum/status_effect/pregnancy/tick()
	var/pregnancy_time = world.time - pregnancy_start
	var/obj/item/organ/genital/belly/belly = owner.getorganslot(ORGAN_SLOT_BELLY)

	var/preggy_stage_duration = round(PREGNANCY_DURATION/PREGNANCY_STAGES)
	//oviposition only has one stage, the rest is handled by the egg
	if(pregnancy_time >= preggy_stage_duration && (last_tick < preggy_stage_duration))
		if(!oviposition)
			to_chat(owner, span_warning("Oh! The kicking in my belly is getting a bit more intense!"))
			if(belly && pregnancy_inflation)
				belly.size = max(belly.size, 2)
				belly.update()
			owner.adjustStaminaLoss(10)

	if(pregnancy_time >= preggy_stage_duration)
		if(!stop_spamming_birth || !(world.time % 30))
			to_chat(owner, span_warning("Something presses hard against your anus! It's probably your egg!"))
			stop_spamming_birth = TRUE
			owner.adjustStaminaLoss(30)
		var/can_oviposit = TRUE
		if(ishuman(owner))
			var/mob/living/carbon/human/human_owner = owner
			var/obj/item/bodypart/chest = human_owner.get_bodypart(BODY_ZONE_CHEST)
			if(human_owner.clothingonpart(chest))
				can_oviposit = FALSE
		if(can_oviposit)
			new /obj/item/reagent_containers/food/snacks/egg/oviposition(owner.loc, src)
			to_chat(owner, span_nicegreen("The egg came out!"))
			qdel(src)

	if(oviposition)
		last_tick = world.time
		return

	if(pregnancy_time >= (preggy_stage_duration*2) && (last_tick < (preggy_stage_duration*2)))
		to_chat(owner, span_warning("I can feel it getting bigger!"))
		if(belly && pregnancy_inflation)
			belly.size = max(belly.size, 3)
			belly.update()
		owner.adjustStaminaLoss(5)

	if(pregnancy_time >= (preggy_stage_duration*3) && (last_tick < (preggy_stage_duration*3)))
		to_chat(owner, span_warning("It's almost ready to come out!"))
		if(belly && pregnancy_inflation)
			belly.size = max(belly.size, 4)
			belly.update()
		owner.adjustStaminaLoss(15)

	if(pregnancy_time >= (preggy_stage_duration*4) && (last_tick < (preggy_stage_duration*4)))
		to_chat(owner, span_warning("You're going into labor very soon! Get ready to give birth!"))
		if(belly && pregnancy_inflation)
			belly.size = max(belly.size, 5)
			belly.update()
		owner.adjustStaminaLoss(25)

	if(pregnancy_time >= ((preggy_stage_duration*4) + 20 SECONDS))
		if(!stop_spamming_birth)
			to_chat(owner, span_warning("You're going into labor <b>right now!</b>"))
			stop_spamming_birth = TRUE
			owner.adjustStaminaLoss(20)
		else if(!(world.time % 30))
			to_chat(owner, span_danger("It hurts! You need to get rid of that damn baby!"))
			owner.adjustStaminaLoss(30)
			owner.emote("scream")
		owner.adjustStaminaLoss(5)
		var/can_birth = TRUE
		if(ishuman(owner))
			var/mob/living/carbon/human/human_owner = owner
			var/obj/item/bodypart/chest = human_owner.get_bodypart(BODY_ZONE_CHEST)
			if(human_owner.clothingonpart(chest))
				can_birth = FALSE
		if(can_birth)
			to_chat(owner, span_nicegreen("The baby came out!"))
			var/mob/living/babby = new baby_type(owner.loc)
			if(ishuman(babby) && ishuman(owner))
				var/mob/living/carbon/human/progenitor = owner
				var/mob/living/carbon/human/human_babby = babby
				if(!like_mother_like_son)
					var/mob/living/carbon/human/daddy = father.resolve()
					if(istype(daddy))
						progenitor = daddy
				progenitor.dna.copy_dna(human_babby.dna)
			INVOKE_ASYNC(src, .proc/offer_control_to_babby, babby, owner)
			qdel(src)

	last_tick = world.time

/datum/status_effect/pregnancy/on_remove()
	REMOVE_TRAIT(owner, TRAIT_PREGNANT, PREGNANCY_TRAIT)
	UnregisterSignal(owner, COMSIG_MOB_DEATH)
	if(ishuman(owner))
		human_pragency_end(owner)
	return ..()

/datum/status_effect/pregnancy/proc/human_pragency_start(mob/living/carbon/human/gregnant)
	//you need a womb even if male to get gragnet
	if(!gregnant.getorganslot(ORGAN_SLOT_WOMB))
		return FALSE
	if(gregnant.client?.prefs)
		oviposition = gregnant.client.prefs.oviposition
		pregnancy_inflation = gregnant.client.prefs.pregnancy_inflation
		if(father && ispath(baby_type, /mob/living/carbon/human))
			var/list/buttons = list("Like me!", "Like dad!")
			var/fatherful_input = tgui_input_list(owner, "You're pregnant! Who is the baby gonna look like?", "Pregnancy", buttons, 1 MINUTES)
			if(fatherful_input == "Like dad!")
				like_mother_like_son = FALSE
	if(pregnancy_inflation)
		//give them a king ass ripper belly initially
		var/obj/item/organ/genital/belly/belly = gregnant.getorganslot(ORGAN_SLOT_BELLY)
		if(!belly)
			belly = gregnant.give_genital(/obj/item/organ/genital/belly)
		else
			old_belly_size = belly.size
		belly.size = max(belly.size, 1)
		belly.update()
	return TRUE

/datum/status_effect/pregnancy/proc/human_pragency_end(mob/living/carbon/human/gregnant)
	//get rid of king ass ripper belly
	var/obj/item/organ/genital/belly/belly = gregnant.getorganslot(ORGAN_SLOT_BELLY)
	if(belly && pregnancy_inflation)
		belly.size = old_belly_size
		belly.update()

/datum/status_effect/pregnancy/proc/fetus_mortus()
	SIGNAL_HANDLER

	if(!QDELETED(owner) && isturf(owner.loc))
		if(!oviposition)
			new /obj/effect/gibspawner/generic(owner.loc)
		else
			new /obj/effect/decal/cleanable/egg_smudge(owner.loc)
	qdel(src)

/datum/status_effect/pregnancy/proc/offer_control_to_babby(mob/living/babby, mob/living/mommy)
	var/poll_message = "Do you want to play as [mommy]'s offspring?"
	var/list/mob/candidates = pollCandidatesForMob(poll_message, ROLE_RESPAWN, null, FALSE, 120, babby)
	if(!LAZYLEN(candidates))
		babby.real_name = random_unique_name(babby.gender, FALSE)
		babby.update_name()
		return

	var/mob/player = pick(candidates)
	player.transfer_ckey(babby, TRUE)
	var/mommy_name = "someone"
	if(!QDELETED(mommy))
		mommy_name = mommy.real_name

	to_chat(babby, "You are the son or daughter of [mommy_name]!")
	var/time = world.time
	var/name = input(babby, "What will be your name? (You have a minute to decide!)", "Name yourself") as null|text
	if(world.time - time >= 1 MINUTES)
		to_chat(babby, "You took too long to decide a name and have been given a random name instead.")
	if(!name || (world.time - time >= 1 MINUTES))
		babby.real_name = random_unique_name(babby.gender, FALSE)
		babby.update_name()
	else
		babby.real_name = name
		babby.update_name()
