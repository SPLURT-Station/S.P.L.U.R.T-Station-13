/mob/living/carbon/human/resist_restraints()
	if(w_underwear && w_underwear.breakouttime)
		MarkResistTime()
		cuff_resist(w_underwear)
	else
		..()
