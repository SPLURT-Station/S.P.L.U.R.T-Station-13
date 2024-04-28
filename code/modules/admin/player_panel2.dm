GLOBAL_LIST_INIT(mute_bits, list(
	list(name = "IC", bitflag = MUTE_IC),
	list(name = "OOC", bitflag = MUTE_OOC),
	list(name = "Pray", bitflag = MUTE_PRAY),
	list(name = "Ahelp", bitflag = MUTE_ADMINHELP),
	list(name = "Deadchat", bitflag = MUTE_DEADCHAT)
))

GLOBAL_LIST_INIT(pp_limbs, list(
	"Head" 		= BODY_ZONE_HEAD,
	"Left leg" 	= BODY_ZONE_L_LEG,
	"Right leg" = BODY_ZONE_R_LEG,
	"Left arm" 	= BODY_ZONE_L_ARM,
	"Right arm" = BODY_ZONE_R_ARM
))

/datum/admins/proc/show_player_panel2(mob/M)
	if(!M)
		to_chat(owner, "You seem to be selecting a mob that doesn't exist anymore.")
		return

	// this is stupid, thanks byond
	if(istype(src, /client))
		var/client/C = src
		src = C.holder

	if(!check_rights())
		to_chat(owner, "Error: you are not an admin!")
		return

	if(!M.mob_panel)
		M.create_player_panel()

	M.mob_panel.ui_interact(owner.mob)

/datum/player_panel
	var/mob/targetMob
	var/client/targetClient
	var/list/roleStatus // A list of each role and whether they are banned or not for this player.
	var/antagBanReason
	var/activeRoleBans
	var/mobSize // Because aparently there is no variable that tracks this on the mob??

/datum/player_panel/New(mob/target)
	. = ..()
	targetMob = target

	var/mob/living/L = targetMob
	if (istype(L))
		mobSize = L.mob_size

/datum/player_panel/Destroy(force, ...)
	targetMob = null
	targetClient = null
	roleStatus = null
	antagBanReason = null
	activeRoleBans = null
	mobSize = null

	SStgui.close_uis(src)
	return ..()

/datum/player_panel/ui_interact(mob/user, datum/tgui/ui)
	if(!targetMob)
		return

	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "PlayerPanel2", "[targetMob.name] Player Panel")
		ui.open()

/datum/player_panel/ui_state(mob/user)
	return GLOB.admin_state

/datum/player_panel/ui_data(mob/user)
	. = list()
	.["mob_name"] = targetMob.real_name
	// .["current_permissions"] = user.client?.holder?.rank.rights
	.["mob_type"] = targetMob.type
	.["admin_mob_type"] = user.client?.mob.type
	.["godmode"] = targetMob.status_flags & GODMODE

	var/mob/living/L = targetMob
	if (istype(L))
		.["is_frozen"] = L.admin_frozen
		.["is_slept"] = L.admin_sleeping
		.["mob_scale"] = mobSize

	if(targetMob.client)
		targetClient = targetMob.client
		.["client_ckey"] = targetClient.ckey
		.["client_muted"] = targetClient.prefs.muted
		.["client_rank"] = targetClient.holder ? targetClient.holder.rank : "Player"

		if (!roleStatus)
			updateJobbanStatus()
		.["roles"] = roleStatus
		.["antag_ban_reason"] = antagBanReason
		.["active_role_ban_count"] = activeRoleBans

	else
		targetClient = null
		roleStatus = null
		antagBanReason = null
		.["client_ckey"] = null

/datum/player_panel/ui_static_data()
	. = list()

	.["transformables"] = GLOB.pp_transformables
	.["glob_limbs"] = GLOB.pp_limbs
	.["glob_mute_bits"] = GLOB.mute_bits
	.["current_time"] = time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")

	.["initial_scale"] = 1

	if(targetClient)
		var/byond_version = "Unknown"
		if(targetClient.byond_version)
			byond_version = "[targetClient.byond_version].[targetClient.byond_build ? targetClient.byond_build : "xxx"]"
		.["data_byond_version"] = byond_version
		.["data_player_join_date"] = targetClient.player_join_date
		.["data_account_join_date"] = targetClient.account_join_date
		.["data_related_cid"] = targetClient.related_accounts_cid
		.["data_related_ip"] = targetClient.related_accounts_ip

		.["initial_scale"] = targetClient.prefs.features["body_size"]

		if(CONFIG_GET(flag/use_exp_tracking))
			.["playtimes_enabled"] = TRUE
			.["playtime"] = targetMob.client.get_exp_living()

