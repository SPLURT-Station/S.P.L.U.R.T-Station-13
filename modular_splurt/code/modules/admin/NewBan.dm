/datum/admins/proc/newBan(mob/M)
	if(!check_rights(R_BAN))
		return

	// var/mob/M = mob_to_ban
	if(!ismob(M) || !M.client)
		to_chat(usr, "<span class='danger'>Error: [M] has no client!</span>")
		return

	if(M.client && M.client.holder)
		to_chat(usr, "<span class='danger'>Error: You cannot ban admins!</span>")
		return	//admins cannot be banned. Even if they could, the ban doesn't affect them anyway

	switch(tgui_alert(usr, "Ban type", buttons = list("Temporary", "Permanent", "Cancel")))
		if("Temporary")
			var/mins = input(usr,"How long (in minutes)?","Ban time",1440) as num|null
			if(mins <= 0)
				to_chat(usr, "<span class='danger'>[mins] is not a valid duration.</span>")
				return
			var/reason = input(usr,"Please State Reason For Banning [M.key].","Reason") as message|null
			if(!reason)
				return
			if(!DB_ban_record(BANTYPE_TEMP, M, mins, reason))
				to_chat(usr, "<span class='danger'>Failed to apply ban.</span>")
				return
			AddBan(M.ckey, M.computer_id, reason, usr.ckey, 1, mins)
			ban_unban_log_save("[key_name(usr)] has banned [key_name(M)]. - Reason: [reason] - This will be removed in [mins] minutes.")
			to_chat(M, "<span class='boldannounce'><BIG>You have been banned by [usr.client.key].\nReason: [reason]</BIG></span>")
			to_chat(M, "<span class='danger'>This is a temporary ban, it will be removed in [mins] minutes. The round ID is [GLOB.round_id].</span>")
			var/bran = CONFIG_GET(string/banappeals)
			if(bran)
				to_chat(M, "<span class='danger'>To try to resolve this matter head to [bran]</span>")
			else
				to_chat(M, "<span class='danger'>No ban appeals URL has been set.</span>")
			log_admin_private("[key_name(usr)] has banned [key_name(M)].\nReason: [key_name(M)]\nThis will be removed in [mins] minutes.")
			var/msg = "<span class='adminnotice'>[key_name_admin(usr)] has banned [key_name_admin(M)].\nReason: [reason]\nThis will be removed in [mins] minutes.</span>"
			message_admins(msg)
			var/datum/admin_help/AH = M.client ? M.client.current_ticket : null
			if(AH)
				AH.Resolve()
			qdel(M.client)
		if("Permanent")
			var/reason = input(usr,"Please State Reason For Banning [M.key].","Reason") as message|null
			if(!reason)
				return
			switch(alert(usr,"IP ban?",,"Yes","No","Cancel"))
				if("Cancel")
					return
				if("Yes")
					AddBan(M.ckey, M.computer_id, reason, usr.ckey, 0, 0, M.lastKnownIP)
				if("No")
					AddBan(M.ckey, M.computer_id, reason, usr.ckey, 0, 0)
			to_chat(M, "<span class='boldannounce'><BIG>You have been banned by [usr.client.key].\nReason: [reason]</BIG></span>")
			to_chat(M, "<span class='danger'>This is a permanent ban. The round ID is [GLOB.round_id].</span>")
			var/bran = CONFIG_GET(string/banappeals)
			if(bran)
				to_chat(M, "<span class='danger'>To try to resolve this matter head to [bran]</span>")
			else
				to_chat(M, "<span class='danger'>No ban appeals URL has been set.</span>")
			if(!DB_ban_record(BANTYPE_PERMA, M, -1, reason))
				to_chat(usr, "<span class='danger'>Failed to apply ban.</span>")
				return
			ban_unban_log_save("[key_name(usr)] has permabanned [key_name(M)]. - Reason: [reason] - This is a permanent ban.")
			log_admin_private("[key_name(usr)] has banned [key_name(M)].\nReason: [reason]\nThis is a permanent ban.")
			var/msg = "<span class='adminnotice'>[key_name_admin(usr)] has banned [key_name_admin(M)].\nReason: [reason]\nThis is a permanent ban.</span>"
			message_admins(msg)
			var/datum/admin_help/AH = M.client ? M.client.current_ticket : null
			if(AH)
				AH.Resolve()
			qdel(M.client)
