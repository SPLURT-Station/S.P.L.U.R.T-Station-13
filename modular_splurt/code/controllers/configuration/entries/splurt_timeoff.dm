/// Toggles time off for jobs
/datum/config_entry/flag/time_off

/// Toggles changing jobs with PTO
/datum/config_entry/flag/pto_job_change

/// PTO hour cap
/datum/config_entry/number/pto_cap
	config_entry_value = 100	/// Total hours
	min_val = 0					/// Minimum hourly value
	integer = FALSE				/// We can be a float for partial hours