/datum/player_panel/ui_act(action, params, datum/tgui/ui)
	if(..())
		return

	var/client/admin = usr.client

	if (!check_rights(R_ADMIN))
		message_admins("<span class='adminhelp'>WARNING: NON-ADMIN [ADMIN_LOOKUPFLW(admin)] ACCESSING ADMIN PANEL. WARN Casper#3044.</span>")
		to_chat(admin, "Error: you are not an admin!")
		return

	switch(action)
		if ("edit_rank")
			if (!targetMob.client?.ckey)
				return

			var/list/context = list()

			context["key"] = targetMob.client.ckey

			if (GLOB.admin_datums[targetMob.client.ckey] || GLOB.deadmins[targetMob.client.ckey])
				context["editrights"] = "rank"
			else
				context["editrights"] = "add"

			admin.holder.edit_rights_topic(context)

		if ("access_variables")
			admin.debug_variables(targetMob)

		if ("access_playtimes")
			if (targetMob.client)
				admin.holder.cmd_show_exp_panel(targetMob.client)

		if ("private_message")
			admin.cmd_admin_pm_context(targetMob)

		if ("subtle_message")
			admin.cmd_admin_subtle_headset_message(targetMob)

		if ("set_name")
			targetMob.vv_auto_rename(params["name"])

		if ("heal")
			admin.cmd_admin_rejuvenate(targetMob)

		if ("ghost")
			if(targetMob.client)
				log_admin("[key_name(admin)] ejected [key_name(targetMob)] from their body.")
				message_admins("[key_name_admin(admin)] ejected [key_name_admin(targetMob)] from their body.")
				to_chat(targetMob, "<span class='danger'>An admin has ejected you from your body.</span>")
				targetMob.ghostize(FALSE)

		if ("offer_control")
			offer_control(targetMob)

		if ("take_control")
			var/mob/adminMob = admin.mob

			// Disassociates observer mind from the body mind
			if(targetMob.client)
				targetMob.ghostize(FALSE)
			else
				for(var/mob/dead/observer/ghost in GLOB.dead_mob_list)
					if(targetMob.mind == ghost.mind)
						ghost.mind = null

			targetMob.ckey = adminMob.ckey
			qdel(adminMob)

			message_admins("<span class='adminnotice'>[key_name_admin(usr)] took control of [targetMob].</span>")
			log_admin("[key_name(usr)] took control of [targetMob].")
			addtimer(CALLBACK(targetMob.mob_panel, TYPE_PROC_REF(/datum, ui_interact), targetMob), 0.1 SECONDS)

		if ("smite")
			admin.smite(targetMob)

		if ("bring")
			admin.Getmob(targetMob)

		if ("orbit")
			if(!isobserver(admin.mob))
				admin.admin_ghost()
			var/mob/dead/observer/O = admin.mob
			O.ManualFollow(targetMob)

		if ("jump_to")
			admin.jumptomob(targetMob)

		if ("freeze")
			var/mob/living/L = targetMob
			if (istype(L))
				L.toggle_admin_freeze(admin)

		if ("sleep")
			var/mob/living/L = targetMob
			if (istype(L))
				L.toggle_admin_sleep(admin)

		if ("lobby")
			if(!isobserver(targetMob))
				to_chat(usr, "<span class='notice'>You can only send ghost players back to the Lobby.</span>")
				return

			if(!targetMob.client)
				to_chat(usr, "<span class='warning'>[targetMob] doesn't seem to have an active client.</span>")
				return

			log_admin("[key_name(usr)] has sent [key_name(targetMob)] back to the Lobby.")
			message_admins("[key_name(usr)] has sent [key_name(targetMob)] back to the Lobby.")

			var/mob/dead/new_player/NP = new()
			NP.ckey = targetMob.ckey
			qdel(targetMob)
			if(GLOB.preferences_datums[NP.ckey])
				var/datum/preferences/P = GLOB.preferences_datums[NP.ckey]
				P.respawn_restrictions_active = FALSE

		if ("select_equipment")
			admin.cmd_select_equipment(targetMob)

		if ("strip")
			for(var/obj/item/I in targetMob)
				targetMob.dropItemToGround(I, TRUE) //The TRUE forces all items to drop, since this is an admin undress.

		if ("cryo")
			cryoMob(targetMob, effects = TRUE)

		if ("force_say")
			targetMob.say(params["to_say"], forced="admin")

		if ("force_emote")
			targetMob.emote("me", EMOTE_VISIBLE, params["to_emote"])

		if ("prison")
			if(isAI(targetMob))
				to_chat(usr, "This cannot be used on instances of type /mob/living/silicon/ai.")
				return

			targetMob.forceMove(pick(GLOB.prisonwarp))
			to_chat(targetMob, "<span class='userdanger'>You have been sent to Prison!</span>")

			log_admin("[key_name(admin)] has sent [key_name(targetMob)] to Prison!")
			message_admins("[key_name_admin(admin)] has sent [key_name_admin(targetMob)] to Prison!")

		if ("kick")
			admin.holder.kick(targetMob)

		if ("ban")
			admin.holder.newBan(targetMob)

		if ("sticky_ban")
			var/list/ban_settings = list()
			if(targetMob.client)
				ban_settings["ckey"] = targetMob.ckey
			admin.holder.stickyban("add", ban_settings)

		if ("notes")
			if (targetMob.client)
				browse_messages(target_ckey = targetMob.ckey)

		if ("logs")
			var/source = LOGSRC_MOB
			if (targetMob.client)
				source = LOGSRC_CLIENT

			show_individual_logging_panel(targetMob, source)

		if ("job_ban")
			if(targetMob.client)
				process_banlist(params["selected_role"], params["is_category"], params["want_to_ban"])

		if ("mute")
			if(!targetMob.client)
				return

			targetMob.client.prefs.muted = text2num(params["mute_flag"])
			log_admin("[key_name(admin)] set the mute flags for [key_name(targetMob)] to [targetMob.client.prefs.muted].")

		if ("mute_all")
			if(!targetMob.client)
				return

			for(var/bit in GLOB.mute_bits)
				targetMob.client.prefs.muted |= bit["bitflag"]

			log_admin("[key_name(admin)] mass-muted [key_name(targetMob)].")

		if ("unmute_all")
			if(!targetMob.client)
				return

			for(var/bit in GLOB.mute_bits)
				targetMob.client.prefs.muted &= ~bit["bitflag"]

			log_admin("[key_name(admin)] mass-unmuted [key_name(targetMob)].")

		if ("related_accounts")
			if(targetMob.client)
				var/related_accounts
				if (params["related_thing"] == "CID")
					related_accounts = targetMob.client.related_accounts_cid
				else
					related_accounts = targetMob.client.related_accounts_ip

				related_accounts = splittext(related_accounts, ", ")

				var/list/dat = list("Related accounts by [params["related_thing"]]:")
				dat += related_accounts
				usr << browse(dat.Join("<br>"), "window=related_[targetMob.client];size=420x300")

		if ("transform")
			var/choice = params["newType"]
			if (choice == "/mob/living")
				choice = tgui_input_list(usr, "What should this mob transform into", "Mob Transform", subtypesof(choice))
				if (!choice)
					return

			admin.holder.transformMob(targetMob, admin.mob, choice, params["newTypeName"])

		if ("toggle_godmode")
			admin.cmd_admin_godmode(targetMob)

		if ("spell")
			admin.toggle_spell(targetMob)

		if ("martial_art")
			admin.teach_martial_art(targetMob)

		if ("quirk")
			admin.toggle_quirk(targetMob)

		if ("species")
			admin.set_species(targetMob)

		if ("limb")
			if(!params["limbs"] || !ishuman(targetMob))
				return

			var/mob/living/carbon/human/H = targetMob

			for(var/limb in params["limbs"])
				if (!limb)
					continue

				if (params["delimb_mode"])
					var/obj/item/bodypart/L = H.get_bodypart(limb)
					if (!L)
						continue
					L.dismember(harmless = TRUE)
					playsound(H, 'modular_splurt/sound/effects/cartoon_pop.ogg', 70)
				else
					H.regenerate_limb(limb)

		if ("scale")
			var/mob/living/L = targetMob
			if(!isnull(params["new_scale"]) && istype(L))
				L.vv_edit_var("resize", params["new_scale"])
				mobSize = params["new_scale"]

		if ("explode")
			var/power = text2num(params["power"])
			var/empMode = text2num(params["emp_mode"])


			var/turf/T = get_turf(usr)
			message_admins("[ADMIN_LOOKUPFLW(usr)] created an admin [empMode ? "EMP" : "explosion"] at [ADMIN_VERBOSEJMP(T)].")
			log_admin("[key_name(usr)] created an admin [empMode ? "EMP" : "explosion"] at [usr.loc].")

			if (empMode)
				empulse_using_range(usr, power, TRUE)
			else
				explosion(usr, power / 3, power / 2, power, power, ignorecap = TRUE)

		if ("narrate")
			var/list/stylesRaw = params["classes"]

			var/styles = ""
			for(var/style in stylesRaw)
				styles += "[style]:[stylesRaw[style]];"

			if (params["mode_global"])
				to_chat(world, "<span style='[styles]'>[params["message"]]</span>")
				log_admin("GlobalNarrate: [key_name(usr)] : [params["message"]]")
				message_admins("<span class='adminnotice'>[key_name_admin(usr)] Sent a global narrate</span>")
			else
				for(var/mob/M in view(params["range"], usr))
					to_chat(M, "<span style='[styles]'>[params["message"]]</span>")

				log_admin("LocalNarrate: [key_name(usr)] at [AREACOORD(usr)]: [params["message"]]")
				message_admins("<span class='adminnotice'><b> LocalNarrate: [key_name_admin(usr)] at [ADMIN_VERBOSEJMP(usr)]:</b> [params["message"]]<BR></span>")

		if ("languages")
			var/datum/language_holder/H = targetMob.get_language_holder()
			H.open_language_menu(usr)

		if ("ambitions")
			var/datum/mind/requesting_mind = targetMob.mind
			if(!istype(requesting_mind) || QDELETED(requesting_mind))
				to_chat(usr, "<span class='warning'>This mind reference is no longer valid. It has probably since been destroyed.</span>")
				return
			requesting_mind.do_edit_objectives_ambitions()

		if ("traitor_panel")
			admin.holder.show_traitor_panel(targetMob)

