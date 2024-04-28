/obj/item/clothing/underwear/chastity_belt
	name = "chastity belt"
	icon = 'modular_splurt/icons/obj/lewd_items/chastity.dmi'
	mob_overlay_icon = 'modular_splurt/icons/obj/clothing/underwear.dmi'
	icon_state = "belt"
	item_flags = NO_UNIFORM_REQUIRED
	var/obj/item/genital_equipment/chastity_cage/belt
	var/obj/item/organ/genital/bepis

/obj/item/clothing/underwear/chastity_belt/Initialize(mapload, obj/item/genital_equipment/chastity_cage/initial_belt)
	if(initial_belt)
		belt = initial_belt
		belt.belt = src
		belt.forceMove(src)
	. = ..()

/obj/item/clothing/underwear/chastity_belt/Destroy()
	if(bepis)
		handle_cage_dropping(null, bepis, null)
	if(!QDELETED(belt))
		qdel(belt)
	. = ..()

/obj/item/clothing/underwear/chastity_belt/attackby(obj/item/W, mob/user, params)
	if(!istype(W, /obj/item/genital_equipment/chastity_cage))
		return ..()
	if(belt)
		to_chat(user, span_warning("The belt already has a cage!"))
		return

	belt = W
	belt.belt = src
	belt.forceMove(src)

/obj/item/clothing/underwear/chastity_belt/AltClick(mob/user)
	if(belt && !bepis)
		belt.belt = null
		user.put_in_hands(belt)
		belt = null
	. = ..()

/obj/item/clothing/underwear/chastity_belt/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning, bypass_equip_delay_self)
	if(!belt)
		return ..()

	if(!(slot == ITEM_SLOT_UNDERWEAR))
		return ..()

	if(!(M.client?.prefs.cit_toggles & CHASTITY))
		to_chat(equipper ? equipper : M, span_warning("They don't want you to do that!"))
		return FALSE

	var/exposed_genitals = list()
	var/mob/living/carbon/human/wearer = M

	for(var/obj/item/organ/genital/genital in wearer.internal_organs)
		if(genital.is_exposed() && genital.can_be_chastened())
			LAZYADD(exposed_genitals, genital)

	if(isemptylist(exposed_genitals))
		to_chat(equipper ? equipper : M, "<span class='warning'>\The [M] does not have any genitals exposed!</span>")
		return FALSE

	var/obj/item/organ/genital/blocked_genital = tgui_input_list(equipper ? equipper : M, "Choose a genital to block.", "Exposed genitals", ((exposed_genitals + list(ORGAN_SLOT_ANUS)) - list(ORGAN_SLOT_BUTT)), null)
	if(!blocked_genital)
		return FALSE

	if(blocked_genital != ORGAN_SLOT_ANUS && locate(/obj/item/genital_equipment/chastity_cage) in blocked_genital?.contents)
		to_chat(equipper ? equipper : M, "<span class='notice'>\The [M] already have a cage on them!</span>")
		return FALSE
	else if(blocked_genital == ORGAN_SLOT_ANUS && HAS_TRAIT(M, TRAIT_CHASTENED_ANUS))
		to_chat(equipper ? equipper : M, "<span class='notice'>\The [M] already have a cage on them!</span>")
		return FALSE

	bepis = blocked_genital
	. = ..()

/obj/item/clothing/underwear/chastity_belt/equipped(mob/user, slot)
	if(!(slot == ITEM_SLOT_UNDERWEAR))
		return

	if(bepis == ORGAN_SLOT_ANUS)
		bepis = list("genital" = bepis, "wearer" = user)

	if(belt)
		belt.item_inserted(belt, bepis, null)
		belt.equipment.holder_genital = bepis
	. = ..()

/obj/item/clothing/underwear/chastity_belt/dropped(mob/user)
	if(QDELETED(belt) && bepis)
		qdel(src)
	else if(belt && bepis)
		belt.item_removed(belt, bepis, null)
		belt.equipment.holder_genital = null
		bepis = null
	. = ..()

/obj/item/clothing/underwear/chastity_belt/proc/handle_cage_equipping(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	var/mob/living/carbon/human/H
	if(!istype(G))
		H = G["wearer"]
		ADD_TRAIT(H, TRAIT_CHASTENED_ANUS, CLOTHING_TRAIT)
		H.anus_toggle_visibility(GEN_VISIBLE_NEVER)
	else
		H = G.owner
		ENABLE_BITFIELD(G.genital_flags, GENITAL_CHASTENED)

	H.update_genitals()
	RegisterSignal(src, COMSIG_MOB_ITEM_DROPPING, PROC_REF(mob_can_unequip))

/obj/item/clothing/underwear/chastity_belt/proc/mob_can_unequip(obj/item/source, force, newloc, no_move, invdrop, silent)
	if(force)
		return

	if(belt && bepis)
		. = belt.item_removing(belt, bepis, null)
		. = . ? null : TRUE

	if(!. || QDELETED(belt))
		return null

/obj/item/clothing/underwear/chastity_belt/proc/handle_cage_dropping(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE

	var/mob/living/carbon/human/H
	if(!istype(G))
		H = G["wearer"]
		REMOVE_TRAIT(H, TRAIT_CHASTENED_ANUS, CLOTHING_TRAIT)
		H.anus_toggle_visibility(GEN_VISIBLE_NO_UNDIES)
	else
		H = G.owner
		DISABLE_BITFIELD(G.genital_flags, GENITAL_CHASTENED)

	H.update_genitals()
	UnregisterSignal(src, COMSIG_MOB_ITEM_DROPPING)
