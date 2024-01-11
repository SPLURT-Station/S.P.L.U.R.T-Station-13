/mob/living/carbon/human/do_climax(datum/reagents/R, atom/target, obj/item/organ/genital/G, spill) //Now I know how to modularize it :D
	. = ..()
	set_lust(0)
	SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "orgasm", /datum/mood_event/orgasm)
	var/message_to_display
	// We got pleased, let's get rid of some of it
	var/crocin_amount = reagents.get_reagent_amount(/datum/reagent/drug/aphrodisiac)
	if(crocin_amount)
		reagents.remove_reagent(/datum/reagent/drug/aphrodisiac, rand(10, max(30, crocin_amount / 5)))
		message_to_display = span_userlove("Mnn.. Yes...~")
	// More potent, harder to get rid of
	var/hexacrocin_amount = reagents.get_reagent_amount(/datum/reagent/drug/aphrodisiacplus)
	if(hexacrocin_amount)
		reagents.remove_reagent(/datum/reagent/drug/aphrodisiacplus, rand(2, max(15, hexacrocin_amount / 6)))
		message_to_display = span_userlove("YES~!")
	if(message_to_display)
		to_chat(src, message_to_display)

/mob/living/proc/pick_receiving_organ(mob/living/carbon/L, flag = CAN_CUM_INTO, title = "Climax", desc = "in what hole?")
	if (!istype(L))
		return
	var/list/receivers_list
	var/list/other_worn = L.get_equipped_items()
	for(var/obj/item/organ/genital/G in L.internal_organs)
		if((!flag || (G.genital_flags & flag)) && G.is_exposed(other_worn)) //filter out what you can't cum into
			LAZYADD(receivers_list, G)
	if(LAZYLEN(receivers_list))
		var/obj/item/organ/genital/ret_organ = input(src, desc, title, null) as null|obj in receivers_list
		return ret_organ
/*
/mob/living/proc/receive_climax(mob/living/partner, obj/item/organ/genital/receiver = null, obj/item/organ/genital/source_gen, spill = TRUE)
	if(!ishuman(src))
		return
	var/mob/living/carbon/human/h_self = src
	var/mob/living/carbon/human/h_partner = null
	if(ishuman(partner))
		h_partner = partner

	if(receiver)
		switch(receiver.slot) //Feel free to add more options for other receiving genitals if you desire
			if(ORGAN_SLOT_VAGINA)
				var/obj/item/organ/genital/womb/W = h_self.getorganslot(ORGAN_SLOT_WOMB)
				if(W && h_partner && !spill && !HAS_TRAIT(h_self, TRAIT_INFERTILE) && istype(source_gen, /obj/item/organ/genital/penis))
					var/obj/item/organ/genital/penis/Sp = source_gen
					if(prob(30 + clamp((70*(rand() + (h_self.sexual_potency + h_partner.sexual_potency)/200)), 0, 70)) && !W.impregnated && !Sp.equipment[GENITAL_EQUIPEMENT_CONDOM] && (Sp.linked_organ.fluid_id == /datum/reagent/consumable/semen))
						W.impregnated = TRUE
						log_game("Debug: [h_self] has been impregnated by [h_partner]")
						to_chat(src, span_userlove("You feel your hormones change, and a motherly instinct take over."))
						var/obj/item/organ/genital/breasts/B = h_self.getorganslot(ORGAN_SLOT_BREASTS)
						if(B)
							B.fluid_rate *= 2
*/
