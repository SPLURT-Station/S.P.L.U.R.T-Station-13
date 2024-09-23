//Everyone who wanted to be an observer gets made one now
/datum/controller/subsystem/ticker/proc/create_observers()
	for(var/mob/dead/new_player/player in GLOB.player_list)
		if(player.ready == PLAYER_READY_TO_OBSERVE && player.mind && !(player.client?.prefs.toggles & TG_PLAYER_PANEL))
			//Break chain since this has a sleep input in it
			addtimer(CALLBACK(player, TYPE_PROC_REF(/mob/dead/new_player, make_me_an_observer)), 1)

/datum/controller/subsystem/ticker/proc/is_part_of_cycle(days, rounds)
    var/current_day = text2num(time2text(world.timeofday, "DD"))
    var/current_month = text2num(time2text(world.timeofday, "MM"))
    var/current_year = text2num(time2text(world.timeofday, "YYYY"))
    var/current_round = GLOB.round_id

    var/list/days_in_months = list(
        1 = 31,  // January
        2 = IsLeapYear(current_year) ? 29 : 28,  // February
        3 = 31,  // March
        4 = 30,  // April
        5 = 31,  // May
        6 = 30,  // June
        7 = 31,  // July
        8 = 31,  // August
        9 = 30,  // September
        10 = 31, // October
        11 = 30, // November
        12 = 31  // December
    )

    // Add the number of days in the past months to the current day
    for (var/i in 1 to (current_month - 1))
        current_day += days_in_months[i]

    // Check if the current day is part of the cycle of every [days] days
    if (current_day % days != 0)
        return FALSE

    // Check if the current round is part of the cycle of every [rounds] rounds
    if (current_round % rounds != 0)
        return FALSE

    return TRUE
