/area/shuttle/lavaland/elevator
	name = "Mining Elevator"

//shuttle console for elevators//

/obj/machinery/computer/shuttle/elevator/mining
	name = "lavaland elevator console"
	desc = "A shuttle control computer."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "lavaland_mining"
	possible_destinations = "lavaland_mining_top;lavaland_mining_down"


/datum/map_template/shuttle/lavaland
	port_id = "lavaland"
	can_be_bought = FALSE

/datum/map_template/shuttle/lavaland/mining
	suffix = "mining"
	name = "lavaland Mining Elevator"