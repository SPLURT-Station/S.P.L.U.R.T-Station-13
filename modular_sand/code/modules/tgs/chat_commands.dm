/datum/tgs_chat_command/who
	name = "who"
	help_text = "Lists everyone currently on the server"

/datum/tgs_chat_command/who/Run(datum/tgs_chat_user/sender, params)
	return new /datum/tgs_message_content(tgswho())

/datum/tgs_chat_command/awho
	name = "awho"
	help_text = "Lists everyone + sneaky admins currently on the server"
	admin_only = TRUE

/datum/tgs_chat_command/awho/Run(datum/tgs_chat_user/sender, params)
	return new /datum/tgs_message_content(tgsadminwho())

/datum/tgs_chat_command/restart
	name = "restart"
	help_text = "Forces a restart on the server"
	admin_only = TRUE

/datum/tgs_chat_command/restart/Run(datum/tgs_chat_user/sender)
	. = new /datum/tgs_message_content("Restarting.")
	to_chat(world, span_boldwarning("Server restart - Initialized by [sender.friendly_name] on Discord."))
	send2adminchat("Server", "[sender.friendly_name] forced a restart.")
	addtimer(CALLBACK(src, world.TgsEndProcess()), 1 SECONDS)
