GLOBAL_LIST_EMPTY(chosen_station_templates)

/obj/effect/landmark
	name = "landmark"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	anchored = TRUE
	layer = MID_LANDMARK_LAYER
	invisibility = INVISIBILITY_ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/effect/landmark/singularity_act()
	return

// Please stop bombing the Observer-Start landmark.
/obj/effect/landmark/ex_act(severity, target, origin)
	return

/obj/effect/landmark/singularity_pull()
	return

INITIALIZE_IMMEDIATE(/obj/effect/landmark)

/obj/effect/landmark/Initialize(mapload)
	. = ..()
	GLOB.landmarks_list += src

/obj/effect/landmark/Destroy()
	GLOB.landmarks_list -= src
	return ..()

/obj/effect/landmark/start
	name = "start"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = MOB_LAYER
	var/jobspawn_override = FALSE
	var/delete_after_roundstart = TRUE
	var/used = FALSE
	var/job_spawnpoint = TRUE //Is it a potential job spawnpoint or should we skip it?

/obj/effect/landmark/start/proc/after_round_start()
	if(delete_after_roundstart)
		qdel(src)

/obj/effect/landmark/start/Initialize(mapload)
	. = ..()
	GLOB.start_landmarks_list += src
	if(jobspawn_override)
		if(!GLOB.jobspawn_overrides[name])
			GLOB.jobspawn_overrides[name] = list()
		GLOB.jobspawn_overrides[name] += src
	if(name != "start")
		tag = "start*[name]"

/obj/effect/landmark/start/Destroy()
	GLOB.start_landmarks_list -= src
	if(jobspawn_override)
		GLOB.jobspawn_overrides[name] -= src
	return ..()

// START LANDMARKS FOLLOW. Don't change the names unless
// you are refactoring shitty landmark code.
/obj/effect/landmark/start/assistant
	name = "Assistant"
	icon_state = "Assistant"

/obj/effect/landmark/start/prisoner
	name = "Prisoner"
	icon_state = "Prisoner"

/obj/effect/landmark/start/assistant/override
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/janitor
	name = "Janitor"
	icon_state = "Janitor"

/obj/effect/landmark/start/cargo_technician
	name = "Cargo Technician"
	icon_state = "Cargo Technician"

/obj/effect/landmark/start/bartender
	name = "Bartender"
	icon_state = "Bartender"

/obj/effect/landmark/start/clown
	name = "Clown"
	icon_state = "Clown"

/obj/effect/landmark/start/mime
	name = "Mime"
	icon_state = "Mime"

/obj/effect/landmark/start/quartermaster
	name = "Quartermaster"
	icon_state = "Quartermaster"

/obj/effect/landmark/start/atmospheric_technician
	name = "Atmospheric Technician"
	icon_state = "Atmospheric Technician"

/obj/effect/landmark/start/cook
	name = "Cook"
	icon_state = "Cook"

/obj/effect/landmark/start/shaft_miner
	name = "Shaft Miner"
	icon_state = "Shaft Miner"

/obj/effect/landmark/start/security_officer
	name = "Security Officer"
	icon_state = "Security Officer"

/obj/effect/landmark/start/botanist
	name = "Botanist"
	icon_state = "Botanist"

/obj/effect/landmark/start/head_of_security
	name = "Head of Security"
	icon_state = "Head of Security"

/obj/effect/landmark/start/captain
	name = "Captain"
	icon_state = "Captain"

/obj/effect/landmark/start/detective
	name = "Detective"
	icon_state = "Detective"

/obj/effect/landmark/start/warden
	name = "Warden"
	icon_state = "Warden"

/obj/effect/landmark/start/chief_engineer
	name = "Chief Engineer"
	icon_state = "Chief Engineer"

/obj/effect/landmark/start/head_of_personnel
	name = "Head of Personnel"
	icon_state = "Head of Personnel"

/obj/effect/landmark/start/librarian
	name = "Curator"
	icon_state = "Curator"

