#define POINT_TYPE_CARGO "cargo"
#define POINT_TYPE_SCIENCE "science"

/obj/machinery/research_table
	name = "Sex Research Rack"
	desc = "The rack with silicone padding and plenty of straps for subject restraining.\
	\nA lot of sensors are connected to this device that record the state of the body during orgasm. Well, you know... For scientific purposes..."
	icon = 'modular_splurt/icons/obj/research_rack.dmi'
	icon_state = "rack"
	can_buckle = TRUE
	density = TRUE
	buckle_lying = TRUE
	layer = TABLE_LAYER
	obj_flags = CAN_BE_HIT|SHOVABLE_ONTO
	pass_flags = LETPASSTHROW //You can throw objects over this, despite it's density.")
	circuit = /obj/item/circuitboard/machine/research_table
	var/self_unbuckle_time = 3 MINUTES
	var/static/list/users = list()
	var/tier = 1
	var/configured = FALSE
	var/point_type = POINT_TYPE_SCIENCE
	var/max_repeat_usage = 3
	var/slaver_mode = FALSE

/obj/machinery/research_table/examine(mob/user)
	. = ..()
	if(configured)
		. += span_notice("The same person can be used up to [max_repeat_usage * tier] time\s.")
	switch(point_type)
		if(POINT_TYPE_SCIENCE)
			. += span_notice("The table is set to generate science points.")
		else
			. += span_notice("The table is set to generate money for cargo.")
	if(!configured && !panel_open)
		. += span_notice("It's not configured yet, you could use a <b>multitool</b> to configure it.")
	if(panel_open)
		. += span_notice("The panel is <b>screwed</b> open and you could change generation type with a <b>multitool</b>.")

/obj/machinery/research_table/multitool_act(mob/living/user, obj/item/I)
	if(user.a_intent == INTENT_HELP)
		if(panel_open && !slaver_mode) // Do not let slaver version switch to science mode, they should only generate credits.
			user.visible_message(span_notice("[user] begins changing the generation type on \the [src]."), span_notice("You begin changing the generation type on \the [src]."))
			if(do_after(user, 5 SECONDS, src))
				point_type = point_type == POINT_TYPE_SCIENCE ? POINT_TYPE_CARGO : POINT_TYPE_SCIENCE
				var/generation_message = null
				switch(point_type)
					if(POINT_TYPE_SCIENCE)
						generation_message = "generate research points for science"
					else
						generation_message = "generate money for cargo"
				user.visible_message(span_notice("[user] finished changing the generation type on \the [src]."), span_notice("You change the generation type on \the [src] to [generation_message]."))
			else
				to_chat(user, span_warning("You need to stand still and uninterrupted for 5 seconds!"))
			return STOP_ATTACK_PROC_CHAIN
		else
			user.visible_message(span_notice("[user] begins reconfiguring \the [src]."), span_notice("You begin reconfiguring \the [src]."))
			if(do_after(user, 5 SECONDS, src))
				configured = !configured
				user.visible_message(span_notice("[user] finished reconfiguring \the [src]."), span_notice("The research table is now [configured ? "configured" : "not configured"]."))
			else
				to_chat(user, span_warning("You need to stand still and uninterrupted for 5 seconds!"))
			return STOP_ATTACK_PROC_CHAIN
	. = ..()

/obj/machinery/research_table/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, I))
		return STOP_ATTACK_PROC_CHAIN

/obj/machinery/research_table/crowbar_act(mob/living/user, obj/item/I)
	. = ..()
	if(default_deconstruction_crowbar(I, FALSE))
		return STOP_ATTACK_PROC_CHAIN

/obj/machinery/research_table/MouseDrop_T(mob/living/M, mob/living/user)
	if(istype(M))
		if(get_turf(M) != get_turf(src) && user.stat == CONSCIOUS)
			var/message = M == user ? "[M] climbs on the [src]." : "[user] puts [M] on the [src]."
			var/self_message = M == user ? "You climb on the [src]." : "You put [M] on the [src]."
			visible_message(message, self_message)
			M.forceMove(get_turf(src))
		. = ..()
		if(. && !configured) // Successfully buckled, not configured.
			say("Warning, table not configured yet!")
	return

