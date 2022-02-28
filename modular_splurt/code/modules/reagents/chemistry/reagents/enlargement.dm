/datum/reagent/fermi/breast_enlarger/overdose_process(mob/living/carbon/M)
	if(M.client?.prefs.cit_toggles & BREAST_ENLARGEMENT)
		var/obj/item/organ/genital/breasts/tity = M.getorganslot(ORGAN_SLOT_BREASTS)
		tity?.fluid_id = tity?.original_fluid_id
	. = ..()

/datum/reagent/fermi/penis_enlarger/overdose_process(mob/living/carbon/human/M)
	if(M.client?.prefs.cit_toggles & PENIS_ENLARGEMENT)
		var/obj/item/organ/genital/penis/pp = M.getorganslot(ORGAN_SLOT_PENIS)
		var/obj/item/organ/genital/testicles/balls = M.getorganslot(ORGAN_SLOT_TESTICLES)
		pp?.fluid_id = pp?.original_fluid_id
		balls?.fluid_id = balls?.original_fluid_id
	. = ..()

/datum/reagent/fermi/butt_enlarger/overdose_process(mob/living/M)
	if(M.client?.prefs.cit_toggles & BUTT_ENLARGEMENT)
		var/obj/item/organ/genital/butt/ass = M.getorganslot(ORGAN_SLOT_BUTT)
		ass?.fluid_id = ass?.original_fluid_id
	. = ..()

/datum/reagent/fermi/butt_enlarger/overdose_process(mob/living/M)
	if(M.client?.prefs.cit_toggles & BELLY_INFLATION)
		var/obj/item/organ/genital/belly/gut = M.getorganslot(ORGAN_SLOT_BELLY)
		gut?.fluid_id = gut?.original_fluid_id
	. = ..()
