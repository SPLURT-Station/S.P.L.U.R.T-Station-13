/proc/setup_silicon_law_prefs(mob/living/silicon/Silicon, client/player_client)
	if(!CONFIG_GET(flag/allow_silicon_choosing_laws))
		return

	if(!player_client.prefs.silicon_lawset)
		return

	var/list/config_laws = CONFIG_GET(keyed_list/choosable_laws)
	var/player_lawset = config_laws[player_client.prefs.silicon_lawset]
	if(player_lawset)
		Silicon.laws = new player_lawset
		var/admin_warning = "[player_client] / [Silicon] ([initial(Silicon.name)]) has joined with the [player_client.prefs.silicon_lawset] ([player_lawset]) lawset.<br>"
		admin_warning += "Laws:<br>"
		admin_warning += english_list(Silicon.laws.get_law_list(TRUE), "No laws", "<br>", "<br>")
		Silicon.laws.show_laws(player_client)
		message_admins(examine_block(admin_warning))
