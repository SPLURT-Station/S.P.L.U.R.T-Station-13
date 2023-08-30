/// Takes in a type path, locates an instance of that type in the cached map, and calculates its offset from the origin of the map, returns this offset in the form list(x, y).
/datum/map_template/proc/discover_offset(obj/marker)
	var/key
	var/list/models = cached_map.grid_models
	for(key in models)
		if(findtext(models[key], "[marker]")) // Yay compile time checks
			break // This works by assuming there will ever only be one mobile dock in a template at most

	for(var/datum/grid_set/gset as anything in cached_map.gridSets)
		var/ycrd = gset.ycrd
		for(var/line in gset.gridLines)
			var/xcrd = gset.xcrd
			for(var/j in 1 to length(line) step cached_map.key_len)
				if(key == copytext(line, j, j + cached_map.key_len))
					return list(xcrd, ycrd)
				++xcrd
			--ycrd
