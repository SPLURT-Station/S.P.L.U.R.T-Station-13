/client/proc/discordbunker()
	set category = "Server"
	set name = "Toggle Discord Bunker"
	if(!SSdbcore.IsConnected())
		to_chat(usr, "<span class='adminnotice'>The Database is not connected/enabled!</span>")
		return

	var/new_dbun = !CONFIG_GET(flag/need_discord_to_join)
	CONFIG_SET(flag/need_discord_to_join, new_dbun)

	log_admin("[key_name(usr)] has toggled the Discord Bunker, it is now [new_dbun ? "on" : "off"]")
	message_admins("[key_name_admin(usr)] has toggled the Discord Bunker, it is now [new_dbun ? "enabled" : "disabled"].")
	SSblackbox.record_feedback("nested tally", "discord_toggle", 1, list("Toggle Discord Bunker", "[new_dbun ? "Enabled" : "Disabled"]"))
	send2adminchat("Discord Bunker", "[key_name(usr)] has toggled the Discord Bunker, it is now [new_dbun ? "enabled" : "disabled"].")

/client/proc/adddiscordbypass(ckeytobypass as text) // In case someone's too lazy to verify on discord
	set category = "Special Verbs"
	set name = "Add Discord Bypass"
	set desc = "Allows a given ckey to connect through the discord bunker for the round even if they haven't verified yet."
	if(!SSdbcore.IsConnected())
		to_chat(usr, "<span class='adminnotice'>The Database is not connected!</span>")
		return
	if(!SSdiscord)
		to_chat(usr, "<span class='adminnotice'>The discord subsystem hasn't initialized yet!</span>")
		return
	if(!CONFIG_GET(flag/need_discord_to_join))
		to_chat(usr, "<span class='adminnotice'>The Discord Bunker is deactivated!</span>")
		return

	GLOB.discord_passthrough |= ckey(ckeytobypass)
	GLOB.discord_passthrough[ckey(ckeytobypass)] = world.realtime
	log_admin("[key_name(usr)] has added [ckeytobypass] to the current round's discord bypass list.")
	message_admins("[key_name_admin(usr)] has added [ckeytobypass] to the current round's discord bypass list.")
	send2adminchat("Discord Bunker", "[key_name(usr)] has added [ckeytobypass] to the current round's discord bypass list.")

/client/proc/revokediscordbypass(ckeytobypass as text) // In case the person you let bypass turned out to be a griefer
	set category = "Special Verbs"
	set name = "Revoke Discord Bypass"
	set desc = "Revoke's a ckey's permission to bypass the discord bunker for a given round."
	if(!SSdbcore.IsConnected())
		to_chat(usr, "<span class='adminnotice'>The Database is not connected!</span>")
		return
	if(!SSdiscord)
		to_chat(usr, "<span class='adminnotice'>The discord subsystem hasn't initialized yet!</span>")
		return
	if(!CONFIG_GET(flag/need_discord_to_join))
		to_chat(usr, "<span class='adminnotice'>The Discord Bunker is deactivated!</span>")
		return

	GLOB.discord_passthrough -= ckey(ckeytobypass)
	log_admin("[key_name(usr)] has removed [ckeytobypass] from the current round's discord bypass list.")
	message_admins("[key_name_admin(usr)] has removed [ckeytobypass] from the current round's discord bypass list.")
	send2adminchat("Discord Bunker", "[key_name(usr)] has removed [ckeytobypass] from the current round's discord bypass list.")
