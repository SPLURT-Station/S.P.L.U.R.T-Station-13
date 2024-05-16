GLOBAL_LIST_INIT(bondage_rope_colors, list("#fc60db", "#fa3737", "#1a1a1a", "#e8e8e8", "#b88965"))
GLOBAL_LIST_INIT(bondage_rope_targets, list(
	"Legs"				= ROPE_TARGET_LEGS,
	"Hands (in front)"	= ROPE_TARGET_HANDS_IN_FRONT,
	"Hands (behind)"	= ROPE_TARGET_HANDS_BEHIND,
	"Legs (to object)"	= ROPE_TARGET_LEGS_OBJECT,
	"Hands (to object)"	= ROPE_TARGET_HANDS_OBJECT
	))
GLOBAL_LIST_INIT(bondage_rope_objects, list(
	/obj/structure/chair = ROPE_OBJECT_MOVABLE,
	/obj/structure/table = ROPE_OBJECT_MOVABLE,
	/obj/structure/bed = ROPE_OBJECT_IMMOVABLE,
	/obj/machinery/portable_atmospherics/canister = ROPE_OBJECT_IMMOVABLE,
	/obj/machinery/atmospherics/pipe = ROPE_OBJECT_IMMOVABLE,
	/obj/structure/reagent_dispensers/watertank = ROPE_OBJECT_IMMOVABLE,
	/obj/structure/reagent_dispensers/fueltank = ROPE_OBJECT_IMMOVABLE,
	/obj/structure/flora/tree = ROPE_OBJECT_IMMOVABLE
))
GLOBAL_LIST_INIT(bondage_rope_slowdowns, list(
	/obj/structure/chair = 8,
	/obj/structure/table = 16,
	/obj/structure/bed = ROPE_OBJECT_IMMOVABLE_SLOWDOWN,
	/obj/machinery/portable_atmospherics/canister = ROPE_OBJECT_IMMOVABLE_SLOWDOWN,
	/obj/machinery/atmospherics/pipe = ROPE_OBJECT_IMMOVABLE_SLOWDOWN,
	/obj/structure/reagent_dispensers/watertank = ROPE_OBJECT_IMMOVABLE_SLOWDOWN,
	/obj/structure/reagent_dispensers/fueltank = ROPE_OBJECT_IMMOVABLE_SLOWDOWN,
	/obj/structure/flora/tree = ROPE_OBJECT_IMMOVABLE_SLOWDOWN
))

/obj/item/restraints/bondage_rope
	name = "bondage rope"
	desc = "A rope designed to not cut into one's skin, the perfect thing for tying someone up."
	icon = 'modular_splurt/icons/obj/rope.dmi'
	icon_state = "rope"
	item_state = "rope"
	color = "#fc60db"
	w_class = WEIGHT_CLASS_SMALL
	breakouttime = 600 //Deciseconds = 60s = 1 minute
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 50, ACID = 50)
	var/cuffsound = 'modular_splurt/sound/lewd/rope.ogg'
	var/rope_target = ROPE_TARGET_HANDS_IN_FRONT
	var/rope_state = ROPE_STATE_UNTIED
	var/rope_stack
	var/mob/living/carbon/roped_master = null
	var/mob/living/carbon/roped_mob = null
	var/obj/roped_object = null
	var/roped_object_type = null
	var/tugged_flag = FALSE
	var/random_color = TRUE

/obj/item/restraints/bondage_rope/Initialize(mapload)
	. = ..()
	if(random_color == TRUE)
		color = pick(GLOB.bondage_rope_colors)
		update_appearance()
	LAZYADD(rope_stack, color)

/obj/item/restraints/bondage_rope/proc/rope_target_text()
	return rope_target == ROPE_TARGET_HANDS_BEHIND ? "behind them" : "in front"

