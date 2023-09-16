/obj/structure/urinal/shit
	name = "shit-stained urinal (Legendary object)"
	desc = "The- dear God, what the fuck happened here?! Your eyes are met with a scene of absolute horror. The pungent stench of decay and neglect permeates the air, assaulting your senses and threatening to overpower your very soul. A primal scream of revulsion builds within you, but you suppress it, for you must brave this vile sight to bear witness to the grotesque aftermath. The urinal, once a symbol of utilitarian simplicity, now stands before you as a monument to the darkest depths of human depravity. Its porcelain surface, once pristine and immaculate, now resembles a nightmarish canvas upon which a malevolent artist has unleashed their chaotic fury. Brown streaks, like sinister brushstrokes, mar the once-white canvas, forming a grotesque abstract artistry of filth. The contents within this cursed receptacle defy all rationality and beg the question: How could such an unholy mess come into existence? Was it the consequence of an unruly horde of unbridled inebriation, carelessly and mercilessly defiling this sacred place? Or perhaps, the result of some demonic force that has chosen this mundane fixture as the battleground for a cosmic clash of excremental proportions? The splatters and smears, they speak of a calamity beyond comprehension, as if a malevolent tornado of fecal matter had torn through this tiny porcelain sanctuary. The very sight of it sends shivers down your spine, and you find yourself questioning the essence of humanity's decency. Oh, the inhumanity! This is not just a simple urinal, but a testament to the fall of civilization itself! It is as if all the horrors of the world have been distilled into this singular, stomach-churning spectacle, a repugnant symbol of our society's decline. You depart from this wretched place, but the haunting image of the shit-stained urinal will forever be etched in your mind, an enduring reminder of the fragility of order and the terrifying chaos that lurks beneath the surface of our civilization. May we learn from this abomination, lest we become lost in the abyss of our own decay."
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
