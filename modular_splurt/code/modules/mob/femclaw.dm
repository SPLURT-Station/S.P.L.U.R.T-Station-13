#define LEWD_VERB_PREFIX "/datum/interaction/lewd/"

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw
	icon = 'modular_splurt/icons/mob/femclaw/newclaws.dmi'
	icon_state = "newclaw"
	var/base_state = "newclaw"
	var/cock_state = "newclaw_cocked"
	var/cock_shown = FALSE

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/alphaclaw
	name = "Alpha Funclaw"
	icon_state = "alphaclaw"
	base_state = "alphaclaw"
	cock_state = "alphaclaw_cocked"

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/death()
	..()
	gib()

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/proc/show_cock()
	if (cock_shown)
		return
	cock_shown = TRUE
	icon_state = cock_state
	visible_message("<font color=purple><b>\The [src]</b>'s cock unsheathes</font>")

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/proc/hide_cock()
	if (!cock_shown)
		return
	cock_shown = FALSE
	icon_state = base_state
	visible_message("<font color=purple><b>\The [src]</b>'s cock slowly retracts back into its sheate</font>")

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle/newclaw/handle_post_sex(amount, orifice, mob/living/partner)
	..()
	if (lust > 0)
		show_cock()
	else
		hide_cock()

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw
	icon = 'modular_splurt/icons/mob/femclaw/newclaws.dmi'
	icon_state = "femclaw"
	gender = FEMALE
	has_penis = FALSE
	has_vagina = TRUE
	has_breasts = TRUE
	has_anus = TRUE
	gold_core_spawnable = FRIENDLY_SPAWN // YES.
	deathclaw_mode = "rape"
	name = "Breasted Funclaw"
	desc = "She's large and in charge... and has her eyes on you."
	maxHealth = 400
	health = 400
	armour_penetration = 45
	var/extra_sexxo = 1
	var/body_colors = "#847559"

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/mommyclaw
	icon_state = "mommyclaw"
	desc = "A machine that turns her victim's pelvis into pelvwas."
	name = "Mommy Funclaw"
	maxHealth = 1200
	health = 1200
	obj_damage = 145
	armour_penetration = 80
	melee_damage_lower = 80
	melee_damage_upper = 80
	body_colors = "#6790c2"

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/death()
	..()
	gib()

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/AttackingTarget()
	var/mob/living/M = target

	var/onLewdCooldown = FALSE
	var/wantsNoncon = FALSE

	if(get_refraction_dif() > 0)
		onLewdCooldown = TRUE

	if(M.client && M.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(M.client?.prefs.toggles, VERB_CONSENT) && M.client?.prefs.nonconpref == "Yes")
		wantsNoncon = TRUE

	if(onLewdCooldown || !wantsNoncon)
		LosePatience()
		return // Do nothing

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
			pickNewFemHole(M)
		change_target_hole_cooldown = world.time + 100

	do_femlewd_action(M)

	for(var/i in 1 to extra_sexxo)
		addtimer(CALLBACK(src, PROC_REF(do_femlewd_action), M), rand(12, 16))


/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/proc/pickNewFemHole(mob/living/M)
	var/list/listOfSexxo = list()

	//Face sit... ayo
	listOfSexxo.Add("mountface")
	//Breast smother
	listOfSexxo.Add("do_breastsmother")
	//Shove their face into vag
	listOfSexxo.Add("facefuck/vag")

	if(M.has_penis())
		//Anal
		listOfSexxo.Add("mountass")
		//Boob job
		listOfSexxo.Add("do_boobjob")
		//Thigh job
		listOfSexxo.Add("do_thighjob")
		//Regular penetration
		listOfSexxo.Add("mount")
		//Suck em dry
		listOfSexxo.Add("oral/blowjob")

	chosen_hole = pick(listOfSexxo)

/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/proc/do_femlewd_action(mob/living/M)

	if(get_refraction_dif() > 0)
		return

	if(rand(1,7) == 7)
		playlewdinteractionsound(loc, "modular_splurt/sound/lewd/deathclaw_grunt[rand(1, 5)].ogg", 30, 1, -1)

	//One by one... strip em

	//Anything over the suit goes off, we're doing this RAW.
	if(tearSlot(M, ITEM_SLOT_OCLOTHING))
		return

	//RAW!!
	if(tearSlot(M, ITEM_SLOT_ICLOTHING))
		return

	//Show me that face of yours
	if(tearSlot(M, ITEM_SLOT_HEAD))
		return

	//Fuck hole included
	if(tearSlot(M, ITEM_SLOT_MASK))
		return

	var/datum/interaction/I = SSinteractions.interactions[LEWD_VERB_PREFIX + chosen_hole]
	I.display_interaction(src, M)

#undef LEWD_VERB_PREFIX
