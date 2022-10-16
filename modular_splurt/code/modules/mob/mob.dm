/mob/Initialize()
	. = ..()
	create_player_panel()

/mob/Destroy()
	QDEL_NULL(mob_panel)
	. = ..()

/mob/verb/tilt_left()
	set hidden = TRUE
	if(!canface() || is_tilted < -45)
		return FALSE
	transform = transform.Turn(-1)
	is_tilted--

/mob/verb/tilt_right()
	set hidden = TRUE
	if(!canface() || is_tilted > 45)
		return FALSE
	transform = transform.Turn(1)
	is_tilted++

/mob/proc/has_spell(spelltype)
	if (!mind)
		return FALSE

	for(var/obj/effect/proc_holder/spell/S in mind.spell_list)
		if(S.type == spelltype)
			return TRUE
	return FALSE

/mob/proc/create_player_panel()
	QDEL_NULL(mob_panel)
	mob_panel = new(src)

/mob/verb/check_out(atom/A as mob in view())
	set name = "Check Out"
	set category = "IC"

	. = examinate(A)
	if (.)
		return
	to_chat(A, "<span class='notice'>[src] seems to be checking you out.</span>")

/mob/proc/check_equip_obscured_slots()
	var/list/slots = check_obscured_slots()
	if(can_equip_underwear())
		slots -= ITEM_SLOT_UNDERWEAR
	return slots

/mob/proc/can_equip_underwear()
	for(var/obj/item/I in list(w_uniform, wear_suit))
		var/body_parts_covered = I.body_parts_covered
		if(istype(I, /obj/item/clothing))
			var/obj/item/clothing/cloth = I
			body_parts_covered &= ~cloth.get_body_parts_equip_uncovered()
		if(istype(I) && (body_parts_covered & GROIN) || (I.flags_inv & HIDEUNDERWEAR))
			return FALSE
	return TRUE
