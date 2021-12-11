/obj/item/smithing/stundild
	name = "dildo frame"
	finishingitem = /obj/item/melee/baton/cattleprod
	finalitem = /obj/item/melee/baton/stunsword/smithed
	icon = 'modular_splurt/icons/obj/smith.dmi'
	icon_state = "stund"

/obj/item/smithing/stundild/startfinish()
	var/obj/item/melee/baton/stunsword/smithed/finalforreal = new /obj/item/melee/baton/stunsword/smithed(src)
	finalforreal.stamina_loss_amount += quality
	finalitem = finalforreal
	..()
