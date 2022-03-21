//////SLAVER BORG
/obj/item/antag_spawner/slaver_borg
	name = "slaver cyborg teleporter"
	desc = "A single-use teleporter designed to quickly reinforce operatives in the field."
	icon = 'icons/obj/device.dmi'
	icon_state = "locator"
	var/borg_to_spawn
	var/next_attempt_allowed // For some reason none of these antag spawners have an anti-spam mechanic. I'll add one here.

/obj/item/antag_spawner/slaver_borg/medical
	name = "slaver medical cyborg teleporter"
	borg_to_spawn = "Medical"

/obj/item/antag_spawner/slaver_borg/proc/check_usability(mob/user)
	if(used)
		to_chat(user, "<span class='warning'>[src] is out of power!</span>")
		return FALSE
	if(!user.mind.has_antag_datum(/datum/antagonist/slaver,TRUE))
		to_chat(user, "<span class='danger'>AUTHENTICATION FAILURE. ACCESS DENIED.</span>")
		return FALSE
	var/area/A = get_area(get_turf(user))
	if (!istype(A, /area/slavers))
		to_chat(user, "<span class='warning'>[src] is out of range! It can only be used at your hideout!</span>")
		return FALSE

	return TRUE

/obj/item/antag_spawner/slaver_borg/attack_self(mob/user)
	if(!(check_usability(user)))
		return

	if(!(next_attempt_allowed < world.time))
		to_chat(user, "<span class='warning'>A request has already been sent! Wait 1 minute.</span>")
		return
	next_attempt_allowed = world.time + 1 MINUTES

	to_chat(user, "<span class='notice'>You activate [src] and wait for confirmation.</span>")
	var/list/borg_candidates = pollGhostCandidates("Do you want to play as a slaver [lowertext(borg_to_spawn)] cyborg?", ROLE_SLAVER, null, ROLE_SLAVER, 150, POLL_IGNORE_SLAVER)
	if(LAZYLEN(borg_candidates))
		if(QDELETED(src) || !check_usability(user))
			return
		used = TRUE
		var/mob/dead/observer/G = pick(borg_candidates)
		spawn_antag(G.client, get_turf(src), "slaverborg", user.mind)
		do_sparks(4, TRUE, src)
		qdel(src)
	else
		to_chat(user, "<span class='warning'>Unable to connect to Slaver command. Please wait and try again later.</span>")

/obj/item/antag_spawner/slaver_borg/spawn_antag(client/C, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/R
	var/datum/antagonist/slaver/creator_slaver = user.has_antag_datum(/datum/antagonist/slaver,TRUE)
	if(!creator_slaver)
		return

	switch(borg_to_spawn)
		if("Medical")
			R = new /mob/living/silicon/robot/modules/syndicate/slaver/medical(T)
		else
			R = new /mob/living/silicon/robot/modules/slaver(T)

	R.radio = new /obj/item/radio/borg/syndicate(R)

	var/brainopsname = C.prefs.real_name

	R.mmi.name = "Man-Machine Interface: [brainopsname]"
	R.mmi.brain.name = "[brainopsname]'s brain"
	R.mmi.brainmob.real_name = brainopsname
	R.mmi.brainmob.name = brainopsname

	R.key = C.key
	R.apply_pref_name("cyborg", C)

	var/datum/antagonist/slaver/new_borg = new()
	new_borg.send_to_spawnpoint = FALSE
	R.mind.add_antag_datum(new_borg,creator_slaver.slaver_team)
	R.mind.special_role = "Slaver Cyborg"
	R.grant_language(/datum/language/codespeak, TRUE, TRUE)

	var/newName = sanitize_name(stripped_input(R, "Enter new robot name", "Cyborg Reclassification", "Cyborg", MAX_NAME_LEN))
	if (newName)
		R.custom_name = newName
		R.updatename()
