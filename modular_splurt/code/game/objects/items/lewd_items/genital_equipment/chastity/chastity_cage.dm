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
	genital_slot = ORGAN_SLOT_PENIS

	var/obj/item/key/chastity_key/key
	var/obj/item/clothing/underwear/chastity_belt/belt

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
	if(equipment.holder_genital)
		item_removed(src, equipment.holder_genital, usr)
	key = null
	belt = null
	return ..()

/obj/item/genital_equipment/chastity_cage/item_inserting(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	if(belt)
		return TRUE

	if(!(G.owner.client?.prefs.cit_toggles & CHASTITY))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	return equip(user, G.owner, G)

/obj/item/genital_equipment/chastity_cage/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	RegisterSignal(equipment.get_wearer(), COMSIG_MOB_GENITAL_TRY_INSERTING)

	if(belt)
		return belt.handle_cage_equipping(source, G, user)

	var/mob/living/carbon/human/H = G.owner

	playsound(source, 'modular_sand/sound/lewd/latex.ogg', 50, 1, -1) // making it a belt sound

	//turn that flag on
	ENABLE_BITFIELD(G.genital_flags, GENITAL_CHASTENED)

	var/overlay_icon_state

	overlay_icon_state = "worn_[worn_icon_state || icon_state]"
	if(resizeable)
		switch(G.size)
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

/obj/item/genital_equipment/chastity_cage/item_removing(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	if(!equipment.holder_genital)
		return FALSE

	var/mob/living/carbon/human/H = istype(G) ? G.owner : G["wearer"]

	var/obj/item/I = user.get_active_held_item()

	if(!I)
		to_chat(user, "<span class='warning'>You need \a [break_require] or its key to take it off!</span>")
		return FALSE

	if(I == key)
		to_chat(user, "<span class='warning'>You wield \the [I.name] and unlock the cage!</span>")
		return TRUE

	if(break_require == TOOL_WIRECUTTER && I.tool_behaviour == break_require)
		if(!do_mob(user, H, break_time))
			return FALSE
	else if(break_require == TOOL_WELDER && I.tool_behaviour == break_require)
		if(!I.tool_start_check(user, 0))
			return FALSE

		playsound(G.owner, pick(list('sound/items/welder.ogg', 'sound/items/welder2.ogg')), 100)
		if(!do_mob(user, H, break_time))
			return FALSE
	else if(break_require == TOOL_MULTITOOL && I.tool_behaviour == break_require)
		if(!do_mob(user, H, break_time))
			return FALSE
	else
		to_chat(user, "<span class='warning'>You can't take it off with \the [I.name]</span>")
		return FALSE

	to_chat(user, "<span class='warning'>You manage to break \the [src] with \the [I.name]!</span>")
	qdel(src)
	return FALSE

/obj/item/genital_equipment/chastity_cage/item_removed(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	UnregisterSignal(equipment.get_wearer(), COMSIG_MOB_GENITAL_TRY_INSERTING)
	if(belt)
		return belt.handle_cage_dropping(source, G, user)

	if(!CHECK_BITFIELD(G.genital_flags, GENITAL_CHASTENED) && !equipment.holder_genital)
		return FALSE

	var/mob/living/carbon/human/H = G.owner

	DISABLE_BITFIELD(G.genital_flags, GENITAL_CHASTENED)
	H.cut_overlay(cage_overlay)
	is_overlay_on = FALSE

	H.update_genitals()

	UnregisterSignal(H, list(COMSIG_MOB_ITEM_EQUIPPED, COMSIG_MOB_ITEM_DROPPED))

/obj/item/genital_equipment/chastity_cage/proc/equip(mob/user, mob/living/carbon/target, obj/item/organ/genital/penor)
	. = TRUE

	if(target.has_penis() == HAS_EXPOSED_GENITAL && CHECK_BITFIELD(penor?.genital_flags, HAS_EQUIPMENT))
		if(locate(/obj/item/genital_equipment/chastity_cage) in penor.contents)
			to_chat(user, "<span class='notice'>\The [target] already have a cage on them!</span>")
			return FALSE
		if(isliving(target) && isliving(user))
			target.visible_message("<span class='warning'>\The <b>[user]</b> is trying to put \the [name] on \the <b>[target]</b>!</span>",\
						"<span class='warning'>\The <b>[user]</b> is trying to put \the [name] on you!</span>")
		if(!do_mob(user, target, 4 SECONDS))
			return FALSE
	else
		return FALSE

/obj/item/genital_equipment/chastity_cage/proc/try_insert_equipment(mob/living/source, obj/item/organ/genital/G, mob/user)
	SIGNAL_HANDLER

	if(source == equipment.get_wearer())
		to_chat(user, "<span class='warning'>You got to take [source.p_their()] cage off first!</span>")
		return TRUE

/obj/item/genital_equipment/chastity_cage/proc/mob_equipped_item(datum/source, obj/item/I)
	var/mob/living/carbon/human/H = source
	if(istype(I, /obj/item/clothing/under) && is_overlay_on)
		H.cut_overlay(cage_overlay)
		is_overlay_on = FALSE

/obj/item/genital_equipment/chastity_cage/proc/mob_dropped_item(datum/source, obj/item/I)
	var/mob/living/carbon/human/H = source
	if(istype(I, /obj/item/clothing/under) && !is_overlay_on)
		H.add_overlay(cage_overlay)
		is_overlay_on = TRUE

#undef BLACKLISTED_GENITALS
