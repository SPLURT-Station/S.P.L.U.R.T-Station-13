/datum/tgs_chat_command/tidi
	name = "tidi"
	help_text = "Current station Time Dilation"
	admin_only = FALSE

/datum/tgs_chat_command/tidi/Run(datum/tgs_chat_user/sender, params)
	return "Time Dilation: [round(SStime_track.time_dilation_current,1)]% AVG:([round(SStime_track.time_dilation_avg_fast,1)]%, [round(SStime_track.time_dilation_avg,1)]%, [round(SStime_track.time_dilation_avg_slow,1)]%)"

/datum/tgs_chat_command/splashsauce
	name = "splashsauce"
	help_text = "Sauce of the current splashscreen"

/datum/tgs_chat_command/splashsauce/Run(datum/tgs_chat_user/sender, params)
	//Check if the sauce system is turned on
	if(!CONFIG_GET(flag/sauce_command_enabled))
		return new /datum/tgs_message_content("This command is not enabled!")

	//Get the current splashscreen
	var/list/raw_path = splittext(SStitle.file_path, "/")
	var/current_splashscreen = raw_path[raw_path.len]

	//Get the info of all splashscreens
	var/list/splashinfo = safe_json_decode(rustg_file_read("[global.config.directory]/splurt/title_screens_sources.json"))

	//Find the info of the current splashscreen
	if(!splashinfo.Find(current_splashscreen))
		return new /datum/tgs_message_content("The current splashscreen has no info set up yet!")

	//create info and embed of the sauce
	var/datum/tgs_message_content/message = new("Source found!")
	message.embed = new

	message.embed.author = new(splashinfo[current_splashscreen]["author"])
	message.embed.title = splashinfo[current_splashscreen]["name"]
	message.embed.description = splashinfo[current_splashscreen]["link"]
	message.embed.timestamp = time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")
	message.embed.image = new(splashinfo[current_splashscreen]["dw_link"])
	message.embed.colour = "#00ff00"

	return message

/datum/tgs_chat_command/allsplashscreens
	name = "allsplashscreens"
	help_text = "All info for all splashscreens currently in the server"

/datum/tgs_chat_command/allsplashscreens/Run(datum/tgs_chat_user/sender, params)
	//Check if the sauce system is turned on
	if(!CONFIG_GET(flag/sauce_command_enabled))
		return new /datum/tgs_message_content("This command is not enabled!")

	//Get the info of all splashscreens
	var/list/splashinfo = safe_json_decode(rustg_file_read("[global.config.directory]/splurt/title_screens_sources.json"))
	if(!splashinfo.len)
		return new /datum/tgs_message_content("There are no splashscreens set up yet!")

	//Organize the splashscreen info
	var/datum/tgs_message_content/message = new("Splashscreens:")
	message.embed = new

	message.embed.title = "Currently available splashscreens"
	message.embed.description = "These are the splashscreens with info currently available"
	message.embed.timestamp = time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")
	message.embed.colour = "#350bce"

	for(var/pic in splashinfo)
		var/list/info = splashinfo[pic]
		var/datum/tgs_chat_embed/field/field = new("by [info["author"]]", "\[[info["name"]]\]([info["link"]])")
		LAZYADD(message.embed.fields, field)
	return message
