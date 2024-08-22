/mob/dead/new_player/proc/new_player_panel()
	if(client?.prefs.toggles & TG_PLAYER_PANEL)
		return
	var/output = "<center><p>Welcome, <b>[client ? client.prefs.real_name : "Unknown User"]</b></p>"
	output += "<center><p><a href='byond://?src=[REF(src)];show_preferences=1'>Setup Character</a></p>"

	if(SSticker.current_state <= GAME_STATE_PREGAME)
		switch(ready)
			if(PLAYER_NOT_READY)
				output += "<p>\[ [LINKIFY_READY("Ready", PLAYER_READY_TO_PLAY)] | <b>Not Ready</b> | [LINKIFY_READY("Observe", PLAYER_READY_TO_OBSERVE)] \]</p>"
			if(PLAYER_READY_TO_PLAY)
				output += "<p>\[ <b>Ready</b> | [LINKIFY_READY("Not Ready", PLAYER_NOT_READY)] | [LINKIFY_READY("Observe", PLAYER_READY_TO_OBSERVE)] \]</p>"
			if(PLAYER_READY_TO_OBSERVE)
				output += "<p>\[ [LINKIFY_READY("Ready", PLAYER_READY_TO_PLAY)] | [LINKIFY_READY("Not Ready", PLAYER_NOT_READY)] | <b> Observe </b> \]</p>"
	else
		output += "<p><a href='byond://?src=[REF(src)];manifest=1'>View the Crew Manifest</a></p>"
		output += "<p><a href='byond://?src=[REF(src)];late_join=1'>Join Game!</a></p>"
		output += "<p>[LINKIFY_READY("Observe", PLAYER_READY_TO_OBSERVE)]</p>"

	if(!IsGuestKey(src.key))
		output += playerpolls()

	output += "</center>"

	//src << browse(output,"window=playersetup;size=210x240;can_close=0")
	var/datum/browser/popup = new(src, "playersetup", "<div align='center'>New Player Options</div>", 250, 265)
	popup.set_window_options("can_close=0")
	popup.set_content(output)
	popup.open(FALSE)

