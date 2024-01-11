/obj/item/key/chastity_key/estim
	name = "\improper E-Stim cage controller"
	icon = 'modular_splurt/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_left.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_right.dmi'
	icon_state = "mindcontroller"
	item_state = "mindcontroller"

	var/min_power = 1
	var/power = 1
	var/max_power = 6

	var/obj/item/genital_equipment/chastity_cage/estim/estim_cage
	COOLDOWN_DECLARE(last_activation)

/obj/item/key/chastity_key/estim/attack_self(mob/user)
	. = ..()
	if(!estim_cage)
		return

	ui_interact(user)

/obj/item/key/chastity_key/estim/proc/activate(mob/user)
	if(!estim_cage.equipment.holder_genital)
		return
	if(!COOLDOWN_FINISHED(src, last_activation))
		return
	var/mob/living/carbon/human/H = estim_cage.equipment.get_wearer()

	switch(estim_cage.mode)
		if("shock")
			playsound(H, get_sfx("sparks"), 20*power)

			if(power >= max_power)
				H.do_jitter_animation()
				H.Stun(3 SECONDS)

			if(HAS_TRAIT(H, TRAIT_MASO))
				H.adjust_arousal(20*power, "masochism", maso = TRUE)
				H.set_lust(5)

				if(prob(30))
					H.emote(pick("moan", "shiver", "blush"))
				return

			if(prob(30))
				H.emote("groan")
			H.adjust_arousal(-20*power, "e-stimcage")
			H.set_lust(0)

		if("stimulation")
			playsound(H, 'modular_splurt/sound/lewd/vibrate.ogg', 20*power)
			if(HAS_TRAIT(H, TRAIT_MASO) && prob(30))
				H.adjust_arousal(-20*power, "e-stimcage")
				H.set_lust(0)

				if(prob(30))
					H.emote("groan")
				return

			if(prob(30))
				H.emote(pick("moan", "shiver", "blush"))

			H.adjust_arousal(20*power, "e-stimcage")
			H.set_lust(5)

	COOLDOWN_START(src, last_activation, 1 SECONDS)

/obj/item/key/chastity_key/estim/ui_status(mob/user)
	if(can_interact(user) && estim_cage)
		return ..()
	return UI_CLOSE

/obj/item/key/chastity_key/estim/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChastityRemote", name)
		ui.open()

/obj/item/key/chastity_key/estim/ui_data(mob/user)
	var/list/data = list()

	data["power"] = power
	data["mode"] = estim_cage.mode
	data["maxPower"] = max_power
	data["minPower"] = min_power

	return data

/obj/item/key/chastity_key/estim/ui_act(action, list/params)
	. = ..()
	if(!ishuman(usr))
		return

	switch(action)
		if("change_power")
			power = params["power"]
			. = TRUE
		if("change_mode")
			estim_cage.mode = params["mode"]
			. = TRUE
		if("activate")
			activate(usr)
			. = TRUE

/obj/item/genital_equipment/chastity_cage/estim
	name = "\improper E-Stim chastity cage"
	icon_state = "estim_cage"
	worn_icon_state = "standard_cage"
	break_require = TOOL_MULTITOOL
	break_time = 15 SECONDS

	var/mode = "shock"

/obj/item/genital_equipment/chastity_cage/estim/Initialize(mapload, obj/item/key/chastity_key/estim/newkey = null)
	. = ..()
	var/obj/item/key/chastity_key/estim/estim_key = key
	if(!estim_key && newkey)
		estim_key = newkey
	else
		return
	if(!estim_key.estim_cage)
		estim_key.estim_cage = src
