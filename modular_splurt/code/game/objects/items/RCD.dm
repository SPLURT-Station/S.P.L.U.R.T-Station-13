/obj/item/construction/tables
	name = "Rapid Table Constructor"
	desc = "A poorly modified RCD outfitted to construct only tables. Reload with metal, glass and plasteel."
	icon = 'icons/obj/tools.dmi'
	icon_state = "arcd"
	item_state = "oldrcd"
	custom_price = PRICE_ABOVE_EXPENSIVE
	custom_premium_price = PRICE_ALMOST_ONE_GRAND
	item_flags = NO_MAT_REDEMPTION | NOBLUDGEON
	has_ammobar = FALSE
	matter = 200
	max_matter = 200

	// Type of table
	var/blueprint = null
	// Index, used in the attack self to get the type
	var/list/choices = list()
	// Index, used in the attack self to get the type
	var/list/name_to_type = list()

	var/list/structure_data = list("cost" = list(), "delay" = list())


/obj/item/construction/tables/attack_self(mob/user)
	..()
	if (!choices.len)
		choices = list(
			"Standard" = image(icon = 'icons/obj/smooth_structures/table.dmi', icon_state = "table"),
			"Reinforced" = image(icon = 'icons/obj/smooth_structures/reinforced_table.dmi', icon_state = "r_table"),
			"Glass" = image(icon = 'icons/obj/smooth_structures/glass_table.dmi', icon_state = "glass_table"),
		)

	var/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, PROC_REF(check_menu), user), require_near = TRUE, tooltips = TRUE)
	if (!check_menu(user))
		return
	switch(choice)
		if ("Standard")
			blueprint = /obj/structure/table
			if (!structure_data["cost"][blueprint])
				structure_data["cost"][blueprint] = 5
			if (!structure_data["delay"][blueprint])
				structure_data["cost"][blueprint] = 20
		if ("Reinforced")
			blueprint = /obj/structure/table/reinforced
			if (!structure_data["cost"][blueprint])
				structure_data["cost"][blueprint] = 5
			if (!structure_data["delay"][blueprint])
				structure_data["cost"][blueprint] = 20
		if ("Glass")
			blueprint = /obj/structure/table/glass
			if (!structure_data["cost"][blueprint])
				structure_data["cost"][blueprint] = 5
			if (!structure_data["delay"][blueprint])
				structure_data["cost"][blueprint] = 20

	playsound(src, 'sound/effects/pop.ogg', 50, FALSE)
	to_chat(user, span_notice("You change [name]s blueprint to '[choice]'."))

// Also pretty much rcd_create but named differently. I'm shameless, fuck you.
/obj/item/construction/tables/proc/create_table(atom/A, mob/user)
	if (!structure_data || !isopenturf(A))
		return FALSE

	if (checkResource(structure_data["cost"][blueprint], user) && blueprint)
		if (do_after(user, structure_data["delay"][blueprint], target = A))
			if (checkResource(structure_data["cost"][blueprint], user) && canPlace(A))
				useResource(structure_data["cost"][blueprint], user)
				activate()
				playsound(src.loc, 'sound/machines/click.ogg', 50, TRUE)
				new blueprint(A, FALSE, FALSE)
				return TRUE

/obj/item/construction/tables/proc/canPlace(turf/T)
	if (!isopenturf(T))
		return FALSE
	. = TRUE
	for (var/obj/O in T.contents)
		if (O.density)	// Let's not put a table over anything dense, like you. That's just stupid.
			return FALSE

/obj/item/construction/tables/afterattack(atom/A, mob/user)
	. = ..()
	if (!range_check(A, user))
		return
	if (istype(A, /obj/structure/table))
		var/obj/structure/table/T = A
		if (do_after(user, 20, target = T))
			qdel(T)	// You don't get shit back. That would be no bueno.
			playsound(get_turf(src), 'sound/machines/click.ogg', 50, TRUE)	// CLICK.
	else
		create_table(A, user)

/obj/item/construction/tables/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] sets the RTC to 'Glass Table' and points it down [user.p_their()] throat! It looks like [user.p_theyre()] trying to commit suicide."))
	return (BRUTELOSS)
