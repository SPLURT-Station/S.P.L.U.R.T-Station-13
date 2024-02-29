// Define config entries for cryo
#define SUBSYSTEM_CRYO_CAN_RUN CONFIG_GET(flag/autocryo_enabled)
#define SUBSYSTEM_CRYO_TIME CONFIG_GET(number/autocryo_time_trigger)

SUBSYSTEM_DEF(auto_cryo)
	name = "Automated Cryogenics"
	flags = SS_BACKGROUND
	wait = 5 MINUTES

/datum/controller/subsystem/auto_cryo/Initialize()
	// Check config before running
	if(!SUBSYSTEM_CRYO_CAN_RUN)
		can_fire = FALSE

	return ..()

/datum/controller/subsystem/auto_cryo/fire()
	if(SUBSYSTEM_CRYO_CAN_RUN)
		cryo_mobs()

/datum/controller/subsystem/auto_cryo/proc/cryo_mobs()
	// Check for any targets
	if(!LAZYLEN(GLOB.ssd_mob_list))
		// No SSD mobs exist
		return

	// Check possible targets
	for(var/mob/living/cryo_mob in GLOB.ssd_mob_list)

		// Get SSD time
		// This is set when disconnecting
		var/afk_time = world.time - cryo_mob.lastclienttime

		// Check if client meets the time requirement
		if(afk_time < SUBSYSTEM_CRYO_TIME)
			continue

		// Send to cryo
		cryoMob(cryo_mob, effects = TRUE)

		// Remove from SSD list
		GLOB.ssd_mob_list -= cryo_mob

		// Log cryo interaction
		log_game("[cryo_mob] was sent to cryo after being SSD for [afk_time] ticks.")


// Remove defines
#undef SUBSYSTEM_CRYO_CAN_RUN
#undef SUBSYSTEM_CRYO_TIME
