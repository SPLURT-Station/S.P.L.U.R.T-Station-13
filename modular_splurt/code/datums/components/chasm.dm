/datum/component/chasm
	var/static/list/forbidden_extra = list(
		/obj/effect/crystalline_reentry
	)

/datum/component/chasm/droppable(atom/movable/AM)
	if(is_type_in_typecache(AM, forbidden_extra))
		return FALSE
	. = ..()
