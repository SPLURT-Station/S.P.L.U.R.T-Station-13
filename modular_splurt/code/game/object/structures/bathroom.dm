/obj/structure/urinal/shit
	name = "shit-stained urinal"
	desc = "The- Dear God, what the fuck happened here?!"
	icon = 'modular_splurt/icons/obj/structures/bathroom.dmi'
	icon_state = "shit_urinal"

/obj/structure/urinal/shit/Initialize()
	. = ..()
	QDEL_NULL(hiddenitem)

/obj/structure/urinal/shit/examine(mob/user)
	. = ..()
	if(iscarbon(user) && prob(5))
		var/mob/living/carbon/C = user
		C.vomit()

/obj/structure/urinal/shit/attackby(obj/item/I, mob/living/user, params)
	. = COMPONENT_NO_AFTERATTACK
	if(!ishuman(user))
		return ..()
	var/mob/living/carbon/human/H = user
	if(istype(I, /obj/item/soap))
		if(!istype(H.gloves, /obj/item/clothing/gloves/color/latex))
			to_chat(H, "<span class='warning'>No! No fucking way I'm touching this shit without at LEAST latex gloves!</span>")
			return
		if(!istype(H.get_inactive_held_item(), /obj/item/storage/bag/trash))
			to_chat(H, "<span class='warning'>I'd.. need a trashbag or similar to stash all this shit.</span>")
			return

		H.visible_message("<span class='notice'>[H] starts cleaning \the [src]![prob(0.1) ? " All for free.." : ""]</span>", "<span class='notice'>You start.. scooping all the shit into the trash bag.. Eugh.</span>")
		if(!do_after(H, 130, target = src))
			H.visible_message("<span class='notice'>[H] gives up!</span>", "<span class='warning'>Fuck this shit.</span>")
			return
		H.visible_message("<span class='notice'>[H] finishes cleaning \the [src]!</span>", "<span class='notice'>You're finally done. Thank fuck.'</span>")
		new /obj/structure/urinal(loc, dir, TRUE)
		return
	return ..()

/obj/structure/urinal/shit/screwdriver_act(mob/living/user, obj/item/I)
	return FALSE

/obj/structure/curtain/goliath
	name = "goliath curtain"
	desc = "Because tribals need privacy too."
	icon = 'modular_splurt/icons/obj/structures/bathroom.dmi'
	icon_state = "goliath_curtain"
	color = null //Default color, didn't bother hardcoding other colors, mappers can and should easily change it.
	alpha = 200 //Mappers can also just set this to 255 if they want curtains that can't be seen through <- No longer necessary unless you don't want to see through it no matter what.
	layer = SIGN_LAYER
	anchored = TRUE
	max_integrity = 125.
