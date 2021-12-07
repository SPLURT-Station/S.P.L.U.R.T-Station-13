/mob/living/carbon/human/proc/pick_receiving_organ(mob/living/L)
	if (!iscarbon(L))
		return
	var/mob/living/carbon/C = L
	var/list/receivers_list
	var/list/other_worn = C.get_equipped_items()
	for(var/obj/item/organ/genital/G in C.internal_organs)
		if((G.genital_flags & CAN_CUM_INTO) && G.is_exposed(other_worn)) //filter out what you can't cum into
			LAZYADD(receivers_list, G)
	if(LAZYLEN(receivers_list))
		var/obj/item/organ/genital/ret_organ = input(src, "in what hole?", "Climax", null) as null|obj in receivers_list
		return ret_organ

/mob/living/proc/receive_climax(mob/living/partner, obj/item/organ/genital/receiver = null, obj/item/organ/genital/source_gen, spill = TRUE)
	if(!ishuman(src))
		return
	var/mob/living/carbon/human/h_self = src
	var/mob/living/carbon/human/h_partner = null

	if(istype(source_gen, /obj/item/organ/genital/penis))
		h_self.cumdrip_rate += rand(5,10)

	if(ishuman(partner))
		h_partner = partner
	if(receiver)
		switch(receiver.slot) //Feel free to add more options for other receiving genitals if you desire
			if(ORGAN_SLOT_VAGINA)
				var/obj/item/organ/genital/womb/W = h_self.getorganslot(ORGAN_SLOT_WOMB)
				if(W && h_partner && !spill && !HAS_TRAIT(h_self, TRAIT_INFERTILE) && istype(source_gen, /obj/item/organ/genital/penis))
					if(prob(30 + clamp((70*(rand() + (h_self.sexual_potency + h_partner.sexual_potency)/200)), 0, 70)) && !W.impregnated)
						W.impregnated = TRUE
						log_game("Debug: [h_self] has been impregnated by [h_partner]")
						to_chat(src, "<span class='userlove'>You feel your hormones change, and a motherly instinct take over.</span>")
						var/obj/item/organ/genital/breasts/B = h_self.getorganslot(ORGAN_SLOT_BREASTS)
						if(B)
							B.fluid_rate *= 2