/obj/effect/landmark/start/lawyer
	name = "Lawyer"
	icon_state = "Lawyer"

/obj/effect/landmark/start/station_engineer
	name = "Station Engineer"
	icon_state = "Station Engineer"

/obj/effect/landmark/start/medical_doctor
	name = "Medical Doctor"
	icon_state = "Medical Doctor"

/obj/effect/landmark/start/paramedic
	name = "Paramedic"
	icon_state = "Paramedic"

/obj/effect/landmark/start/scientist
	name = "Scientist"
	icon_state = "Scientist"

/obj/effect/landmark/start/chemist
	name = "Chemist"
	icon_state = "Chemist"

/obj/effect/landmark/start/roboticist
	name = "Roboticist"
	icon_state = "Roboticist"

/obj/effect/landmark/start/research_director
	name = "Research Director"
	icon_state = "Research Director"

/obj/effect/landmark/start/geneticist
	name = "Geneticist"
	icon_state = "Geneticist"

/obj/effect/landmark/start/chief_medical_officer
	name = "Chief Medical Officer"
	icon_state = "Chief Medical Officer"

/obj/effect/landmark/start/virologist
	name = "Virologist"
	icon_state = "Virologist"

/obj/effect/landmark/start/chaplain
	name = "Chaplain"
	icon_state = "Chaplain"

/obj/effect/landmark/start/cyborg
	name = "Cyborg"
	icon_state = "Cyborg"

/obj/effect/landmark/start/ai
	name = "AI"
	icon_state = "AI"
	delete_after_roundstart = FALSE
	var/primary_ai = TRUE
	var/latejoin_active = TRUE

/obj/effect/landmark/start/ai/after_round_start()
	if(latejoin_active && !used)
		new /obj/structure/ai_core/latejoin_inactive(loc)
	return ..()

/obj/effect/landmark/start/ai/secondary
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "ai_spawn"
	primary_ai = FALSE
	latejoin_active = FALSE

//Department Security spawns

/obj/effect/landmark/start/depsec
	name = "department_sec"
	icon_state = "Security Officer"

/obj/effect/landmark/start/depsec/New()
	..()
	GLOB.department_security_spawns += src

/obj/effect/landmark/start/depsec/Destroy()
	GLOB.department_security_spawns -= src
	return ..()

/obj/effect/landmark/start/depsec/supply
	name = "supply_sec"

/obj/effect/landmark/start/depsec/medical
	name = "medical_sec"

/obj/effect/landmark/start/depsec/engineering
	name = "engineering_sec"

/obj/effect/landmark/start/depsec/science
	name = "science_sec"

/obj/effect/landmark/start/wizard
	name = "wizard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "wiznerd_spawn"

/obj/effect/landmark/start/wizard/Initialize(mapload)
	..()
	GLOB.wizardstart += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nukeop
	name = "nukeop"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/nukeop/Initialize(mapload)
	..()
	GLOB.nukeop_start += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nukeop_leader
	name = "nukeop leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/nukeop_leader/Initialize(mapload)
	..()
	GLOB.nukeop_leader_start += get_turf(src)
	return INITIALIZE_HINT_QDEL

// Must be immediate because players will
// join before SSatom initializes everything.
INITIALIZE_IMMEDIATE(/obj/effect/landmark/start/new_player)

/obj/effect/landmark/start/new_player
	name = "New Player"

/obj/effect/landmark/start/new_player/Initialize(mapload)
	..()
	GLOB.newplayer_start += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nuclear_equipment
	name = "bomb or clown beacon spawner"
	var/nukie_path = /obj/item/sbeacondrop/bomb
	var/clown_path = /obj/item/sbeacondrop/clownbomb
	job_spawnpoint = FALSE

/obj/effect/landmark/start/nuclear_equipment/after_round_start()
	var/npath = nukie_path
	if(istype(SSticker.mode, /datum/game_mode/nuclear/clown_ops))
		npath = clown_path
	else if(istype(SSticker.mode, /datum/game_mode/dynamic))
		var/datum/game_mode/dynamic/D = SSticker.mode
		if(locate(/datum/dynamic_ruleset/roundstart/nuclear/clown_ops) in D.current_rules)
			npath = clown_path
	new npath(loc)
	return ..()

