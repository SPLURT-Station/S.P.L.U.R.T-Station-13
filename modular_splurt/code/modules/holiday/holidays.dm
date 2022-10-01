/datum/holiday/birthday/splurt
	name = "Birthday of S.P.L.U.R.T."
	begin_day = 8
	begin_month = OCTOBER

/datum/holiday/birthday/splurt/greet()
	var/station_age = text2num(time2text(world.timeofday, "YYYY")) - 2021
	return "On this day, we commemorate the [station_age]\th year since S.P.L.U.R.T. was first hosted, as SEXO:EROS, on October 8th, 2021.\nLet us celebrate, for getting more degenerate each day!"

/datum/holiday/birthday/splurt/getStationPrefix()
	. = ..()
	. = pick(., "Anniversary", "Birfday", "Celebration", "Cake and Party")
