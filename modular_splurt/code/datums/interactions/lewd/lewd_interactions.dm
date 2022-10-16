//help
/datum/interaction/lewd

	var/unholy = FALSE //Same as extreme but... we don't talk about this one...

	var/require_user_legs
	var/require_user_num_legs

	var/require_target_legs
	var/require_target_num_legs

	var/require_user_belly
	var/require_target_belly

	var/can_hand_slide = FALSE

/datum/interaction/lewd/evaluate_user(mob/living/user, silent = TRUE, action_check = TRUE)
	if(require_user_belly)
		switch(require_user_belly)
			if(REQUIRE_EXPOSED)
				if(!user.has_belly(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your belly needs to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_belly(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>Your belly seems to be too flat for that.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_belly(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your belly needs to be unexposed.</span>")
					return FALSE

	if(require_user_legs)
		switch(require_user_legs)
			if(REQUIRE_EXPOSED)
				if(!user.has_legs(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your legs need to be exposed.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_legs(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your legs need to be unexposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_legs(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have enough legs.</span>")
					return FALSE

	if(require_user_num_legs && (user.has_legs() < require_user_num_legs))
		if(!silent)
			to_chat(user, "<span class='warning'>Your don't have enough legs.</span>")
		return FALSE


	if(unholy)
		var/client/cli = user.client
		if(cli)
			if(cli.prefs.unholypref == "No")
				if(!silent)
					to_chat(user, "<span class='warning'>That's way too much for you.</span>")
				return FALSE
	. = ..()

/datum/interaction/lewd/evaluate_target(mob/living/user, mob/living/target, silent = TRUE)
	if(require_target_belly)
		switch(require_target_belly)
			if(REQUIRE_EXPOSED)
				if(!target.has_belly(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their belly needs to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_belly(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>Their belly seems to be too flat for that.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_belly(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their belly needs to be unexposed.</span>")
					return FALSE

	if(require_target_legs)
		switch(require_target_legs)
			if(REQUIRE_EXPOSED)
				if(!target.has_legs(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>[target.p_their()] legs need to be exposed.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_legs(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>[target.p_their()] legs need to be unexposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_legs(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>[target.p_they()] [target.p_do()]n't have enough legs.</span>")
					return FALSE

	if(require_target_num_legs && (target.has_legs() < require_target_num_legs))
		if(!silent)
			to_chat(user, "<span class='warning'>[target.p_they()] [target.p_do()]n't have enough legs.</span>")
		return FALSE

	if(unholy)
		var/client/cli = target.client
		if(cli)
			if(target.client.prefs.unholypref == "No")
				if(!silent)
					to_chat(user, "<span class='warning'>For some reason, you don't want to do this to [target].</span>")
				return FALSE
	. = ..()

/mob/living/list_interaction_attributes(mob/living/LM, mob/living/LT)
	. = ..()
	if(has_belly(REQUIRE_EXPOSED))
		. += "...have a belly"
	if(LM == src && istype(LM, /mob/living/carbon))
		var/mob/living/carbon/LMC = LM
		if(LMC.hand_slide_target == LT)
			. += "...slid your hand [LMC.hand_slide_part == CHEST ? "up" : "under"] their [LMC.get_hand_slide_clothing_name(LMC.hand_slide_target, LMC.hand_slide_part)]"
	else if(LT == src && istype(LT, /mob/living/carbon))
		var/mob/living/carbon/LTC = LT
		if(LTC.hand_slide_target == LM)
			. += "...slid their hand [LTC.hand_slide_part == CHEST ? "up" : "under"] your [LTC.get_hand_slide_clothing_name(LTC.hand_slide_target, LTC.hand_slide_part)]"
