/mob/living/simple_animal/hostile/boss/clockcultistboss
	name = "Clockwork Mechanic"
	desc = "This one seems to be wielding some kind of clock and a brass wrench, what a chad."
	icon = 'modular_splurt/icons/mobs/vharmob.dmi'
	icon_state = "clockboss"
	icon_living = "clockboss"
	icon_dead = "idle"
	boss_abilities = list(/datum/action/boss/clockie_summon_minions)
	point_regen_amount = 3
	gender = NEUTER
	speak_chance = 0
	turns_per_move = 2
	maxHealth = 700
	health = 700
	see_in_dark = 7
	response_help_continuous  = "pets"
	response_disarm_continuous = "pushes aside"
	response_harm_continuous   = "bonks"
	melee_damage_lower = 2
	melee_damage_upper = 5
	armour_penetration = 5
	attack_verb_continuous = "bonks"
	attack_sound = 'modular_splurt/sound/misc/bonk.ogg'
	faction = list("ratvar")
	ranged = 0
	retreat_distance = 3
	minimum_distance = 7
	harm_intent_damage = 5
	obj_damage = 60
	a_intent = INTENT_HARM
	death_sound = 'sound/voice/ed209_20sec.ogg'
	deathmessage = "lets out scream and explodes in a pile of gibs..."
	move_to_delay = 4
	loot = list(/obj/effect/gibspawner/human)

/datum/action/boss/clockie_summon_minions
	name = "Summon Minions"
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "art_summon"
	usage_probability = 90
	boss_cost = 20
	boss_type = /mob/living/simple_animal/hostile/boss/clockcultistboss
	needs_target = FALSE
	req_statuses = list(AI_ON)
	say_when_triggered = "FOR RAT'VAR!"
	var/list/summoned_minions = list()
	var/maximum_tanks = 4
	var/tanks_to_summon = 2

/datum/action/boss/clockie_summon_minions/Trigger()
	. =..()
	if(!.)
		return
	var/to_summon = tanks_to_summon
	var/current_len = length(summoned_minions)
	if(current_len > maximum_tanks - tanks_to_summon)
		for(var/a in (maximum_tanks - tanks_to_summon) to current_len)
			var/mob/living/simple_animal/hostile/clocktank/weak/S = popleft(summoned_minions)
			if(!S.client)
				qdel(S)
			else
				S.forceMove(boss.drop_location())
				S.revive(TRUE)
				summoned_minions += S
				to_summon--

	var/static/list/minions = list(
	/mob/living/simple_animal/hostile/clocktank/weak)

	var/list/directions = GLOB.cardinals.Copy()
	for(var/i in 1 to to_summon)
		var/minions_chosen = pick(minions)
		var/mob/living/simple_animal/hostile/clocktank/weak/S = new minions_chosen (get_step(boss,pick_n_take(directions)), 1)
		S.faction = boss.faction
		RegisterSignal(S, COMSIG_PARENT_QDELETING, .proc/remove_from_list)
		summoned_minions += S

/datum/action/boss/clockie_summon_minions/proc/remove_from_list(datum/source, forced)
	summoned_minions -= source

