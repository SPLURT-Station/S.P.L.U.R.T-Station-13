/mob/living/simple_animal/hostile/megafauna
	var/retaliated = FALSE
	var/retaliatedcooldowntime = 6000
	var/retaliatedcooldown

/mob/living/simple_animal/hostile/megafauna
	var/list/enemies = list()

/mob/living/simple_animal/hostile/megafauna/Found(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(!L.stat)
			return L
		else
			enemies -= L
	else if(ismecha(A))
		var/obj/vehicle/sealed/mecha/M = A
		if(LAZYLEN(M.occupants))
			return A

/mob/living/simple_animal/hostile/megafauna/ListTargets()
	if(!length(enemies))
		return list()
	var/list/see = ..()
	see &= enemies // Remove all entries that aren't in enemies
	return see

/mob/living/simple_animal/hostile/megafauna/proc/Retaliate()
	var/list/around = oview(src, vision_range)
	for(var/atom/movable/A in around)
		if(isliving(A))
			var/mob/living/M = A
			if((faction_check_mob(M) && attack_same) || (!faction_check_mob(M)) || (!ismegafauna(M)))
				enemies |= M
				if(!retaliated)
					src.visible_message(span_userdanger("[src] seems pretty pissed off at [M]!"))
					retaliated = TRUE
					retaliatedcooldown = world.time + retaliatedcooldowntime
		else if(ismecha(A))
			var/obj/vehicle/sealed/mecha/M = A
			var/list/occupants = LAZYCOPY(M.occupants)
			if(occupants.len)
				enemies |= M
				for(var/mob/living/living in occupants)
					if(!living.client)
						continue
					enemies |= living
					if(!retaliated)
						visible_message(span_userdanger("[src] seems pretty pissed off at [M]!"))
						retaliated = TRUE
						retaliatedcooldown = world.time + retaliatedcooldowntime

	for(var/mob/living/simple_animal/hostile/megafauna/H in around)
		if(faction_check_mob(H) && !attack_same && !H.attack_same)
			H.enemies |= enemies
	return 0

/mob/living/simple_animal/hostile/megafauna/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(. > 0 && stat == CONSCIOUS)
		Retaliate()

/mob/living/simple_animal/hostile/megafauna/Life()
	..()
	if(retaliated)
		if(retaliatedcooldown < world.time)
			retaliated = FALSE
