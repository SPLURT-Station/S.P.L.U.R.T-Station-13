//mob based off the game Carrion.
//replica sprite made by quotefox

/mob/living/simple_animal/hostile/carrion
	name = "mass of red tentacles"
	desc = "A creature composed of tentacles and teeth, you aren't sure where it starts and where it ends."
	icon = 'modular_splurt/icons/mobs/carrion.dmi'
	icon_state = "c_idle"
	icon_living = "c_idle"
	icon_dead = "idle"
	gender = NEUTER
	speak_chance = 0
	turns_per_move = 2
	turns_per_move = 3
	maxHealth = 300
	health = 300
	see_in_dark = 7
	response_help_continuous  = "pets"
	response_disarm_continuous = "pushes aside"
	response_harm_continuous   = "attacks"
	melee_damage_lower = 12
	melee_damage_upper = 20
	attack_verb_continuous = "attacks"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = list("hostile")
	ranged = 1
	harm_intent_damage = 5
	obj_damage = 60
	a_intent = INTENT_HARM
	death_sound = 'sound/voice/ed209_20sec.ogg'
	deathmessage = "lets out scream and its tentacles shrivel away..."
	move_to_delay = 4
	loot = list(/obj/effect/gibspawner/human)

	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 150
	maxbodytemp = 500

/mob/living/simple_animal/hostile/carrion/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/footstep, FOOTSTEP_MOB_CLAW)
	AddElement(/datum/element/ventcrawling, given_tier = VENTCRAWLER_ALWAYS)

/mob/living/simple_animal/hostile/carrion/OpenFire(atom/the_target)
	var/dist = get_dist(src, the_target)
	Beam(the_target, "tentacle", time=dist*2, maxdistance=dist, beam_sleep_time = 5)
	the_target.attack_animal(src)

/mob/living/simple_animal/hostile/carrion/Initialize()
//Move the sprite into position, cant use Pixel_X and Y, causes issues with the tenticle sprite!
	. = ..()
	var/matrix/M = transform
	transform = M.Translate(-32,-32)
