#define BLACKLISTED_GENITALS list(/obj/item/organ/genital/breasts, /obj/item/organ/genital/belly)

/obj/item/organ/genital/proc/can_be_chastened()
	for(var/blacklisted_genital in BLACKLISTED_GENITALS)
		if(type in typesof(blacklisted_genital))
			return FALSE

	return TRUE

/obj/item/key/chastity_key
	name = "cage key"
	icon_state = "key"
	desc = "You better not lose this."

/obj/item/genital_equipment/chastity_cage
	name = "chastity cage"
	desc = "Feeling submissive yet?"
	icon = 'modular_splurt/icons/obj/lewd_items/chastity.dmi'
	icon_state = "standard_cage"
	w_class = WEIGHT_CLASS_TINY

	var/obj/item/key/chastity_key/key

	var/break_require = TOOL_WIRECUTTER //Which tool is required to break the chastity_cage
	var/break_time = 25 SECONDS

	var/obj/item/organ/genital/genital
	var/mutable_appearance/cage_overlay
	var/worn_icon_state

	var/overlay_layer = -(GENITALS_FRONT_LAYER - 0.01)
	var/is_overlay_on

	var/cage_sprite
	var/resizeable = TRUE

/obj/item/genital_equipment/chastity_cage/Initialize(mapload, obj/item/key/chastity_key/newkey = null)
	. = ..()

	if(!key)
		key = newkey

	color = pick(list(COLOR_LIGHT_PINK, COLOR_STRONG_VIOLET, null))

/obj/item/genital_equipment/chastity_cage/Destroy()
	if(owner)
		if(istype(loc, /obj/item/organ/genital))
			unequip(loc, owner)
				
	. = ..()

/obj/item/genital_equipment/chastity_cage/insert_item_organ(mob/living/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	if(!istype(target_organ, /obj/item/organ/genital/penis))
		return ..()

	if(!(target.client?.prefs.cit_toggles & CHASTITY))
		to_chat(user, span_warning("They don't want you to do that!"))
		return

	var/obj/item/organ/genital/penis/penor = target_organ
	equip(user, target, penor)

	return

/obj/item/genital_equipment/chastity_cage/proc/unequip_process(obj/item/organ/genital/G, mob/user)
	if(!owner)
		return

	var/obj/item/I = user.get_active_held_item()

	if(!I)
		to_chat(user, "<span class='warning'>You need \a [break_require] or its key to take it off!</span>")
		return

	if(I == key)
		to_chat(user, "<span class='warning'>You wield \the [I.name] and unlock the cage!</span>")
		unequip(G, owner)
		return

	if(break_require == TOOL_WIRECUTTER && I.tool_behaviour == break_require)
		if(!do_mob(user, owner, break_time))
			return
	else if(break_require == TOOL_WELDER && I.tool_behaviour == break_require)
		if(!I.tool_start_check(user, 0))
			return

		playsound(owner, pick(list('sound/items/welder.ogg', 'sound/items/welder2.ogg')), 100)
		if(!do_mob(user, owner, break_time))
			return
	else if(break_require == TOOL_MULTITOOL && I.tool_behaviour == break_require)
		if(!do_mob(user, owner, break_time))
			return
	else
		to_chat(user, "<span class='warning'>You can't take it off with \the [I.name]</span>")
		return

	to_chat(user, "<span class='warning'>You manage to break \the [src] with \the [I.name]!</span>")
	qdel(src)

/obj/item/genital_equipment/chastity_cage/proc/equip(mob/user, mob/living/carbon/target, obj/item/organ/genital/penis/penor)
	if(target.has_penis(REQUIRE_EXPOSED) && CHECK_BITFIELD(penor?.genital_flags, HAS_EQUIPMENT))
		if(locate(/obj/item/genital_equipment/chastity_cage) in penor.contents)
			to_chat(user, "<span class='notice'>\The [target] already have a cage on them!</span>")
			return
		if(isliving(target) && isliving(user))
			target.visible_message("<span class='warning'>\The <b>[user]</b> is trying to put \the [name] on \the <b>[target]</b>!</span>",\
						"<span class='warning'>\The <b>[user]</b> is trying to put \the [name] on you!</span>")
		if(!do_mob(user, target, 4 SECONDS))
			return
		if(!user.transferItemToLoc(src, penor))
			return

		playsound(target, 'modular_sand/sound/lewd/latex.ogg', 50, 1, -1) // making it a belt sound
		owner = target

		var/mob/living/carbon/human/H = owner

		//turn that flag on
		ENABLE_BITFIELD(penor.genital_flags, GENITAL_CHASTENED)

		var/overlay_icon_state

		overlay_icon_state = "worn_[worn_icon_state || icon_state]"
		if(resizeable)
			switch(penor.size)
				if(1 to 2)
					cage_sprite = 1
				if(3 to 4)
					cage_sprite = 2
				if(5)
					cage_sprite = 3

			overlay_icon_state += "_[cage_sprite]"

		cage_overlay = mutable_appearance(icon, overlay_icon_state, overlay_layer)
		cage_overlay.color = color //Set the overlay's color to the cage item's

		H.add_overlay(cage_overlay)
		is_overlay_on = TRUE

		H.update_genitals()
		RegisterSignal(H, COMSIG_MOB_ITEM_EQUIPPED, .proc/mob_equipped_item)
		RegisterSignal(H, COMSIG_MOB_ITEM_DROPPED, .proc/mob_dropped_item)

/obj/item/genital_equipment/chastity_cage/proc/unequip(obj/item/organ/genital/G, mob/living/carbon/human/H)
	if(!CHECK_BITFIELD(G.genital_flags, GENITAL_CHASTENED) && !owner)
		return

	DISABLE_BITFIELD(G.genital_flags, GENITAL_CHASTENED)
	H.cut_overlay(cage_overlay)
	is_overlay_on = FALSE

	H.update_genitals()

	H.transferItemToLoc(src, get_turf(H))
	
	UnregisterSignal(owner, list(COMSIG_MOB_ITEM_EQUIPPED, COMSIG_MOB_ITEM_DROPPED))

	owner = null


/obj/item/genital_equipment/chastity_cage/proc/mob_equipped_item(datum/source, obj/item/I)
	if(istype(I, /obj/item/clothing/under) && is_overlay_on)
		owner.cut_overlay(cage_overlay)
		is_overlay_on = FALSE

/obj/item/genital_equipment/chastity_cage/proc/mob_dropped_item(datum/source, obj/item/I)
	if(istype(I, /obj/item/clothing/under) && !is_overlay_on)
		owner.add_overlay(cage_overlay)
		is_overlay_on = TRUE
