/obj/item/implant/genital_fluid
	name = "genital fluid implant"
	icon = 'modular_splurt/icons/obj/implants.dmi'
	icon_state = "genital_fluid"
	var/use_blacklist = TRUE

/obj/item/implant/genital_fluid/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Nanotrasen Genital Fluid Inducer Implant<BR>
				<b>Important Notes:</b> It will only works in genitals that have the natural function of producing fluids.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Allows the user to induce their genitals into producing a specific reagent.<BR>
				<b>Special Features:</b> Will prevent harmful liquids from being accepted as a genital fluid replace.<BR>
				<b>Integrity:</b> Implant will last so long as the implant is inside the host and they posess genitals capable of fluid production."}
	return dat

/obj/item/implant/genital_fluid/can_be_implanted_in(mob/living/target)
	if(!ishuman(target))
		return FALSE
	. = ..()

/obj/item/implant/genital_fluid/activate()
	. = ..()
	var/list/obj/item/organ/genital/penidlist
	var/list/datum/reagent/fluidlist = list()
	var/mob/living/carbon/human/owner = imp_in

	//List their genitals if they have any at all
	for(var/obj/item/organ/genital/dicc in owner.internal_organs)
		if(istype(dicc) && (dicc.genital_flags & GENITAL_FUID_PRODUCTION))
			LAZYADD(penidlist, dicc)

	//List their current reagents if they're valid
	for(var/datum/reagent/pee in owner.reagents.reagent_list)
		if((find_reagent_object_from_type(pee.type)) && ((pee.type in allowed_gfluid_paths()) || !use_blacklist))
			LAZYADD(fluidlist, find_reagent_object_from_type(pee.type))

	//List any reagents they may be holding in their hands
	if(owner.available_rosie_palms(TRUE, /obj/item/reagent_containers))
		for(var/obj/item/reagent_containers/container in owner.held_items)
			if(container.is_open_container() || istype(container, /obj/item/reagent_containers/food/snacks))
				for(var/datum/reagent/pee in container.reagents.reagent_list)
					if((find_reagent_object_from_type(pee.type)) && ((pee.type in allowed_gfluid_paths()) || !use_blacklist))
						LAZYADD(fluidlist, find_reagent_object_from_type(pee.type))

	//Return if genitals list is void/null
	if(!penidlist)
		SEND_SOUND(owner, 'sound/machines/terminal_error.ogg')
		to_chat(owner, span_notice("ERROR: No compatible genitals detected."))
		return

	var/obj/item/organ/genital/cocc = tgui_input_list(owner, "Pick a genital", "Genital Fluid Infuser", penidlist)
	if(!cocc)
		return

	fluidlist = list(find_reagent_object_from_type(cocc.get_default_fluid())) + fluidlist

	var/datum/reagent/selection = tgui_input_list(owner, "Choose your new reagent", "Genital Fluid Infuser", fluidlist)
	if(!selection)
		return

	cocc.fluid_id = selection.type
	SEND_SOUND(owner, 'sound/effects/bubbles.ogg')
	to_chat(owner, span_notice("You feel the fluids inside your [cocc.name] bubble and swirl..."))
	message_admins("[ADMIN_LOOKUPFLW(owner)] changed the fluid of their [owner.p_their()] [cocc.name] to [selection].")

/obj/item/implant/genital_fluid/emag_act()
	. = ..()
	name = "hacked genital fluid implant"
	use_blacklist = FALSE
	obj_flags |= EMAGGED

/obj/item/implanter/genital_fluid
	name = "implanter (genital fluid)"
	imp_type = /obj/item/implant/genital_fluid

/obj/item/implanter/genital_fluid/hacked
	name = "implanter (genital fluid (hacked))"

/obj/item/implanter/genital_fluid/hacked/New()
	. = ..()
	if(istype(imp, /obj/item/implant/genital_fluid))
		var/obj/item/implant/genital_fluid/I = imp
		I.emag_act()

/obj/item/implantcase/genital_fluid
	name = "implant case - 'Genital Fluid'"
	desc = "A glass case containing a Genital Fluid Infuser implant."
	imp_type = /obj/item/implant/genital_fluid

/obj/item/implantcase/genital_fluid/hacked
	name = "implant case - 'Genital Fluid (Hacked)'"

/obj/item/implantcase/genital_fluid/hacked/New()
	. = ..()
	if(istype(imp, /obj/item/implant/genital_fluid))
		var/obj/item/implant/genital_fluid/I = imp
		I.emag_act()
