// Time before sending the user to cryo
/datum/config_entry/number/autocryo_time_trigger
	default = 24000
	min_val = 600
	integer = TRUE

// Should this system be used?
/datum/config_entry/flag/autocryo_enabled

// Time before deleting a disconnected ghost
/datum/config_entry/number/ghost_check_time
	default = 10 MINUTES
	min_val = 600
	integer = TRUE

// Should the system check for ghosts to delete too?
/datum/config_entry/flag/ghost_checking