// process_banlist: Gets all jobs in a job category
// Input:
// 	query (string): The name of the role / department you want to jobban.
//	is_category (boolean): Is the query a department / role category? e.g. query "Engineering" needs TRUE
//	want_to_ban (boolean): Should we ban or should we unban the job we just supplied.
//
// Output:A list of strings with the names of each role the INPUT covers.
/datum/player_panel/proc/process_banlist(query, is_category, want_to_ban)
	if(!SSjob)
		to_chat(usr, "Jobs subsystem not initialized yet!")
		return

	var/mob/M = targetClient.mob
	var/list/jobs_to_set = list() // All the roles relating to the clicked button

	if (is_category)
		for(var/list/role_category in roleStatus) // For every department / antag category
			if (role_category["category_name"] == query) // If this is the selected category

				for(var/list/role in role_category["category_roles"])
					jobs_to_set += role["name"]
				break

	else
		jobs_to_set += query

	var/list/jobs_to_set_trimmed = list() // The roles from jobs_to_set that aren't already banned / unbanned
	for(var/role in jobs_to_set)

		// If we are in ban mode and this role is unbanned OR if we are in unban mode and this role is banned
		// (We don't want to ban / unban roles that are already banned / unbanned)
		if ((want_to_ban && !jobban_isbanned(M, role)) || (!want_to_ban && jobban_isbanned(M, role)))
			jobs_to_set_trimmed += role

	for(var/role in jobs_to_set_trimmed)

	if (jobs_to_set_trimmed.len) // At least one role to get banned / unbanned
		if (want_to_ban)
			usr.client.holder.Jobban(targetClient.mob, jobs_to_set_trimmed)
		else
			usr.client.holder.UnJobban(targetClient.mob, jobs_to_set_trimmed)

	updateJobbanStatus() // Update TGUI data to reflect new ban statuses

// Updates the jobban status of this client's jobban panel.
/datum/player_panel/proc/updateJobbanStatus()
	var/list/roles = list()
	var/active_role_bans = 0

	for(var/list/role_category in GLOB.jobban_panel_data) // For every department / antag category
		var/list/category_roles = list()
		category_roles["category_name"] = role_category["name"]
		category_roles["category_color"] = role_category["color"]
		category_roles["category_roles"] = list()

		for(var/role in role_category["roles"]) // For every job / antag
			var/list/roles_instance = list()
			roles_instance["name"] = role
			var/reason = jobban_isbanned(targetMob, role)
			if(reason)
				roles_instance["ban_reason"] = reason
				active_role_bans++

			category_roles["category_roles"] += list(roles_instance)

		roles += list(category_roles)

	roleStatus = roles
	antagBanReason = jobban_isbanned(targetMob, ROLE_SYNDICATE)
	activeRoleBans = active_role_bans
