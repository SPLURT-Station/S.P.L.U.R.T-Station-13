/datum/component/pregnancy

	dupe_mode = COMPONENT_DUPE_UNIQUE
	//can_transfer = TRUE

	/// type of baby the mother will plop out - needs to be subtype of /mob/living
	var/baby_type = /mob/living/carbon/human

	var/obj/item/organ/container
	var/mob/living/carrier

	var/datum/dna/father_dna
	var/datum/dna/mother_dna

	var/list/mother_features
	var/list/father_features

	var/mother_name

	var/egg_name

	var/stage = 0
	var/max_stage = PREGNANCY_STAGES
	COOLDOWN_DECLARE(stage_time)
	COOLDOWN_DECLARE(hatch_request_cooldown)

	var/added_size = 0
	/// this boolean is for identifying whether this preg is in the egg state or not
	var/oviposition = TRUE
	/// this boolean is for saving whether or not we should inflate the belly if appropriate
	var/pregnancy_inflation = TRUE
	/// breast growth
	var/pregnancy_breast_growth = TRUE
	/// whether the pregnancy is revealed or not, scanners will reveal this no matter what
	var/revealed = FALSE

/datum/component/pregnancy/Initialize(mob/living/_mother, mob/living/_father, _baby_type = /mob/living/carbon/human)
	if(!isobj(parent))
		return COMPONENT_INCOMPATIBLE

	var/obj/item/thing = parent

	if(!isorgan(thing.loc))
		return COMPONENT_INCOMPATIBLE

	if(ispath(_baby_type, /mob/living))
		baby_type = _baby_type
	else
		stack_trace("Invalid baby_type given to pregnancy component!")
		return COMPONENT_INCOMPATIBLE

	container = thing.loc

	var/obj/item/organ/nads = thing.loc

	if(nads.owner)
		carrier = nads.owner

	if(iscarbon(_father))
		var/mob/living/carbon/cardad = _father
		father_dna = new
		cardad.dna.copy_dna(father_dna)

	if(iscarbon(_mother))
		var/mob/living/carbon/carmom = _mother
		mother_dna = new
		carmom.dna.copy_dna(mother_dna)

	mother_name = _mother.real_name

	if(ishuman(_father))
		var/mob/living/carbon/human/cardad = _father
		LAZYINITLIST(father_features)
		father_features["skin_tone"] = cardad.skin_tone
		father_features["hair_color"] = cardad.hair_color
		father_features["facial_hair_color"] = cardad.facial_hair_color
		father_features["left_eye_color"] = cardad.left_eye_color
		father_features["right_eye_color"] = cardad.right_eye_color

	if(ishuman(_mother))
		var/mob/living/carbon/human/carmom = _mother
		LAZYINITLIST(mother_features)
		mother_features["skin_tone"] = carmom.skin_tone
		mother_features["hair_color"] = carmom.hair_color
		mother_features["facial_hair_color"] = carmom.facial_hair_color
		mother_features["left_eye_color"] = carmom.left_eye_color
		mother_features["right_eye_color"] = carmom.right_eye_color

	pregnancy_inflation = carrier?.client?.prefs?.pregnancy_inflation

	pregnancy_breast_growth = carrier?.client?.prefs?.pregnancy_breast_growth

	if(carrier)
		generic_pragency_start()
		ADD_TRAIT(carrier, TRAIT_PREGNANT, PREGNANCY_TRAIT)

/datum/component/pregnancy/RegisterWithParent()
	if(carrier)
		register_carrier()
	RegisterSignal(parent, COMSIG_ATOM_ENTERING, PROC_REF(on_entering))
	RegisterSignal(parent, COMSIG_OBJ_BREAK, PROC_REF(on_obj_break))
	RegisterSignal(parent, COMSIG_OBJ_WRITTEN_ON, PROC_REF(name_egg))
	RegisterSignal(parent, COMSIG_PARENT_ATTACKBY, PROC_REF(handle_hatch))
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(eg_status))

