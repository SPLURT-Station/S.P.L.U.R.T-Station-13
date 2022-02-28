/////////////////////////
///MIND CONTROL COLLAR///
/////////////////////////

//Ok, first - it's not mind control. Just forcing someone to do emotes that user added to remote thingy. Just a funny illegal ERP toy.

//Controller stuff
/obj/item/mind_controller
	name = "mind controller"
	desc = "A small remote for sending basic emotion patterns to a collar."
	icon = 'modular_splurt/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_left.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/lewd_items/lewd_inhand_right.dmi'
	icon_state = "mindcontroller"
	item_state = "mindcontroller"
	var/obj/item/clothing/neck/mind_collar/collar = null
	w_class = WEIGHT_CLASS_SMALL

/obj/item/mind_controller/Initialize(mapload, collar)
    //Store the collar on creation.
	src.collar = collar
	. = ..() //very important to call parent in Intialize

/obj/item/mind_controller/attack_self(mob/user)
	if (collar)
		collar.emoting = stripped_input(user, "Change the emotion pattern")
		collar.emoting_proc()
//Collar stuff
/obj/item/clothing/neck/mind_collar
	name = "mind collar"
	desc = "A tight collar. It has some strange high-tech emitters on the side."
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/neck/lewd_neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/neck/lewd_neck.dmi'
	icon_state = "mindcollar"
	item_state = "mindcollar"
	var/obj/item/mind_controller/remote = null
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small/collar/mind_collar
	var/emoting = "Shivers"
	var/seamless = FALSE

/obj/item/clothing/neck/mind_collar/Initialize()
	. = ..()
	remote = new /obj/item/mind_controller(src, src)
	remote.forceMove(src)

/obj/item/clothing/neck/mind_collar/proc/emoting_proc()
	var/mob/living/carbon/human/U = src.loc
	if(istype(U) && src == U.wear_neck)
		U.emote("me", 1,"[emoting]", TRUE)

/obj/item/clothing/neck/mind_collar/Destroy()
	if(remote)
		remote.collar = null
		remote = null
	return ..()
/obj/item/clothing/neck/mind_collar/attack_hand(mob/living/carbon/human/user)
	var/mob/living/carbon/human/C = user
	if(iscarbon(user) && seamless && (user.get_item_by_slot(ITEM_SLOT_NECK)))
		to_chat(C, span_purple(pick("You can't seem to find the release latch for the collar!",
									"The collar refuses to budge while you tug at it.",
									"Your hands uselessly roam along the strange device.")))
		return
	. = ..()
/obj/item/clothing/neck/mind_collar/MouseDrop(atom/over_object)

/obj/item/clothing/neck/mind_collar/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/latex))
		if(seamless != FALSE)
			to_chat(user, span_warning("The collar latches loosen!"))
			seamless = FALSE
		else
			to_chat(user, span_warning("The collar latches tighten!"))
			seamless = TRUE
	return
