/obj/item/organ/genital/vagina/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!.)
		return
	RegisterSignal(owner, COMSIG_MOB_CAME, .proc/splash_cum)

/obj/item/organ/genital/vagina/Remove(special)
	. = ..()
	var/mob/living/carbon/human/C = .
	if(!QDELETED(C))
		UnregisterSignal(C, COMSIG_MOB_CAME)

/obj/item/organ/genital/vagina/splash_cum(mob/living/carbon/human/orgasming, target_orifice, atom/partner, cumin, genital)
	. = ..()
	if(!. || !linked_organ)
		return

	if(get_size(owner) < 1.25)
		return

	// get target objects
	var/turf/target_turf = get_turf(owner)
	if(!istype(target_turf))
		return

	// splash affected objects
	for(var/atom/object in target_turf.contents)
		if(!istype(object) || isturf(object) || object == owner)
			continue
		object.add_cum_overlay(initial(linked_organ.fluid_id.color), get_size(owner) >= 1.5)
