//Main code edits
/obj/structure/table/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/crawl_under)

/obj/structure/table/CanPass(atom/movable/mover, turf/target)
	if(mover.pass_flags & PASSCRAWL)
		return TRUE
	return ..()

/obj/structure/table/glass/check_break(mob/living/M)
	if(M.pass_flags & PASSCRAWL)
		return
	. = ..()

/obj/structure/table/glass/table_shatter(mob/living/L)
	var/turf/F = get_turf(src) // Because modularized procs ignore original's defined vars.
	if(prob(1)) // Took about 33 broken glass tables to play the meme on local testing.
		playsound(F, 'modular_splurt/sound/misc/ourtable.ogg', 100, 0)
	. = ..()

//Own stuff
/obj/structure/table/wood/shadow
	name = "shadow wood table"
	icon = 'modular_splurt/icons/obj/smooth_structures/table_shadow.dmi'
	icon_state = "table_shadow"
	frame = /obj/structure/table_frame/shadow_wood
	framestack = /obj/item/stack/sheet/mineral/wood/shadow
	buildstack = /obj/item/stack/sheet/mineral/wood/shadow
	canSmoothWith = list(/obj/structure/table/wood/shadow,
		/obj/structure/table/wood/poker/shadow
		)

/obj/structure/table/wood/mushroom
	name = "mushroom table"
	desc = "A pinkish table. And is fireproof!"
	icon = 'modular_splurt/icons/obj/smooth_structures/table_mushwood.dmi'
	icon_state = "table_mushwood"
	frame = /obj/structure/table_frame/mushwood
	framestack = /obj/item/stack/sheet/mineral/wood/mushroom
	buildstack = /obj/item/stack/sheet/mineral/wood/mushroom
	resistance_flags = FIRE_PROOF
	canSmoothWith = list(/obj/structure/table/wood/mushroom,
		/obj/structure/table/wood/poker/mushroom
		)

/obj/structure/table/wood/poker/shadow //No specialties, Just a mapping object.
	icon = 'modular_splurt/icons/obj/smooth_structures/poker_table_shadow.dmi'
	icon_state = "poker_shadow"
	frame = /obj/structure/table_frame/shadow_wood
	framestack = /obj/item/stack/sheet/mineral/wood/shadow
	canSmoothWith = list(/obj/structure/table/wood/shadow,
		/obj/structure/table/wood/poker/shadow
		)

/obj/structure/table/wood/poker/mushroom
	icon = 'modular_splurt/icons/obj/smooth_structures/poker_table_mushwood.dmi'
	icon_state = "poker_mush"
	frame = /obj/structure/table_frame/mushwood
	framestack = /obj/item/stack/sheet/mineral/wood/mushroom
	canSmoothWith = list(/obj/structure/table/wood/mushroom,
		/obj/structure/table/wood/poker/mushroom
		)

// Rope hooks
/obj/structure/table/AfterPutItemOnTable(obj/item/I, mob/living/user)
	if(istype(I, /obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/rope = I
		if(rope.rope_state == ROPE_STATE_DECIDING_OBJECT)
			rope.set_roped_master(user)
			rope.process_object(src, user)
	. = ..()
