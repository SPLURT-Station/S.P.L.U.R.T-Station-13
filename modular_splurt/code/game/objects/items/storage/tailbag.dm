/obj/item/storage/tailbag
	name = "tailbag"
	desc = "A bag for holding small items. It fastens around the base of the tail."
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "tailbag"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_ID

	var/obj/item/card/id/front_id = null
	var/list/combined_access

/obj/item/storage/tailbag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.cant_hold = typecacheof(list(/obj/item/screwdriver/power))
	STR.can_hold = typecacheof(list(
		/obj/item/stack/spacecash,
		/obj/item/holochip,
		/obj/item/card,
		/obj/item/clothing/mask/cigarette,
		/obj/item/flashlight/pen,
		/obj/item/seeds,
		/obj/item/stack/medical,
		/obj/item/toy/crayon,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/implanter,
		/obj/item/lighter,
		/obj/item/lipstick,
		/obj/item/match,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/syringe,
		/obj/item/screwdriver,
		/obj/item/multitool,
		/obj/item/wrench,
		/obj/item/wirecutters,
		/obj/item/valentine,
		/obj/item/stamp,
		/obj/item/key,
		/obj/item/cartridge,
		/obj/item/camera_film,
		/obj/item/stack/ore/bluespace_crystal,
		/obj/item/reagent_containers/food/snacks/grown/poppy,
		/obj/item/instrument/harmonica,
		/obj/item/mining_voucher,
		/obj/item/suit_voucher,
		/obj/item/reagent_containers/pill,
		/obj/item/gun/ballistic/derringer,
		/obj/item/genital_equipment/condom,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/laser_pointer,
		/obj/item/pda,
		/obj/item/paicard))

/obj/item/storage/tailbag/Exited(atom/movable/AM)
	. = ..()
	refreshID()

/obj/item/storage/tailbag/proc/refreshID()
	LAZYCLEARLIST(combined_access)
	if(!(front_id in src))
		front_id = null
	for(var/obj/item/card/id/I in contents)
		if(!front_id)
			front_id = I
		LAZYINITLIST(combined_access)
		combined_access |= I.access
	update_icon()

/obj/item/storage/tailbag/Entered(atom/movable/AM)
	. = ..()
	refreshID()

/obj/item/storage/tailbag/update_icon_state()
	var/new_state = "tailbag"
	if(front_id)
		new_state = "tailbag_id"
	if(new_state != icon_state)		//avoid so many icon state changes.
		icon_state = new_state

/obj/item/storage/tailbag/GetID()
	return front_id

/obj/item/storage/tailbag/RemoveID()
	if(!front_id)
		return
	. = front_id
	front_id.forceMove(get_turf(src))

/obj/item/storage/tailbag/InsertID(obj/item/inserting_item)
	var/obj/item/card/inserting_id = inserting_item.RemoveID()
	if(!inserting_id)
		return FALSE
	attackby(inserting_id)
	if(inserting_id in contents)
		return TRUE
	return FALSE

/obj/item/storage/tailbag/GetAccess()
	if(LAZYLEN(combined_access))
		return combined_access
	else
		return ..()

/obj/item/storage/tailbag/xtralg
	name = "XL Tailbag"
	desc = "A larger tail bag for larger creatures"
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "tailbag_xl"

/obj/item/storage/tailbag/xtralg/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8

