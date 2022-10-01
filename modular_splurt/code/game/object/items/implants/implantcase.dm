/obj/item/implantcase/emag_act(mob/user)
	. = ..()
	if(istype(imp, /obj/item/implant/genital_fluid))
		var/obj/item/implant/genital_fluid/I = imp
		if(I.obj_flags & EMAGGED)
			to_chat(user, "<span class='warning'>[src] has no functional safeties to emag.</span>")
			return
		to_chat(user, "<span class='notice'>You short out [src]'s safeties.</span>")
		name = "implant case - 'Genital Fluid (Hacked)'"
		I.emag_act()
