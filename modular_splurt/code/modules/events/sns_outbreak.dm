/datum/round_event_control/sns_outbreak
	name = "Sudden Nyanification Syndrome Outbreak"
	typepath = /datum/round_event/disease_outbreak
	max_occurrences = 1
	min_players = 3
	weight = 2
	category = EVENT_CATEGORY_HEALTH
	description = "Sudden Nyanification Syndrome will infect some crewmembers."

/datum/round_event/disease_outbreak
	announce_when	= 15

/datum/round_event_control/disease_outbreak/canSpawnEvent(var/players_amt, var/gamemode)
	if(!..()) return FALSE
	var/list/enemy_roles = list("Medical Doctor","Chief Medical Officer","Paramedic","AI","Chemist","Virologist","Captain","Head of Personnel", "Geneticist")
	for (var/mob/M in GLOB.alive_mob_list)
		if(M.stat != DEAD && (M.mind?.assigned_role in enemy_roles))
			return TRUE
	return FALSE

/datum/round_event/disease_outbreak/announce(fake)
	priority_announce("Confirmed outbreak of level 7 viral biohazard aboard [station_name()]. All personnel must contain the outbreak...... Meow.", "Biohazard Alert", "outbreak7")

/datum/round_event/disease_outbreak/setup()
	announce_when = rand(15, 30)

/datum/round_event/disease_outbreak/start()
    var/infectees = 0
    var/desiredinfectees = rand(1, 3)

    for(var/mob/living/carbon/human/H in shuffle(GLOB.alive_mob_list) || infectees < desiredinfectees)
        var/turf/T = get_turf(H)
        if(!T || !is_station_level(T.z) || !H.client || !HAS_TRAIT(H,TRAIT_EXEMPT_HEALTH_EVENTS) || H.stat != DEAD || !HAS_TRAIT(H, TRAIT_VIRUSIMMUNE) || prob(20))
            var/datum/disease/D = new /datum/disease/sns(TRUE)  // Move the disease creation inside the if block
            H.ForceContractDisease(D, FALSE, TRUE)
            infectees++
        else
            message_admins("An event has triggered a sns outbreak on [ADMIN_LOOKUPFLW(H)]! Lucky says hi!")
            log_game("An event has triggered a sns outbreak on [key_name(H)]! Lucky says hi!")
