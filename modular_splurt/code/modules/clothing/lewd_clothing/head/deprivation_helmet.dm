//Credit goes to the Skyrat codebase https://github.com/Skyrat-SS13/Skyrat-tg

#define NO_MUZZLE 0
#define HALF_MUZZLE 1
#define FULL_MUZZLE 2

/obj/item/clothing/head/helmet/space/deprivation_helmet
	name = "deprivation helmet"
	desc = "Completely cuts off the wearer from the outside world."
	icon_state = "dephelmet"
	item_state = "dephelmet"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 25, "rad" = 0, "fire" = 20, "acid" = 15, "wound" = 0)
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/head/lewd_hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_hats.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_hats.dmi'
	mutantrace_variation = STYLE_MUZZLE
	lefthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_left.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_right.dmi'
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES
	var/current_helmet_color = "pink"
	//these three vars needed to turn deprivation stuff on or off
	var/muzzle = NO_MUZZLE
	var/earmuffs = FALSE
	var/prevent_vision = FALSE
	var/color_changed = FALSE
	var/seamless = FALSE

	var/static/list/helmet_designs
	actions_types = list(/datum/action/item_action/toggle_vision, /datum/action/item_action/toggle_hearing, /datum/action/item_action/toggle_speech)
//Declare action types
/datum/action/item_action/toggle_vision
    name = "Vision switch"
    desc = "Makes it impossible to see anything"

/datum/action/item_action/toggle_hearing
    name = "Hearing switch"
    desc = "Makes it impossible to hear anything"

/datum/action/item_action/toggle_speech
    name = "Speech switch"
    desc = "Makes it impossible to say anything"

//Vision switcher
/datum/action/item_action/toggle_vision/Trigger()
	var/obj/item/clothing/head/helmet/space/deprivation_helmet/H = target
	var/mob/living/carbon/C = usr
	if(istype(H))
		if(H == C.head)
			to_chat(usr, span_notice("You're unable to reach the switch"))
		else
			H.SwitchHelmet("vision")

//Hearing switcher
/datum/action/item_action/toggle_hearing/Trigger()
	var/obj/item/clothing/head/helmet/space/deprivation_helmet/H = target
	var/mob/living/carbon/C = usr
	if(istype(H))
		if(H == C.head)
			to_chat(usr, span_notice("You're unable to reach the switch"))
		else
			H.SwitchHelmet("hearing")

//Speech switcher
/datum/action/item_action/toggle_speech/Trigger()
	var/obj/item/clothing/head/helmet/space/deprivation_helmet/H = target
	var/mob/living/carbon/C = usr
	if(istype(H))
		if(H == C.head)
			to_chat(usr, span_notice("You're unable to reach the switch"))
		else
			H.SwitchHelmet("speech")

