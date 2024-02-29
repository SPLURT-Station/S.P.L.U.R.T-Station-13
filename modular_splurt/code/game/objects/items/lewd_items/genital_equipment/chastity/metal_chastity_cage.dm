/obj/item/genital_equipment/chastity_cage/metal
	name = "metal chastity cage"
	icon_state = "metal_cage"

	break_time = 40 SECONDS
	break_require = TOOL_WELDER

	var/jingle_chance = 1.25//in percentage
	var/mutable_appearance/skin_overlay
	var/skin_overlay_layer = -(GENITALS_FRONT_LAYER - 0.01)

/obj/item/genital_equipment/chastity_cage/metal/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = ..() // Call the parent proc

	var/mob/living/carbon/human/H = G.owner
	RegisterSignal(H, COMSIG_MOVABLE_MOVED, .proc/on_move)

	skin_overlay = mutable_appearance(icon, "worn_[icon_state]_[cage_sprite]_skin", skin_overlay_layer)
	skin_overlay.color = G.color

	H.add_overlay(skin_overlay)

/obj/item/genital_equipment/chastity_cage/metal/proc/on_move(atom/old_loc, dir)
	var/mob/living/carbon/human/H = equipment.holder_genital.owner
	if(H.stat == CONSCIOUS && prob(jingle_chance))
		H.visible_message("<span class='warning'>[H.name] jingles slightly as they move.</span>",
							"<span class='warning'>You jingle slightly as you move.")

/obj/item/genital_equipment/chastity_cage/metal/item_removed(datum/source, obj/item/organ/genital/G, mob/user)
	var/mob/living/carbon/human/H = G.owner
	UnregisterSignal(H, COMSIG_MOVABLE_MOVED)
	H.cut_overlay(skin_overlay)
	. = ..()

/obj/item/genital_equipment/chastity_cage/metal/mob_equipped_item(datum/source, obj/item/I)
	. = ..() // Call the parent proc
	var/mob/living/carbon/human/H = source
	if(istype(I, /obj/item/clothing/under))
		H.cut_overlay(skin_overlay)

/obj/item/genital_equipment/chastity_cage/metal/mob_dropped_item(datum/source, obj/item/I)
	. = ..() // Call the parent proc
	var/mob/living/carbon/human/H = source
	if(istype(I, /obj/item/clothing/under))
		H.add_overlay(skin_overlay)
