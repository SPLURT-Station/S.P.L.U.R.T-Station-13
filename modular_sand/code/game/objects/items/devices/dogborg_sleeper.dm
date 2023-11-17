/obj/item/storage/attackby(obj/item/dogborg/sleeper/K9, mob/user, proximity)
	if(istype(K9))
		K9.afterattack(src, user ,1)
	else
		. = ..()

/obj/item/dogborg/sleeper/compactor //Janihound gut.
	name = "garbage processor"
	desc = "A mounted garbage compactor unit with fuel processor."
	icon = 'icons/mob/robot_items.dmi'
	icon_state = "compactor"
	inject_amount = 0
	min_health = -100
	injection_chems = null //So they don't have all the same chems as the medihound!
	var/max_item_count = 30

/obj/item/storage/attackby(obj/item/dogborg/sleeper/compactor, mob/user, proximity) //GIT CIRCUMVENTED YO!
	if(istype(compactor))
		compactor.afterattack(src, user ,1)
	else
		. = ..()

/obj/item/dogborg/sleeper/compactor/afterattack(atom/movable/target, mob/living/silicon/user, proximity)//GARBO NOMS
	var/mob/living/silicon/robot/hound = get_host()
	if(!hound || !istype(target) || !proximity || target.anchored)
		return
	if(length(contents) > (max_item_count - 1))
		to_chat(user,span_warning("Your [src] is full. Eject or process contents to continue."))
		return
	if(isitem(target))
		var/obj/item/I = target
		if(CheckAccepted(I))
			to_chat(user,span_warning("[I] registers an error code to your [src]"))
			return
		if(I.w_class > WEIGHT_CLASS_NORMAL)
			to_chat(user,span_warning("[I] is too large to fit into your [src]"))
			return
		user.visible_message(span_warning("[hound.name] is ingesting [I] into their [src.name]."), span_notice("You start ingesting [target] into your [src.name]..."))
		if(do_after(user, 1.5 SECONDS, target) && length(contents) < max_item_count)
			I.forceMove(src)
			I.visible_message(span_warning("[hound.name]'s garbage processor groans lightly as [I] slips inside."), span_notice("Your garbage compactor groans lightly as [I] slips inside."))
			playsound(hound, 'sound/machines/disposalflush.ogg', 50, 1)
			if(length(contents) > 11) //grow that tum after a certain junk amount
				hound.sleeper_r = 1
				hound.update_icons()
			else
				hound.sleeper_r = 0
				hound.update_icons()
		return

	if(iscarbon(target) || issilicon(target))
		var/mob/living/trashman = target
		if(!CHECK_BITFIELD(trashman.vore_flags,DEVOURABLE))
			to_chat(user, span_warning("[target] registers an error code to your [src]"))
			return
		if(patient)
			to_chat(user,span_warning("Your [src] is already occupied."))
			return
		if(trashman.buckled)
			to_chat(user,span_warning("[trashman] is buckled and can not be put into your [src]."))
			return
		user.visible_message(span_warning("[hound.name] is ingesting [trashman] into their [src]."), span_notice("You start ingesting [trashman] into your [src.name]..."))
		if(do_after(user, 3 SECONDS, trashman) && !patient && !trashman.buckled && length(contents) < max_item_count)
			trashman.forceMove(src)
			trashman.reset_perspective(src)
			update_gut(user)
			user.visible_message(span_warning("[hound.name]'s garbage processor groans lightly as [trashman] slips inside."), span_notice("Your garbage compactor groans lightly as [trashman] slips inside."))
			playsound(hound, 'sound/effects/bin_close.ogg', 80, 1)
