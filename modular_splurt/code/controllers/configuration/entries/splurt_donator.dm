#define DONATOR_TOML_FILE "config/splurt/donator.toml"

// New donator system
// Reminder that you must setup autodonator and ckeytools on
// a discord redbot on your guild for this to work
// https://github.com/SPLURT-Station/Mal0-cogs

/datum/config_entry/number/toml_donators_mode
	postload_required = TRUE

/datum/config_entry/number/toml_donators_mode/OnPostload()
	if(config_entry_value != 1 && config_entry_value != 2)
		return ..()

	var/list/donators = rustg_read_toml_file(DONATOR_TOML_FILE)
	if(!donators)
		CRASH("Attempted to read donator file, but none was found!")

	for(var/tier in subtypesof(/datum/config_entry/multi_keyed_flag/donator_group))
		var/datum/config_entry/multi_keyed_flag/donator_group/group = CONFIG_GET_ENTRY_FROM_PATH(tier)
		group.load_new_donators(donators, config_entry_value)

	regenerate_donator_grouping_list()

	. = ..()

/datum/config_entry/multi_keyed_flag/donator_group
	var/toml_tier

/datum/config_entry/multi_keyed_flag/donator_group/proc/load_new_donators(list/donators, mode)
	if(IsAdminAdvancedProcCall() || !toml_tier)
		return
	switch(mode)
		if(1)
			LAZYADD(config_entry_value, donators["donators"][toml_tier])
		if(2)
			config_entry_value = donators["donators"][toml_tier]
		else
			return
	for(var/ckey in config_entry_value)
		if(isnull(config_entry_value[ckey]))
			config_entry_value[ckey] = TRUE

/datum/config_entry/multi_keyed_flag/donator_group/tier_1_donators
	toml_tier = "tier_1"

/datum/config_entry/multi_keyed_flag/donator_group/tier_2_donators
	toml_tier = "tier_2"

/datum/config_entry/multi_keyed_flag/donator_group/tier_3_donators
	toml_tier = "tier_3"

#undef DONATOR_TOML_FILE
