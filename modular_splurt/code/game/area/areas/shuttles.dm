/area/shuttle
	//The mobile port attached to this area
	var/obj/docking_port/mobile/mobile_port

/area/shuttle/proc/link_to_shuttle(obj/docking_port/mobile/M)
	mobile_port = M

/area/shuttle/get_virtual_z(turf/T)
	if(mobile_port && is_reserved_level(mobile_port.z))
		return mobile_port.virtual_z
	return ..(T)

////////////////////////////Slave Trader Shuttle////////////////////////////

/area/shuttle/slaveship
	name = "Slave Trader Shuttle"
	canSmoothWithAreas = /area/shuttle/slaveship

/area/shuttle/slaveship/brig
	name = "Slave Trader Shuttle Brig"
	canSmoothWithAreas = null
	icon_state = "brig"
