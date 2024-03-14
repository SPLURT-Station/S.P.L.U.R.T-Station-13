/datum/controller/subsystem/shuttle/Initialize(timeofday)
	. = ..(timeofday)
	SSticker.OnRoundend(CALLBACK(src, .proc/roundend_callback))

/datum/controller/subsystem/shuttle/proc/roundend_callback()
	SSshuttle.navigation_locked_traits.Remove(ZTRAIT_CENTCOM)
