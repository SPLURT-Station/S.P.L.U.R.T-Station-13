/obj/structure/micro_brick
	icon = 'modular_splurt/icons/obj/small_world.dmi'
	anchored = FALSE
	var/buildstacktype = /obj/item/stack/sheet/micro_bricks

/obj/structure/micro_brick/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/simple_rotation,ROTATION_ALTCLICK | ROTATION_CLOCKWISE)

/obj/structure/micro_brick/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_PARENT_ATTACKBY, PROC_REF(on_attackby))
	RegisterSignal(src, COMSIG_ATOM_ATTACK_HAND, PROC_REF(handatacc))

/obj/structure/micro_brick/proc/on_attackby(datum/source, obj/item/item, mob/user, params)
	if(try_crush_microbricks(user))
		return TRUE

	if(istype(item, /obj/item/carpentry/glue))
		to_chat(user,span_notice("You glue the bricks to the floor."))
		anchored = TRUE
		return TRUE

	if(istype(item, /obj/item/crowbar))
		to_chat(user,span_notice("You pry the bricks from the floor."))
		anchored = FALSE
		return TRUE

	//probably could better, but im busy playing warframe rn to help Summer lmao -Dahl
	// Moved it to the top, MERP! Also... i CHANGED THE CODE. Side note, AAAAAAA! -Summer

/obj/structure/micro_brick/proc/handatacc(datum/source, mob/user, list/modifiers)
	return try_crush_microbricks(user)

/obj/structure/micro_brick/proc/try_crush_microbricks(mob/stomper)
	if(stomper.a_intent != INTENT_HARM)
		return FALSE
	to_chat(stomper, "You crush the microbrick structure, what a monster!")

	playsound(src, pick('modular_splurt/sound/effects/bricks_1.ogg', 'modular_splurt/sound/effects/bricks_2.ogg'), 30, 0)
	//I Stepped on these legos that i bought. and it hurts :( -Summer
	qdel(src)
	return TRUE

/obj/structure/micro_brick/road_fourway
	name = "Road fourway"
	desc = "roundabouts are better!"
	icon_state = "roadfourway"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 2

/obj/structure/micro_brick/road_threeway
	name = "Road threeway"
	desc = "Ill take the back you get the front."
	icon_state = "roadthreeway"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 1

/obj/structure/micro_brick/road_straight
	name = "Road straight"
	desc = "Is it gay if the balls touch?"
	icon_state = "roadstraight"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 1

/obj/structure/micro_brick/Road_turn
	name = "Road turn"
	desc = "Bending the Rules."
	//i cannot find a joke for this :(
	icon_state = "roadturn"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 1

/obj/structure/micro_brick/small_house
	name = "Small houses"
	desc = "Lets hope this household does their taxes!"
	icon_state = "smallhouses"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 5

/obj/structure/micro_brick/small_business
	name = "Small business"
	desc = "A place for not many 9's with how many 5's"
	icon_state = "smallbusiness"
	var/rotation_flags = TRUE
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 5

/obj/structure/micro_brick/small_warehouse
	name = "Small warehouse"
	desc = "The house has been exposed to the moon light and is now a warehouse!"
	// https://i.redd.it/4ke5819c2ib61.jpg
	icon_state = "warehouse"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 5

/obj/structure/micro_brick/small_museum
	name = "Small museum"
	desc = "A place to store old and small relics found around the station "
	icon_state = "smallmuseum"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 30
	var/buildstackamount = 5

/obj/item/moon
	name = "Small moon"
	icon_state = "smallmoon"
	icon = 'modular_splurt/icons/obj/small_world.dmi'
	desc = "You now have the power of the moon on your side"
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	force = 0
	total_mass = TOTAL_MASS_TINY_ITEM
