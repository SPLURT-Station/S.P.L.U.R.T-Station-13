


/obj/item/organ/cyberimp/brain/condenser
	name = "condenser implant"
	desc = "This cybernetic brain implant will allow you to force your hand muscles to contract, preventing item dropping. Twitch ear to toggle."
	implant_color = "#DE7E00"
	slot = ORGAN_SLOT_BRAIN_ANTIDROP
	actions_types = list(/datum/action/item_action/organ_action/toggle)
	var/datum/condenser_implant/condenser/condenser
	var/on = 0
	var/wanted_size_p = 30
	var/wanted_size_t = 5
	var/wanted_size_b = 30

/obj/item/organ/cyberimp/brain/condenser/New()
	..()
	condenser = new(null, src)

/obj/item/organ/cyberimp/brain/condenser/ui_action_click()
	condenser.ui_interact(usr)

/datum/condenser_implant/condenser
	var/obj/item/organ/cyberimp/brain/condenser/FATHER = null
	var/mob/living/carbon/human/HH = null

/datum/condenser_implant/condenser/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	HH = user
	if(!ui)
		ui = new(user, src, "Condenser", "Condenser")
		ui.open()

/datum/condenser_implant/condenser/New(mob/viewer, obj/item/organ/cyberimp/brain/condenser/objectA)
	FATHER = objectA
	ui_interact(viewer)

/datum/condenser_implant/ui_state(mob/user)
	return GLOB.conscious_state

/datum/condenser_implant/condenser/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("condenser")
			FATHER.on = !FATHER.on
			. = TRUE
		if("size_p")
			var/sent_value = params["size_p"]
			FATHER.wanted_size_p = sent_value
			. = TRUE
		if("size_t")
			var/sent_value = params["size_t"]
			FATHER.wanted_size_t = sent_value
			. = TRUE
		if("size_b")
			var/sent_value = params["size_b"]
			FATHER.wanted_size_b = sent_value
			. = TRUE


	var/mob/living/carbon/human/H = HH
	var/obj/item/organ/genital/penis/P = null
	var/obj/item/organ/genital/testicles/T = null
	var/obj/item/organ/genital/breasts/B = null

	for(var/obj/item/organ/genital/penis/PP in H.internal_organs)
		P = PP
	for(var/obj/item/organ/genital/testicles/TT in H.internal_organs)
		T = TT
	for(var/obj/item/organ/genital/breasts/BB in H.internal_organs)
		B = BB

	if(FATHER.on)
		if(P)
			var/tamanho = FATHER.wanted_size_p-P.length
			P.modify_size(tamanho)
		if(T)
			var/tamanho = FATHER.wanted_size_t-T.size
			T.modify_size(tamanho)
		if(B)
			var/tamanho = FATHER.wanted_size_b-B.size
			B.modify_size(tamanho)
	else
		if(P)
			var/tamanho = P.prev_length-P.length
			P.modify_size(tamanho)
		if(T)
			var/tamanho = initial(T.size)-T.size
			T.modify_size(tamanho)
		if(B)
			var/tamanho = B.prev_size-B.size
			B.modify_size(tamanho)

/datum/condenser_implant/condenser/ui_data(mob/user)
	if(!ishuman(user))
		return
	var/list/data = list()

	data["on"] = FATHER.on
	data["wanted_size_p"] = FATHER.wanted_size_p
	data["wanted_size_t"] = FATHER.wanted_size_t
	data["wanted_size_b"] = FATHER.wanted_size_b


	return data

