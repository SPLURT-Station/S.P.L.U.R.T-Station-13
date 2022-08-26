/client/proc/vpnbunker()
	set category = "Server"
	set name = "Toggle VPN Blocker"

	var/new_vpnbun = !CONFIG_GET(flag/kick_vpn)
	CONFIG_SET(flag/kick_vpn, new_vpnbun)

	log_admin("[key_name(usr)] has toggled the VPN Blocker, it is now [new_vpnbun ? "on" : "off"]")
	message_admins("[key_name_admin(usr)] has toggled the VPN Blocker, it is now [new_vpnbun ? "enabled" : "disabled"].")
	SSblackbox.record_feedback("nested tally", "vpn_toggle", 1, list("Toggle VPN Blocker", "[new_vpnbun ? "Enabled" : "Disabled"]"))
	send2adminchat("VPN Blocker", "[key_name(usr)] has toggled the VPN Bunker, it is now [new_vpnbun ? "enabled" : "disabled"].")

/client/proc/addvpnbypass(ckeytobypass as text)
	set category = "Special Verbs"
	set name = "Add VPN Bypass"
	set desc = "Allows a given ckey to connect through the VPN Blocker."
	if(!CONFIG_GET(flag/kick_vpn))
		to_chat(usr, span_adminnotice("VPN Blocker is currently off!"))

	var/datum/config_entry/multi_keyed_flag/vpn_bypass/bypasses = CONFIG_GET_ENTRY(multi_keyed_flag/vpn_bypass)
	bypasses.add_bypass(ckeytobypass)
	log_admin("[key_name(usr)] has added [ckeytobypass] to the current round's VPN bypass list.")
	message_admins("[key_name_admin(usr)] has added [ckeytobypass] to the current round's VPN bypass list.")
	send2adminchat("VPN Blocker", "[key_name(usr)] has added [ckeytobypass] to the current round's VPN bypass list.")

/client/proc/revokevpnbypass(ckeytobypass as text)
	set category = "Special Verbs"
	set name = "Revoke VPN Bypass"
	set desc = "Removes a ckey from the VPN Blocker bypass list."
	if(!CONFIG_GET(flag/kick_vpn))
		to_chat(usr, span_adminnotice("VPN Blocker is currently off!"))

	var/datum/config_entry/multi_keyed_flag/vpn_bypass/bypasses = CONFIG_GET_ENTRY(multi_keyed_flag/vpn_bypass)
	bypasses.rev_bypass(ckeytobypass)
	log_admin("[key_name(usr)] has removed [ckeytobypass] from the current round's VPN bypass list.")
	message_admins("[key_name_admin(usr)] has removed [ckeytobypass] from the current round's VPN bypass list.")
	send2adminchat("VPN Blocker", "[key_name(usr)] has removed [ckeytobypass] from the current round's VPN bypass list.")
