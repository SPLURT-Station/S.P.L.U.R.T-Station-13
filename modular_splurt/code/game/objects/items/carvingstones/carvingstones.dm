/obj/item/toy/carvingstone
	var/stone_sound = 'modular_splurt/sound/carvings/hello.ogg'
	name = "Hello Carving Stone"
	desc = "This stone has a face that looks happy to see you carved onto it."
	attack_verb = list("bonked", "bapped")
	icon = 'modular_splurt/icons/obj/carvingstones/carving_stones.dmi'
	icon_state = "hello"
	item_state = "minimeteor"
	w_class = WEIGHT_CLASS_TINY
	var/sound_cooldown_last = 0
	var/sound_cooldown = 0.8 SECONDS

/obj/item/toy/carvingstone/helpme
	stone_sound = 'modular_splurt/sound/carvings/help_me.ogg'
	name = "Help Me Carving Stone"
	desc = "This stone has a face that looks like it's calling out for help carved onto it."
	icon_state = "help_me"

/obj/item/toy/carvingstone/verygood
	stone_sound = 'modular_splurt/sound/carvings/very_good.ogg'
	name = "Very Good Carving Stone"
	desc = "This carved stone has a face that looks like it's amused onto it."
	icon_state = "very_good"

/obj/item/toy/carvingstone/imsorry
	stone_sound = 'modular_splurt/sound/carvings/im_sorry.ogg'
	name = "I'm Sorry Carving Stone"
	desc = "This carved stone has a face that looks apologetic carved onto it."
	icon_state = "im_sorry"

/obj/item/toy/carvingstone/thankyou
	stone_sound = 'modular_splurt/sound/carvings/thank_you.ogg'
	name = "Thank You Carving Stone"
	desc = "This carved stone has a face that looks grateful carved onto it."
	icon_state = "thank_you"

/obj/item/toy/carvingstone/attack(atom/target, mob/living/user, proximity_flag, clickparams)
	. = ..()
	MakeStoneSound(target)

/obj/item/toy/carvingstone/throw_impact(atom/hit_atom)
	..()
	MakeStoneSound(hit_atom)
	MakeHitSound(hit_atom)

/obj/item/toy/carvingstone/attack_self(mob/user)
	..()
	if(sound_cooldown_last < world.time)
		MakeStoneSound(user)
		sound_cooldown_last = world.time + sound_cooldown

/obj/item/toy/carvingstone/proc/MakeStoneSound(atom/movable/hit_atom)
	var/turf/T = get_turf(hit_atom)
	playsound(T, stone_sound, 100, FALSE)

/obj/item/toy/carvingstone/proc/MakeHitSound(atom/movable/hit_atom)
	var/turf/T = get_turf(hit_atom)
	playsound(T, hitsound, 100, FALSE)


/datum/supply_pack/costumes_toys/carvingstones
	name = "Carving Stones Crate"
	desc = "Let your friends and foes know what you think about them, via stone-to-face communication!"
	cost = 400
	contains = list(/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/helpme,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/verygood,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/thankyou,
	/obj/item/toy/carvingstone/imsorry,
	/obj/item/toy/carvingstone/imsorry,
	)
	crate_name = "Carving Stones Crate"
	crate_type = /obj/structure/closet/crate/wooden
