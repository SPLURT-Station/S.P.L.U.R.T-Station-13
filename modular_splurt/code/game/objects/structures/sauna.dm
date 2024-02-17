#define SAUNA_H2O_TEMP (T20C + 50)
#define SAUNA_WOOD_FUEL 150
#define SAUNA_PAPER_FUEL 5
#define SAUNA_MAXIMUM_FUEL 3000
#define SAUNA_WATER_PER_WATER_UNIT 5

/obj/structure/sauna_oven
	name = "\improper sauna oven"
	desc = "A modest sauna oven adorned with stones. Add some fuel, pour water, and relish the tranquil moment."
	icon = 'modular_splurt/icons/obj/sauna_oven.dmi'
	icon_state = "sauna_oven"
	density = TRUE
	anchored = TRUE
	resistance_flags = FIRE_PROOF
	var/lit = FALSE
	var/fuel_amount = 0
	var/water_amount = 0

/obj/structure/sauna_oven/examine(mob/user)
	. = ..()
	. += span_notice("The stones look [water_amount ? "moist" : "somewhat dry"].")
	. += span_notice("You see [fuel_amount ? "combustible materials" : "a heap of smoldering ash"] inside the oven's firebox.")

/obj/structure/sauna_oven/Destroy()
	if(lit)
		STOP_PROCESSING(SSobj, src)
	QDEL_NULL(particles)
	return ..()

/obj/structure/sauna_oven/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(lit)
		lit = FALSE
		STOP_PROCESSING(SSobj, src)
		user.visible_message(span_notice("[user] cuts off the air in [src]."), span_notice("You cut off the air in [src]."))
	else if (fuel_amount)
		lit = TRUE
		START_PROCESSING(SSobj, src)
		user.visible_message(span_notice("[user] activates [src]."), span_notice("You activate [src]."))
	update_icon()

/obj/structure/sauna_oven/update_overlays()
	. = ..()
	if(lit)
		. += "sauna_oven_on_overlay"

/obj/structure/sauna_oven/update_icon()
	..()
	icon_state = "[lit ? "sauna_oven_on" : initial(icon_state)]"

/obj/structure/sauna_oven/attackby(obj/item/used_item, mob/user)
	if(used_item.tool_behaviour == TOOL_SCREWDRIVER)
		balloon_alert(user, "Disassembling...")
		if(used_item.use_tool(src, user, 60, volume = 50))
			new /obj/item/stack/sheet/mineral/wood(get_turf(src), 30)
			qdel(src)
		return // Prevent the default attack behavior

	else if(used_item.tool_behaviour == TOOL_WRENCH)
		if(anchored)
			balloon_alert(user, "Unanchoring...")
		else
			balloon_alert(user, "Anchoring...")	
		if(used_item.use_tool(src, user, 40, volume=50))
			anchored = !anchored
			balloon_alert(user, "You [anchored ? "anchor" : "unanchor"] the oven [anchored ? "to" : "from"] the ground.")
		return // Prevent the default attack behavior

	else if(istype(used_item, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/reagent_container = used_item
		if(!reagent_container.is_open_container())
			return ..()
		if(reagent_container.reagents.has_reagent(/datum/reagent/water))
			reagent_container.reagents.remove_reagent(/datum/reagent/water, 5)
			user.visible_message(span_notice("[user] pours some \
			water into [src]."), span_notice("You pour some \
			water into [src]."))
			water_amount += 5 * SAUNA_WATER_PER_WATER_UNIT
			return // Prevent the default attack behavior	
		else
			balloon_alert(user, "No water left!")

	else if(istype(used_item, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/wood = used_item
		if(fuel_amount > SAUNA_MAXIMUM_FUEL)
			balloon_alert(user, "No room left in the firebox!")
			return
		fuel_amount += SAUNA_WOOD_FUEL * wood.amount
		wood.use(wood.amount)
		user.visible_message(span_notice("[user] throws wood chips \
			into the firebox of [src]."), span_notice("You throw wood chips \
			into the firebox of [src]."))
		return // Prevent the default attack behavior

	else if(istype(used_item, /obj/item/paper_bin))
		var/obj/item/paper_bin/paper_bin = used_item
		user.visible_message(span_notice("[user] throws [used_item] into the firebox of \
			[src]."), span_notice("You add [used_item] to the firebox of [src].\
			"))
		fuel_amount += SAUNA_PAPER_FUEL * paper_bin.total_paper
		qdel(paper_bin)
		return // Prevent the default attack behavior

	else if(istype(used_item, /obj/item/paper))
		user.visible_message(span_notice("[user] throws [used_item] into the firebox of \
			[src]."), span_notice("You add [used_item] to the firebox of [src].\
			"))
		fuel_amount += SAUNA_PAPER_FUEL
		qdel(used_item)
		return // Prevent the default attack behavior
	else
		return ..()

/obj/structure/sauna_oven/process()
	if(water_amount)
		water_amount--
		update_steam_particles()
		var/turf/open/pos = get_turf(src)
		if(istype(pos) && pos.air.return_pressure() < 2*ONE_ATMOSPHERE)
			pos.atmos_spawn_air("water_vapor=25;TEMP=[SAUNA_H2O_TEMP]")
	fuel_amount--
	if(fuel_amount <= 0)
		lit = FALSE
		update_steam_particles()
		STOP_PROCESSING(SSobj, src)
		update_icon()

/obj/structure/sauna_oven/proc/update_steam_particles()
	new /obj/effect/temp_visual/small_smoke/halfsecond(get_turf(src))

#undef SAUNA_H2O_TEMP
#undef SAUNA_WOOD_FUEL
#undef SAUNA_PAPER_FUEL
#undef SAUNA_MAXIMUM_FUEL
#undef SAUNA_WATER_PER_WATER_UNIT
