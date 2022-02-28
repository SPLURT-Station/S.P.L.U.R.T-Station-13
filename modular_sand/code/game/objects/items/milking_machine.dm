/obj/item/milking_machine
	icon = 'modular_sand/icons/obj/milking_machine.dmi'
	name = "milking machine"
	icon_state = "Off"
	item_state = "Off"
	desc = "A pocket sized pump and tubing assembly designed to collect and store products from mammary glands."

	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_POCKETS

	var/on = FALSE
	var/obj/item/reagent_containers/inserted_item = null

	var/milking_speed = 50
	var/engine_sound = 'sound/vehicles/carrev.ogg'
	var/target_organ  = ORGAN_SLOT_BREASTS // What organ we are transfering from
	var/inuse = 0

/obj/item/milking_machine/Initialize()
	. = ..()
	item_flags |= NOBLUDGEON //No more attack messages

/obj/item/milking_machine/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>[src] is currently [on ? "on" : "off"].</span>")
	if (inserted_item)
		to_chat(user, "<span class='notice'>[inserted_item] contains [inserted_item.reagents.total_volume]/[inserted_item.reagents.maximum_volume] units</span>")

/obj/item/milking_machine/attackby(obj/item/W, mob/user, params)
	add_fingerprint(user)
	if(istype(W, /obj/item/reagent_containers/) && !inserted_item)
		if(!user.transferItemToLoc(W, src))
			return ..()
		inserted_item = W
		UpdateIcon()
	else
		return ..()

/obj/item/milking_machine/interact(mob/user)
	if(!isAI(user) && inserted_item)
		add_fingerprint(user)
		on = !on
		if (on)
			to_chat(user, "<span class='notice'>You turn [src] on.</span>")
		else
			to_chat(user, "<span class='notice'>You turn [src] off.</span>")
		UpdateIcon()
	else
		..()

/obj/item/milking_machine/proc/UpdateIcon()
	icon_state = "[on ? "On" : "Off"][inserted_item ? "Beaker" : ""]"
	item_state = icon_state


/obj/item/milking_machine/AltClick(mob/living/user)
	add_fingerprint(user)
	user.put_in_hands(inserted_item)
	inserted_item = null
	on = FALSE
	UpdateIcon()

/obj/item/milking_machine/penis
	name = "cock milker"
	icon_state = "PenisOff"
	item_state = "PenisOff"
	desc = "A pocket sized pump and tubing assembly designed to collect and store products from the penis."
	target_organ = ORGAN_SLOT_PENIS

/obj/item/milking_machine/penis/UpdateIcon()
	icon_state = "Penis[on ? "On" : "Off"][inserted_item ? "Beaker" : ""]"
	item_state = icon_state

/obj/item/milking_machine/afterattack(mob/living/carbon/human/H, mob/living/user)
	if (!on)
		to_chat(user, "<span class='notice'>You can't use the [src] while it's off.</span>")
		return

	var/obj/item/organ/genital/G = FALSE
	// Checking if a valid organ is being passed
	if (target_organ == ORGAN_SLOT_BREASTS || target_organ == ORGAN_SLOT_PENIS || target_organ == ORGAN_SLOT_VAGINA)
		G = H.getorganslot(target_organ)
	else
		return

	if(inuse == 1) //just to stop stacking and causing people to cum instantly
		return
	if(G && G.is_exposed())
		inuse = 1
		if(!(H == user)) //lewd flavour text
			H.visible_message("<span class='love'>[user] pumps [H]'s [G.name] using [p_their()] [src.name].</span>", \
							  "<span class='userlove'>[user] pumps your [G.name] with [p_their()] [src.name].</span>", \
							  "<span class='userlove'>Someone is pumping your [G.name].</span>")
		else
			user.visible_message("<span class='love'>[user] sets [src] to suck on [p_their()] [G.name].</span>", \
								 "<span class='userlove'>You pump your [G.name] using [src].</span>", \
								 "<span class='userlove'>You pump your [G.name] into the machine.</span>")
		playsound(src, engine_sound, 30, 1, -1)
		if(!do_mob(user, H, 3 SECONDS)) //3 second delay
			inuse = 0
			return
		playsound(src, 'modular_sand/sound/lewd/slaps.ogg', 20, 1, -1)
		inuse = 0

		if(prob(30)) //30% chance to make them moan.
			H.emote("moan")

		H.add_lust(20 + rand(0, 50)) //make the target more aroused. (same ammount as the fleshlight)
		if (H.get_lust() >= H.get_lust_tolerance()*3 && ishuman(H) && H.has_dna())
			H.mob_fill_container(G, inserted_item, milking_speed, src) //make them cum if they are over the edge.
			H.do_jitter_animation()
		return
	else
		to_chat(user, "<span class='notice'>You don't see anywhere to use this on.</span>")
	inuse = 0
	..()