// Handles initial rope checks and then calls process_knot
/obj/item/restraints/bondage_rope/attack(mob/living/carbon/C, mob/living/user)
	if(!istype(C))
		return
	if(rope_state == ROPE_STATE_DECIDING_OBJECT)
		reset_rope_state()
		forceMove(user.loc)

	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_BEHIND, ROPE_TARGET_HANDS_OBJECT)
			if(C.handcuffed != null && !istype(C.handcuffed, /obj/item/restraints/bondage_rope))
				to_chat(user, span_warning("[C] is already handcuffed..."))
				return
			if(C.get_num_arms(FALSE) < 2 && !C.get_arm_ignore())
				to_chat(user, span_warning("[C] doesn't have two hands..."))
				return
			if(C.handcuffed == null)
				C.visible_message(span_danger("[user] is trying to tie [C]'s hands [rope_target_text()]!"), \
								span_userdanger("[user] is trying to tie [C]'s hands [rope_target_text()]!"))
			else
				var/obj/item/restraints/bondage_rope/rope = C.handcuffed
				if(LAZYLEN(rope.rope_stack) >= ROPE_MAX_STACK)
					to_chat(user, span_warning("You cannot strengthen this rope anymore..."))
					return
				C.visible_message(span_danger("[user] is trying to strengthen the rope on [C]!"), \
								span_userdanger("[user] is trying to strengthen the rope on [C]!"))
			process_knot(C, user)

		if(ROPE_TARGET_LEGS, ROPE_TARGET_LEGS_OBJECT)
			if(C.legcuffed != null && !istype(C.legcuffed, /obj/item/restraints/bondage_rope))
				to_chat(user, span_warning("[C] is already legcuffed..."))
				return
			if(C.get_num_legs(FALSE) < 2 && !C.get_leg_ignore())
				to_chat(user, span_warning("[C] doesn't have two legs..."))
				return
			if(C.legcuffed == null)
				C.visible_message(span_danger("[user] is trying to tie [C]'s legs!"), \
								span_userdanger("[user] is trying to tie [C]'s legs!"))
			else
				var/obj/item/restraints/bondage_rope/rope = C.legcuffed
				if(LAZYLEN(rope.rope_stack) >= ROPE_MAX_STACK)
					to_chat(user, span_warning("You cannot strengthen this rope anymore..."))
					return
				C.visible_message(span_danger("[user] is trying to strengthen the rope on [C]!"), \
								span_userdanger("[user] is trying to strengthen the rope on [C]!"))
			process_knot(C, user)

/obj/item/restraints/bondage_rope/attack_obj(obj/O, mob/user)
	if(rope_state != ROPE_STATE_DECIDING_OBJECT)
		to_chat(user, span_notice("You need to attach the rope to somebody first."))
		return
	process_object(O, user)

// Handles deciding objects in ROPE_STATE_DECIDING_OBJECT state
// If rope is attached to an object calls finish_knot_object
/obj/item/restraints/bondage_rope/proc/process_object(obj/O, mob/user)
	if(rope_state != ROPE_STATE_DECIDING_OBJECT)
		return
	// Might be reduntant, since the roped mob gets pulled, but meh
	var/distance = get_dist(user, roped_mob)
	if(distance > ROPE_MAX_DISTANCE_MASTER)
		to_chat(user, span_warning("The rope isn't long enough to tie a knot."))
		return

	for(var/type in GLOB.bondage_rope_objects)
		if(istype(O, type))
			finish_knot_object(O, type)

// Handles the initial knot on the target (timeout and messages)
// > If target doesn't have a rope tied, calls after_process_knot
// > If target does have a rope tied, calls strengthen_rope
/obj/item/restraints/bondage_rope/proc/process_knot(mob/living/carbon/C, mob/living/user)
	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_BEHIND, ROPE_TARGET_HANDS_OBJECT)
			if(do_mob(user, C, 30) && (C.get_num_arms(FALSE) >= 2 || C.get_arm_ignore()))
				playsound(loc, cuffsound, 30, 1, -2)
				SSblackbox.record_feedback("tally", "handcuffs", 1, type)
				log_combat(user, C, "handcuffed")
				if(C.handcuffed == null)
					to_chat(user, span_notice("You tie [C]'s hands [rope_target_text()]."))
					after_process_knot(C, user)
				else
					to_chat(user, span_notice("You strengthen the rope on [C]."))
					strengthen_rope(C, user)
			else
				to_chat(user, span_warning("You fail to tie [C]'s hands!"))
		if(ROPE_TARGET_LEGS, ROPE_TARGET_LEGS_OBJECT)
			if(do_mob(user, C, 30) && (C.get_num_legs(FALSE) >= 2 || C.get_leg_ignore()))
				playsound(loc, cuffsound, 30, 1, -2)
				SSblackbox.record_feedback("tally", "handcuffs", 1, type)
				log_combat(user, C, "handcuffed")
				if(C.legcuffed == null)
					to_chat(user, span_notice("You tie [C]'s legs."))
					after_process_knot(C, user)
				else
					to_chat(user, span_notice("You strengthen the rope on [C]."))
					strengthen_rope(C, user)
			else
				to_chat(user, span_warning("You fail to tie [C]'s legs!"))

