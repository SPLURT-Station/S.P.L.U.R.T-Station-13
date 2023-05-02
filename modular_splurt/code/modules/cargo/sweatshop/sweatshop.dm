//THE TOOLS
/obj/item/carpentry
	name = "carpentry"
	desc = "You shouldn't be seeing this!"
	icon = 'modular_splurt/icons/obj/cargo/sweatshop/sweatshop.dmi'
	usesound = list('sound/effects/picaxe1.ogg', 'sound/effects/picaxe2.ogg', 'sound/effects/picaxe3.ogg')

/obj/item/carpentry/handsaw
	name = "handsaw"
	desc = "A shoddy tool used to process wood into smaller segments."
	icon_state = "handsaw"
	slot_flags = ITEM_SLOT_BACK
	force = 8
	sharpness = TRUE
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = list(/datum/material/iron=50)
	attack_verb_continuous = list("slashes", "saws")
	attack_verb_simple = list("slash", "saw")

/obj/item/carpentry/hammer
	name = "hammer"
	desc = "A tool used to manually bash nails into place."
	icon_state = "hammer"
	slot_flags = ITEM_SLOT_BELT
	force = 7
	sharpness = FALSE
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron=100)
	attack_verb_continuous = list("bonks", "nails")
	attack_verb_simple = list("bonk", "nail")

/obj/item/carpentry/glue
	name = "glue"
	desc = "Used to haphazardly stick things together; secured by the toughest Monkey Glue(TM)."
	icon_state = "glue"
	force = 0
	sharpness = FALSE
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/plastic=25)
	attack_verb_continuous = list("glues", "coughs")
	attack_verb_simple = list("glue", "cough")

/obj/item/carpentry/borer
	name = "manual borer"
	desc = "An incredibly awful tool used to manually drill holes into something... Surely there's a better option."
	icon_state = "borer"
	force = 3
	sharpness = TRUE
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=25)
	attack_verb_continuous = list("bores", "drills")
	attack_verb_simple = list("bore", "drill")

/obj/item/carpentry/sandpaper
	name = "sandpaper strip"
	desc = "A strip of sandpaper, commonly used for sanding down rough surfaces into a more smooth shape."
	icon_state = "sandpaper"
	force = 1
	sharpness = FALSE
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/glass=1) //lmao
	attack_verb_continuous = list("sands", "licks")
	attack_verb_simple = list("sand", "lick")

/obj/item/nails
	name = "metal nails"
	desc = "A bunch of nails, used for hammering into things."
	icon = 'modular_splurt/icons/obj/cargo/sweatshop/sweatshop.dmi'
	icon_state = "nails"
	force = 0
	sharpness = TRUE
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/iron=10)
	attack_verb_continuous = list("nails", "screws")
	attack_verb_simple = list("nail", "screw")

/obj/item/cushion
	name = "basic cushion"
	desc = "Beats sitting on the floor."
	icon = 'modular_splurt/icons/obj/cargo/sweatshop/cloth.dmi'
	icon_state = "clothcushion"
	force = 0
	sharpness = FALSE
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb_continuous = list("thomps", "thwacks")
	attack_verb_simple = list("thomp", "thwack")

/obj/item/cushion/silk
	name = "silk cushion"
	desc = "How'd it turn red?!"
	icon_state = "silkcushion"

