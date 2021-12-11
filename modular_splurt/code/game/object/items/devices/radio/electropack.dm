/obj/item/electropack/shockcollar/slave
	name = "slave collar"
	desc = "A reinforced metal collar. This one has a shock element and tracker installed."

	var/price = 0
	var/bought = FALSE
	shockStrength = 400
	shockCooldown = 200
	code = -1
	frequency = -1

/obj/item/electropack/shockcollar/slave/Initialize()
	GLOB.tracked_slaves += src
	. = ..()


/obj/item/electropack/shockcollar/slave/Destroy()
	visible_message("<span class='notice'>The [src] detaches from [src.loc]'s neck.</span>", \
		"<span class='notice'>The [src] detaches from your neck.</span>")
	playsound(get_turf(src.loc), 'sound/machines/terminal_eject_disc.ogg', 50, 1)
	GLOB.tracked_slaves -= src
	. = ..()

// Don't let user change frequency.
/obj/item/electropack/shockcollar/slave/attack_self(mob/living/user)
	return

// Once equipped, do not let anyone take it off
/obj/item/electropack/shockcollar/slave/equipped(mob/user, slot)
	. = ..()

	if(isliving(user))
		var/mob/living/M = user
		if(slot == SLOT_NECK)
			playsound(get_turf(M), 'sound/machines/triple_beep.ogg', 50, 1)
			ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)