// > Using normal rope, calls finish_knot_normal
// > Using object rope, handles the handcuffed effect (unless instant self apply is disabled) and sets state to ROPE_STATE_DECIDING_OBJECT
/obj/item/restraints/bondage_rope/proc/after_process_knot(mob/living/carbon/C, mob/living/user)
	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_BEHIND, ROPE_TARGET_LEGS)
			finish_knot_normal(C, user)
			return
		if(ROPE_TARGET_HANDS_OBJECT)
			if(C != user || ROPE_SELF_APPLY_INSTANT)
				apply_hands(C)
		if(ROPE_TARGET_LEGS_OBJECT)
			if(C != user || ROPE_SELF_APPLY_INSTANT)
				apply_legs(C)

	rope_state = ROPE_STATE_DECIDING_OBJECT
	set_roped_mob(C)
	set_roped_master(user)
	set_rope_slowdown(C)
	to_chat(roped_master, span_notice("Attach the rope to an object to finish the knot."))
	while(1)
		sleep(2)
		if(rope_state == ROPE_STATE_UNTIED)
			break
		if(!check_rope_state())
			break

// Strengthens target's rope and deletes itself
/obj/item/restraints/bondage_rope/proc/strengthen_rope(mob/living/carbon/target, mob/living/carbon/user)
	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_BEHIND, ROPE_TARGET_HANDS_OBJECT)
			var/obj/item/restraints/bondage_rope/rope = target.handcuffed
			LAZYADD(rope.rope_stack, src.color)
			rope.set_rope_slowdown(target)
		if(ROPE_TARGET_LEGS, ROPE_TARGET_LEGS_OBJECT)
			var/obj/item/restraints/bondage_rope/rope = target.legcuffed
			LAZYADD(rope.rope_stack, src.color)
			rope.set_rope_slowdown(target)
	reset_rope_state()
	qdel(src)

// Sets state to ROPE_STATE_TIED, applies handcuffed effect and disappears rope
/obj/item/restraints/bondage_rope/proc/finish_knot_normal(mob/living/carbon/target, mob/living/carbon/user)
	rope_state = ROPE_STATE_TIED
	if(!user.temporarilyRemoveItemFromInventory(src))
		reset_rope_state()
		return
	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_BEHIND)
			apply_hands(target)
		if(ROPE_TARGET_LEGS)
			apply_legs(target)
	forceMove(target)

	set_rope_slowdown(target)

// Sets state to ROPE_STATE_TIED, applies handcuffed effect (if needed) and disappears rope
/obj/item/restraints/bondage_rope/proc/finish_knot_object(obj/O, O_type)
	rope_state = ROPE_STATE_TIED
	if(!roped_master.temporarilyRemoveItemFromInventory(src))
		reset_rope_state()
		return
	if(roped_master == roped_mob && !ROPE_SELF_APPLY_INSTANT)
		switch(rope_target)
			if(ROPE_TARGET_HANDS_OBJECT)
				apply_hands(roped_mob)
			if(ROPE_TARGET_LEGS_OBJECT)
				apply_legs(roped_mob)
	forceMove(roped_mob)

	set_roped_master(null)
	set_roped_object(O, O_type)
	to_chat(roped_mob, span_warning("You are tied to [O]."))
	to_chat(roped_master, span_notice("You tie the rope to [O]."))
	tugged_flag = TRUE
	apply_tug_mob_to_object(roped_mob, roped_object, ROPE_MAX_DISTANCE_OBJECT)

