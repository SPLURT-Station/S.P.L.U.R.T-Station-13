/obj/item/rtl
	name = "rapid tile layer"
	desc = "A device used to rapidly deploy tiles."
	icon = 'modular_splurt/icons/obj/tools.dmi'
	icon_state = "rtl"
	item_state = "rtl"
	var/obj/item/stack/tile/plasteel/loaded
	var/max_amount = 240
	var/active = FALSE
	lefthand_file = 'modular_splurt/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/equipment/tools_righthand.dmi'
	var/mob/listeningTo

/obj/item/rtl/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_wield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_unwield))
	update_icon()

/obj/item/rtl/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	AddComponent(/datum/component/two_handed)

/// triggered on wield of two handed item
/obj/item/rtl/proc/on_wield(obj/item/source, mob/user)
	active = TRUE

/// triggered on unwield of two handed item
/obj/item/rtl/proc/on_unwield(obj/item/source, mob/user)
	active = FALSE

/obj/item/rtl/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/stack/sheet/metal))
		var/obj/item/stack/sheet/metal/inserted_metal = W

		if(!loaded)
			if(!user.transferItemToLoc(W, src))
				to_chat(user, span_warning("[src] is stuck to your hand!"))
				return
			else
				loaded = new /obj/item/stack/tile/plasteel
				loaded.max_amount = max_amount
				loaded.amount = min(max_amount, inserted_metal.amount*4)
				to_chat(user, span_notice("You add the metal to [src]. It now contains [loaded.amount]."))
				return

		if(loaded.amount < max_amount)
			var/transfer_amount = min(max_amount - loaded.amount, inserted_metal.amount*4)
			inserted_metal.use(round(transfer_amount/4)) //this is a complete fucking hack
			loaded.amount += transfer_amount
		else
			return
		update_icon()
		to_chat(user, span_notice("You add the metal to [src]. It now contains [loaded.amount]."))
	else
		..()

/obj/item/rtl/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click to set what tile to lay.")
	if(loaded)
		. += span_info("It contains [loaded.amount]/[max_amount] metal.")

/obj/item/rtl/Destroy()
	QDEL_NULL(loaded)
	listeningTo = null
	return ..()

/obj/item/rtl/update_icon_state()
	icon_state = initial(icon_state)
	item_state = initial(item_state)
	if(!loaded || !loaded.amount)
		icon_state += "-empty"
		item_state += "-0"

/obj/item/rtl/proc/is_empty(mob/user)
	update_icon()
	if(!loaded || !loaded.amount)
		if(loaded)
			QDEL_NULL(loaded)
			loaded = null
		return TRUE
	return FALSE

/obj/item/rtl/pickup(mob/user)
	..()
	getMobhook(user)

/obj/item/rtl/dropped(mob/wearer)
	..()
	UnregisterSignal(wearer, COMSIG_MOVABLE_MOVED)
	listeningTo = null

/obj/item/rtl/proc/getMobhook(mob/to_hook)
	if(listeningTo == to_hook)
		return
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	RegisterSignal(to_hook, COMSIG_MOVABLE_MOVED, PROC_REF(trigger))
	listeningTo = to_hook

/obj/item/rtl/proc/trigger(mob/user)
	SIGNAL_HANDLER

	if(active)
		layTile(user)

/obj/item/rtl/proc/layTile(mob/user)
	if(!isturf(user.loc))
		return
	if(is_empty(user, 0))
		to_chat(user, span_warning("\The [src] is empty!"))
		return	

	var/turf/T = get_turf(user)
	if(!istype(T, /turf/open/floor/plating))
		return
	T.attackby(loaded, user, 0)
	update_icon()

/obj/item/rtl/AltClick(mob/user)
	if(!loaded)
		return ..()
	var/obj/item/stack/tile/choice = show_radial_menu(user, src, loaded.tile_reskin_types, radius = 48, require_near = TRUE)
	if(!choice || choice == type)
		return
	var/amount_to_transfer = loaded.amount
	QDEL_NULL(loaded)
	loaded = new choice
	loaded.amount = amount_to_transfer

/obj/item/rtl/pre_loaded/Initialize(mapload) //Comes preloaded, for testing stuff
	loaded = new()
	loaded.max_amount = max_amount
	loaded.amount = max_amount
	return ..()

/datum/design/rtl
	name = "Rapid Tile Layer"
	id = "rtl"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 2500)
	build_path = /obj/item/rtl
	category = list("initial","Tools")
