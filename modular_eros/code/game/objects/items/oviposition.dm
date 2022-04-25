/obj/item/reagent_containers/food/snacks/egg/oviposition
	var/baby_type = /mob/living/carbon/human
	var/datum/dna/progenitor_dna
	var/pregnancy_start = 0

/obj/item/reagent_containers/food/snacks/egg/oviposition/Initialize(datum/status_effect/pregnancy/pregnancy)
	. = ..()
	if(pregnancy)
		inherit_pregnancy(pregnancy)
		START_PROCESSING(SSobj, src)
	else
		pregnancy_start = world.time

/obj/item/reagent_containers/food/snacks/egg/oviposition/process()
	. = ..()

/obj/item/reagent_containers/food/snacks/egg/oviposition/proc/inherit_pregnancy(datum/status_effect/pregnancy/pregnancy)
	pregnancy_start = pregnancy.pregnancy_start
	baby_type = pregnancy.baby_type
	if(ispath(baby_type, /mob/living/carbon/human))
		var/mob/living/carbon/human/progenitor = pregnancy.owner
		if(pregnancy.father && (!pregnancy.like_mother_like_son || !istype(progenitor)))
			var/mob/living/carbon/human/daddy = pregnancy.father.resolve()
			if(istype(daddy))
				progenitor = daddy
		if(istype(progenitor))
			progenitor_dna = new()
			progenitor.dna.copy_dna(progenitor_dna)
