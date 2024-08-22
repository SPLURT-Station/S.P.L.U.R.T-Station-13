/datum/design/board/self_actualization_device
	name = "Machine Design (Self-Actualization Device)"
	desc = "The circuit board for a Self-Actualization Device by Cinco: A Family Company."
	id = "self_actualization_device"
	build_path = /obj/item/circuitboard/machine/self_actualization_device
	category = list("Medical Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/obj/item/circuitboard/machine/self_actualization_device
	name = "Self-Actualization Device (Machine Board)"
	build_path = /obj/machinery/self_actualization_device
	req_components = list(/obj/item/stock_parts/micro_laser = 5)

/obj/machinery/self_actualization_device
	name = "Self-Actualization Device"
	desc = "With the power of modern neurological scanning and synthflesh cosmetic surgery, the Veymed Corporation \
	has teamed up with Nanotrasen Human Resources (and elsewise)  to bring you the Self-Actualization Device! \
	Ever revived a patient and had them file a malpractice lawsuit because their head got attached to the wrong body? \
	Just slap 'em in the SAD and turn it on! Their frown will turn upside down as they're reconstituted as their ideal self \
	via the magic technology of brain scanning! Within a few short moments, they'll be popped out as their ideal self, \
	ready to continue on with their day lawsuit-free!"
	icon = 'modular_splurt/icons/obj/machinery/self_actualization_device.dmi'
	icon_state = "sad_open"
	circuit = /obj/item/circuitboard/machine/self_actualization_device
	state_open = FALSE
	density = TRUE
	/// Is someone being processed inside of the machine?
	var/processing = FALSE
	/// How long does it take to break out of the machine?
	var/breakout_time = 10 SECONDS
	/// How long does the machine take to work?
	var/processing_time = 1 MINUTES
	/// The interval that advertisements are said by the machine's speaker.
	var/next_fact = 10
	/// A list containing advertisements that the machine says while working.
	var/static/list/advertisements = list(\
	"Thank you for using the Self-Actualization Device, brought to you by Veymed, because you asked for it.", \
	"The Self-Actualization device is not to be used by the elderly without direct adult supervision. Cinco is not liable for any and all injuries sustained under unsupervised usage of the Self-Actualization Device.", \
	"Please make sure to clean the Self-Actualization Device every fifteen minutes! The Self-Actualization Device is not to be used un-cleaned.", \
	"Before using the Self-Actualization Device, remove any and all metal devices, or you might make the term 'ironman' a bit too literal!" , \
	"Have more questions about the Self-Actualization Device? Call your nearest Veymed Representative to requisition more information about the Self-Actualization Device!" \
	)
	allow_oversized_characters = TRUE

/obj/machinery/self_actualization_device/update_appearance(updates)
	. = ..()

/obj/machinery/self_actualization_device/Initialize(mapload)
	. = ..()
	update_appearance()

/obj/machinery/self_actualization_device/close_machine(mob/user)
	..()
	playsound(src, 'sound/machines/click.ogg', 50)
	icon_state = "sad_closed"
	if(!occupant)
		return FALSE
	if(!ishuman(occupant) || !check_for_normalizer(occupant)) // BLUEMOON EDIT - normalizer check added
		occupant.forceMove(drop_location())
		set_occupant(null)
		return FALSE
	to_chat(occupant, span_notice("You enter [src]."))
	update_appearance()


/obj/machinery/self_actualization_device/examine(mob/user)
	. = ..()
	. += span_notice("ALT-Click to turn ON when closed.")

/obj/machinery/self_actualization_device/open_machine(mob/user)
	playsound(src, 'sound/machines/click.ogg', 50)
	icon_state = "sad_open"
	..()

/obj/machinery/self_actualization_device/AltClick(mob/user)
	. = ..()
	if(!powered() || !occupant || state_open)
		return FALSE
	to_chat(user, "You power on [src].")
	addtimer(CALLBACK(src, PROC_REF(eject_new_you)), processing_time, TIMER_OVERRIDE|TIMER_UNIQUE)
	if(occupant)
		if(!processing)
			icon_state = "sad_on"
		else
			icon_state = "sad_off"
	processing = TRUE
	update_appearance()

/obj/machinery/self_actualization_device/interact(mob/user)
	if(state_open)
		close_machine()
		return

	if(!processing)
		open_machine()
		return

// SPLURT ADD - if a character is wearing a normalizer, he cannot get inside/complete the procedure (otherwise it leads to errors with setting the size)
/obj/machinery/self_actualization_device/proc/check_for_normalizer(mob/target)
	if(target.GetComponent(/datum/component/size_normalized))
		visible_message(span_warning("[src] beeps, as it denies user with normalization devices!"))
		return FALSE // prohibition
	return TRUE // permission
// SPLURT ADD END

/obj/machinery/self_actualization_device/process(delta_time)
	if(!processing)
		return
	if(!powered() || !occupant || !iscarbon(occupant))
		open_machine()
		return

	next_fact--
	if(next_fact <= 0)
		next_fact = rand(initial(next_fact), 2 * initial(next_fact))
		say(pick(advertisements))
		playsound(loc, 'sound/machines/chime.ogg', 30, FALSE)

	use_power(500)

/// Ejects the occupant as either their preference character, or as a monke based on emag status.
/obj/machinery/self_actualization_device/proc/eject_new_you()
	if(state_open || !occupant || !powered())
		return
	processing = FALSE

	if(!ishuman(occupant) || !check_for_normalizer(occupant)) // BLUEMOON EDIT - added || !check_for_normalizer(occupant)
		return FALSE

	var/mob/living/carbon/human/patient = occupant
	var/original_name = patient.dna.real_name

	//Organ damage saving code.
	var/heart_damage = check_organ(patient, /obj/item/organ/heart)
	var/liver_damage = check_organ(patient, /obj/item/organ/liver)
	var/lung_damage = check_organ(patient, /obj/item/organ/lungs)
	var/stomach_damage = check_organ(patient, /obj/item/organ/stomach)
	var/brain_damage = check_organ(patient, /obj/item/organ/brain)
	var/eye_damage = check_organ(patient, /obj/item/organ/eyes)
	var/ear_damage = check_organ(patient, /obj/item/organ/ears)

	var/list/trauma_list = list()
	if(patient.get_traumas())
		for(var/datum/brain_trauma/trauma as anything in patient.get_traumas())
			trauma_list += trauma

	var/brute_damage = patient.getBruteLoss()
	var/burn_damage = patient.getFireLoss()

	patient.client?.prefs?.copy_to(patient)
	patient.dna.update_dna_identity()
	log_game("[key_name(patient)] used a Self-Actualization Device at [loc_name(src)].")

	if(patient.dna.real_name != original_name)
		message_admins("[key_name_admin(patient)] has used the Self-Actualization Device, and changed the name of their character. \
		Original Name: [original_name], New Name: [patient.dna.real_name]. \
		This may be a false positive from changing from a humanized monkey into a character, so be careful.")

	// Apply organ damage
	patient.setOrganLoss(ORGAN_SLOT_HEART, heart_damage)
	patient.setOrganLoss(ORGAN_SLOT_LIVER, liver_damage)
	patient.setOrganLoss(ORGAN_SLOT_LUNGS, lung_damage)
	patient.setOrganLoss(ORGAN_SLOT_STOMACH, stomach_damage)
	// Head organ damage.
	patient.setOrganLoss(ORGAN_SLOT_EYES, eye_damage)
	patient.setOrganLoss(ORGAN_SLOT_EARS, ear_damage)
	patient.setOrganLoss(ORGAN_SLOT_BRAIN, brain_damage)

	//Re-Applies Trauma
	var/obj/item/organ/brain/patient_brain = patient.getorgan(/obj/item/organ/brain)

	if(length(trauma_list))
		patient_brain.traumas = trauma_list

	//Re-Applies Damage
	patient.getBruteLoss(brute_damage)
	patient.getFireLoss(burn_damage)

	SSquirks.AssignQuirks(patient, patient.client, TRUE, TRUE, null, FALSE, patient)

	open_machine()
	playsound(src, 'sound/machines/microwave/microwave-end.ogg', 100, FALSE)

/// Checks the damage on the inputed organ and stores it.
/obj/machinery/self_actualization_device/proc/check_organ(mob/living/carbon/human/patient, obj/item/organ/organ_to_check)
	var/obj/item/organ/organ_to_track = patient.getorgan(organ_to_check)

	// If the organ is missing, the organ damage is automatically set to 100.
	if(!organ_to_track)
		return 100 //If the organ is missing, return max damage.

	return organ_to_track.damage

/obj/machinery/self_actualization_device/screwdriver_act(mob/living/user, obj/item/used_item)
	. = TRUE
	if(..())
		return

	if(occupant)
		to_chat(user, span_warning("[src] is currently occupied!"))
		return

	if(default_deconstruction_screwdriver(user, icon_state, icon_state, used_item))
		update_appearance()
		return

	return FALSE

/obj/machinery/self_actualization_device/crowbar_act(mob/living/user, obj/item/used_item)
	if(occupant)
		to_chat(user, span_warning("[src] is currently occupied!"))
		return

	if(default_deconstruction_crowbar(used_item))
		return TRUE