/obj/effect/landmark/start/nuclear_equipment/minibomb
	name = "minibomb or bombanana spawner"
	nukie_path = /obj/item/storage/box/minibombs
	clown_path = /obj/item/storage/box/bombananas

/obj/effect/landmark/latejoin
	name = "JoinLate"

/obj/effect/landmark/latejoin/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += get_turf(src)
	return INITIALIZE_HINT_QDEL

// carp.
/obj/effect/landmark/carpspawn
	name = "carpspawn"
	icon_state = "carp_spawn"

// lone op (optional)
/obj/effect/landmark/loneopspawn
	name = "loneop+ninjaspawn"
	icon_state = "snukeop_spawn"

// observer-start.
/obj/effect/landmark/observer_start
	name = "Observer-Start"
	icon_state = "observer_start"

// xenos.
/obj/effect/landmark/xeno_spawn
	name = "xeno_spawn"
	icon_state = "xeno_spawn"

/obj/effect/landmark/xeno_spawn/Initialize(mapload)
	..()
	GLOB.xeno_spawn += get_turf(src)
	return INITIALIZE_HINT_QDEL

// blobs.
/obj/effect/landmark/blobstart
	name = "blobstart"
	icon_state = "blob_start"

/obj/effect/landmark/blobstart/Initialize(mapload)
	..()
	GLOB.blobstart += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/secequipment
	name = "secequipment"
	icon_state = "secequipment"

/obj/effect/landmark/secequipment/Initialize(mapload)
	..()
	GLOB.secequipment += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/prisonwarp
	name = "prisonwarp"
	icon_state = "prisonwarp"

/obj/effect/landmark/prisonwarp/Initialize(mapload)
	..()
	GLOB.prisonwarp += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/ert_spawn
	name = "Emergencyresponseteam"
	icon_state = "ert_spawn"

/obj/effect/landmark/ert_spawn/Initialize(mapload)
	..()
	GLOB.emergencyresponseteamspawn += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/holding_facility
	name = "Holding Facility"
	icon_state = "holding_facility"

/obj/effect/landmark/holding_facility/Initialize(mapload)
	..()
	GLOB.holdingfacility += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/observe
	name = "tdomeobserve"
	icon_state = "tdome_observer"

/obj/effect/landmark/thunderdome/observe/Initialize(mapload)
	..()
	GLOB.tdomeobserve += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/one
	name = "tdome1"
	icon_state = "tdome_t1"

/obj/effect/landmark/thunderdome/one/Initialize(mapload)
	..()
	GLOB.tdome1	+= get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/two
	name = "tdome2"
	icon_state = "tdome_t2"

/obj/effect/landmark/thunderdome/two/Initialize(mapload)
	..()
	GLOB.tdome2 += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/admin
	name = "tdomeadmin"
	icon_state = "tdome_admin"

/obj/effect/landmark/thunderdome/admin/Initialize(mapload)
	..()
	GLOB.tdomeadmin += get_turf(src)
	return INITIALIZE_HINT_QDEL

//Servant spawn locations
/obj/effect/landmark/servant_of_ratvar
	name = "servant of ratvar spawn"
	icon_state = "clockwork_orange"
	layer = MOB_LAYER

/obj/effect/landmark/servant_of_ratvar/Initialize(mapload)
	..()
	GLOB.servant_spawns += get_turf(src)
	return INITIALIZE_HINT_QDEL

//City of Cogs entrances
/obj/effect/landmark/city_of_cogs
	name = "city of cogs entrance"
	icon_state = "city_of_cogs"

/obj/effect/landmark/city_of_cogs/Initialize(mapload)
	..()
	GLOB.city_of_cogs_spawns += get_turf(src)
	return INITIALIZE_HINT_QDEL

