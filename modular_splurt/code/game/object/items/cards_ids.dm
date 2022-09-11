/obj/item/card/id/syndicate/slaver
	name = "\improper Slaver Trader ID"
	desc = "A cheap ID used by slave traders."
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_SLAVER)

/obj/item/card/id/syndicate/slaver/leader
	name = "\improper Slaver Master ID"
	desc = "A cheap ID used by slave traders. This guy seems to run the show."

/obj/item/card/emag
	var/restricted = FALSE

/obj/item/card/emag/afterattack(atom/target, mob/user, proximity)
	. = ..()
	var/atom/A = target
	if(!proximity && prox_check || !(isobj(A) || issilicon(A) || isbot(A) || isdrone(A)))
		return
	if(istype(A, /obj/item/storage) && !(istype(A, /obj/item/storage/lockbox) || istype(A, /obj/item/storage/pod)))
		return
	if(restricted && !is_type_in_typecache(A, GLOB.restricted_emag_allowed))
		user.visible_message("<span class='warning'>A light blinks on [src]. Seems it doesn't work here.</span>")
		return
	if(!uses)
		user.visible_message("<span class='warning'>[src] emits a weak spark. It's burnt out!</span>")
		playsound(src, 'sound/effects/light_flicker.ogg', 100, 1)
		return
	else if(uses <= 3)
		playsound(src, 'sound/effects/light_flicker.ogg', 30, 1)	//Tiiiiiiny warning sound to let ya know your emag's almost dead
	if(!A.emag_act(user))
		return
	uses = max(uses - 1, 0)
	if(!uses)
		user.visible_message("<span class='warning'>[src] fizzles and sparks. It seems like it's out of charges.</span>")
		playsound(src, 'sound/effects/light_flicker.ogg', 100, 1)

/obj/item/card/emag/restricted
	name = "restricted cryptographic sequencer"
	desc = "It's a card with a magnetic strip attached to some circuitry. Only works on certain appliances."
	uses = 5
	restricted = TRUE

