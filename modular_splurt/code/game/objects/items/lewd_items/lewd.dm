/obj/item/key/latex
	name = "Latex Adjustment Override"
	desc = "This is a strange device that ensures your 'gifts' are recieved permanently"
	icon = 'modular_splurt/icons/obj/lewd_items/lewd_items.dmi'
	icon_state = "lustwish_discount"

/obj/item/storage/box/shockcollar
	name = "Shock Collar & Signaler"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	desc = "Silver Love Co. is not responsible for users getting the collar stuck on themselves."

// portal fleshlight box
/obj/item/storage/box/shockcollar/PopulateContents()
	new /obj/item/electropack/shockcollar(src)
	new /obj/item/assembly/signaler(src)
