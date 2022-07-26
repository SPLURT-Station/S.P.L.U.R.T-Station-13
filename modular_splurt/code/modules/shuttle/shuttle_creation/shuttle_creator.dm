/proc/invertDir(var/input_dir)
	switch(input_dir)
		if(UP)
			return DOWN
		if(DOWN)
			return UP
		if(-INFINITY to 0, 11 to INFINITY)
			CRASH("Can't turn invalid directions!")
	return turn(input_dir, 180)

//Select shuttle fly direction.
/obj/item/shuttle_creator/proc/select_preferred_direction(mob/user)
	var/obj/docking_port/mobile/port = SSshuttle.getShuttle(linkedShuttleId)
	if(!port || !istype(port, /obj/docking_port/mobile))
		return FALSE
	var/static/list/choice = list("NORTH" = NORTH, "SOUTH" = SOUTH, "EAST" = EAST, "WEST" = WEST)
	var/Pdir = input(user, "Shuttle Fly Direction:", "Blueprint Editing", "NORTH") as null|anything in list("NORTH", "SOUTH", "EAST", "WEST")
	if(Pdir)
		port.preferred_direction = choice[Pdir]
