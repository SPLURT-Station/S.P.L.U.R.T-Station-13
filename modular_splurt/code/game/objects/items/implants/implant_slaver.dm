/obj/item/implant/slaver
	name = "emergency teleport implant"
	desc = "Returns you to the slave hideout (single use)."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "implant"

/obj/item/implant/slaver/activate()
	. = ..()

	imp_in.visible_message(span_notice("[imp_in] begins fiddling with a subtle bump on their arm."), span_notice("You prepare to teleport."))
	if(do_mob(imp_in, imp_in, 5 SECONDS, IGNORE_HELD_ITEM))
		playsound(get_turf(imp_in.loc), 'sound/magic/blink.ogg', 50, 1)
		imp_in.visible_message(span_notice("[imp_in] vanishes from sight!"), \
					span_notice("You activate [src], sending you to the slaver mothership!"))
		new /obj/effect/temp_visual/dir_setting/ninja(get_turf(imp_in), imp_in.dir)

		var/list/L = list()
		for(var/turf/T in get_area_turfs(/area/slavers/export))
			L+=T

		if(!L || !L.len)
			to_chat(usr, "No area available.")
			return

		imp_in.forceMove(pick(L))

		qdel(src)
	else
		to_chat(imp_in, span_warning("You need to stand still and uninterrupted for 5 seconds!"))

/obj/item/implant/slaver/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Ratchete CO. Emergency Teleport Implant<BR>
				<b>Life:</b> 7 months.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font>, single-use<BR>
				<HR>
				<b>Implant Details:</b> Subject can activate a short-range teleport.<BR>
				<b>Function:</b> Teleports the host to the slave trader mothership.<BR>
				<b>Integrity:</b> Implant can only be used one time before bluespace reserves are depleted."}
	return dat