//Helmet switcher
/obj/item/clothing/head/helmet/space/deprivation_helmet/proc/SwitchHelmet(button)
	var/C = button
	if(C == "speech")
		if(muzzle == FULL_MUZZLE)
			muzzle = NO_MUZZLE
			//playsound(usr, 'sound/weapons/magout.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Speech switch off"))
			flags_cover = HEADCOVERSEYES
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				REMOVE_TRAIT(usr, TRAIT_MUTE, CLOTHING_TRAIT)
				to_chat(usr, span_purple("Your mouth is free. you breathe out with relief."))
		else if(muzzle == NO_MUZZLE)
			muzzle = HALF_MUZZLE
			//playsound(usr, 'sound/weapons/magin.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Ring gag switch on"))
			flags_cover = HEADCOVERSEYES //should be unneccesary but fuck it
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				ADD_TRAIT(usr, TRAIT_TONGUELESS_SPEECH, CLOTHING_TRAIT)
				to_chat(usr, span_purple("Something is gagging your mouth! It seems to be partially obstructing yet allowing full access to your mouth, whether you want it or not..."))
		else if(muzzle == HALF_MUZZLE)
			muzzle = FULL_MUZZLE
			//playsound(usr, 'sound/weapons/magin.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Full gag switch on"))
			flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				REMOVE_TRAIT(usr, TRAIT_TONGUELESS_SPEECH, CLOTHING_TRAIT)
				ADD_TRAIT(usr, TRAIT_MUTE, CLOTHING_TRAIT)
				to_chat(usr, span_purple("Something is gagging your mouth completely! You can't even make a sound..."))
	if(C == "hearing")
		if(earmuffs == TRUE)
			earmuffs = FALSE
			//playsound(usr, 'sound/weapons/magout.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Hearing switch off"))
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				REMOVE_TRAIT(usr, TRAIT_DEAF, CLOTHING_TRAIT)
				//Toggle_Sounds()
				to_chat(usr, span_purple("Finally you can hear the world around again."))
		else
			earmuffs = TRUE
			//playsound(usr, 'sound/weapons/magin.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Hearing switch on"))
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				ADD_TRAIT(usr, TRAIT_DEAF, CLOTHING_TRAIT)
				//Toggle_Sounds()
				//stop_client_sounds()
				to_chat(usr, span_purple("You can barely hear anything! Your other senses have become more apparent..."))
	if(C == "vision")
		var/mob/living/carbon/human/user = usr
		if(prevent_vision == TRUE)
			prevent_vision = FALSE
			//playsound(usr, 'sound/weapons/magout.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Vision switch off"))
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				user.become_blind("deprivation_helmet_[REF(src)]")
				to_chat(usr, span_purple("Helmet no longer restricts your vision."))
		else
			prevent_vision = TRUE
			//playsound(usr, 'sound/weapons/magin.ogg', 40, TRUE, ignore_walls = FALSE)
			to_chat(usr, span_notice("Vision switch on"))
			if(usr.get_item_by_slot(ITEM_SLOT_HEAD) == src)
				user.become_blind("deprivation_helmet_[REF(src)]")
				to_chat(usr, span_purple("The helmet is blocking your vision! You can't make out anything on the other side..."))

//create radial menu
/obj/item/clothing/head/helmet/space/deprivation_helmet/proc/populate_helmet_designs()
	helmet_designs = list(
		"pink" = image(icon = src.icon, icon_state = "dephelmet_pink"),
		"teal" = image(icon = src.icon, icon_state = "dephelmet_teal"),
		"pinkn" = image(icon = src.icon, icon_state = "dephelmet_pinkn"),
		"tealn" = image(icon = src.icon, icon_state = "dephelmet_tealn"))

//to change model
/obj/item/clothing/head/helmet/space/deprivation_helmet/AltClick(mob/user, obj/item/I)
	if(color_changed == FALSE)
		. = ..()
		if(.)
			return
		var/choice = show_radial_menu(user,src, helmet_designs, custom_check = CALLBACK(src, PROC_REF(check_menu), user, I), radius = 36, require_near = TRUE)
		if(!choice)
			return FALSE
		current_helmet_color = choice
		update_icon()
		update_action_buttons_icons()
		color_changed = TRUE
	else
		return

/obj/item/clothing/head/helmet/space/deprivation_helmet/proc/update_action_buttons_icons()
	var/datum/action/item_action/M

	for(M in src.actions)
		if(istype(M, /datum/action/item_action/toggle_vision))
			M.button_icon_state = "[current_helmet_color]_blind"
			M.icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
		if(istype(M, /datum/action/item_action/toggle_hearing))
			M.button_icon_state = "[current_helmet_color]_deaf"
			M.icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
		if(istype(M, /datum/action/item_action/toggle_speech))
			M.button_icon_state = "[current_helmet_color]_mute"
			M.icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
	update_icon()

//to check if we can change helmet's model
/obj/item/clothing/head/helmet/space/deprivation_helmet/proc/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated())
		return FALSE
	return TRUE

