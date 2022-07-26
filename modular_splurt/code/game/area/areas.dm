/// Gets an areas virtual z value. For having multiple areas on the same z-level treated mechanically as different z-levels
/area/proc/get_virtual_z(turf/T)
	return T.z

/area/get_virtual_z_level()
	return get_virtual_z(get_turf(src))
