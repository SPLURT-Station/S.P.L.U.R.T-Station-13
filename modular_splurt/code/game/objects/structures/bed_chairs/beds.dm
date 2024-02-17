/obj/structure/bed/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/crawl_under)

/obj/structure/bed/Destroy()
	unbuckle_all_mobs()
	return ..()

/obj/structure/bed/dogbed/shadow
	icon = 'modular_splurt/icons/obj/objects.dmi'
	icon_state = "dogbed_shadow"
	buildstacktype = /obj/item/stack/sheet/mineral/wood/shadow

/obj/structure/bed/dogbed/mushroom
	icon = 'modular_splurt/icons/obj/objects.dmi'
	icon_state = "dogbed_mushwood"
	buildstacktype = /obj/item/stack/sheet/mineral/wood/mushroom

/obj/structure/bed/shadow
	name = "shadow bed"
	desc = "A bunch of shadow planks strewn together. Better than sleeping on the ground."
	icon_state = "bed_shadow"
	icon = 'modular_splurt/icons/obj/structures/beds.dmi'
	buildstacktype = /obj/item/stack/sheet/mineral/wood/shadow

/obj/structure/bed/double/shadow
	name = "shadow double bed"
	desc = "A double shadow bed, because tribals need luxury too."
	icon = 'modular_splurt/icons/obj/structures/beds.dmi'
	icon_state = "bed_wide_shadow"
	buildstacktype = /obj/item/stack/sheet/mineral/wood/shadow

/obj/structure/bed/matress
	name = "matress"
	desc = "This is used to lie in, sleep in or strap on."
	icon_state = "mattress0"
	buildstacktype = /obj/item/stack/sheet/cloth

/obj/structure/bed/matress/New()
	..()
	icon_state = "mattress[rand(0,6)]"

/obj/structure/bed/matress/clean
	icon_state = "mattress2"

/obj/structure/bed/matress/clean_pillowed
	icon_state = "mattress0"

/obj/structure/bed/secbed
	name = "security pet bed"
	desc = "A comfy-looking pet bed, now in the classic security colors."
	//icon_state = "secbed" //doesn't exist...?
	anchored = FALSE

