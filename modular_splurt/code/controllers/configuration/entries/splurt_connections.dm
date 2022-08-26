/datum/config_entry/flag/need_discord_to_join

/datum/config_entry/flag/kick_vpn

/datum/config_entry/multi_keyed_flag/vpn_bypass
	postload_required = TRUE

/datum/config_entry/multi_keyed_flag/vpn_bypass/OnPostload()
	var/list/new_entries = list()
	for(var/key in config_entry_value)
		new_entries[ckey(key)] = world.realtime
	config_entry_value = new_entries

/datum/config_entry/multi_keyed_flag/vpn_bypass/proc/add_bypass(ckeytobypass)
	if(IsAdminAdvancedProcCall())
		return
	config_entry_value |= ckey(ckeytobypass)
	config_entry_value[ckey(ckeytobypass)] = world.realtime

/datum/config_entry/multi_keyed_flag/vpn_bypass/proc/rev_bypass(ckeytobypass)
	if(IsAdminAdvancedProcCall())
		return
	config_entry_value -= ckey(ckeytobypass)
