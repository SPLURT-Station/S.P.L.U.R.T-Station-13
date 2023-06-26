/obj/item/shibola
	name = "Shibari Bola"
	desc = "A set of skillfully entwined bondage ropes, capable of being thrown at unsuspecting targets. Clothing items may be hidden inside of it, forcing the clothing to be worn on a successful hit. Additionally, bondage ropes may be added to bind the target on hit."
	icon = 'modular_splurt/icons/obj/shibola.dmi'
	icon_state = "shibola"
	item_state = "legcuff"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	var/obj/item/payload

/obj/item/shibola/attackby(obj/item/I,mob/user,params)
	if(istype(I,/obj/item/clothing))
		var/obj/item/clothing/C = I
		if(payload)
			to_chat(user, "<span class='warning'>[src] already has something in it!</span>")
		else
			if(!user.transferItemToLoc(C, src))
				return
			payload = C
			to_chat(user, "<span class='notice'>You tangle the [src] around [C]</span>")
	else if(istype(I,/obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/R = I
		if(payload)
			to_chat(user, "<span class='warning'>[src] already has something in it!</span>")
			return
		if(R.rope_target > 2)
			to_chat(user, "<span class='warning'>Your [R] cannot target an object; choose a different target!</span>")
			return
		else
			if(!user.transferItemToLoc(R, src))
				return
			payload = R
			to_chat(user, "<span class='notice'>You strengthen the [src] with [R]</span>")
	else
		return ..()

/obj/item/shibola/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback)
	if(!..())
		return
	playsound(src.loc,'sound/weapons/bolathrow.ogg', 75, 1)

/obj/item/shibola/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(..() || !iscarbon(hit_atom))//if it gets caught or the target can't be cuffed,
		return//abort
	ensnare(hit_atom)

/obj/item/shibola/attack_self(mob/user)
	if(payload)
		to_chat(user, span_warning("You untangle the shibari bola, causing the [payload.name] to fall out!"))
		payload.forceMove(get_turf(src))
		payload = null
	else
		to_chat(user, span_warning("There is nothing to remove; try putting some clothing or bondage ropes into it first!"))

/obj/item/shibola/proc/ensnare(mob/living/carbon/C)
	visible_message("<span class='danger'>\The [src] tangles around [C]!</span>")

	if(!C.client || C.client?.prefs.nonconpref == "No")
		C.Knockdown(5)
		visible_message("<span class='danger'>\The [src] slips downwards, causing [C] to trip!</span>")
		if(payload)
			payload.forceMove(get_turf(C))
		qdel(src)
		return
	if(istype(payload,/obj/item/clothing))
		var/T = payload.slot_flags
		var/obj/item/W = C.get_item_by_slot(T)
		if(W)
			C.dropItemToGround(W)
			playsound(loc, "sound/items/poster_ripped.ogg", 70, 1, -1)
		C.equip_to_slot(payload,T)
		visible_message("<span class='danger'>\The [src] unravels, forcing [C] to wear [payload]!</span>")
		qdel(src)
		return
	if(istype(payload,/obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/R = payload
		R.bola(C)
		qdel(src)
		return
	if(!payload)
		C.Knockdown(5)
		visible_message("<span class='danger'>\The [src] slips downwards, causing [C] to trip!</span>")
		qdel(src)
		return
