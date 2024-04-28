//---------Standard Chastity Cage Box--------//
/obj/item/storage/box/chastity_cage
	name = "standard chastity box"
	desc = "Contains a key and a dick cage"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "box"
	illustration = null
	var/size = 2

/obj/item/storage/box/chastity_cage/ComponentInitialize()
	. = ..()
	var/datum/component/storage/str = GetComponent(/datum/component/storage)
	str.max_items = size

/obj/item/storage/box/chastity_cage/PopulateContents()
	var/newkey = new /obj/item/key/chastity_key(src)
	new /obj/item/genital_equipment/chastity_cage(src, newkey)
//-------------------------------------------//

//----------Metal Chastity Cage Box----------//
/obj/item/storage/box/chastity_cage/metal
	name = "metal chastity box"

/obj/item/storage/box/chastity_cage/metal/PopulateContents()
	var/newkey = new /obj/item/key/chastity_key(src)
	new /obj/item/genital_equipment/chastity_cage/metal(src, newkey)
//-------------------------------------------//

//-------------Chastity Belt Box-------------//
/obj/item/storage/box/chastity_cage/belt
	name = "chastity belt box"

/obj/item/storage/box/chastity_cage/belt/PopulateContents()
	var/newkey = new /obj/item/key/chastity_key(src)
	new /obj/item/clothing/underwear/chastity_belt(src, new /obj/item/genital_equipment/chastity_cage(null, newkey))
//-------------------------------------------//

//----------E-Stim Chastity Cage Box----------//
/obj/item/storage/box/chastity_cage/estim
	name = "\improper E-Stim chastity box"

/obj/item/storage/box/chastity_cage/estim/PopulateContents()
	var/newkey = new /obj/item/key/chastity_key/estim(src)
	new /obj/item/genital_equipment/chastity_cage/estim(src, newkey)
//-------------------------------------------//