/obj/item/clothing/head/helmet/space/deprivation_helmet/Initialize()
	. = ..()
	update_icon_state()
	update_icon()
	update_action_buttons_icons()
	if(!length(helmet_designs))
		populate_helmet_designs()

//updating both and icon in hands and icon worn
/obj/item/clothing/head/helmet/space/deprivation_helmet/update_icon_state()
	.=..()
	icon_state = "[initial(icon_state)]_[current_helmet_color]"
	item_state = "[initial(icon_state)]_[current_helmet_color]"
//Code for applying the deprivation aspects upon equip
/obj/item/clothing/head/helmet/space/deprivation_helmet/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_HEAD)
		return
	if(muzzle == HALF_MUZZLE)
		ADD_TRAIT(user, TRAIT_TONGUELESS_SPEECH, CLOTHING_TRAIT)
		to_chat(user, span_purple("Something is gagging your mouth! It seems to be partially obstructing yet allowing full access to your mouth, whether you want it or not..."))
	if(muzzle == FULL_MUZZLE)
		ADD_TRAIT(user, TRAIT_MUTE, CLOTHING_TRAIT)
		to_chat(user, span_purple("Something is gagging your mouth completely! You can't even make a sound..."))
	if(earmuffs == TRUE)
		ADD_TRAIT(user, TRAIT_DEAF, CLOTHING_TRAIT)
		//Toggle_Sounds()
		//stop_client_sounds()
		to_chat(user, span_purple("You can barely hear anything! Your other senses have become more apparent..."))
	if(prevent_vision == TRUE)
		user.become_blind("deprivation_helmet_[REF(src)]")
		to_chat(user, span_purple("The helmet is blocking your vision! You can't make out anything on the other side..."))

//Here goes code that heals the wearer after unequipping helmet
/obj/item/clothing/head/helmet/space/deprivation_helmet/dropped(mob/living/carbon/human/user)
	. = ..()
	if(muzzle == HALF_MUZZLE)
		REMOVE_TRAIT(user, TRAIT_TONGUELESS_SPEECH, CLOTHING_TRAIT)
	if(muzzle == FULL_MUZZLE)
		REMOVE_TRAIT(user, TRAIT_MUTE, CLOTHING_TRAIT)
	if(earmuffs == TRUE)
		earmuffs = FALSE
		REMOVE_TRAIT(user, TRAIT_DEAF, CLOTHING_TRAIT)
		//Toggle_Sounds()
		earmuffs = TRUE
	if(prevent_vision == TRUE)
		user.cure_blind("deprivation_helmet_[REF(src)]")

	//some stuff for unequip messages
	if(src == user.head)
		if(muzzle != NO_MUZZLE)
			to_chat(user, span_purple("Your mouth is free. You breathe out with relief."))
		if(earmuffs == TRUE)
			to_chat(user, span_purple("Finally you can hear the world around you once more."))
		if(prevent_vision == TRUE)
			to_chat(user, span_purple("The helmet no longer restricts your vision."))

/obj/item/clothing/head/helmet/space/deprivation_helmet/attack_hand(mob/living/carbon/human/user)
	if(iscarbon(user) && seamless && (user.get_item_by_slot(ITEM_SLOT_HEAD) == src))
		to_chat(user, span_purple(pick("You roam your hands around the helmet for some sort of release!",
									"You find it impossible to leverage your fingers underneath the helmet",
									"The durable material seems to reflect your pointless force.")))
		return
	. = ..()

/obj/item/clothing/head/helmet/space/deprivation_helmet/MouseDrop(atom/over_object)

/obj/item/clothing/head/helmet/space/deprivation_helmet/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/latex))
		if(seamless != FALSE)
			to_chat(user, span_warning("The latches suddenly loosen"))
			seamless = FALSE
		else
			to_chat(user, span_warning("The latches suddenly tighten!"))
			seamless = TRUE
	return

#undef NO_MUZZLE
#undef HALF_MUZZLE
#undef FULL_MUZZLE
