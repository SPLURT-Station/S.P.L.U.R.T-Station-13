//hyperstation 13 stripper pole! about time?

/obj/structure/pole
	name = "stripper pole"
	desc = "A pole fastened to the ceiling and floor, used to show of ones goods to company."
	icon = 'modular_splurt/icons/obj/pole.dmi'
	icon_state = "pole"
	density = TRUE
	anchored = TRUE
	var/icon_state_inuse
	layer = 4 //make it the same layer as players.
	pseudo_z_axis = 9 //stepping onto the pole makes you raise upwards!
	density = 0 //easy to step up on

/obj/structure/pole/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(obj_flags & IN_USE)
		to_chat(user, "It's already in use - wait a bit.")
		return
	else
		obj_flags |= IN_USE
		user.setDir(SOUTH)
		user.Stun(100)
		user.forceMove(src.loc)
		user.visible_message("<B>[user] dances on [src]!</B>")
		animatepole(user)
		user.layer = layer //set them to the poles layer
		obj_flags &= ~IN_USE
		user.pixel_y = 0
		user.pixel_z = pseudo_z_axis //incase we are off it when we jump on!
		icon_state = initial(icon_state)

/obj/structure/pole/proc/animatepole(mob/living/user)
	return

/obj/structure/pole/animatepole(mob/living/user)

	if (user.loc != src.loc)
		return
	animate(user,pixel_x = -6, pixel_y = 0, time = 10)
	sleep(20)
	user.dir = 4
	animate(user,pixel_x = -6,pixel_y = 24, time = 10)
	sleep(12)
	src.layer = 4.01 //move the pole infront for now. better to move the pole, because the character moved behind people sitting above otherwise
	animate(user,pixel_x = 6,pixel_y = 12, time = 5)
	user.dir = 8
	sleep(6)
	animate(user,pixel_x = -6,pixel_y = 4, time = 5)
	user.dir = 4
	src.layer = 4 // move it back.
	sleep(6)
	user.dir = 1
	animate(user,pixel_x = 0, pixel_y = 0, time = 3)
	sleep(6)
	user.do_jitter_animation()
	sleep(6)
	user.dir = 2


/obj/item/polepack
	name 				= "stripper pole flatpack"
	desc 				= "A wrench is required to construct."
	icon 				= 'modular_splurt/icons/obj/pole.dmi'
	throwforce			= 0
	icon_state 			= "pole_base"
	var/unwrapped			= 0
	w_class = WEIGHT_CLASS_HUGE

/obj/item/polepack/attackby(obj/item/P, mob/user, params) //erecting a pole here.
	add_fingerprint(user)
	if(istype(P, /obj/item/wrench))
		if (!(item_flags & IN_INVENTORY))
			to_chat(user, "<span class='notice'>You start to fasten the frame to the floor and celing...</span>")
			if(P.use_tool(src, user, 8 SECONDS, volume=50))
				to_chat(user, "<span class='notice'>You construct the stripper pole!</span>")
				var/obj/structure/pole/C = new
				C.loc = loc
				del(src)
			return

/obj/structure/pole/attackby(obj/item/P, mob/user, params) //un-erecting a pole. :(
	add_fingerprint(user)
	if(istype(P, /obj/item/wrench))
		to_chat(user, "<span class='notice'>You start to unfastening the frame...</span>")
		if(P.use_tool(src, user, 8 SECONDS, volume=50))
			to_chat(user, "<span class='notice'>You take down the stripper pole!</span>")
			var/obj/item/polepack/C = new
			C.loc = loc
			del(src)
		return
