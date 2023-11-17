/obj/item/organ/genital/penis/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!.)
		return
	RegisterSignal(owner, COMSIG_MOB_POST_CAME, .proc/splash_cum)

/obj/item/organ/genital/penis/Remove(special)
	. = ..()
	var/mob/living/carbon/human/C = .
	if(!QDELETED(C))
		UnregisterSignal(C, COMSIG_MOB_POST_CAME)

/obj/item/organ/genital/penis/get_features(mob/living/carbon/human/H)
	. = ..()
	original_fluid_id = fluid_id
	fluid_max_volume += ((length - initial(length))*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((length - initial(length))/10)*(owner ? get_size(owner) : 1)

/obj/item/organ/genital/penis/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
	if(!(owner.client?.prefs.cit_toggles & PENIS_ENLARGEMENT))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable(partner)
	if(!fluid_source)
		return

	var/datum/reagents/target
	if(linked_organ)
		if(!linked_organ.climax_fluids)
			linked_organ.climax_fluids = new
			linked_organ.climax_fluids.maximum_volume = INFINITY
		target = linked_organ.climax_fluids
	else
		if(!climax_fluids)
			climax_fluids = new
			climax_fluids.maximum_volume = INFINITY
		target = climax_fluids

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(target, fluid_source.total_volume)

	if(target.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		modify_size(target.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message(span_lewd("\The <b>[owner]</b>'s [pick(GLOB.dick_nouns)][linked_organ ? " and [pick(list("nuts", "balls", "testicles", "ballsack", "sack"))]" : ""] swell and grow bigger as they get pumped full of \the <b>[partner]</b>'s [lowertext(source_gen.get_fluid_name())]!"), ignored_mobs = owner.get_unconsenting())
			if(linked_organ)
				linked_organ.fluid_id = source_gen.get_fluid_id()
		target.clear_reagents()

/obj/item/organ/genital/penis/splash_cum(mob/living/carbon/human/orgasming, target_orifice, atom/partner, cumin, genital)
	. = ..()
	if(!. || !linked_organ)
		return

	// determine size stage
	var/length_multiplier = 0
	if(HAS_TRAIT(owner,TRAIT_MESSY))
		length_multiplier = 2
	else
		switch(round(length * get_size(owner)))
			if(16 to 32)
				length_multiplier = 1
			if(32 to INFINITY)
				length_multiplier = 2
			else
				return

	// get affected objects
	var/turf/target_turf = owner.loc
	var/list/atom/cumsplashed_items = list()
	if(!istype(target_turf))
		return
	for(var/i in 0 to length_multiplier)
		target_turf = get_step(target_turf, owner.dir)
		for(var/object in target_turf.contents)
			if(isturf(object))
				continue
			if(ishuman(object))
				var/mob/living/carbon/human/H = object
				if(!(H.client?.prefs.cit_toggles & CUM_ONTO))
					continue
			LAZYADD(cumsplashed_items, object)
		if(cumsplashed_items.len)
			break

	// splash affected objects
	for(var/atom/object in cumsplashed_items)
		object.add_cum_overlay(initial(linked_organ.fluid_id.color), length_multiplier > 1 ? TRUE : FALSE)