//generic event spawns
/obj/effect/landmark/event_spawn
	name = "generic event spawn"
	icon_state = "generic_event"
	layer = HIGH_LANDMARK_LAYER


/obj/effect/landmark/event_spawn/New()
	..()
	GLOB.generic_event_spawns += src

/obj/effect/landmark/event_spawn/Destroy()
	GLOB.generic_event_spawns -= src
	return ..()

/obj/effect/landmark/ruin
	var/datum/map_template/ruin/ruin_template

/obj/effect/landmark/ruin/New(loc, my_ruin_template)
	name = "ruin_[GLOB.ruin_landmarks.len + 1]"
	..(loc)
	ruin_template = my_ruin_template
	GLOB.ruin_landmarks |= src

/obj/effect/landmark/ruin/Destroy()
	GLOB.ruin_landmarks -= src
	ruin_template = null
	. = ..()

//------Station Rooms Landmarks------------//
/obj/effect/landmark/stationroom
	var/list/template_names = list()
	/// Whether or not we can choose templates that have already been chosen
	var/unique = FALSE
	layer = BULLET_HOLE_LAYER
	plane = ABOVE_WALL_PLANE

/obj/effect/landmark/stationroom/New()
	..()
	GLOB.stationroom_landmarks += src

/obj/effect/landmark/stationroom/Destroy()
	if(src in GLOB.stationroom_landmarks)
		GLOB.stationroom_landmarks -= src
	return ..()

/obj/effect/landmark/stationroom/proc/load(template_name)
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	if(!template_name)
		for(var/t in template_names)
			if(!SSmapping.station_room_templates[t])
				stack_trace("Station room spawner placed at ([T.x], [T.y], [T.z]) has invalid ruin name of \"[t]\" in its list")
				template_names -= t
		template_name = choose()
	if(!template_name)
		GLOB.stationroom_landmarks -= src
		qdel(src)
		return FALSE
	GLOB.chosen_station_templates += template_name
	var/datum/map_template/template = SSmapping.station_room_templates[template_name]
	if(!template)
		return FALSE
	testing("Ruin \"[template_name]\" placed at ([T.x], [T.y], [T.z])")
	template.load(T, centered = FALSE)
	template.loaded++
	GLOB.stationroom_landmarks -= src
	qdel(src)
	return TRUE

// Proc to allow you to add conditions for choosing templates, instead of just randomly picking from the template list.
// Examples where this would be useful, would be choosing certain templates depending on conditions such as holidays,
// Or co-dependent templates, such as having a template for the core and one for the satelite, and swapping AI and comms.git
/obj/effect/landmark/stationroom/proc/choose()
	if(unique)
		var/list/current_templates = template_names
		for(var/i in GLOB.chosen_station_templates)
			template_names -= i
		if(!template_names.len)
			stack_trace("Station room spawner (type: [type]) has run out of ruins, unique will be ignored")
			template_names = current_templates
	return pickweight(template_names)

// The landmark for the Engine on Box

/obj/effect/landmark/stationroom/box/engine
	template_names = list("Engine SM" = 3, "Engine Singulo" = 3, "Engine Tesla" = 3)
	icon = 'icons/rooms/box/engine.dmi'

/obj/effect/landmark/stationroom/box/engine/New()
	. = ..()
	template_names = CONFIG_GET(keyed_list/box_random_engine)

// Landmark for the mining station
/obj/effect/landmark/stationroom/lavaland/station
	template_names = list("Public Mining Base" = 3)
	icon = 'icons/rooms/Lavaland/Mining.dmi'

// handled in portals.dm, id connected to one-way portal
/obj/effect/landmark/portal_exit
	name = "portal exit"
	icon_state = "portal_exit"
	var/id

/obj/effect/landmark/start/hangover
	name = "hangover spawn"
	icon_state = "hangover_spawn"

	/// A list of everything this hangover spawn created
	var/list/debris = list()

/obj/effect/landmark/start/hangover/Initialize(mapload)
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/landmark/start/hangover/Destroy()
	debris = null
	return ..()

