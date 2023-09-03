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
			to_chat(H, span_warning("No! No fucking way I'm touching this shit without at LEAST latex gloves!"))
			return
		if(!istype(H.get_inactive_held_item(), /obj/item/storage/bag/trash))
			to_chat(H, span_warning("I'd.. need a trashbag or similar to stash all this shit."))
			return

		H.visible_message(span_notice("[H] starts cleaning \the [src]![prob(0.1) ? " All for free.." : ""]"), span_notice("You start.. scooping all the shit into the trash bag.. Eugh."))
		if(!do_after(H, 130, target = src))
			H.visible_message(span_notice("[H] gives up!"), span_warning("Fuck this shit."))
			return
		H.visible_message(span_notice("[H] finishes cleaning \the [src]!"), span_notice("You're finally done. Thank fuck."))
		var /obj/structure/urinal/cleaned = new /obj/structure/urinal(loc, dir, TRUE)
		cleaned.pixel_y = src.pixel_y
		cleaned.pixel_x = src.pixel_x
		qdel(src)
		return
	return ..()

/obj/structure/urinal/shit/screwdriver_act(mob/living/user, obj/item/I)
	return FALSE

/obj/structure/curtain
	icon_state = "curtain_open"

/obj/structure/curtain/goliath
	name = "goliath curtain"
	desc = "Because tribals need privacy too."
	icon = 'modular_splurt/icons/obj/structures/bathroom.dmi'
	icon_state = "goliath_curtain_open"
	color = null //Default color, didn't bother hardcoding other colors, mappers can and should easily change it.
	alpha = 200 //Mappers can also just set this to 255 if they want curtains that can't be seen through <- No longer necessary unless you don't want to see through it no matter what.
	layer = SIGN_LAYER
	anchored = TRUE
	max_integrity = 125.

/obj/structure/curtain/update_icon_state()
	. = ..()
	if(!open)
		icon_state = replacetext(initial(icon_state), "open", "closed")
	else
		icon_state = initial(icon_state)
