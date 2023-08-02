// Configuration defines
#define JOB_MINIMAL_ACCESS CONFIG_GET(flag/jobs_have_minimal_access)
#define PROTOLOCK_DURING_LOWPOP CONFIG_GET(flag/protolock_during_lowpop)

// Only Clients should have a panel for them, okay?
/mob/Login()
	. = ..()
	AddComponent(/datum/component/interaction_menu_granter)

/mob/Logout()
	qdel(GetComponent(/datum/component/interaction_menu_granter))
	. = ..()

/mob/Initialize(mapload)
	. = ..()
	register_context()

/mob/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()
	if(user.GetComponent(/datum/component/interaction_menu_granter))
		LAZYSET(context[SCREENTIP_CONTEXT_CTRL_SHIFT_LMB], INTENT_ANY, "Interact with")
		return CONTEXTUAL_SCREENTIP_SET

///Adjust the thirst of a mob
/mob/proc/adjust_thirst(change, max = THIRST_LEVEL_THRESHOLD)
	thirst = clamp(thirst + change, 0, max)

/mob/proc/set_thirst(change)
	thirst = max(0, change)

/mob/proc/can_use_production(obj/machinery/machine_target)
	// Check if access is required
	if(!machine_target.req_access)
		return TRUE

	// Check if server is NOT using minimal access
	// This is intended for low populations
	if((!PROTOLOCK_DURING_LOWPOP) && (!JOB_MINIMAL_ACCESS))
		// Allow unrestricted use
		return PROTOLOCK_ACCESS_LOWPOP

	// Check if user has access to this machine
	if(machine_target.allowed(src))
		return PROTOLOCK_ACCESS_NORMAL

	// Define user ID card
	var/obj/item/card/id/user_id = get_idcard()

	// Check if ID card was found
	if(!istype(user_id))
		return FALSE

	// Check for Captain
	if(ACCESS_CAPTAIN in user_id.access)
		// Allow usage
		return PROTOLOCK_ACCESS_CAPTAIN

	// Check for ORM access
	if(ACCESS_MINERAL_STOREROOM in user_id.access)
		// Allow use
		return PROTOLOCK_ACCESS_MINERAL

	// User has no access
	return FALSE

/mob/proc/can_use_production_topic(obj/machinery/rnd/production/machine_target, raw, ls)
	// Basic actions that are always permitted
	// This includes syncing research and switching screens
	if(ls["sync_research"] || ls["switch_screen"])
		return TRUE

	// Define user's access type
	var/user_access = usr.can_use_production(machine_target)

	// Switch result based on access type
	// This currently doesn't do anything special
	switch(user_access)
		// Type: Low population
		if(PROTOLOCK_ACCESS_LOWPOP)
			return TRUE

		// Type: Standard
		if(PROTOLOCK_ACCESS_NORMAL)
			return TRUE

		// Type: Captain
		if(PROTOLOCK_ACCESS_CAPTAIN)
			return TRUE

		// Type: Mineral / ORM
		if(PROTOLOCK_ACCESS_MINERAL)
			// Check if permitted topic
			if(ls["ejectsheet"])
				return TRUE

			// Topic prohibited
			// Deny usage
			else
				return FALSE

	// Default to false
	return FALSE

/mob/proc/can_use_mechfab_topic(obj/machinery/mecha_part_fabricator/machine_target, action, var/list/params)
	// Basic actions that are always permitted
	if(action == "sync_rnd")
		return TRUE

	// Define user's access type
	var/user_access = usr.can_use_production(machine_target)

	// Switch result based on access type
	// This currently doesn't do anything special
	switch(user_access)
		// Type: Low population
		if(PROTOLOCK_ACCESS_LOWPOP)
			return TRUE

		// Type: Standard
		if(PROTOLOCK_ACCESS_NORMAL)
			return TRUE

		// Type: Captain
		if(PROTOLOCK_ACCESS_CAPTAIN)
			return TRUE

		// Type: Mineral / ORM
		if(PROTOLOCK_ACCESS_MINERAL)
			// Check if permitted topic
			if(action == "remove_mat")
				return TRUE

			// Topic prohibited
			// Deny usage
			else
				return FALSE

	// Default to false
	return FALSE

#undef JOB_MINIMAL_ACCESS
#undef PROTOLOCK_DURING_LOWPOP