// Handles a number of edge cases, if something goes wrong resets the rope state and returns false
/obj/item/restraints/bondage_rope/proc/check_rope_state()
	if(rope_state == ROPE_STATE_UNTIED)
		return TRUE

	if(roped_mob == null)
		if(roped_master != null)
			to_chat(roped_master, span_warning("Seems like whoever you were roping... Is gone?"))
		reset_rope_state()
		return FALSE
	if(rope_state == ROPE_STATE_TIED || (roped_master != roped_mob || ROPE_SELF_APPLY_INSTANT))
		if(rope_target == ROPE_TARGET_HANDS_OBJECT && roped_mob.handcuffed != src)
			if(roped_master != null)
				to_chat(roped_master, span_warning("[roped_mob] got out of your rope."))
			reset_rope_state()
			return FALSE
		if(rope_target == ROPE_TARGET_LEGS_OBJECT && roped_mob.legcuffed != src)
			if(roped_master != null)
				to_chat(roped_master, span_warning("[roped_mob] got out of your rope."))
			reset_rope_state()
			return FALSE
	if(rope_state == ROPE_STATE_TIED && roped_object == null)
		to_chat(roped_mob, span_warning("The thing you were tied to... Is gone?"))
		reset_rope_state()
		return FALSE

	return TRUE

// Restores the rope into the initial state
/obj/item/restraints/bondage_rope/proc/reset_rope_state()
	rope_state = ROPE_STATE_UNTIED
	set_roped_master(null)
	set_roped_mob(null)
	set_roped_object(null)

// Handles whenever roped master moves, tugging their tied mob to them (isn't called whenever roped master is roped mob!)
/obj/item/restraints/bondage_rope/proc/on_master_move()
	if(!check_rope_state())
		return
	var/distance = get_dist(roped_mob.loc, roped_master.loc)
	if(distance > ROPE_MAX_DISTANCE_MASTER)
		tugged_flag = TRUE
		apply_tug_mob_to_mob(roped_mob, roped_master, ROPE_MAX_DISTANCE_MASTER)
		if (prob(30))
			roped_mob.apply_effect(20, EFFECT_KNOCKDOWN, 0)
	if(distance > ROPE_MAX_DISTANCE_SNAP)
		snap_rope()

// Handles whenever roped object moves, tugging their tied mob to it
/obj/item/restraints/bondage_rope/proc/on_object_move()
	if(!check_rope_state())
		return
	var/distance = get_dist(roped_mob.loc, roped_object.loc)
	if(distance > ROPE_MAX_DISTANCE_OBJECT)
		tugged_flag = TRUE
		apply_tug_mob_to_object(roped_mob, roped_object, ROPE_MAX_DISTANCE_OBJECT)
		if (prob(30))
			roped_mob.apply_effect(20, EFFECT_KNOCKDOWN, 0)
	if(distance > ROPE_MAX_DISTANCE_SNAP)
		snap_rope()

// Handles whenever roped mob moves, tugging them to their master, their object to them or them to their object
/obj/item/restraints/bondage_rope/proc/on_mob_move()
	if(!check_rope_state())
		return
	if(tugged_flag)
		tugged_flag = FALSE
		return
	switch(rope_state)
		if(ROPE_STATE_DECIDING_OBJECT)
			if(roped_master != null)
				var/distance = get_dist(roped_mob.loc, roped_master.loc)
				if(distance > ROPE_MAX_DISTANCE_MASTER)
					if (prob(10))
						to_chat(roped_mob, span_warning("You tug the rope away from [roped_master]."))
						to_chat(roped_master, span_warning("[roped_mob] tugs the rope away from you."))
						forceMove(roped_mob.loc)
					else
						to_chat(roped_mob, span_warning("The rope doesn't let you go further."))
						tugged_flag = TRUE
						apply_tug_mob_to_mob(roped_mob, roped_master, ROPE_MAX_DISTANCE_MASTER)
						// Not reduntant, since the above line can tug the rope and make roped_master null
						if(roped_master == null)
							return
						distance = get_dist(roped_mob.loc, roped_master.loc)
				if(distance > ROPE_MAX_DISTANCE_SNAP)
					snap_rope()
			else
				var/distance = get_dist(roped_mob.loc, src.loc)
				if(distance > ROPE_MAX_DISTANCE_MASTER)
					apply_tug_object_to_mob(src, roped_mob, ROPE_MAX_DISTANCE_MASTER)
					distance = get_dist(roped_mob.loc, src.loc)
				if(distance > ROPE_MAX_DISTANCE_SNAP)
					snap_rope()

		if(ROPE_STATE_TIED)
			var/can_move = can_move_object()
			var/distance = get_dist(roped_mob.loc, roped_object.loc)
			if(distance > ROPE_MAX_DISTANCE_OBJECT)
				if(can_move)
					apply_tug_object_to_mob(roped_object, roped_mob, ROPE_MAX_DISTANCE_OBJECT)
				else
					to_chat(roped_mob, span_warning("The rope doesn't let you go further."))
					tugged_flag = TRUE
					apply_tug_mob_to_object(roped_mob, roped_object, ROPE_MAX_DISTANCE_OBJECT)
				distance = get_dist(roped_mob.loc, roped_object.loc)
			if(distance > ROPE_MAX_DISTANCE_SNAP)
				snap_rope()

