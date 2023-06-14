/mob/living/simple_animal/hostile/cultleader
	name = "Cult Leader"
	desc = "The leader of all of them, he has a perturbed look on their face."
	icon = 'modular_splurt/icons/mobs/vharmob.dmi'
	icon_state = "cultistangery"
	icon_living = "cultistangery"
	icon_dead = "idle"
	gender = NEUTER
	speak_chance = 0
	turns_per_move = 2
	turns_per_move = 3
	maxHealth = 700
	health = 700
	see_in_dark = 7
	ranged = 1
	response_help_continuous  = "pets"
	response_disarm_continuous = "pushes aside"
	response_harm_continuous   = "attacks"
	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_verb_continuous = "attacks"
	attack_sound = 'sound/weapons/blade1.ogg'
	faction = list("cult")
	harm_intent_damage = 10
	obj_damage = 60
	a_intent = INTENT_HARM
	death_sound = 'sound/voice/ed209_20sec.ogg'
	deathmessage = "lets out scream and its tentacles shrivel away..."
	move_to_delay = 3
	armour_penetration = 15
	loot = list(/obj/effect/gibspawner/human)

	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 150
	maxbodytemp = 500

/mob/living/simple_animal/hostile/cultleader/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/footstep, FOOTSTEP_MOB_CLAW)
	AddElement(/datum/element/ventcrawling, given_tier = VENTCRAWLER_NONE)

/mob/living/simple_animal/hostile/cultleader/OpenFire(atom/the_target)
	var/dist = get_dist(src, the_target)
	Beam(the_target, "tentacle", time=dist*2, maxdistance=dist, beam_sleep_time = 10)
	the_target.attack_animal(src)
