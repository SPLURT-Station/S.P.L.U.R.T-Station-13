/mob/living/carbon/wendigo/UnarmedAttack(atom/A, proximity)
	A.attack_hand(src)

/mob/living/carbon/wendigo/canUseTopic(atom/movable/M, be_close=FALSE, no_dextery=FALSE, no_tk=FALSE, check_resting=FALSE)
	if(incapacitated() || lying)
		to_chat(src, span_warning("You can't do that right now!"))
		return FALSE
	if(be_close && !in_range(M, src))
		to_chat(src, span_warning("You are too far away!"))
		return FALSE
	return TRUE