//BASIC RECIPES - To do, add sound. As well as refactor everything in a more smart way so we can add the possibility of multiple wood types in the future.
//saw a plank into two platforms
/obj/item/processed/wood/plank/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/handsaw))
		to_chat(user,span_notice(" You begin to saw [src] in half..."))
		if(do_after(user, 40, target = src) && isturf(loc))
			new src.sawobj(loc)
			new src.sawobj(loc) //send help i dont know how to make two in the same line lmfao
			to_chat(user, span_notice(" You saw [src] in half."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to saw [src]!"))
	else
		..()
//saw a platform into four blocks
/obj/item/processed/wood/platform/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/handsaw))
		to_chat(user,span_notice(" You begin cut [src] into smaller pieces..."))
		if(do_after(user, 20, target = src) && isturf(loc))
			new src.sawobj(loc)
			new src.sawobj(loc)
			new src.sawobj(loc)
			new src.sawobj(loc)
			to_chat(user, span_notice(" You cut [src] into four pieces."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to saw [src]!"))
	else
		..()
//sand a block into a peg
/obj/item/processed/wood/block/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/sandpaper))
		to_chat(user,span_notice(" You carefully begin to sand down [src]..."))
		if(do_after(user, 50, target = src) && isturf(loc))
			new src.sandobj(loc)
			to_chat(user, span_notice(" You smooth [src] into a peg."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to sand [src]!"))
	else
		..()
//cut heated metal into nails
/obj/item/processed/metal/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wirecutters))
		to_chat(user,span_notice(" You tediously begin to cut [src] into several nails..."))
		if(do_after(user, 80, target = src) && isturf(loc))
			new /obj/item/nails(loc)
			new /obj/item/nails(loc)
			to_chat(user, span_notice(" You make some crude metal nails."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to process [src]!"))
	else
		..()

//Covered in glue
//cover a wooden block in glue
/obj/item/processed/wood/block/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/glue))
		to_chat(user,span_notice(" You begin to glue down one end of [src]..."))
		if(do_after(user, 10, target = src) && isturf(loc))
			new src.glueobj(loc)
			to_chat(user, span_notice(" You slap some glue onto [src]."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to glue [src]!"))
	else
		..()
//cover a wooden peg in glue
/obj/item/processed/wood/peg/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/glue))
		to_chat(user,span_notice(" You begin to glue down one end of the [src]..."))
		if(do_after(user, 10, target = src) && isturf(loc))
			new src.glueobj(loc)
			to_chat(user, span_notice(" You slap some glue onto [src]."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to glue [src]!"))
	else
		..()

//Seats
//bore a platform into a seat
/obj/item/processed/wood/platform/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/borer))
		to_chat(user,span_notice(" You begin to cut four holes into [src]..."))
		if(do_after(user, 40, target = src) && isturf(loc))
			new src.boreobj(loc)
			to_chat(user, span_notice(" You drill four holes into [src]."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to refine [src]!"))
	else
		..()

//Stools - Further crafting
/obj/item/processed/wood/stool1/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/nails))
		to_chat(user,span_notice(" You place nails into [src]..."))
		if(do_after(user, 20, target = src) && isturf(loc))
			new /obj/item/processed/wood/stool2(loc)
			to_chat(user, span_notice(" The nails are ready to be hammered."))
			qdel(src)
			qdel(I)
		else
			to_chat(user, span_warning("You need to hold still to refine [src]!"))
	else
		..()

/obj/item/processed/wood/stool2/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/hammer))
		to_chat(user,span_notice(" You begin to hammer the [src]..."))
		if(do_after(user, 30, target = src) && isturf(loc))
			new /obj/item/processed/wood/stool3(loc)
			to_chat(user, span_notice(" The nails are hammered into place."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to refine [src]!"))
	else
		..()

/obj/item/processed/wood/stool3/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/carpentry/sandpaper))
		to_chat(user,span_notice(" You begin to sand the [src]..."))
		if(do_after(user, 30, target = src) && isturf(loc))
			new /obj/item/processed/wood/stool4(loc)
			to_chat(user, span_notice(" You sand down the [src]."))
			qdel(src)
		else
			to_chat(user, span_warning("You need to hold still to refine [src]!"))
	else
		..()

/obj/item/processed/wood/stool4/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/processed/wood/glueblock))
		to_chat(user,span_notice(" You add some finishing touches to the [src]..."))
		if(do_after(user, 30, target = src) && isturf(loc))
			new /obj/item/processed/wood/stool(loc)
			to_chat(user, span_notice(" You complete the [src]."))
			qdel(src)
			qdel(I)
		else
			to_chat(user, span_warning("You need to hold still to refine [src]!"))
	else
		..()

/obj/item/processed/wood/stool/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cushion))
		to_chat(user,span_notice(" You secure a cloth cushion to [src]..."))
		if(do_after(user, 30, target = src) && isturf(loc))
			new /obj/item/processed/wood/stoolcloth(loc)
			to_chat(user, span_notice(" You add a cushion to [src]."))
			qdel(src)
			qdel(I)
		else
			to_chat(user, span_warning("You need to hold still to detail [src]!"))
	else
		..()

/obj/item/processed/wood/stool/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cushion/silk))
		to_chat(user,span_notice(" You secure a silk cushion to [src]..."))
		if(do_after(user, 30, target = src) && isturf(loc))
			new /obj/item/processed/wood/stoolsilk(loc)
			to_chat(user, span_notice(" You add a cushion to [src]."))
			qdel(src)
			qdel(I)
		else
			to_chat(user, span_warning("You need to hold still to detail [src]!"))
	else
		..()
