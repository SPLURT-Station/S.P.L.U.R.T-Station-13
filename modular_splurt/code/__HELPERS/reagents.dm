/proc/mix_color_from_reagents_hashtable(list/reagent_list)
	if(!istype(reagent_list))
		return

	var/mixcolor
	var/vol_counter = 0
	var/vol_temp
	var/color_temp

	for(var/i in reagent_list)
		var/datum/reagent/R = find_reagent_object_from_type(i)
		vol_temp = reagent_list[R]
		color_temp = R.color
		vol_counter += vol_temp


		if(!mixcolor)
			mixcolor = color_temp

		else if (length(mixcolor) >= length(color_temp))
			mixcolor = BlendRGB(mixcolor, color_temp, vol_temp/vol_counter)
		else
			mixcolor = BlendRGB(color_temp, mixcolor, vol_temp/vol_counter)
	return mixcolor

