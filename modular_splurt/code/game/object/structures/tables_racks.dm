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
