/mob/living/simple_animal/hostile/werewolf
	name = "Werewolf"
	desc = "A massive, wolf like creature with powerful muscles, razor-sharp claws, and aggression to match."
	icon = 'modular_splurt/icons/mobs/werewolf.dmi'
	icon_state = "Werewolf_idle"
	icon_living = "Werewolf_idle"
	icon_dead = "Werewolf_dead"
	icon_gib = "syndicate_gib"
	pixel_x = -16
	gender = MALE
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	stat_attack = UNCONSCIOUS
	speak = list("ROAR!","Rawr!","GRRAAGH!","Growl!")
	speak_emote = list("growls", "snarls")
	emote_hear = list("grumbles.","snarls.")
	emote_taunt = list("bares its teeth", "stomps")
	speak_chance = 10
	taunt_chance = 25
	speed = 0
	see_in_dark = 8
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab= 4,
							/obj/item/stack/sheet/animalhide = 2,
							/obj/item/stack/sheet/bone = 4)
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	maxHealth = 500
	health = 500
	obj_damage = 60
	armour_penetration = 30
	melee_damage_lower = 56
	melee_damage_upper = 56
	attack_sound = 'modular_splurt/sound/misc/claw_rend.ogg'
	faction = list("werewolf")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 5
	gold_core_spawnable = HOSTILE_SPAWN
	var/charging = FALSE
	has_penis = TRUE
	has_butt = TRUE

	footstep_type = FOOTSTEP_MOB_HEAVY

	//**werewolf_mode**
	// Hostile: Normal deathclaw murder machine
	// Friendly: Does not attack
	// Rape: Hurts and lewds people
	// Gentle: lewds people
	// Abomination: Hurts and does unspeakable lewd things to people
	var/werewolf_mode = "hostile"

/mob/living/simple_animal/hostile/werewolf/pacifist
	name = "Friendly Werewolf"
	desc = "A massive, wolf like creature with powerful muscles, razor-sharp claws, and aggression to match."
	werewolf_mode = "friendly"
	friendly_verb_continuous = "howls at"
	friendly_verb_simple = "howl at"

/mob/living/simple_animal/hostile/werewolf/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(10))
		visible_message(span_danger("\The [src] growls, enraged!"))
		sleep(3)
		Charge()
	if(prob(85) || Proj.damage > 26) //prob(x) = chance for proj to actually do something, adjust depending on how OP you want deathclaws to be
		return ..()
	else
		visible_message(span_danger("\The [Proj] bounces off \the [src]'s thick hide!"))
		return 0

/mob/living/simple_animal/hostile/werewolf/do_attack_animation(atom/A, visual_effect_icon, obj/item/used_item, no_effect)
	if(!charging)
		..()

/mob/living/simple_animal/hostile/werewolf/AttackingTarget()
	if (werewolf_mode == "friendly")
		return // Do not attack

	if(!charging)
		return ..()

/mob/living/simple_animal/hostile/werewolf/Goto(target, delay, minimum_distance)
	if(!charging)
		..()

/mob/living/simple_animal/hostile/werewolf/Move()
	if(charging)
		new /obj/effect/temp_visual/decoy/fading(loc,src)
		DestroySurroundings()
	. = ..()
	if(charging)
		DestroySurroundings()

/mob/living/simple_animal/hostile/werewolf/proc/Charge()
	var/turf/T = get_turf(target)
	if(!T || T == loc)
		return
	charging = TRUE
	visible_message(span_danger("[src] charges!"))
	DestroySurroundings()
	walk(src, 0)
	setDir(get_dir(src, T))
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#FF0000", transform = matrix()*2, time = 1)
	sleep(3)
	throw_at(T, get_dist(src, T), 1, src, 0, callback = CALLBACK(src, PROC_REF(charge_end)))

/mob/living/simple_animal/hostile/werewolf/charge_end(list/effects_to_destroy)
	charging = FALSE
	if(target)
		Goto(target, move_to_delay, minimum_distance)

/mob/living/simple_animal/hostile/werewolf/Bump(atom/A)
	if(charging)
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		DestroySurroundings()
	..()

/mob/living/simple_animal/hostile/werewolf/throw_impact(atom/A)
	if(!charging)
		return ..()

	else if(isliving(A))
		var/mob/living/L = A
		L.visible_message(span_danger("[src] slams into [L]!"), span_userdanger("[src] slams into you!"))
		L.apply_damage(melee_damage_lower/2, BRUTE)
		playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
		shake_camera(L, 4, 3)
		shake_camera(src, 2, 3)
		var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
		L.throw_at(throwtarget, 3)

	charging = FALSE
