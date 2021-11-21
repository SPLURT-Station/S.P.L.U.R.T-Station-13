#define ASH_WALKER_SPAWN_THRESHOLD 2
//The ash walker den consumes corpses or unconscious mobs to create ash walker eggs. For more info on those, check ghost_role_spawners.dm
/obj/structure/lavaland/ash_walker
	name = "necropolis tendril nest"
	desc = "A vile tendril of corruption. It's surrounded by a nest of rapidly growing eggs..."
	icon = 'icons/mob/nest.dmi'
	icon_state = "ash_walker_nest"
	move_resist=INFINITY // just killing it tears a massive hole in the ground, let's not move it
	anchored = TRUE
	density = TRUE
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	max_integrity = 200
	var/faction = list("ashwalker")
	var/meat_counter = 6
	var/spawned_obj = /obj/effect/mob_spawn/human/ash_walker
	var/species = /datum/species/lizard/ashwalker
	var/datum/team/ashwalkers/ashies
	var/datum/linked_objective

/obj/structure/lavaland/ash_walker/Initialize(mapload)
	.=..()
	ashies = new /datum/team/ashwalkers()
	var/datum/objective/protect_object/objective = new
	objective.set_target(src)
	linked_objective = objective
	ashies.objectives += objective
	START_PROCESSING(SSprocessing, src)

/obj/structure/lavaland/ash_walker/Destroy()
	ashies.objectives -= linked_objective
	ashies = null
	QDEL_NULL(linked_objective)
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/obj/structure/lavaland/ash_walker/deconstruct(disassembled)
	new /obj/item/assembly/signaler/anomaly (get_step(loc, pick(GLOB.alldirs)))
	new /obj/effect/collapse(loc)

/obj/structure/lavaland/ash_walker/process()
	consume()
	spawn_mob()

/obj/structure/lavaland/ash_walker/proc/consume()
	for(var/mob/living/prey in view(src, 1)) //Only for corpse right next to/on same tile
		if(!prey.stat)
			continue
		for(var/obj/item/W in prey)
			if(!prey.dropItemToGround(W))
				qdel(W)
		var/datum/antagonist/antag = prey.mind?.has_antag_datum(/datum/antagonist/ashwalker)
		if((linked_objective in antag?.objectives) && (prey.key || prey.get_ghost(FALSE, TRUE))) //special interactions for dead lava lizards with ghosts attached
			visible_message("<span class='warning'>Serrated tendrils carefully pull [prey] to [src], absorbing the body and creating it anew.</span>")
			var/datum/mind/deadmind
			if(prey.key)
				deadmind = prey.mind
			else
				deadmind = prey.get_ghost(FALSE, TRUE)
			to_chat(deadmind, "Your body has been returned to the nest. You are being remade anew, and will awaken shortly. </br><b>Your memories will remain intact in your new body, as your soul is being salvaged.</b>")
			SEND_SOUND(deadmind, sound('sound/magic/enter_blood.ogg',volume=100))
			new /obj/effect/gibspawner/generic(get_turf(prey))
			var/oldgender = prey.gender
			var/oldname = prey.real_name
			addtimer(CALLBACK(src, .proc/remake_walker, oldname, oldgender, deadmind), 20 SECONDS)
			qdel(prey)

			continue
		playsound(get_turf(src),'sound/magic/demon_consume.ogg', 100, 1)
		if(issilicon(prey)) //no advantage to sacrificing borgs...
			visible_message("<span class='notice'>Serrated tendrils eagerly pull [prey] apart, but find nothing of interest.</span>")
			prey.gib()
			obj_integrity = min(obj_integrity + max_integrity*0.05,max_integrity)//restores 5% hp of tendril
			continue
		visible_message("<span class='warning'>Serrated tendrils eagerly pull [prey] to [src], tearing the body apart as its blood seeps over the eggs.</span>")

		if(ismegafauna(prey))
			meat_counter += 20
		else
			meat_counter++
		prey.gib()
		obj_integrity = min(obj_integrity + max_integrity*0.05,max_integrity)//restores 5% hp of tendril

/obj/structure/lavaland/ash_walker/proc/spawn_mob()
	if(meat_counter < ASH_WALKER_SPAWN_THRESHOLD)
		return
	new spawned_obj(get_step(loc, pick(GLOB.alldirs)), ashies, linked_objective)
	visible_message("<span class='danger'>One of the eggs swells to an unnatural size and tumbles free. It's ready to hatch!</span>")
	meat_counter -= ASH_WALKER_SPAWN_THRESHOLD
