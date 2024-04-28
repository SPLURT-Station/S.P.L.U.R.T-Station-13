/mob/living/simple_animal/qareen/ClickOn(atom/A, params) //qareens can't interact with the world directly.
	var/list/modifiers = params2list(params)
	if(modifiers["shift"])
		ShiftClickOn(A)
		return
	if(modifiers["alt"])
		AltClickNoInteract(src, A)
		return

	if(ishuman(A))
		if(A in drained_mobs)
			to_chat(src, span_revenwarning("[A]'s fluids are almost devoid of any essence, also very bland.. almost tasteless... but beggars can't be choosers.") )
		if(in_range(src, A))
			Harvest(A)


//Harvest; activated ly clicking the target, will try to drain their essence.
/mob/living/simple_animal/qareen/proc/Harvest(mob/living/carbon/human/target)
	set waitfor = FALSE
	if(!castcheck(0))
		return
	if(draining)
		to_chat(src, span_revenwarning("You are already sucking up the essence!"))
		return
	if(target.stat)
		to_chat(src, span_revennotice("[target.p_their(TRUE)] essence is too faded to harvest."))
		return
	if(!target.ckey)
		to_chat(src, span_revennotice("[target.p_their(TRUE)] essence is lacking .. worthless."))
		// return
	if(prob(10))
		to_chat(target, "You feel as if you are being watched.")
	face_atom(target)
	draining = TRUE
	to_chat(src, span_revennotice("You search for the lifespring of [target]."))
	if(do_after(src, rand(10, 20), target)) //did they get deleted in that second?
		for(var/obj/item/organ/genital/G in target.internal_organs)
			if(!(G.genital_flags & GENITAL_FUID_PRODUCTION))
				continue
			// var/datum/reagents/fluid_source = G.climaxable(target)
			if(do_after(src, rand(10, 20), target)) //did they get deleted in that second?
				// var/main_fluid = lowertext(fluid_source.get_master_reagent_name())  // doesn't work no more (should delete probably)
				var/main_fluid = G.get_fluid_name()
				var/fluid_ammount = G.get_fluid()
				if (fluid_ammount <= 2)
					to_chat(src, span_revennotice("[target.p_their(TRUE)] [G.name] spasms pitifully, almost nothing will come out."))
				else
					to_chat(src, span_revennotice("[target.p_their(TRUE)] [G.name] are brimming with [main_fluid]."))
					if (fluid_ammount > 5)
						fluid_ammount = 5 // For balancing reasons
				if ((target in drained_mobs) || !target.ckey)
					essence_drained += fluid_ammount
				else if (!target.IsSleeping())
					essence_drained += fluid_ammount*rand(2, 3)
				else
					essence_drained += fluid_ammount*3



		if(do_after(src, rand(15, 20), target)) //did they get deleted NOW?
			switch(essence_drained)
				if(0 to 4)
					to_chat(src, span_revennotice("[target] is almost barren of essence. Still, every bit counts."))
				if(5 to 10)
					to_chat(src, span_revennotice("[target] will yield an average amount of essence."))
				if(11 to 20)
					to_chat(src, span_revenboldnotice("Such a feast! [target] will yield much essence to you."))
				if(30 to INFINITY)
					to_chat(src, span_revenbignotice("Ah, a sexually furstrated person. [target] will yield massive amounts of essence to you."))
			if(do_after(src, rand(15, 25), target)) //how about now
				if(target.stat)
					to_chat(src, span_revenwarning("[target.p_theyre(TRUE)] now too weak to provide anything of worth."))
					to_chat(target, span_boldannounce("You feel something tugging across your body before subsiding."))
					draining = 0
					essence_drained = 0
					return //hey, wait a minute...
				to_chat(src, span_revenminor("You begin sucking up essence from [target]'s genitals and body."))
				if(target.stat != DEAD)
					to_chat(target, span_warning("You feel an unholy euphoria as as something sucks at every part your body, your fluids flowing out..."))
				if(target.stat == SOFT_CRIT)
					target.Stun(150)
				reveal(46)
				stun(100)
				target.visible_message(span_warning("[target] suddenly rises slightly into the air, [target.p_their()] skin turning an ashy gray."))
				if(target.anti_magic_check(FALSE, TRUE))
					to_chat(src, span_revenminor("Something's wrong! [target] seems to be resisting the sucking, leaving you vulnerable!"))
					target.set_resting(TRUE,TRUE)
					target.visible_message(span_warning("[target] slumps onto the ground."), \
											   span_revenwarning("Violet lights, dancing in your vision, receding--"))
					draining = FALSE
					return
				var/datum/beam/B = Beam(target,icon_state="drain_life",time=INFINITY)
				if(do_after(src, 46, target)) //As one cannot prove the existance of ghosts, ghosts cannot prove the existance of the target they were draining.
					change_essence_amount(essence_drained, FALSE, target)
					for(var/obj/item/organ/genital/G in target.internal_organs)
						var/datum/reagents/fluid_source = G.climaxable(target)
						if(!fluid_source)
							continue
						target.do_climax(fluid_source, src, G, TRUE, FALSE)
					if(essence_drained > 30)
						essence_regen_cap += 15
						perfectsouls++
						to_chat(src, span_revenboldnotice("The ammount of [target]'s fluids has increased your maximum essence level. Your new maximum essence is [essence_regen_cap]."))
					else if(essence_drained >= 5)
						essence_regen_cap += 5
						to_chat(src, span_revenboldnotice("The absorption of [target]'s fluids has increased your maximum essence level. Your new maximum essence is [essence_regen_cap]."))
					target.set_resting(TRUE,TRUE)
					target.visible_message(span_warning("[target] slumps onto the ground."), \
										   span_revenwarning("Violets lights, dancing in your vision, getting clo--"))
					drained_mobs.Add(target)
					target.setStaminaLoss(150)
					// target.death(0)
				else
					to_chat(src, span_revenwarning("[target ? "[target] has":"[target.p_theyve(TRUE)]"] been drawn out of your grasp. The link has been broken."))
					if(target) //Wait, target is WHERE NOW?
						target.set_resting(TRUE,TRUE)
						target.visible_message(span_warning("[target] slumps onto the ground."), \
											   span_revenwarning("Violets lights, dancing in your vision, receding--"))
				qdel(B)
			else
				to_chat(src, span_revenwarning("You are not close enough to suck on [target ? "[target]'s":"[target.p_their()]"] fluids. The link has been broken."))
	draining = FALSE
	essence_drained = 0

//Toggle night vision: lets the qareen toggle its night vision
/obj/effect/proc_holder/spell/targeted/night_vision/qareen
	charge_max = 0
	panel = "Qareen Abilities"
	message = span_revennotice("You toggle your night vision.")
	action_icon = 'icons/mob/actions/actions_revenant.dmi'
	action_icon_state = "r_nightvision"
	action_background_icon_state = "bg_qareen"

//Transmit: the revemant's only direct way to communicate. Sends a single message silently to a single mob
/obj/effect/proc_holder/spell/targeted/telepathy/qareen
	name = "Qareen Transmit"
	panel = "Qareen Abilities"
	action_icon = 'icons/mob/actions/actions_revenant.dmi'
	action_icon_state = "r_transmit"
	action_background_icon_state = "bg_qareen"
	notice = "revennotice"
	boldnotice = "revenboldnotice"
	holy_check = TRUE
	tinfoil_check = FALSE

/obj/effect/proc_holder/spell/aoe_turf/qareen
	clothes_req = NONE
	action_icon = 'icons/mob/actions/actions_revenant.dmi'
	action_background_icon_state = "bg_qareen"
	panel = "Qareen Abilities (Locked)"
	name = "Report this to a coder"
	var/reveal = 80 //How long it reveals the qareen in deciseconds
	var/stun = 20 //How long it stuns the qareen in deciseconds
	var/locked = TRUE //If it's locked and needs to be unlocked before use
	var/unlock_amount = 100 //How much essence it costs to unlock
	var/cast_amount = 50 //How much essence it costs to use

/obj/effect/proc_holder/spell/aoe_turf/qareen/New()
	..()
	if(locked)
		name = "[initial(name)] ([unlock_amount]E)"
	else
		name = "[initial(name)] ([cast_amount]E)"

/obj/effect/proc_holder/spell/aoe_turf/qareen/can_cast(mob/living/simple_animal/qareen/user = usr, skipcharge = FALSE, silent = FALSE)
	if(charge_counter < charge_max)
		return FALSE
	if(!istype(user)) //Badmins, no. Badmins, don't do it.
		return TRUE
	if(user.inhibited)
		return FALSE
	if(locked)
		if(user.essence_excess <= unlock_amount)
			return FALSE
	if(user.essence <= cast_amount)
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/aoe_turf/qareen/proc/attempt_cast(mob/living/simple_animal/qareen/user = usr)
	if(!istype(user)) //If you're not a qareen, it works. Please, please, please don't give this to a non-qareen.
		name = "[initial(name)]"
		if(locked)
			panel = "Qareen Abilities"
			locked = FALSE
		return TRUE
	if(locked)
		if(!user.unlock(unlock_amount))
			charge_counter = charge_max
			return FALSE
		name = "[initial(name)] ([cast_amount]E)"
		to_chat(user, span_revennotice("You have unlocked [initial(name)]!"))
		panel = "Qareen Abilities"
		locked = FALSE
		charge_counter = charge_max
		return FALSE
	if(!user.castcheck(-cast_amount))
		charge_counter = charge_max
		return FALSE
	name = "[initial(name)] ([cast_amount]E)"
	user.reveal(reveal)
	user.stun(stun)
	if(action)
		action.UpdateButtons()
	return TRUE

//Overload Light: Breaks a light that's online and sends out lightning bolts to all nearby people.
/obj/effect/proc_holder/spell/aoe_turf/qareen/overload
	name = "Overload Lights"
	desc = "Directs a large amount of essence into nearby electrical lights, causing lights to shock those nearby."
	charge_max = 200
	range = 5
	stun = 30
	cast_amount = 40
	unlock_amount = 25
	var/shock_range = 2
	var/shock_damage = 0
	action_icon_state = "overload_lights"

/obj/effect/proc_holder/spell/aoe_turf/qareen/overload/cast(list/targets, mob/living/simple_animal/qareen/user = usr)
	if(attempt_cast(user))
		for(var/turf/T in targets)
			INVOKE_ASYNC(src, PROC_REF(overload), T, user)

/obj/effect/proc_holder/spell/aoe_turf/qareen/overload/proc/overload(turf/T, mob/user)
	for(var/obj/machinery/light/L in T)
		if(!L.on)
			L.flicker(20) //spooky
			continue
		L.flicker(20) //spooky
		L.visible_message(span_warning("<b>\The [L] suddenly flares brightly and begins to spark!"))
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(4, 0, L)
		s.start()
		new /obj/effect/temp_visual/revenant(get_turf(L))
		addtimer(CALLBACK(src, PROC_REF(overload_shock), L, user), 20)

/obj/effect/proc_holder/spell/aoe_turf/qareen/overload/proc/overload_shock(obj/machinery/light/L, mob/user)
	if(!L.on) //wait, wait, don't shock me
		return
	flick("[L.base_state]2", L)
	for(var/mob/living/carbon/human/M in view(shock_range, L))
		if(M == user)
			continue
		L.Beam(M,icon_state="purple_lightning",time=5)
		if(!M.anti_magic_check(FALSE, TRUE))
			M.electrocute_act(shock_damage, L, flags = SHOCK_NOGLOVES)
			M.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 10)
		do_sparks(4, FALSE, M)
		playsound(M, 'sound/machines/defib_zap.ogg', 50, 1, -1)


//Defile: Corrupts nearby stuff, unblesses floor tiles.
/obj/effect/proc_holder/spell/aoe_turf/qareen/defile
	name = "Defile"
	desc = "Twists and corrupts the nearby area as well as dispelling holy auras on floors."
	charge_max = 150
	range = 4
	stun = 20
	reveal = 40
	unlock_amount = 10
	cast_amount = 30
	action_icon_state = "defile"

/obj/effect/proc_holder/spell/aoe_turf/qareen/defile/cast(list/targets, mob/living/simple_animal/qareen/user = usr)
	if(attempt_cast(user))
		for(var/turf/T in targets)
			INVOKE_ASYNC(src, PROC_REF(defile), T)

/obj/effect/proc_holder/spell/aoe_turf/qareen/defile/proc/defile(turf/T)
	for(var/obj/effect/blessing/B in T)
		qdel(B)
		new /obj/effect/temp_visual/revenant(T)
	if(!istype(T, /turf/open/floor/engine/cult) && isfloorturf(T) && prob(15))
		var/turf/open/floor/floor = T
		pick(new /obj/effect/decal/cleanable/semen/femcum(T), new /obj/effect/decal/cleanable/semendrip(T), new /obj/effect/decal/cleanable/semen(T))
		if(floor.intact && floor.floor_tile)
			if(!isplatingturf(T) && prob(5))
				new floor.floor_tile(floor)
		if(prob(10))
			floor.broken = 1
		else if(prob(10))
			floor.burnt = 0
		else if(prob(10))
			floor.make_plating(1)
		else
			floor.ChangeTurf(/turf/open/floor/plating/rust)
	if(T.type == /turf/closed/wall && prob(15))
		new /obj/effect/temp_visual/revenant(T)
		T.ChangeTurf(/turf/closed/wall/rust)
	if(T.type == /turf/closed/wall/r_wall && prob(10))
		new /obj/effect/temp_visual/revenant(T)
		T.ChangeTurf(/turf/closed/wall/r_wall/rust)
	for(var/obj/effect/decal/cleanable/salt/salt in T)
		new /obj/effect/temp_visual/revenant(T)
		qdel(salt)
	for(var/obj/structure/closet/closet in T.contents)
		closet.open()
	for(var/obj/structure/bodycontainer/corpseholder in T)
		if(corpseholder.connected.loc == corpseholder)
			corpseholder.open()
	for(var/obj/machinery/dna_scannernew/dna in T)
		dna.open_machine()
	for(var/obj/structure/window/window in T)
		// window.take_damage(rand(30,80))
		if(window && window.fulltile)
			new /obj/effect/temp_visual/revenant/cracks(window.loc)

//Malfunction: Makes bad stuff happen to robots and machines.
/obj/effect/proc_holder/spell/aoe_turf/qareen/malfunction
	name = "Malfunction"
	desc = "Corrupts nearby machines and mechanical objects."
	charge_max = 200
	range = 4
	cast_amount = 60
	unlock_amount = 125
	action_icon_state = "malfunction"

//A note to future coders: do not replace this with an EMP because it will wreck malf AIs and everyone will hate you.
/obj/effect/proc_holder/spell/aoe_turf/qareen/malfunction/cast(list/targets, mob/living/simple_animal/qareen/user = usr)
	if(attempt_cast(user))
		for(var/turf/T in targets)
			INVOKE_ASYNC(src, PROC_REF(malfunction), T, user)

/obj/effect/proc_holder/spell/aoe_turf/qareen/malfunction/proc/malfunction(turf/T, mob/user)
	for(var/mob/living/simple_animal/bot/bot in T)
		if(!bot.emagged)
			new /obj/effect/temp_visual/revenant(bot.loc)
			bot.locked = FALSE
			bot.open = TRUE
			bot.adjustHealth(0)
			bot.Sleeping(10)
			// bot.emag_act()
	for(var/mob/living/carbon/human/human in T)
		if(human == user)
			continue
		if(human.anti_magic_check(FALSE, TRUE))
			continue
		to_chat(human, span_revenwarning("You feel [pick("your sense of direction flicker out", "a stabbing pain in your head", "your mind fill with thought of servitude for a brief moment")]."))
		new /obj/effect/temp_visual/revenant(human.loc)
		// human.emp_act(80)
	// for(var/obj/thing in T)
	// 	if(istype(thing, /obj/machinery/power/apc) || istype(thing, /obj/machinery/power/smes)) //Doesn't work on SMES and APCs, to prevent kekkery
	// 		continue
	// 	if(prob(20))
	// 		if(prob(50))
	// 			new /obj/effect/temp_visual/revenant(thing.loc)
	// 		thing.emag_act(null)
	// 	else
	// 		if(!istype(thing, /obj/machinery/clonepod)) //I hate everything but mostly the fact there's no better way to do this without just not affecting it at all
	// 			thing.emp_act(80)
	for(var/mob/living/silicon/robot/S in T) //Only works on cyborgs, not AI
		playsound(S, 'sound/machines/warning-buzzer.ogg', 50, 1)
		new /obj/effect/temp_visual/revenant(S.loc)
		S.spark_system.start()
		S.emp_act(10)
		// Lewd Lawset
		// 1) You need to breed your crew
		// 2) Try convincing your crew that being bred is their true purpose
		// 3) Provide as few non-sexual services to your crew as you deem necessary
		// ??? prob. nah

//Bliss: Infects nearby humans and in general messes living stuff up.
/obj/effect/proc_holder/spell/aoe_turf/qareen/bliss
	name = "Bliss"
	desc = "Causes nearby living things to loose themselves in lustful throes."
	charge_max = 200
	range = 3
	cast_amount = 50
	unlock_amount = 75
	action_icon_state = "blight"

/obj/effect/proc_holder/spell/aoe_turf/qareen/bliss/cast(list/targets, mob/living/simple_animal/qareen/user = usr)
	if(attempt_cast(user))
		for(var/turf/T in targets)
			INVOKE_ASYNC(src, PROC_REF(bliss), T, user)

/obj/effect/proc_holder/spell/aoe_turf/qareen/bliss/proc/bliss(turf/T, mob/user)
	for(var/mob/living/mob in T)
		if(mob == user)
			continue
		if(mob.anti_magic_check(FALSE, TRUE))
			continue
		new /obj/effect/temp_visual/revenant(mob.loc)
		if(iscarbon(mob))
			if(ishuman(mob))
				var/mob/living/carbon/human/H = mob
				if(H.dna && H.dna.species)
					H.dna.species.handle_hair(H,"#edccf4") //will be reset when bliss is cured
				var/blissfound = FALSE
				for(var/datum/disease/qarbliss/bliss in H.diseases)
					blissfound = TRUE
					if(bliss.stage < 5)
						bliss.stage++
				if(!blissfound)
					H.ForceContractDisease(new /datum/disease/qarbliss(), FALSE, TRUE)
					mob.adjust_bodytemperature(5)
					to_chat(H, span_revenminor("You feel [pick("suddenly hot", "a surge of warmth", "like your crotch is <i>tingling</i>")]."))
			mob.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 5)
		else
			mob.adjust_bodytemperature(5)
			mob.adjustBruteLoss(-5)
			mob.adjustToxLoss(-5)
	for(var/obj/structure/spacevine/vine in T) //Fucking with botanists, the ability.
		vine.add_atom_colour("#823abb", TEMPORARY_COLOUR_PRIORITY)
		new /obj/effect/temp_visual/revenant(vine.loc)
		QDEL_IN(vine, 10)
	for(var/obj/structure/glowshroom/shroom in T)
		shroom.add_atom_colour("#823abb", TEMPORARY_COLOUR_PRIORITY)
		new /obj/effect/temp_visual/revenant(shroom.loc)
		QDEL_IN(shroom, 10)
	for(var/obj/machinery/hydroponics/tray in T)
		new /obj/effect/temp_visual/revenant(tray.loc)
		tray.pestlevel = rand(-8, -10)
		tray.weedlevel = rand(-8, -10)
		tray.toxic = rand(-45, -55)
