/obj/item/organ/genital
	var/max_size = 6
	var/min_size = 1
	var/datum/reagents/climax_fluids
	var/datum/reagent/original_fluid_id
	var/datum/reagent/default_fluid_id
	var/list/writtentext = ""

/obj/item/organ/genital/modify_size(modifier, min, max)
	. = ..()
	if(owner) //Add extra space depending on the owner's size
		fluid_max_volume += (modifier*2.5)*(get_size(owner)-1)
		fluid_rate += (modifier/10)*(get_size(owner)-1)

/obj/item/organ/genital/proc/size_to_state()
	return size

/obj/item/organ/genital/proc/get_fluid()
	return clamp(fluid_rate * ((world.time - last_orgasmed) / (10 SECONDS)) * fluid_mult, 0, fluid_max_volume)

/obj/item/organ/genital/proc/get_fluid_fraction()
	return get_fluid() / fluid_max_volume

/obj/item/organ/genital/proc/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
    return

/obj/item/organ/genital/proc/get_fluid_id()
	if(fluid_id)
		return fluid_id
	else if(linked_organ?.fluid_id)
		return linked_organ.fluid_id
	return

/obj/item/organ/genital/proc/get_fluid_name()
	var/milkies = get_fluid_id()
	var/message
	if(!milkies) //No milkies??
		return
	var/datum/reagent/R = find_reagent_object_from_type(milkies)
	message = R.name
	return message

/obj/item/organ/genital/proc/get_default_fluid()
	if(default_fluid_id)
		return default_fluid_id
	else if(linked_organ?.default_fluid_id)
		return linked_organ.default_fluid_id
	return

/obj/item/organ/genital/proc/set_fluid_id(new_fluidtype)
	if(genital_flags & GENITAL_FUID_PRODUCTION)
		fluid_id = new_fluidtype
	else if(linked_organ?.genital_flags & GENITAL_FUID_PRODUCTION)
		linked_organ?.fluid_id = new_fluidtype

/obj/item/organ/genital
	var/list/obj/item/equipment = list()

/*
/obj/item/organ/genital/proc/remove_equipment(mob/living/carbon/remover, selection)
	var/obj/item/selected = equipment[selection]
	if(!selected)
		to_chat(remover, span_warning("[remover != owner ? owner.p_their() : "Your"] [name] doesn't have that equipped"))
		return

	if(remover == owner)
		owner.visible_message(message = span_lewd("<b>\The [owner]</b> slides the [selected] out of [owner.p_their()] [name]"),
		self_message = span_lewd("You feel the [selected] slide out of your [name]"),
		ignored_mobs = owner.get_unconsenting()
		)
	else
		owner.visible_message(message = "<span class='lewd'><b>\The [remover]</b> tries to remove the [selected] out of [owner]'s [name]",
		self_message = span_lewd("<b>\The [remover]</b> gently takes your [name] and starts sliding the [selected] out of it"),
		ignored_mobs = owner.get_unconsenting()
		)
		if(!do_mob(remover, owner, 4 SECONDS))
			return
		owner.visible_message(message = span_lewd("<b>\The [remover]</b> slides the [selected] out of [owner]'s [name]!"),
		self_message = span_lewd("You feel [remover]'s warm hand slide the [selected] out of your [name]</span>"),
		ignored_mobs = owner.get_unconsenting()
		)
	switch(selected.type)
		if(/obj/item/genital_equipment)
			var/obj/item/genital_equipment/eq = selected
			eq.genital_remove_proccess()
		if(/obj/item/electropack/vibrator)
			var/obj/item/electropack/vibrator/V = selected
			equipment.Remove(selection)
			V.loc = owner.loc
			V.inside = FALSE
		else
			selected.loc = owner.loc
			equipment.Remove(selection)
*/

/mob/living/carbon/human/update_genitals()
	. = ..()

	// Send signal
	SEND_SIGNAL(src, COMSIG_MOB_UPDATE_GENITALS)
