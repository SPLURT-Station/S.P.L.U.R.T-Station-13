/obj/item/misc/potato
	name = "potato"
	desc = "It's a potato"
	icon_state = "potato"
	item_state = "potato"
	icon = 'modular_sand/icons/obj/misc.dmi'
	force = 12
	throwforce = 20
	throw_speed = 5
	throw_range = 20
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("hit")
	hitsound = 'sound/weapons/smash.ogg'

/obj/item/misc/potato/examine_more(mob/user)
	. = ..()
	. += "On a closer inspection, you've realized this is a rock."
