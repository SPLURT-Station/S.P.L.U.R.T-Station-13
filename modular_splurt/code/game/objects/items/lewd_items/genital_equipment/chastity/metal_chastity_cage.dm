/obj/item/genital_equipment/chastity_cage/metal
	name = "metal chastity cage"
	icon_state = "metal_cage"

	break_time = 40 SECONDS
	break_require = TOOL_WELDER
	
	var/jingle_chance = 1.25//in percentage
	var/mutable_appearance/skin_overlay
	var/skin_overlay_layer = -(GENITALS_FRONT_LAYER - 0.02)

/obj/item/genital_equipment/chastity_cage/metal/equip(user, target, obj/item/organ/genital/penis/penor)
	. = ..()
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, .proc/on_move)

	skin_overlay = mutable_appearance(icon, "worn_[icon_state]_[cage_sprite]_skin", skin_overlay_layer)
	skin_overlay.color = penor.color

	owner.add_overlay(skin_overlay)

/obj/item/genital_equipment/chastity_cage/metal/proc/on_move(atom/old_loc, dir)
	if(owner.stat == CONSCIOUS && prob(jingle_chance))
		owner.visible_message("<span class='warning'>[owner.name] jingles slightly as they move.</span>",
							"<span class='warning'>You jingle slightly as you move.")

/obj/item/genital_equipment/chastity_cage/metal/unequip(obj/item/organ/genital/G)
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	owner.cut_overlay(skin_overlay)
	. = ..()
