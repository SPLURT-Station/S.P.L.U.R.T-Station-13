/// Ties the target's shoes
/datum/smite/shoes
	name = "Knot Shoes"

/datum/smite/shoes/effect(client/user, mob/living/target)
	. = ..()
	if(!iscarbon(target))
		to_chat(usr,"<span class='warning'>This must be used on a carbon mob.</span>")
		return
	var/mob/living/carbon/C = target
	var/obj/item/clothing/shoes/sick_kicks = C.shoes
	if(!sick_kicks?.can_be_tied)
		to_chat(usr,"<span class='warning'>[C] does not have knottable shoes!</span>")
		return
	sick_kicks.adjust_laces(SHOES_KNOTTED)
