/*/client/proc/generate_ruin()
	set category = "Debug"
	set name = "Generate Ruin"
	set desc = "Randomly generate a space ruin."
	if (!holder)
		return
	var/ruin_size = input(src, "Ruin size (NxN) (Between 10 and 200)", "Ruin Size", 0) as num
	if(ruin_size < 10 || ruin_size >= 200)
		return
	var/response = alert(src, "This will place the ruin at your current location.", "Spawn Ruin", "Spawn Ruin", "Cancel")
	if (response == "Cancel")
		return
	var/border_size = (world.maxx - ruin_size) / 2
	generate_space_ruin(mob.x, mob.y, mob.z, border_size, border_size)
	log_admin("[key_name(src)] randomly generated a space ruin at [COORD(mob)].")*/
