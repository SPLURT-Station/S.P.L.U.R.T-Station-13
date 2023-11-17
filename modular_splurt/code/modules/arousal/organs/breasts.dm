/obj/item/organ/genital/breasts
	default_fluid_id = /datum/reagent/consumable/milk

/obj/item/organ/genital/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!.)
		return
	RegisterSignal(owner, COMSIG_MOB_POST_CAME, .proc/splash_cum)

/obj/item/organ/genital/breasts/Remove(special)
	. = ..()
	var/mob/living/carbon/human/C = .
	if(!QDELETED(C))
		UnregisterSignal(C, COMSIG_MOB_POST_CAME)

/obj/item/organ/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["breasts_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["breasts_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		else if(fluid && (fluid in GLOB.genital_fluids_list))
			fluid_id = D.features["breasts_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()
	fluid_max_volume += ((size - initial(size))*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((size - initial(size))/10)*(owner ? get_size(owner) : 1)

/obj/item/organ/genital/breasts/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
	if(!(owner.client?.prefs.cit_toggles & BREAST_ENLARGEMENT))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable(partner)
	if(!fluid_source)
		return

	if(!climax_fluids)
		climax_fluids = new
		climax_fluids.maximum_volume = INFINITY //Just in case

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(climax_fluids, fluid_source.total_volume)

	if(climax_fluids.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		modify_size(climax_fluids.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The <b>[owner]</b>'s [pick(GLOB.breast_nouns)] swell up with the surge of [lowertext(source_gen.get_fluid_name())] from \the <b>[partner]</b>'s [source_gen.name]", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()

/obj/item/organ/genital/breasts/splash_cum(mob/living/carbon/human/orgasming, target_orifice, atom/partner, cumin, genital)
	. = ..()
	if(!.)
		return

	// determine size stage
	var/width_multiplier = 0
	if(HAS_TRAIT(owner,TRAIT_MESSY))
		width_multiplier = 2
	else
		switch(round(size * get_size(owner)))
			if(10 to 20)
				width_multiplier = 1
			if(20 to INFINITY)
				width_multiplier = 2
			else
				return

	// get affected objects
	var/turf/target_turf = owner.loc
	var/list/atom/cumsplashed_items = list()
	if(!istype(target_turf))
		return
	for(var/i in 0 to width_multiplier)
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
		object.add_cum_overlay(initial(fluid_id.color), width_multiplier > 1 ? TRUE : FALSE)