/obj/effect/landmark/start/hangover/LateInitialize()
	. = ..()
	if(!HAS_TRAIT(SSstation, STATION_TRAIT_HANGOVER))
		return
	if(prob(60))
		debris += new /obj/effect/decal/cleanable/vomit(get_turf(src))
	if(prob(70))
		var/bottle_count = rand(1, 3)
		for(var/index in 1 to bottle_count)
			var/turf/turf_to_spawn_on = get_step(src, pick(GLOB.alldirs))
			if(!isopenturf(turf_to_spawn_on))
				continue
			var/dense_object = FALSE
			for(var/atom/content in turf_to_spawn_on.contents)
				if(content.density)
					dense_object = TRUE
					break
			if(dense_object)
				continue
			debris += new /obj/item/reagent_containers/food/drinks/beer/almost_empty(turf_to_spawn_on)

///Spawns the mob with some drugginess/drunkeness, and some disgust.
/obj/effect/landmark/start/hangover/proc/make_hungover(mob/hangover_mob)
	if(!iscarbon(hangover_mob))
		return
	var/mob/living/carbon/spawned_carbon = hangover_mob
	spawned_carbon.set_resting(TRUE, silent = TRUE)
	if(prob(50))
		spawned_carbon.adjust_drugginess(rand(15, 20))
	else
		spawned_carbon.drunkenness += rand(15, 25)
	spawned_carbon.adjust_disgust(rand(5, 55)) //How hungover are you?
	if(spawned_carbon.head)
		return

/obj/effect/landmark/start/hangover/JoinPlayerHere(mob/joining_mob, buckle)
	. = ..()
	make_hungover(joining_mob)

/obj/effect/landmark/start/hangover/closet
	name = "hangover spawn closet"
	icon_state = "hangover_spawn_closet"

/obj/effect/landmark/start/hangover/closet/JoinPlayerHere(mob/joining_mob, buckle)
	make_hungover(joining_mob)
	for(var/obj/structure/closet/closet in contents)
		if(closet.opened)
			continue
		joining_mob.forceMove(closet)
		return
	return ..() //Call parent as fallback

/obj/effect/landmark/stationroom/maint/
	unique = TRUE

/obj/effect/landmark/stationroom/maint/threexthree
	template_names = list("Maint 2storage", "Maint 9storage", "Maint airstation", "Maint biohazard", "Maint boxbedroom", "Maint boxchemcloset", "Maint boxclutter2", "Maint boxclutter3", "Maint boxclutter4", "Maint boxclutter5", "Maint boxclutter6", "Maint boxclutter8",
	"Maint boxwindow", "Maint bubblegumaltar", "Maint deltajanniecloset", "Maint deltaorgantrade", "Maint donutcapgun", "Maint dronehole", "Maint gibs", "Maint hazmat", "Maint hobohut", "Maint hullbreach", "Maint kilolustymaid", "Maint kilomechcharger", "Maint kilotheatre",
	"Maint medicloset", "Maint memorial", "Maint metaclutter2", "Maint metaclutter4", "Maint metagamergear", "Maint owloffice", "Maint plasma", "Maint pubbyartism", "Maint pubbyclutter1", "Maint pubbyclutter2", "Maint pubbyclutter3", "Maint radspill", "Maint shrine", "Maint singularity",
	"Maint tanning", "Maint tranquility", "Maint wash", "Maint command", "Maint dummy", "Maint spaceart", "Maint containmentcell", "Maint naughtyroom", "Maint vendoraccident", "Maint donut", "Maint lair" = 0.25, "Maint lair2" = 0.25, "Maint lair3" = 0.25, "Maint lair4" = 0.25)

