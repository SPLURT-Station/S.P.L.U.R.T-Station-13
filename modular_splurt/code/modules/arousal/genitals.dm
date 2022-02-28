/obj/item/organ/genital
	var/datum/reagents/climax_fluids
	var/datum/reagent/original_fluid_id


/obj/item/organ/genital/proc/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
    return

/obj/item/organ/genital/proc/get_fluid_id()
	if(fluid_id)
		return fluid_id
	else if(linked_organ.fluid_id)
		return linked_organ.fluid_id
	return

/obj/item/organ/genital/proc/get_fluid_name()
	var/milkies = get_fluid_id()
	var/message
	if(!milkies) //No milkies??
		return
	var/datum/reagent/R = GLOB.chemical_reactions_list[milkies]
	message = R.name
	return message
