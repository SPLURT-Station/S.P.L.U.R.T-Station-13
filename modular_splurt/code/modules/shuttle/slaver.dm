/obj/machinery/computer/shuttle/slaver
	name = "slaver shuttle terminal"
	desc = "The terminal used to control the slaver transport shuttle."
	circuit = /obj/item/circuitboard/computer/slaver_shuttle
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_RED
	shuttleId = "slaver"
	possible_destinations = "slaver_away;slaver_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/machinery/computer/shuttle/slaver/recall
	name = "slaver shuttle recall terminal"
	desc = "Use this if your friends left you behind."
	possible_destinations = "slaver_away"

/obj/machinery/computer/camera_advanced/shuttle_docker/slaver
	name = "slaver shuttle navigation computer"
	desc = "Used to designate a precise transit location for the slaver shuttle."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "slaver"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "slaver_custom"
	jumpto_ports = list("slaver_custom" = 1)
	view_range = 5.5
	x_offset = -7
	y_offset = -1
	space_turfs_only = FALSE
	whitelist_turfs = list(/turf/open/space, /turf/open/floor/plating, /turf/open/lava, /turf/closed/mineral)
	see_hidden = TRUE
