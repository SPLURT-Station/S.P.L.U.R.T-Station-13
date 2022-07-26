/datum/space_level
	//Z-levels orbital body
	var/datum/orbital_object/z_linked/orbital_body
	//Is something generating on this level?
	var/generating = FALSE

/datum/space_level/New(new_z, new_name, list/new_traits, orbital_body_type)
	. = ..()
	if(orbital_body_type)
		orbital_body = new orbital_body_type()
		orbital_body.link_to_z(src)