/datum/component/pregnancy/UnregisterFromParent()
	if(carrier)
		unregister_carrier()
	UnregisterSignal(parent, COMSIG_ATOM_ENTERING)
	UnregisterSignal(parent, COMSIG_OBJ_BREAK)
	UnregisterSignal(parent, COMSIG_OBJ_WRITTEN_ON)
	UnregisterSignal(parent, COMSIG_PARENT_ATTACKBY)
	UnregisterSignal(parent, COMSIG_PARENT_EXAMINE)

/datum/component/pregnancy/proc/register_carrier()
	RegisterSignal(carrier, COMSIG_MOB_DEATH, PROC_REF(clear_eggs))
	RegisterSignal(carrier, COMSIG_LIVING_BIOLOGICAL_LIFE, PROC_REF(handle_life))
	RegisterSignal(carrier, COMSIG_HEALTH_SCAN, PROC_REF(on_scan))
	if(oviposition)
		RegisterSignal(carrier, COMSIG_MOB_CLIMAX, PROC_REF(on_climax))

/datum/component/pregnancy/proc/unregister_carrier()
	UnregisterSignal(carrier, COMSIG_MOB_DEATH)
	UnregisterSignal(carrier, COMSIG_LIVING_BIOLOGICAL_LIFE)
	UnregisterSignal(carrier, COMSIG_HEALTH_SCAN)
	UnregisterSignal(carrier, COMSIG_MOB_CLIMAX)

/datum/component/pregnancy/Destroy()
	if(carrier)
		generic_pragency_end()
	return ..()

/datum/component/pregnancy/proc/name_egg(datum/source, name)
	SIGNAL_HANDLER

	egg_name = name

/datum/component/pregnancy/proc/on_climax(datum/source, datum/reagents/senders_cum, atom/target, obj/item/organ/genital/sender, obj/item/organ/genital/receiver, spill)
	SIGNAL_HANDLER

	if(isgenital(container))
		var/obj/item/organ/genital/stuff = container
		if(stuff != sender && stuff.linked_organ != sender)
			return FALSE

	if(stage < 2)
		return FALSE

	if(receiver && isliving(target))
		if(CHECK_BITFIELD(receiver.genital_flags, GENITAL_CAN_STUFF))
			return lay_eg(receiver, senders_cum)
	return lay_eg(get_turf(carrier), senders_cum)

/datum/component/pregnancy/proc/on_obj_break(datum/source, damage_flag)
	SIGNAL_HANDLER

	qdel(src)

/datum/component/pregnancy/proc/on_entering(datum/source, atom/destination, atom/oldLoc)
	SIGNAL_HANDLER

	if(istype(destination, /obj/item/organ))
		var/obj/item/organ/preg_container = destination
		//severed wombs don't count, boyos
		if(!preg_container.owner)
			return
		carrier = preg_container.owner
		container = preg_container
		pregnancy_inflation = carrier.client?.prefs?.pregnancy_inflation
		pregnancy_breast_growth = carrier.client?.prefs?.pregnancy_breast_growth
		register_carrier()
		generic_pragency_start()
	else if(carrier)
		generic_pragency_end()
		unregister_carrier()
		carrier = null
		container = null

/datum/component/pregnancy/proc/handle_life(seconds)
	SIGNAL_HANDLER

	if(oviposition)
		handle_ovi_preg()
	else
		handle_incubation()

	if((stage >= 2) && !revealed)
		revealed = TRUE
		carrier.apply_status_effect(/datum/status_effect/pregnancy)
		carrier.apply_status_effect(/datum/status_effect/lactation)

	if(stage > 3 && ishuman(carrier) && oviposition)
		SEND_SIGNAL(carrier, COMSIG_ADD_MOOD_EVENT, "pregnancy", /datum/mood_event/pregnant_negative)

	if(COOLDOWN_FINISHED(src, stage_time))
		stage += 1
		stage = min(stage, max_stage)
		if(ishuman(carrier) && stage >= 2)
			inflate_organs(carrier)
		COOLDOWN_START(src, stage_time, PREGNANCY_STAGE_DURATION)

