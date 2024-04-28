/mob/living/simple_animal/hostile/deathclaw/funclaw
	name = "Funclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one seems to have a strange look in its eyes.."
	var/change_target_hole_cooldown = 0
	var/chosen_hole
	var/voremode = FALSE // Fixes runtime when grabbing victim
	gold_core_spawnable = NO_SPAWN // Admin only
	deathclaw_mode = "rape"

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one has the bedroom eyes.."
	deathclaw_mode = "gentle"

/mob/living/simple_animal/hostile/deathclaw/funclaw/abomination
	name = "Exiled Deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one has a strange smell for some reason.."
	deathclaw_mode = "abomination"

/mob/living/simple_animal/hostile/deathclaw/funclaw/AttackingTarget()
	var/mob/living/M = target

	var/onLewdCooldown = FALSE
	var/wantsNoncon = FALSE

	if(get_refraction_dif() > 0)
		onLewdCooldown = TRUE

	if(M.client && M.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(M.client?.prefs.toggles, VERB_CONSENT) && M.client?.prefs.nonconpref == "Yes")
		wantsNoncon = TRUE

	switch(deathclaw_mode)
		if("gentle")
			if(onLewdCooldown || !wantsNoncon)
				return // Do nothing
		if("abomination")
			if(onLewdCooldown || !wantsNoncon)
				return // Do nothing
		if("rape")
			if(onLewdCooldown || !wantsNoncon || M.health > 60)
				..() // Attack target
				return

	if(!M.pulledby)
		if(!M.buckled && !M.density)
			M.forceMove(src.loc)

		start_pulling(M, supress_message = TRUE)
		log_combat(src, M, "grabbed")
		M.visible_message(span_warning("[src] violently grabs [M]!"), \
			span_userdanger("[src] violently grabs you!"))
		setGrabState(GRAB_NECK) //Instant neck grab

		return

	if(get_refraction_dif() > 0)
		..()
		return

	if(change_target_hole_cooldown < world.time)
		chosen_hole = null
		while (chosen_hole == null)
			pickNewHole(M)
		change_target_hole_cooldown = world.time + 100


	do_lewd_action(M)
	addtimer(CALLBACK(src, PROC_REF(do_lewd_action), M), rand(8, 12))

	// Regular sex has an extra action per tick to seem less slow and robotic
	if(deathclaw_mode != "abomination" || M.client?.prefs.unholypref != "Yes")
		addtimer(CALLBACK(src, PROC_REF(do_lewd_action), M), rand(12, 16))


/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pickNewHole(mob/living/M)
	switch(rand(2))
		if(0)
			chosen_hole = CUM_TARGET_ANUS
		if(1)
			if(M.has_vagina())
				chosen_hole = CUM_TARGET_VAGINA
			else
				chosen_hole = CUM_TARGET_ANUS
		if(2)
			chosen_hole = CUM_TARGET_THROAT

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/do_lewd_action(mob/living/M)
	if(get_refraction_dif() > 0)
		return

	if(rand(1,7) == 7)
		playlewdinteractionsound(loc, "modular_splurt/sound/lewd/deathclaw_grunt[rand(1, 5)].ogg", 30, 1, -1)

	var/datum/interaction/I
	switch(chosen_hole)
		if(CUM_TARGET_ANUS)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return

			// Abomination deathclaws do other stuff instead
			if(deathclaw_mode == "abomination" && M.client?.prefs.unholypref == "Yes")
				if(prob(1))
					I = SSinteractions.interactions["/datum/interaction/lewd/grindmouth"]
				else
					I = SSinteractions.interactions["/datum/interaction/lewd/grindface"]
				handle_post_sex(25, null, M)
			else
				I = SSinteractions.interactions["/datum/interaction/lewd/fuck/anal"]
			I.display_interaction(src, M)

		if(CUM_TARGET_VAGINA)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return

			// Abomination deathclaws do other stuff instead
			if(deathclaw_mode == "abomination" && M.client?.prefs.unholypref == "Yes")
				I = SSinteractions.interactions["/datum/interaction/lewd/footjob/vagina"]
				handle_post_sex(10, null, M)
			else
				I = SSinteractions.interactions["/datum/interaction/lewd/fuck"]
			I.display_interaction(src, M)

		if(CUM_TARGET_THROAT)
			if(tearSlot(M, ITEM_SLOT_HEAD))
				return
			if(tearSlot(M, ITEM_SLOT_MASK))
				return

			// Abomination deathclaws do other stuff instead
			if(deathclaw_mode == "abomination" && M.client?.prefs.unholypref == "Yes")
				if(prob(1))
					do_faceshit(M)
				else
					do_facefart(M)
				handle_post_sex(25, null, M)
				shake_camera(M, 6, 1)
			else
				I = SSinteractions.interactions["/datum/interaction/lewd/throatfuck"]
				I.display_interaction(src, M)

/mob/living/simple_animal/hostile/deathclaw/funclaw/cum(mob/living/M)

	if(get_refraction_dif() > 0)
		return

	var/message

	if(!istype(M))
		chosen_hole = null

	switch(chosen_hole)
		if(CUM_TARGET_THROAT)
			if(M.has_mouth() && M.mouth_is_free())
				message = "shoves their fat reptillian cock deep down \the [M]'s throat and cums."
			else
				message = "cums on \the [M]'s face."
		if(CUM_TARGET_VAGINA)
			if(M.is_bottomless() && M.has_vagina())
				message = "rams its meaty cock into \the [M]'s pussy and fills it with sperm."
				M.impregnate(src, M.getorganslot(ORGAN_SLOT_WOMB), src.type)
			else
				message = "cums on \the [M]'s belly."
		if(CUM_TARGET_ANUS)
			if(M.is_bottomless() && M.has_anus())
				message = "hilts its knot into \the [M]'s ass and floods it with Deathclaw jizz."
			else
				message = "cums on \the [M]'s backside."
		else
			message = "cums on the floor!"

	if(deathclaw_mode == "abomination" && M.client?.prefs.unholypref == "Yes")
		message = "cums all over [M]'s body"

	if(istype(M, /mob/living/carbon))
		M.reagents.add_reagent(/datum/reagent/consumable/semen, 30)
	new /obj/effect/decal/cleanable/semen(loc)

	playlewdinteractionsound(loc, "modular_splurt/sound/lewd/deathclaw[rand(1, 2)].ogg", 30, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	shake_camera(M, 6, 1)
	set_is_fucking(null ,null)

	refractory_period = world.time + rand(100, 150) // Sex cooldown
	set_lust(0) // Nuts at 400

	addtimer(CALLBACK(src, PROC_REF(slap), M), 15)


/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/slap(mob/living/M)
	playlewdinteractionsound(loc, "modular_sand/sound/interactions/slap.ogg", 30, 1, -1)
	visible_message(span_danger("\The [src]</b> slaps \the [M] right on the ass!"), \
			span_userdanger("\The [src]</b> slaps \the [M] right on the ass!"), null, COMBAT_MESSAGE_RANGE)

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/tearSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		M.dropItemToGround(W)
		playlewdinteractionsound(loc, "sound/items/poster_ripped.ogg", 30, 1, -1)
		visible_message(span_danger("\The [src]</b> tears off \the [M]'s clothes!"), \
				span_userdanger("\The [src]</b> tears off \the [M]'s clothes!"), null, COMBAT_MESSAGE_RANGE)
		return TRUE
	return FALSE
