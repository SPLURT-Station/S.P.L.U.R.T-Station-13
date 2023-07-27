/obj/item/toy/carvingstone
	var/on_break_sound = 'modular_splurt/sound/carvings/hello.ogg'
	name = "Hello Carving Stone"
	desc = "This stone has a face that looks happy to see you carved onto it."
	icon = 'modular_splurt/icons/carvingstones/Carving_Stones.dmi'
	icon_state = "hello"
	item_state = "minimeteor"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/carvingstone/helpme
	on_break_sound = 'modular_splurt/sound/carvings/help_me.ogg'
	name = "Help Me Carving Stone"
	desc = "This stone has a face that looks like it's calling out for help carved onto it."
	icon_state = "help_me"

/obj/item/toy/carvingstone/verygood
	on_break_sound = 'modular_splurt/sound/carvings/very_good.ogg'
	name = "Very Good Carving Stone"
	desc = "This carved stone has a face that looks like it's amused onto it."
	icon_state = "very_good"

/obj/item/toy/carvingstone/imsorry
	on_break_sound = 'modular_splurt/sound/carvings/im_sorry.ogg'
	name = "I'm Sorry Carving Stone"
	desc = "This carved stone has a face that looks apologetic carved onto it."
	icon_state = "im_sorry"

/obj/item/toy/carvingstone/thankyou
	on_break_sound = 'modular_splurt/sound/carvings/thank_you.ogg'
	name = "Thank You Carving Stone"
	desc = "This carved stone has a face that looks grateful carved onto it."
	icon_state = "thank_you"

/obj/item/toy/carvingstone/throw_impact(atom/hit_atom)
	BreakStone(hit_atom)

/obj/item/toy/carvingstone/attack_self(mob/user)
	BreakStone(user)

/obj/item/toy/carvingstone/afterattack(atom/O, mob/user, proximity)
	BreakStone(O)

/obj/item/toy/carvingstone/proc/BreakStone(atom/movable/hit_atom)
	hit_atom.visible_message("<span class='notice'>The [src] breaks</span>")
	var/turf/T = get_turf(hit_atom)
	playsound(T, on_break_sound, 100, FALSE)
	qdel(src)

/datum/supply_pack/costumes_toys/carvingstones
	name = "Carving Stones Crate"
	desc = "Let your friends or foes know what you think about them, via stone-to-face communication!"
	cost = 400
	contains = list(/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/imsorry,
	/obj/item/toy/carvingstone/imsorry,
	/obj/item/toy/carvingstone/imsorry,
	/obj/item/toy/carvingstone/imsorry,
	/obj/item/toy/carvingstone/imsorry
	)
	crate_name = "Carving Stones Crate"
	crate_type = /obj/structure/closet/crate/wooden
