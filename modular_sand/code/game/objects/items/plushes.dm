// Honestly, i was just sad when i made this, if you don't my sadness moment, simply delete the file or comment it out.

/obj/item/toy/plush/saliith
	name = "Saliith plushie"
	desc = "It has seen better days."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "saliith"
	gender = MALE
	can_random_spawn = FALSE

/obj/item/toy/plush/saliith/examine(mob/user)
	. = ..()
	. += "[p_they(TRUE)] seems depressed."
	if(!stuffed)
		. += span_deadsay("[p_they(TRUE)] [p_are()] dead.")
	else
		if((length(user?.mind?.antag_datums) >= 1) && user.ckey != "sandpoot")
			. += "[src] looks at you menacingly, patting [p_them()] does NOT look like a good idea."

/obj/item/toy/plush/saliith/attack_self(mob/user)
	if(user.ckey == "sandpoot")
		return ..()
	var/special_friend = FALSE
	for(var/datum/antagonist/A in user?.mind?.antag_datums)
		if(istype(A, /datum/antagonist/changeling/xenobio))
			special_friend = TRUE // Doesn't help if they're evil anyways on the else
			continue
		else
			to_chat(user, span_warning("This was a bad idea."))
			user.gib()
			return
	if(special_friend)
		to_chat(user, "[src] looks at you hesitantly, but lets you carry on anyhow.")
	if(grenade)
		qdel(grenade)
	return ..()

/obj/item/toy/plush/saliith/attackby(obj/item/I, mob/living/user, params)
	if(user.ckey == "sandpoot")
		return ..()
	if(I.get_sharpness())
		to_chat(user, "[src] shatters \the [I]!")
		qdel(I)
		return
	if(istype(I, /obj/item/grenade))
		to_chat(user, "[src] forces \the [I] into your mouth!")
		var/obj/item/grenade/bad_idea = I
		bad_idea.forceMove(user)
		bad_idea.preprime(volume = 10)
		return
	return ..()

/obj/item/toy/plush/saliith/ex_act(severity, target, origin)
	return

/obj/item/toy/plush/plushling/plushie_absorb(obj/item/toy/plush/victim)
	if(istype(victim, /obj/item/toy/plush/saliith))
		visible_message(span_warning("[victim] violently parries the impostor!"))
		new /obj/effect/gibspawner(get_turf(src))
		qdel(src)
		return
	return ..()

/obj/item/toy/plush/love(obj/item/toy/plush/Kisser, mob/living/user)
	if(user.ckey != "sandpoot")
		if(istype(src, /obj/item/toy/plush/saliith))
			user.show_message(span_notice("[src] refuses socializing with [Kisser]!"), MSG_VISUAL,
				span_notice("That didn't feel like it worked."), NONE)
			return
		if(istype(Kisser, /obj/item/toy/plush/saliith))
			user.show_message(span_notice("[Kisser] refuses socializing with [src]!"), MSG_VISUAL,
				span_notice("That didn't feel like it worked."), NONE)
			return
	return ..()
