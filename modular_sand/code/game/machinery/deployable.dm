/obj/item/grenade/secbed
	name = "security bed grenade"
	desc = "A nice red and black pet bed, now in a compact, throwable package! No more wrestling entire beds out of vending machines!"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "flashbang"
	item_state = "flashbang"

/obj/item/grenade/secbed/prime()
	new /obj/structure/bed/secbed(get_turf(src.loc))
	qdel(src)
