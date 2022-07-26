/datum/controller/subsystem/air/proc/pause_z(z_level)
	LAZYADD(paused_z_levels, z_level)

/datum/controller/subsystem/air/proc/unpause_z(z_level)
	LAZYREMOVE(paused_z_levels, z_level)