/obj/item/restraints/bondage_rope/proc/snap_rope()
	var/loc = null
	if(roped_master != null)
		to_chat(roped_master, span_warning("The rope snaps."))
		loc = roped_master.loc
	if(roped_mob != null)
		to_chat(roped_mob, span_warning("The rope snaps."))
		loc = roped_mob.loc
	reset_rope_state()
	forceMove(loc)

/obj/item/restraints/bondage_rope/Destroy()
	reset_rope_state()
	return ..()

/obj/item/restraints/bondage_rope/dropped(mob/user, silent)
	switch(rope_state)
		if(ROPE_STATE_DECIDING_OBJECT)
			set_roped_master(null)
		if(ROPE_STATE_TIED)
			// For object ones, this gets handled in check_rope_state
			if(rope_target != ROPE_TARGET_HANDS_OBJECT && rope_target != ROPE_TARGET_LEGS_OBJECT)
				reset_rope_state()
	..()

/obj/item/restraints/bondage_rope/pickup(mob/user)
	if(rope_state == ROPE_STATE_DECIDING_OBJECT)
		set_roped_master(user)
	..()

// Taken from handcuffs code
/obj/item/restraints/bondage_rope/proc/apply_hands(mob/living/carbon/target)
	if(target == null || target.handcuffed != null)
		return
	target.handcuffed = src
	target.update_handcuffed()

// Taken from handcuffs code
/obj/item/restraints/bondage_rope/proc/apply_legs(mob/living/carbon/target)
	if(target == null || target.legcuffed != null)
		return
	target.legcuffed = src
	target.update_equipment_speed_mods()
	target.update_inv_legcuffed()

// Handles differing breakout times and cuffbreak (hands free removes rope faster, wirecutters even better)
/obj/item/restraints/bondage_rope/proc/prepare_resist(mob/living/carbon/target)
	var/obj/item/restraints/bondage_rope/rope_handcuffed = target.handcuffed
	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_OBJECT)
			breakouttime = 350 + (LAZYLEN(rope_stack) * 100)
		if(ROPE_TARGET_HANDS_BEHIND)
			breakouttime = 500 + (LAZYLEN(rope_stack) * 100)
		if(ROPE_TARGET_LEGS, ROPE_TARGET_LEGS_OBJECT)
			// Alert resisting always resists hands first, so this may not be ever used T-T
			if(rope_handcuffed != null && rope_handcuffed.rope_target == ROPE_TARGET_HANDS_BEHIND)
				return -1
			breakouttime = (rope_handcuffed != null ? 400 : 250) + (LAZYLEN(rope_stack) * 100)
	if(rope_handcuffed == null && istype(target.get_active_held_item(), /obj/item/wirecutters))
		return FAST_CUFFBREAK

	return 0