/datum/component/pregnancy/proc/inflate_organs(mob/living/carbon/human/gregnant)
	//var/obj/item/organ/genital/belly/belly = gregnant.getorganslot(ORGAN_SLOT_BELLY)
	var/obj/item/organ/genital/breasts/boob = gregnant.getorganslot(ORGAN_SLOT_BREASTS)

	if(added_size < 4)
		added_size += 1
	else
		return
	parent.AddComponent(/datum/component/organ_inflation, 1)
	//if(pregnancy_inflation)
	//	belly?.modify_size(1)
	if(pregnancy_breast_growth)
		boob?.modify_size(1)

/datum/component/pregnancy/proc/handle_incubation()
	if(carrier && (stage < max_stage) && prob(2))
		to_chat(carrier, span_warning("You feel \The [parent] moving a bit inside you!"))
	if(carrier && (stage == max_stage) && prob(2))
		to_chat(carrier, span_warning("\The [parent] moves, it's probably ready to hatch!"))

/datum/component/pregnancy/proc/handle_hatch(datum/source, obj/item/I, mob/user, params)
	SIGNAL_HANDLER

	if(stage < max_stage)
		return

	INVOKE_ASYNC(src, PROC_REF(hatch), source, I, user, params)

/datum/component/pregnancy/proc/hatch(datum/source, obj/item/I, mob/user, params)
	if(!COOLDOWN_FINISHED(src, hatch_request_cooldown))
		return

	COOLDOWN_START(src, hatch_request_cooldown, 30 SECONDS)

	var/poll_message = "Do you want to play as [mother_name]'s offspring?[egg_name ? " Your name will be [egg_name]" : ""]"
	var/list/mob/candidates = pollGhostCandidates(poll_message, ROLE_RESPAWN, null, FALSE, 30 SECONDS, POLL_IGNORE_EGG)

	if(!LAZYLEN(candidates))
		to_chat(user, span_info("\The [parent] doesn't seems to hatch, try again later?"))
		return

	var/mob/player = pick(candidates)

	playsound(parent, 'sound/effects/splat.ogg', 70, TRUE)
	var/mob/living/babby = new baby_type(get_turf(parent))

	if(ishuman(babby))
		determine_baby_features(babby)
		determine_baby_dna(babby)

	player.transfer_ckey(babby, TRUE)

	to_chat(babby, "You are the son (or daughter) of [mother_name ? mother_name : "someone"]!")

	var/name
	if(egg_name)
		name = egg_name
	else if(user)
		name = input(user, "What will be your baby's name?", "Name the baby") as null|text
	else
		name = input(babby, "What will be your name?", "Name yourself") as null|text

	if(!name)
		babby.real_name = random_unique_name(babby.gender, )
		babby.update_name()
	else
		babby.real_name = name
		babby.update_name()

	if(mother_name)
		babby?.mind?.store_memory("[mother_name] is your mother!")

	var/obj/item = parent
	item.forceMove(get_turf(parent))
	item.obj_break(MELEE)
	qdel(src)

