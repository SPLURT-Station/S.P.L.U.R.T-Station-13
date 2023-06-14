/obj/item/genital_equipment/chastity_cage/belt // I'm making it a genital_equipment, sorry
	name = "chastity belt"
	icon = 'modular_splurt/icons/obj/lewd_items/chastity.dmi'
	icon_state = "belt"
	slot_flags = ITEM_SLOT_UNDERWEAR

	item_flags = NO_UNIFORM_REQUIRED

	mutantrace_variation = STYLE_DIGITIGRADE

	break_require = TOOL_WELDER
	overlay_layer = -(GENITALS_FRONT_LAYER - 0.05)
	resizeable = FALSE

	var/obj/item/organ/genital/blocked_genital
	var/is_equipped

/obj/item/genital_equipment/chastity_cage/Initialize(mapload, obj/item/key/chastity_key/newkey = null)
	. = ..()

	cage_overlay = mutable_appearance(icon, "worn_[icon_state]", overlay_layer)
	cage_overlay.color = color

/obj/item/genital_equipment/chastity_cage/belt/proc/not_sleepy_equipped(mob/user, slot)
	if(!CHECK_BITFIELD(slot, ITEM_SLOT_UNDERWEAR) || !ishuman(user) || !ishuman(usr))
		return

	var/mob/holder = usr
	owner = user

	var/mob/living/carbon/human/H = owner

	var/exposed_genitals = list()

	for(var/obj/item/organ/genital/genital in H.internal_organs)
		if(genital.is_exposed() && genital.can_be_chastened())
			LAZYADD(exposed_genitals, genital)

	if(isemptylist(exposed_genitals))
		to_chat(holder, "<span class='warning'>\The [H] does not have any genitals exposed!</span>")
		holder.dropItemToGround(src)
		return

	blocked_genital = input(holder, "Choose a genital to block.") as null|anything in ((exposed_genitals + list("anus")) - list("butt"))
	if(!blocked_genital)
		holder.dropItemToGround(src)
		return

	if(blocked_genital != "anus" && locate(/obj/item/genital_equipment/chastity_cage) in blocked_genital?.contents)
		to_chat(holder, "<span class='notice'>\The [H] already have a cage on them!</span>")
		holder.dropItemToGround(src)
		return

	if(blocked_genital == "anus" && !H.dna.features["has_anus"])
		ADD_TRAIT(H, TRAIT_CHASTENED_ANUS, CLOTHING_TRAIT)
		H.anus_toggle_visibility(GEN_VISIBLE_NEVER)
	else
		ENABLE_BITFIELD(blocked_genital.genital_flags, GENITAL_CHASTENED)

	is_equipped = TRUE

	H.update_genitals()
	H.add_overlay(cage_overlay)
	is_overlay_on = TRUE

	RegisterSignal(H, COMSIG_MOB_ITEM_EQUIPPED, .proc/mob_equipped_item)
	RegisterSignal(H, COMSIG_MOB_ITEM_DROPPED, .proc/mob_dropped_item)


/obj/item/genital_equipment/chastity_cage/belt/mob_can_equip(mob/M, equipper, slot, disable_warning, bypass_equip_delay_self, list/return_warning)
	if(!(M.client?.prefs.cit_toggles & CHASTITY))
		return FALSE
	return ..()

/obj/item/genital_equipment/chastity_cage/belt/equipped(mob/user, slot)
	INVOKE_ASYNC(src, .proc/not_sleepy_equipped, user, slot)
	. = .. ()

// This sucks
/obj/item/genital_equipment/chastity_cage/belt/on_attack_hand(mob/user)
	if(!is_equipped)
		. = ..()
	else
		unequip_process(blocked_genital, user)

/obj/item/genital_equipment/chastity_cage/belt/attackby(obj/item/I, mob/living/user)
	if(!is_equipped)
		. = ..()
	else
		unequip_process(blocked_genital, user)
//

/obj/item/genital_equipment/chastity_cage/belt/unequip(obj/item/organ/genital/G, mob/living/carbon/human/H)
	if(!blocked_genital)
		return

	if(blocked_genital == "anus" && !H.dna.features["has_anus"])
		REMOVE_TRAIT(H, TRAIT_CHASTENED_ANUS, CLOTHING_TRAIT)
		H.anus_toggle_visibility(GEN_VISIBLE_NO_UNDIES)
	else
		DISABLE_BITFIELD(blocked_genital.genital_flags, GENITAL_CHASTENED)

	is_equipped = FALSE

	H.update_genitals()
	H.cut_overlay(cage_overlay)
	is_overlay_on = FALSE

	blocked_genital = null
	H.dropItemToGround(src)

	UnregisterSignal(owner, list(COMSIG_MOB_ITEM_EQUIPPED, COMSIG_MOB_ITEM_DROPPED))

/obj/item/genital_equipment/chastity_cage/belt/Destroy()
	if(owner)
		if(!ishuman(owner))
			return

		unequip(blocked_genital, owner)

	. = ..()

/obj/item/genital_equipment/chastity_cage/belt/insert_item_organ(mob/living/carbon/target, mob/living/user, obj/item/organ/genital/target_organ)

/datum/strippable_item/start_unequip(atom/source, mob/user)
	var/obj/item/genital_equipment/chastity_cage/belt/belt = get_item(source)
	if(istype(belt))
		if(belt.blocked_genital && belt.owner)
			belt.unequip_process(belt.blocked_genital, user)
		return

	. = ..()
