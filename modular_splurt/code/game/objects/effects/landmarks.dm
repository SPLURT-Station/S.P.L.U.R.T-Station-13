/obj/effect/landmark/start/slaver
	name = "slaver"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "sslaver_spawn"

/obj/effect/landmark/start/slaver/Initialize()
	..()
	GLOB.slaver_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/slaver_leader
	name = "slaver leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "sslaver_leader_spawn"

/obj/effect/landmark/start/slaver_leader/Initialize()
	..()
	GLOB.slaver_leader_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/psychologist
	name = "Psychologist"
	icon = 'modular_splurt/icons/mob/landmarks.dmi'
	icon_state = "Psychologist"

/obj/effect/landmark/start/stowaway
	name = "Stowaway"
	icon = 'modular_splurt/icons/mob/landmarks.dmi'
	icon_state = "Stowaway"
	jobspawn_override = TRUE //spawn in maint
	delete_after_roundstart = FALSE

//Landmark that creates destinations for the navigate verb to path to
/obj/effect/landmark/navigate_destination
	name = "navigate verb destination"
	icon = 'modular_splurt/icons/effects/landmarks_static.dmi'
	icon_state = "navigate"
	var/location

/obj/effect/landmark/navigate_destination/Initialize(mapload)
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/landmark/navigate_destination/LateInitialize()
	. = ..()
	if(!location)
		var/obj/machinery/door/airlock/A = locate(/obj/machinery/door/airlock) in loc
		location = A ? format_text(A.name) : get_area_name(src, format_text = TRUE)

	GLOB.navigate_destinations[loc] = location

	qdel(src)

//Command
/obj/effect/landmark/navigate_destination/bridge
	location = "Bridge"

/obj/effect/landmark/navigate_destination/hop
	location = "Head of Personnel's Office"

/obj/effect/landmark/navigate_destination/vault
	location = "Vault"

/obj/effect/landmark/navigate_destination/teleporter
	location = "Teleporter"

/obj/effect/landmark/navigate_destination/gateway
	location = "Gateway"

/obj/effect/landmark/navigate_destination/eva
	location = "EVA Storage"

/obj/effect/landmark/navigate_destination/aiupload
	location = "AI Upload"

/obj/effect/landmark/navigate_destination/minisat_access_ai
	location = "AI MiniSat Access"

/obj/effect/landmark/navigate_destination/minisat_access_tcomms
	location = "Telecomms MiniSat Access"

/obj/effect/landmark/navigate_destination/minisat_access_tcomms_ai
	location = "AI and Telecomms MiniSat Access"

/obj/effect/landmark/navigate_destination/tcomms
	location = "Telecommunications"

//Departments
/obj/effect/landmark/navigate_destination/sec
	location = "Security"

/obj/effect/landmark/navigate_destination/det
	location = "Detective's Office"

/obj/effect/landmark/navigate_destination/research
	location = "Research"

/obj/effect/landmark/navigate_destination/engineering
	location = "Engineering"

/obj/effect/landmark/navigate_destination/techstorage
	location = "Technical Storage"

/obj/effect/landmark/navigate_destination/atmos
	location = "Atmospherics"

/obj/effect/landmark/navigate_destination/med
	location = "Medical"

/obj/effect/landmark/navigate_destination/chemfactory
	location = "Chemistry Factory"

/obj/effect/landmark/navigate_destination/cargo
	location = "Cargo"

//Common areas
/obj/effect/landmark/navigate_destination/bar
	location = "Bar"

/obj/effect/landmark/navigate_destination/dorms
	location = "Dormitories"

/obj/effect/landmark/navigate_destination/court
	location = "Courtroom"

/obj/effect/landmark/navigate_destination/tools
	location = "Tool Storage"

/obj/effect/landmark/navigate_destination/library
	location = "Library"

/obj/effect/landmark/navigate_destination/chapel
	location = "Chapel"

/obj/effect/landmark/navigate_destination/minisat_access_chapel_library
	location = "Chapel and Library MiniSat Access"

//Service
/obj/effect/landmark/navigate_destination/kitchen
	location = "Kitchen"

/obj/effect/landmark/navigate_destination/hydro
	location = "Hydroponics"

/obj/effect/landmark/navigate_destination/janitor
	location = "Janitor's Closet"

/obj/effect/landmark/navigate_destination/lawyer
	location = "Lawyer's Office"

//Shuttle docks
/obj/effect/landmark/navigate_destination/dockarrival
	location = "Arrival Shuttle Dock"

/obj/effect/landmark/navigate_destination/dockesc
	location = "Escape Shuttle Dock"

/obj/effect/landmark/navigate_destination/dockescpod
	location = "Escape Pod Dock"

/obj/effect/landmark/navigate_destination/dockescpod1
	location = "Escape Pod 1 Dock"

/obj/effect/landmark/navigate_destination/dockescpod2
	location = "Escape Pod 2 Dock"

/obj/effect/landmark/navigate_destination/dockescpod3
	location = "Escape Pod 3 Dock"

/obj/effect/landmark/navigate_destination/dockescpod4
	location = "Escape Pod 4 Dock"

/obj/effect/landmark/navigate_destination/dockaux
	location = "Auxiliary Dock"

//Maint
/obj/effect/landmark/navigate_destination/incinerator
	location = "Incinerator"

/obj/effect/landmark/navigate_destination/disposals
	location = "Disposals"

/obj/effect/landmark/navigate_destination/blueshield
	location = "Blueshield's office"

/obj/effect/landmark/navigate_destination/psychologist
	location = "Psychologist's office"
