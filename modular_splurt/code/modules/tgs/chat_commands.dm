/datum/tgs_chat_command/tidi
	name = "tidi"
	help_text = "Current station Time Dilation"
	admin_only = FALSE

/datum/tgs_chat_command/tidi/Run(datum/tgs_chat_user/sender, params)
	return "Time Dilation: [round(SStime_track.time_dilation_current,1)]% AVG:([round(SStime_track.time_dilation_avg_fast,1)]%, [round(SStime_track.time_dilation_avg,1)]%, [round(SStime_track.time_dilation_avg_slow,1)]%)"

