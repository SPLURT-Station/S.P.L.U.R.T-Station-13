//Lavaland Ruins

/area/ruin/lavaland/unpowered
	always_unpowered = FALSE

/area/ruin/lavaland/unpowered/no_grav
	has_gravity = FALSE

/area/ruin/lavaland/powered
	requires_power = FALSE

/area/ruin/lavaland/powered/beach
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/clownplanet
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/animal_hospital
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/snow_biodome
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/gluttony
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/golem_ship
	name = "Free Golem Ship"
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/greed
	icon_state = "dk_yellow"

/area/ruin/lavaland/unpowered/hierophant
	name = "Hierophant's Arena"
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/pride
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/seedvault
	icon_state = "dk_yellow"

/area/ruin/lavaland/unpowered/elephant_graveyard
	name = "Elephant Graveyard"
	icon_state = "dk_yellow"

/area/ruin/lavaland/powered/graveyard_shuttle
	name = "Elephant Graveyard"
	icon_state = "green"

/area/ruin/unpowered/syndicate_lava_base
	name = "Secret Base"
	icon_state = "dk_yellow"
	ambientsounds = HIGHSEC

/area/ruin/unpowered/syndicate_lava_base/engineering
	name = "Syndicate Lavaland Engineering"

/area/ruin/unpowered/syndicate_lava_base/medbay
	name = "Syndicate Lavaland Medbay"

/area/ruin/unpowered/syndicate_lava_base/arrivals
	name = "Syndicate Lavaland Arrivals"

/area/ruin/unpowered/syndicate_lava_base/bar
	name = "Syndicate Lavaland Bar"

/area/ruin/unpowered/syndicate_lava_base/main
	name = "Syndicate Lavaland Primary Hallway"

/area/ruin/unpowered/syndicate_lava_base/cargo
	name = "Syndicate Lavaland Cargo Bay"

/area/ruin/unpowered/syndicate_lava_base/chemistry
	name = "Syndicate Lavaland Chemistry"

/area/ruin/unpowered/syndicate_lava_base/virology
	name = "Syndicate Lavaland Virology"

/area/ruin/unpowered/syndicate_lava_base/testlab
	name = "Syndicate Lavaland Experimentation Lab"

/area/ruin/unpowered/syndicate_lava_base/dormitories
	name = "Syndicate Lavaland Dormitories"

/area/ruin/unpowered/syndicate_lava_base/telecomms
	name = "Syndicate Lavaland Telecommunications"

/area/ruin/unpowered/syndicate_lava_base/circuits
	name = "Syndicate Lavaland Circuit Lab"

/area/ruin/unpowered/syndicate_lava_base/outdoors //Putting this area down should prevent fauna from spawning nearby
	name = "Syndicate Lavaland Approach"
	icon_state = "red"



//Xeno Nest

/area/ruin/lavaland/unpowered/xenonest
	name = "The Hive"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	poweralm = FALSE

//ash walker nest
/area/ruin/lavaland/unpowered/ash_walkers
	icon_state = "red"
