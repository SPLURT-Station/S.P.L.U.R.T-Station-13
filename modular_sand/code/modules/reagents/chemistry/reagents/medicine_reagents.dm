/datum/reagent/medicine/mine_salve/on_mob_metabolize(mob/living/M) //modularisation for miners salve painkiller.
	..()
	if(iscarbon(M))
		ADD_TRAIT(M, TRAIT_PAINKILLER, PAINKILLER_MINERSSALVE)

/datum/reagent/medicine/mine_salve/on_mob_end_metabolize(mob/living/L)
	..()
	if(iscarbon(L))
		REMOVE_TRAIT(L, TRAIT_PAINKILLER, PAINKILLER_MINERSSALVE)
