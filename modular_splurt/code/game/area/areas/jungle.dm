/area/jungle // trees spawn here
	name = "Jungle Surface"
	icon_state = "explored"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | CAVES_ALLOWED | MOB_SPAWN_ALLOWED | NO_ALERTS
	sound_environment = SOUND_AREA_ICEMOON

/area/jungle/surface // trees spawn here
	name = "Jungle Surface"
	icon_state = "explored"
	outdoors = TRUE
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	map_generator = /datum/map_generator/cave_generator/jungle

/area/jungle/underground //cave generator
	name = "Jungle Caves"
	icon_state = "unexplored"
	outdoors = FALSE
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambientsounds = MINING
	map_generator = /datum/map_generator/cave_generator/jungle/caves