/datum/component/pregnancy/proc/eg_status(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(stage >= max_stage)
		examine_list += span_notice("\The [parent] seems ready to hatch! You can tap it with something to hatch it")

/datum/component/pregnancy/proc/handle_ovi_preg()
	if(stage <= 2)
		if(stage == 2 && prob(2))
			to_chat(carrier, span_notice("You feel something pressing lightly inside"))
		return
	if(prob(10))
		if(prob(50))
			to_chat(carrier, span_warning("Something presses hard against your anus! It's probably your egg!"))
		else
			to_chat(carrier, span_warning("You REALLY need to get this egg out!"))
		carrier.emote("scream")
		carrier.adjustStaminaLoss(15)

	lay_eg(get_turf(carrier))

/datum/component/pregnancy/proc/lay_eg(atom/location, datum/reagents/senders_cum)
	to_chat(carrier, span_userlove("You feel your egg sliding slowly inside!"))

	if(prob(60))
		return FALSE
	if(isorgan(location))
		var/obj/item/organ/recv = location

		if(!recv.owner)
			return FALSE

	if(container && isgenital(container))
		var/obj/item/organ/genital/gen = container
		if(!(gen.is_exposed() || gen.linked_organ?.is_exposed()))
			return FALSE

	var/obj/item/oviposition_egg/eggo = parent

	eggo.icon_state = carrier.client?.prefs?.egg_shell ? ("egg_" + carrier.client.prefs.egg_shell) : "egg_chicken"
	eggo.update_appearance()

	if(isorgan(location))
		var/obj/item/organ/recv = location
		var/datum/component/genital_equipment/equipment = eggo.GetComponent(/datum/component/genital_equipment)
		equipment.holder_genital = recv
		carrier.visible_message(span_userlove("[carrier] laid an egg!"), \
			span_userlove("You laid an egg inside [recv.owner]'s [recv]"))
	else
		carrier.visible_message(span_notice("[carrier] laid an egg!"), \
			span_nicegreen("The egg came out!"))

	if(senders_cum?.total_volume > 5)
		senders_cum.reaction(location, TOUCH, 1, 0)

	playsound(carrier, 'sound/effects/splat.ogg', 70, TRUE)
	carrier.Knockdown(200, TRUE, TRUE)
	carrier.Stun(200, TRUE, TRUE)
	carrier.adjustStaminaLoss(200)
	SEND_SIGNAL(carrier, COMSIG_ADD_MOOD_EVENT, "pregnancy_end", /datum/mood_event/pregnant_positive)

	oviposition = FALSE
	eggo.forceMove(location)

	return TRUE

//not how genetics work but okay
/datum/component/pregnancy/proc/determine_baby_dna(mob/living/carbon/human/babby)
	if(mother_dna && father_dna)
		mother_dna.transfer_identity_random(father_dna, babby)
	else if(mother_dna && !father_dna)
		mother_dna.transfer_identity_random(babby.dna, babby)
	else if(!mother_dna && father_dna)
		father_dna.transfer_identity_random(babby.dna, babby)

/datum/component/pregnancy/proc/determine_baby_features(mob/living/carbon/human/babby)

	var/list/final_features = list()

	transfer_randomized_list(final_features, mother_features, father_features)

	if(final_features["skin_tone"])
		babby.skin_tone = final_features["skin_tone"]
	if(final_features["hair_color"])
		babby.hair_color = final_features["hair_color"]
	if(final_features["facial_hair_color"])
		babby.facial_hair_color = final_features["facial_hair_color"]
	if(final_features["left_eye_color"])
		babby.left_eye_color = final_features["left_eye_color"]
	if(final_features["right_eye_color"])
		babby.right_eye_color = final_features["right_eye_color"]

	babby.hair_style = pick("Bedhead", "Bedhead 2", "Bedhead 3")
	babby.facial_hair_style = "Shaved"
	babby.underwear = "Nude"
	babby.undershirt = "Nude"
	babby.socks = "Nude"

	babby.saved_underwear = babby.underwear
	babby.saved_undershirt = babby.undershirt
	babby.saved_socks = babby.socks

/datum/component/pregnancy/proc/generic_pragency_start()
	if(revealed)
		carrier.apply_status_effect(/datum/status_effect/pregnancy)
	if(ishuman(carrier))
		human_pragency_start(carrier)
	ADD_TRAIT(carrier, TRAIT_PREGNANT, PREGNANCY_TRAIT)

/datum/component/pregnancy/proc/generic_pragency_end()
	REMOVE_TRAIT(carrier, TRAIT_PREGNANT, PREGNANCY_TRAIT)
	carrier.remove_status_effect(/datum/status_effect/pregnancy)
	if(ishuman(carrier))
		human_pragency_end(carrier)

/datum/component/pregnancy/proc/human_pragency_start(mob/living/carbon/human/gregnant)
	if(pregnancy_breast_growth)
		var/obj/item/organ/genital/breasts/boob = gregnant.getorganslot(ORGAN_SLOT_BREASTS)
		if(!boob)
			boob = gregnant.give_genital(/obj/item/organ/genital/breasts)
	return TRUE

/datum/component/pregnancy/proc/human_pragency_end(mob/living/carbon/human/gregnant)
	SEND_SIGNAL(gregnant, COMSIG_CLEAR_MOOD_EVENT, "pregnancy")

/datum/component/pregnancy/proc/clear_eggs()
	SIGNAL_HANDLER

	qdel(src)

/datum/component/pregnancy/proc/on_scan(datum/source, mob/user)
	SIGNAL_HANDLER
	to_chat(user, span_notice("<b>Pregnancy detected!</b>"))
