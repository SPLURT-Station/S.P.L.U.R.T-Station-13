/mob/living/carbon/human/mob_climax_partner(obj/item/organ/genital/G, mob/living/L, spillage, mb_time, obj/item/organ/genital/Lgen, forced = FALSE)
	. = ..()
	L.receive_climax(src, Lgen, G, spillage, forced = forced)

/mob/living/receive_climax(mob/living/partner, obj/item/organ/genital/receiver, obj/item/organ/genital/source_gen, spill, forced)
	. = ..()

	if(!receiver || spill || forced)
		return

	receiver.climax_modify_size(partner, source_gen)
