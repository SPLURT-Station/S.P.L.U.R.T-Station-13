/obj/machinery/atmospherics/components/trinary/nuclear_reactor/meltdown()
	if(check_sm_delam())
		write_sm_delam()
		return ..()
	shut_down()
	stop_relay(CHANNEL_REACTOR_ALERT)
	playsound(src, 'modular_splurt/sound/misc/connection_terminated.ogg', 75, FALSE)
	sleep(2 SECONDS)
	investigate_log("Reactor meltdown disallowed by config", INVESTIGATE_SINGULO)
	priority_announce("RBMK privileges revoked. Current crew is deemed unsuitable to handle a highly radioactive steam engine. More training is required.", "SIMULATION TERMINATED")
	var/skill_issue_sound = pick('modular_splurt/sound/voice/boowomp.ogg', 'modular_splurt/sound/effects/fart_reverb.ogg')
	sound_to_playing_players(skill_issue_sound)
	var/turf/plush_turf = get_turf(src)
	var/obj/item/toy/plush/random/plushe = new(plush_turf)
	plushe = locate(/obj/item/toy/plush) in plush_turf
	plushe?.name = "Consolation plushie"
	plushe?.desc = "It says \"You tried\" poorly written in its tag."
	plushe?.squeak_override = list(skill_issue_sound = 1)
	plushe?.resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF | FREEZE_PROOF
	qdel(src)

/obj/machinery/atmospherics/components/trinary/nuclear_reactor/blowout()
	if(check_sm_delam())
		write_sm_delam()
		return ..()
	shut_down()
	stop_relay(CHANNEL_REACTOR_ALERT)
	playsound(src, 'modular_splurt/sound/misc/connection_terminated.ogg', 75, FALSE)
	sleep(2 SECONDS)
	investigate_log("Reactor meltdown disallowed by config", INVESTIGATE_SINGULO)
	priority_announce("RBMK privileges revoked. Current crew is deemed unsuitable to handle a highly radioactive steam engine. More training is required.", "SIMULATION TERMINATED")
	var/skill_issue_sound = pick('modular_splurt/sound/voice/boowomp.ogg', 'modular_splurt/sound/effects/fart_reverb.ogg')
	sound_to_playing_players(skill_issue_sound)
	var/turf/plush_turf = get_turf(src)
	var/obj/item/toy/plush/random/plushe = new(plush_turf)
	plushe = locate(/obj/item/toy/plush) in plush_turf
	plushe?.name = "Consolation plushie"
	plushe?.desc = "It says \"You tried\" poorly written in its tag."
	plushe?.squeak_override = list(skill_issue_sound = 1)
	plushe?.resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF | FREEZE_PROOF
	qdel(src)
