/obj/machinery/computer/cloning
	var/obj/item/implant/resleeving/inserted_implant

/obj/machinery/computer/cloning/examine(mob/user)
	. = ..()
	if(inserted_implant)
		. += "<span class='info'>[p_they(TRUE)] [p_have()] a resleeving implant inserted. <b>Ctrl-click</b> to remove it.</span>"

/obj/machinery/computer/cloning/attacked_by(obj/item/I, mob/living/user, attackchain_flags, damage_multiplier)
	. = ..()
	if(istype(I, /obj/item/implant/resleeving))
		if(!inserted_implant)
			user.dropItemToGround(I)
			inserted_implant = I
			to_chat(user, "<span class='notice'>You insert [I] into [src].</span>")
		else
			to_chat(user, "<span class='warning'>There is already a resleeving implant in [src].</span>")

/obj/machinery/computer/cloning/CtrlClick(mob/user)
	. = ..()
	if(inserted_implant && user.put_in_hands(inserted_implant))
		to_chat(user, "<span class='notice'>You take [inserted_implant] out of [src].")
		inserted_implant = null

/obj/machinery/computer/cloning/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("sleeve")
			if(scanner && inserted_implant?.associated_mind)
				scanner.insert_mind(inserted_implant.associated_mind, inserted_implant, usr)
