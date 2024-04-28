/mob/living/ComponentInitialize()
	. = ..()
	RegisterSignal(src, SIGNAL_TRAIT(TRAIT_FLOORED), PROC_REF(update_mobility))
