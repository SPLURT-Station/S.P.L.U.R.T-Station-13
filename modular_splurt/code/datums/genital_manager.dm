/**
 * This disgusting datum is used to manage the TGUI interface, which manages the autistic genital manager.
 */
/datum/genital_manager
	/// Our owner - Not a weakref, didn't think it was necessary
	var/mob/living/carbon/owner
	/// Our preferences datum, which we modify as needed
	var/datum/preferences/preferences

/datum/genital_manager/New(mob/living/carbon/new_owner)
	. = ..()
	// This datum should never exist if we don't have an owner with a client
	if(!istype(new_owner) || !new_owner.client?.prefs)
		qdel(src)
		return
	assign_owner(new_owner)

/datum/genital_manager/Destroy(force)
	. = ..()
	if(owner)
		UnregisterSignal(owner, COMSIG_PARENT_QDELETING)
		owner = null
		owner.genital_manager = null
	if(preferences)
		UnregisterSignal(preferences, COMSIG_PARENT_QDELETING)
		preferences = null

/datum/genital_manager/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GenitalManager", name)
		ui.open()

/datum/genital_manager/ui_host(mob/user)
	return owner

/datum/genital_manager/ui_state(mob/user)
	return GLOB.ui_genital_manager_state

/datum/genital_manager/ui_data(mob/user)
	var/list/i_will_murder_mosley = list()

	var/list/genital_information = list()
	for(var/obj/item/organ/genital/genital in owner.internal_organs)
		var/list/this_genital = list()

		this_genital["name"] = genital.name
		this_genital["desc"] = genital.desc
		if(genital.fluid_id)
			this_genital["fluid_id"] = genital.get_fluid_id()
			this_genital["fluid_max_volume"] = genital.fluid_max_volume
			this_genital["fluid_rate"] = genital.fluid_rate
			this_genital["fluid_mult"] = genital.fluid_mult
			this_genital["fluid_efficiency"] = genital.fluid_efficiency
			this_genital["fluid_name"] = genital.get_fluid_name()
		this_genital["shape"] = genital.shape
		this_genital["size"] = genital.size
		this_genital["sensitivity"] = genital.sensitivity
		var/list/genital_equipment = list()
		for(var/obj/item/this_equipment as anything in genital.equipment)
			var/list/this_genital_equipment = list()

			this_genital_equipment["name"] = this_equipment.name
			this_genital_equipment["desc"] = this_equipment.desc

			genital_equipment += list(this_genital_equipment)
		this_genital["genital_equipment"] = genital_equipment

		genital_information += list(this_genital)
	i_will_murder_mosley["genital_information"] = genital_information

	return i_will_murder_mosley

/datum/genital_manager/proc/assign_owner(mob/living/carbon/new_owner)
	owner = new_owner
	preferences = new_owner.client.prefs
	RegisterSignal(owner, COMSIG_PARENT_QDELETING, .proc/owner_deleted)
	RegisterSignal(preferences, COMSIG_PARENT_QDELETING, .proc/preferences_deleted)

/datum/genital_manager/proc/owner_deleted()
	SIGNAL_HANDLER

	UnregisterSignal(owner, COMSIG_PARENT_QDELETING)
	owner = null
	owner.genital_manager = null

	qdel(src)

/datum/genital_manager/proc/preferences_deleted()
	SIGNAL_HANDLER

	UnregisterSignal(preferences, COMSIG_PARENT_QDELETING)
	preferences = null

	qdel(src)