/obj/effect/landmark/stationroom/maint/threexfive
	template_names = list("Maint airlockstorage", "Maint boxclutter7", "Maint boxkitchen", "Maint boxmaintfreezers", "Maint canisterroom", "Maint checkpoint", "Maint hank", "Maint junkcloset", "Maint kilomobden", "Maint laststand", "Maint monky", "Maint onioncult", "Maint pubbyclutter5",
	"Maint pubbyclutter6", "Maint pubbyrobotics", "Maint ripleywreck", "Maint churchroach", "Maint mirror", "Maint chromosomes", "Maint clutter", "Maint dissection", "Maint emergencyoxy", "Maint oreboxes", "Maint gaxbotany")

/obj/effect/landmark/stationroom/maint/fivexthree
	template_names = list("Maint boxclutter1", "Maint breach", "Maint cloner", "Maint deltaclutter2", "Maint deltaclutter3", "Maint incompletefloor", "Maint kiloclutter1", "Maint metaclutter1", "Maint metaclutter3", "Maint minibreakroom", "Maint nastytrap", "Maint pills", "Maint pubbybedroom",
	"Maint pubbyclutter4", "Maint pubbyclutter7", "Maint pubbykitchen", "Maint storeroom", "Maint yogsmaintdet", "Maint yogsmaintrpg", "Maint waitingroom", "Maint podmin", "Maint highqualitysurgery", "Maint chestburst", "Maint gloveroom", "Maint magicroom", "Maint spareparts", "Maint smallfish")

/obj/effect/landmark/stationroom/maint/fivexfour
	template_names = list("Maint blasted", "Maint boxbar", "Maint boxdinner", "Maint boxsurgery", "Maint comproom", "Maint deltabar", "Maint deltadetective", "Maint deltadressing", "Maint deltaEVA", "Maint deltagamble", "Maint deltalounge", "Maint deltasurgery", "Maint firemanroom", "Maint icicle",
	"Maint kilohauntedlibrary", "Maint kilosurgery", "Maint medusa", "Maint metakitchen", "Maint metamedical", "Maint metarobotics", "Maint metatheatre", "Maint pubbysurgery", "Maint tinybarbershop", "Maint laundromat", "Maint pass", "Maint boxclutter", "Maint posterstore", "Maint shoestore", "Maint nanitechamber", "Maint oldcryoroom")

/obj/effect/landmark/stationroom/maint/tenxfive
	template_names = list("Maint barbershop", "Maint deltaarcade", "Maint deltabotnis", "Maint deltacafeteria", "Maint deltaclutter1", "Maint deltarobotics", "Maint factory", "Maint maintmedical", "Maint meetingroom", "Maint phage", "Maint skidrow", "Maint transit", "Maint ballpit", "Maint commie", "Maint firingrange", "Maint clothingstore",
	"Maint butchersden", "Maint courtroom", "Maint gaschamber", "Maint oldaichamber", "Maint radiationtherapy", "Maint ratburger", "Maint tank_heaven", "Maint bamboo", "Maint medicalmaint")

/obj/effect/landmark/stationroom/maint/tenxten
	template_names = list("Maint aquarium", "Maint bigconstruction", "Maint bigtheatre", "Maint deltalibrary", "Maint graffitiroom", "Maint junction", "Maint podrepairbay", "Maint pubbybar", "Maint roosterdome", "Maint sanitarium", "Maint snakefighter", "Maint vault", "Maint ward", "Maint assaultpod", "Maint maze", "Maint maze2", "Maint boxfactory",
	"Maint sixsectorsdown", "Maint advbotany", "Maint beach", "Maint botany_apiary", "Maint gamercave", "Maint ladytesla_altar", "Maint olddiner", "Maint smallmagician", "Maint fourshops", "Maint fishinghole", "Maint fakewalls", "Maint wizard", "Maint halloween")

/obj/effect/landmark/stationroom/maint/smexi1
	template_names = list("Icemaint Center Boring", "Icemaint Center Danger", "Icemaint Center Frosty")

/obj/effect/landmark/stationroom/maint/smexi2
	template_names = list("Icemaint West Boring")

/obj/effect/landmark/stationroom/maint/smexi3
	template_names = list("Icemaint East Boring", "Icemaint East Danger", "Icemaint East Knotways", "Icemaint East Icering", "Icemaint East Maze")