/mob/dead/new_player/proc/playerpolls()
	var/output = "" //hey tg why is this a list?
	if (SSdbcore.Connect())
		var/isadmin = FALSE
		if(client?.holder)
			isadmin = TRUE
		var/datum/db_query/query_get_new_polls = SSdbcore.NewQuery({"
			SELECT id FROM [format_table_name("poll_question")]
			WHERE (adminonly = 0 OR :isadmin = 1)
			AND Now() BETWEEN starttime AND endtime
			AND deleted = 0
			AND id NOT IN (
				SELECT pollid FROM [format_table_name("poll_vote")]
				WHERE ckey = :ckey
				AND deleted = 0
			)
			AND id NOT IN (
				SELECT pollid FROM [format_table_name("poll_textreply")]
				WHERE ckey = :ckey
				AND deleted = 0
			)
		"}, list("isadmin" = isadmin, "ckey" = ckey))
		var/rs = REF(src)
		if(!query_get_new_polls.Execute())
			qdel(query_get_new_polls)
			return
		if(query_get_new_polls.NextRow())
			output += "<p><b><a href='byond://?src=[rs];showpoll=1'>Show Player Polls</A> (NEW!)</b></p>"
		else
			output += "<p><a href='byond://?src=[rs];showpoll=1'>Show Player Polls</A></p>"
		qdel(query_get_new_polls)
		if(QDELETED(src))
			return
		return output

/mob/dead/new_player/Topic(href, list/href_list)
	if(src != usr)
		return ..()

	if(!client)
		return ..()

	//don't let people get to this unless they are specifically not verified
	if(href_list["Month"] && (CONFIG_GET(flag/age_verification) && !check_rights_for(client, R_ADMIN) && !(client.ckey in GLOB.bunker_passthrough)))
		return ..()

	if(!age_verify())
		return ..()

	//Handle discord verification
	var/vibe_check = SSdiscord?.check_login(src)
	if(isnull(vibe_check))
		to_chat(usr, span_notice("The server is still starting up. Please wait... "))
		return
	if(href_list["ready"])
		var/tready = text2num(href_list["ready"])
		if(tready != PLAYER_NOT_READY && !vibe_check)
			ready = PLAYER_NOT_READY
			to_chat(src, span_warning("You must link your discord account to your ckey in order to join the game. Join our <a style=\"color: #ff00ff;\" href=\"[CONFIG_GET(string/discordurl)]\">discord</a> and use the <span style=\"color: #ff00ff;\">[CONFIG_GET(string/discordbotcommandprefix)][CONFIG_GET(string/verification_command)]</span> command [CONFIG_GET(string/verification_channel) ? "as indicated in #[CONFIG_GET(string/verification_channel)] " : ""]. It won't take you more than two minutes :)<br>Ahelp or ask staff in the discord if this is an error."))
			return
	if(href_list["late_join"] || href_list["SelectedJob"] || href_list["JoinAsGhostRole"])
		if(!vibe_check)
			to_chat(src, span_warning("You must link your discord account to your ckey in order to join the game. Join our <a style=\"color: #ff00ff;\" href=\"[CONFIG_GET(string/discordurl)]\">discord</a> and use the <span style=\"color: #ff00ff;\">[CONFIG_GET(string/discordbotcommandprefix)][CONFIG_GET(string/verification_command)]</span> command [CONFIG_GET(string/verification_channel) ? "as indicated in #[CONFIG_GET(string/verification_channel)] " : ""]. It won't take you more than two minutes :)<br>Ahelp or ask staff in the discord if this is an error."))
			return

	if(client?.prefs.toggles & TG_PLAYER_PANEL)
		return ..()

	//Determines Relevant Population Cap
	var/relevant_cap
	var/hpc = CONFIG_GET(number/hard_popcap)
	var/epc = CONFIG_GET(number/extreme_popcap)
	if(hpc && epc)
		relevant_cap = min(hpc, epc)
	else
		relevant_cap = max(hpc, epc)

	if(href_list["show_preferences"])
		client.prefs.ShowChoices(src)
		return 1

	if(href_list["ready"])
		var/tready = text2num(href_list["ready"])
		//Avoid updating ready if we're after PREGAME (they should use latejoin instead)
		//This is likely not an actual issue but I don't have time to prove that this
		//no longer is required
		if(SSticker.current_state <= GAME_STATE_PREGAME)
			ready = tready
		//if it's post initialisation and they're trying to observe we do the needful
		if(!SSticker.current_state < GAME_STATE_PREGAME && tready == PLAYER_READY_TO_OBSERVE)
			ready = tready
			make_me_an_observer()
			return

	if(href_list["refresh"])
		src << browse(null, "window=playersetup") //closes the player setup window
		new_player_panel()

	if(href_list["late_join"])
		if(!SSticker || !SSticker.IsRoundInProgress())
			return ..()

		if(href_list["late_join"] == "override")
			LateChoices()
			return

		if(SSticker.queued_players.len || (relevant_cap && living_player_count() >= relevant_cap && !(ckey(usr.key) in GLOB.admin_datums)))
			to_chat(usr, span_danger("[CONFIG_GET(string/hard_popcap_message)]"))

			var/queue_position = SSticker.queued_players.Find(usr)
			if(queue_position == 1)
				to_chat(usr, span_notice("You are next in line to join the game. You will be notified when a slot opens up."))
			else if(queue_position)
				to_chat(usr, span_notice("There are [queue_position-1] players in front of you in the queue to join the game."))
			else
				SSticker.queued_players += usr
				to_chat(usr, span_notice("You have been added to the queue to join the game. Your position in queue is [SSticker.queued_players.len]."))
			return

	if(href_list["manifest"])
		ViewManifest()

	else if(!href_list["late_join"])
		new_player_panel()

	if(href_list["showpoll"])
		handle_player_polling()
		return

	. = ..()

