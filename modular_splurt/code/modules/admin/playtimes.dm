/client
	var/datum/player_playtime/playtime_menu
	var/next_valve_grief_warning = 0
	var/next_chem_grief_warning = 0
	var/next_canister_grief_warning = 0
	var/next_ied_grief_warning = 0
	var/next_circuit_grief_warning = 0
	var/touched_transfer_valve = FALSE
	var/used_chem_dispenser = FALSE
	var/touched_canister = FALSE
	var/crafted_ied = FALSE
	var/touched_circuit = FALSE
	var/uses_vpn = FALSE

//Most of this data is now unused except for the flags
/*
/client/proc/cmd_player_playtimes()
	set category = "Admin"
	set name = "Player Playtimes"

	if(!check_rights(R_ADMIN))
		return

	if(!CONFIG_GET(flag/use_exp_tracking))
		to_chat(usr, span_warning("Tracking is disabled in the server configuration file."))
		return

	if(!playtime_menu)
		playtime_menu = new()
	playtime_menu.ui_interact(usr)

/datum/player_playtime/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PlayerPlaytimes", "Player Playtimes")
		ui.open()

/datum/player_playtime/ui_state(mob/user)
	return GLOB.admin_state

/datum/player_playtime/ui_data(mob/user)
	var/list/data = list()

	var/list/clients = list()
	for(var/client/C in GLOB.clients)
		var/list/client = list()

		client["ckey"] = C.ckey
		client["playtime"] = C.get_exp_living(TRUE)
		client["playtime_hours"] = C.get_exp_living()
		client["flags"] = check_flags(C)

		var/name = C.ckey
		var/mob/M = C.mob
		if (istype(M))
			if (isobserver(M))
				client["observer"] = TRUE

			if(M.real_name)
				client["ingame"] = TRUE
				name += (" (" + M.real_name + ")")
		client["name"] = name

		clients += list(client)

	clients = sort_list(clients, GLOBAL_PROC_REF(cmp_playtime))
	data["clients"] = clients
	return data
*/

/datum/player_playtime/proc/check_flags(client/C)
	var/list/flags = list()

	if (C.touched_transfer_valve)
		var/list/flag = list()
		flag["icon"] = "bomb"
		flag["tooltip"] = "This player touched a Transfer Valve."
		flags += list(flag)

	if (C.used_chem_dispenser)
		var/list/flag = list()
		flag["icon"] = "flask"
		flag["tooltip"] = "This player used a Chem Dispenser."
		flags += list(flag)

	if (C.touched_canister)
		var/list/flag = list()
		flag["icon"] = "spray-can"
		flag["tooltip"] = "This player touched a gas canister."
		flags += list(flag)

	if (C.crafted_ied)
		var/list/flag = list()
		flag["icon"] = "hammer"
		flag["tooltip"] = "This player crafted an IED or Molotov."
		flags += list(flag)

	if (C.touched_circuit)
		var/list/flag = list()
		flag["icon"] = "code-branch"
		flag["tooltip"] = "This player touched a circuit printer."
		flags += list(flag)

	if(C.uses_vpn)
		var/list/flag = list()
		flag["icon"] = "wifi"
		flag["tooltip"] = "This player is [round(C.ip_intel*100, 0.01)]% likely to be using a Proxy/VPN"
		flags += list(flag)

	return flags
/*
/datum/player_playtime/ui_act(action, params)
	if(..())
		return

	switch(action)
		if ("observe")
			if(!isobserver(usr) && !check_rights(R_ADMIN))
				return

			var/atom/movable/target = get_mob_by_key(params["ckey"])
			if(!target)
				to_chat(usr, span_notice("This player cannot be observed."))
				return

			var/client/C = usr.client
			if(!isobserver(usr) && !C.admin_ghost())
				return
			var/mob/dead/observer/A = C.mob
			A.ManualFollow(target)
*/
