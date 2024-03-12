/*
==================================================================================================
IMPORTANT NOTE: Gravity Handling for Oshan
==================================================================================================
When adding new areas to the station, make sure to manually set the 'has_gravity' variable to
TRUE in the corresponding map file (e.g., oshanlaboratory.dmm) to ensure proper gravity in those areas.
(The ocean already has standard gravity by default)

This approach is necessary to avoid re-creating all the existing station areas under the /oshan
path just to add the 'has_gravity' flag to them. By manually setting the gravity in the map file,
we can maintain the existing area definitions while still ensuring proper gravity.

Example:
/area/service/bar
	name = "Bar"
	icon_state = "bar"
	has_gravity = TRUE  // Set this to TRUE in the map file / strongDMM editor

==================================================================================================
*/

/area/oshan/ocean
	name = "Ocean"
	icon_state = "bluenew"
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CULT_PERMITTED
	requires_power = TRUE
	outdoors = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	ambientsounds = MINING

/area/commons/lounge/upper
	name = "Upper Crew Lounge"

/area/commons/lounge/gooncave
	name = "Nerd Dungeon"

/area/service/bar/baroffice
	name = "Bar Office"

/area/commons/vacant_room/info
	name = "Information Office"

/area/commons/radio_lab
	name = "Radio Lab"
	icon_state = "escape_lounge"

/area/commons/radio_lab/toilet
	name = "Radio Lab Bathroom"
	icon_state = "escape_lounge"

/area/service/hydroponics/ranch
	name = "Ranch"

/area/oshan_hangars/engineering
	name = "Engineering Dock"
	icon_state = "yellow"

/area/oshan_hangars/main
	name = "Pod Bay"
	icon_state = "yellow"

/area/oshan_hangars/service
	name = "Catering Hangar"
	icon_state = "yellow"

/area/oshan_hangars/sci
	name = "Research Dock"
	icon_state = "yellow"

/area/oshan_hangars/elevator
	name = "Sea Elevator"
	icon_state = "yellow"

/area/oshan_hangars/sec
	name = "Secure Dock"
	icon_state = "yellow"

/area/security/interrogation
	name = "Interrogation Room"

/area/security/checkpoint/foyer
	name = "Security Foyer Checkpoint"

/area/security/beepsky
	name = "Beepsky's House"

/area/commons/lounge/sauna
	name = "Sauna"

/area/science/data
	name = "Data Center"

/area/science/outpost
	name = "Science Outpost"

/area/oshan_hangars/sci/outpost
	name = "Science Outpost Hangar"
	icon_state = "yellow"