/obj/machinery/research_table/user_unbuckle_mob(mob/living/buckled_mob, mob/user)
	if(QDELETED(buckled_mob) || QDELETED(user)) //SPLURT edit
		return
	if(INTERACTING_WITH(buckled_mob, src))
		to_chat(user, "<span class='notice'>You're already trying to unbuckle [buckled_mob == user ? "yourself" : buckled_mob]!")
		return
	if(!handle_unbuckling(buckled_mob, user))
		if(buckled_mob == user)
			to_chat(user, span_warning("You fail to unbuckle yourself."))
		else
			to_chat(user, span_warning("You fail to unbuckle [buckled_mob]."))
		return
	UnregisterSignal(buckled_mob, COMSIG_MOB_POST_CAME)
	say("User left, resetting scanners.")
	return ..()

/obj/machinery/research_table/proc/handle_unbuckling(mob/living/buckled_mob, user)
	if(buckled_mob == user)
		if(do_after(user, self_unbuckle_time, src))
			return TRUE
		else
			return FALSE
	return TRUE

/obj/machinery/research_table/buckle_mob(mob/living/buckled_mob, force, check_loc)
	RegisterSignal(buckled_mob, COMSIG_MOB_POST_CAME, .proc/on_cum)
	say("New user detected, tracking data.")
	. = ..()

/obj/machinery/research_table/RefreshParts()
	var/parts = 0
	tier = 0
	for(var/obj/item/stock_parts/part in component_parts)
		tier += part.rating
		parts++
	tier /= parts

/obj/machinery/research_table/proc/on_cum(mob/living/carbon/buckled_mob, obj/item/organ/genital/target_orifice, mob/living/partner)
	if(!configured)
		say("Failed to get any data, the table is not configured!")
		return
	if(!istype(buckled_mob))
		say("Failed to get any data from the subject, it is not a human.")
		return
	if((buckled_mob.last_partner && buckled_mob.last_partner == buckled_mob) || buckled_mob == partner)
		say("Failed to get any data from the subject, two are needed for the experiment!")
		return
	if(users[buckled_mob.name] > (max_repeat_usage * tier))
		say("There is already too much data from this subject.")
		return
	users[buckled_mob.name] += 1
	var/points_awarded = 0
	for(var/obj/item/organ/genital/genital in buckled_mob.internal_organs)
		if(istype(genital, /obj/item/organ/genital/breasts))
			var/obj/item/organ/genital/breasts/breasts = genital
			points_awarded += breasts.fluid_rate + GLOB.breast_values[breasts.size]
			continue
		points_awarded += genital.fluid_rate + genital.size
	points_awarded *= tier
	points_awarded *= CONFIG_GET(number/sex_table_multiplier)
	switch(point_type)
		if(POINT_TYPE_SCIENCE)
			SSresearch.science_tech.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = points_awarded))
		else
			if(slaver_mode) // Slaver version generates money for the slavers instead.
				GLOB.slavers_credits_balance += points_awarded
			else
				var/datum/bank_account/D = SSeconomy.get_dep_account(ACCOUNT_CAR)
				if(D)
					D.adjust_money(points_awarded)
	if(points_awarded)
		var/add_s = points_awarded == 1 ? "" : "s"
		say("Obtained [points_awarded] [point_type == POINT_TYPE_SCIENCE ? "point" : "credit"][add_s] from the session.")
	else
		say("Obtained no [point_type == POINT_TYPE_SCIENCE ? "points" : "credits"] from the session.") // Probably has no genitals at all
	playsound(src, 'sound/machines/chime.ogg', 30, 1)

/obj/machinery/research_table/slaver
	slaver_mode = TRUE
	point_type = POINT_TYPE_CARGO
	configured = TRUE

#undef POINT_TYPE_CARGO
#undef POINT_TYPE_SCIENCE
