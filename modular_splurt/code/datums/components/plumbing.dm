/datum/component/plumbing/hydroponics
	demand_connects = NORTH | SOUTH | EAST | WEST
	//hydroponics cuts the overlays anyway, no point drawing then erasing them
	use_overlays = FALSE

/datum/component/plumbing/hydroponics/Initialize()
	. = ..(TRUE, FALSE)