// Handles changing between different rope targets
/obj/item/restraints/bondage_rope/AltClick(mob/living/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	customize_rope(user)
	return TRUE

/obj/item/restraints/bondage_rope/proc/customize_rope(mob/living/user)
	if(rope_state != ROPE_STATE_UNTIED)
		to_chat(user, span_warning("You can only customize an untied rope."))
		return

	if(src && !user.incapacitated() && in_range(user, src))
		var/target_choice = input(user,"Choose a target for your rope.", "Rope Target") as null|anything in GLOB.bondage_rope_targets
		if(src && target_choice && !user.incapacitated() && in_range(user,src))
			sanitize_inlist(target_choice, GLOB.bondage_rope_targets, "Legs")
			rope_target = GLOB.bondage_rope_targets[target_choice]

/obj/item/restraints/bondage_rope/proc/set_roped_mob(mob/living/carbon/new_mob)
	if(roped_mob != null)
		UnregisterSignal(roped_mob, COMSIG_MOVABLE_MOVED)
		if(roped_mob.handcuffed == src)
			roped_mob.clear_cuffs(roped_mob.handcuffed, 0)
		else if(roped_mob.legcuffed == src)
			roped_mob.clear_cuffs(roped_mob.legcuffed, 0)
	roped_mob = new_mob
	if(roped_mob != null)
		RegisterSignal(roped_mob, COMSIG_MOVABLE_MOVED, PROC_REF(on_mob_move))

/obj/item/restraints/bondage_rope/proc/set_roped_master(mob/living/carbon/new_master)
	if(roped_master != null && roped_mob != roped_master)
		UnregisterSignal(roped_master, COMSIG_MOVABLE_MOVED)
	roped_master = new_master
	if(roped_master != null && roped_mob != roped_master)
		RegisterSignal(roped_master, COMSIG_MOVABLE_MOVED, PROC_REF(on_master_move))

/obj/item/restraints/bondage_rope/proc/set_roped_object(obj/new_object, new_object_type)
	if(roped_object != null)
		UnregisterSignal(roped_object, COMSIG_MOVABLE_MOVED)
	roped_object = new_object
	roped_object_type = new_object_type
	set_rope_slowdown(roped_mob)
	if(roped_object != null)
		RegisterSignal(roped_object, COMSIG_MOVABLE_MOVED, PROC_REF(on_object_move))

// Returns true, if roped mob can tug their object behind them
/obj/item/restraints/bondage_rope/proc/can_move_object()
	if(roped_object == null)
		return FALSE
	switch(roped_object_type)
		if(/obj/structure/chair)
			// Might add more exceptions, not sure
			if(istype(roped_object, /obj/structure/chair/sofa) || istype(roped_object, /obj/structure/chair/pew))
				return FALSE
			return TRUE
		if(/obj/structure/table)
			var/obj/structure/table/table = roped_object
			var/list/tables = table.connected_floodfill(1)
			return LAZYLEN(tables) <= 1

	return GLOB.bondage_rope_objects[roped_object_type] == ROPE_OBJECT_MOVABLE

// Handles changing slowdown based on roped object
/obj/item/restraints/bondage_rope/proc/set_rope_slowdown(mob/living/carbon/target)
	if(rope_state == ROPE_STATE_DECIDING_OBJECT)
		slowdown = 16
	else if(roped_object == null)
		slowdown = 0
		switch(rope_target)
			if(ROPE_TARGET_LEGS)
				slowdown = LAZYLEN(rope_stack) * 8
	else
		slowdown = GLOB.bondage_rope_slowdowns[roped_object_type]
	if(target != null)
		target.update_equipment_speed_mods()

// For the Shibari Bola

/obj/item/restraints/bondage_rope/proc/bola(mob/living/carbon/C)
	switch(rope_target)
		if(ROPE_TARGET_HANDS_IN_FRONT, ROPE_TARGET_HANDS_BEHIND)
			if(C.get_num_arms(FALSE) >= 2 || C.get_arm_ignore())
				playsound(loc, cuffsound, 30, 1, -2)
				SSblackbox.record_feedback("tally", "handcuffs", 1, type)
				if(C.handcuffed == null)
					rope_state = ROPE_STATE_TIED
					C.handcuffed = src
					C.update_handcuffed()
					forceMove(C)
					set_rope_slowdown(C)
				else
					var/obj/item/restraints/bondage_rope/rope = C.handcuffed
					LAZYADD(rope.rope_stack, src.color)
					rope.set_rope_slowdown(C)
					reset_rope_state()
					qdel(src)
		if(ROPE_TARGET_LEGS)
			if(C.get_num_legs(FALSE) >= 2 || C.get_leg_ignore())
				playsound(loc, cuffsound, 30, 1, -2)
				SSblackbox.record_feedback("tally", "handcuffs", 1, type)
				if(C.legcuffed == null)
					rope_state = ROPE_STATE_TIED
					C.legcuffed = src
					C.update_equipment_speed_mods()
					C.update_inv_legcuffed()
					forceMove(C)
					set_rope_slowdown(C)
				else
					var/obj/item/restraints/bondage_rope/rope = C.legcuffed
					LAZYADD(rope.rope_stack, src.color)
					rope.set_rope_slowdown(C)
					reset_rope_state()
					qdel(src)
