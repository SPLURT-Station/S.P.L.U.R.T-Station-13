/datum/round_event_control/crystalline_reentry
	name = "Crystalline Asteroid"
	typepath = /datum/round_event/crystalline_reentry
	min_players = 15
	max_occurrences = 0 //Deactivated for now
	var/atom/special_target
	category = EVENT_CATEGORY_SPACE

/datum/round_event_control/crystalline_reentry/admin_setup()
	if(!check_rights(R_FUN))
		return
	var/aimed = alert("Aimed at current location?","Snipe", "Yes", "No")
	if(aimed == "Yes")
		special_target = get_turf(usr)

/datum/round_event/crystalline_reentry
	announce_when = 0
	start_when = 10
	fakeable = FALSE

/datum/round_event/crystalline_reentry/announce(fake)
	priority_announce("A crystalline asteroid has suffered a violent atmospheric entry. Brace for possible impact.", "General Alert")

/datum/round_event/crystalline_reentry/start()
	var/datum/round_event_control/crystalline_reentry/C = control
	var/startside = pick(GLOB.cardinals)
	var/z = pick(SSmapping.levels_by_trait(ZTRAIT_STATION))
	var/turf/startT = spaceDebrisStartLoc(startside, z)
	var/turf/endT = spaceDebrisFinishLoc(startside, z)
	new /obj/effect/crystalline_reentry(startT, endT, C.special_target)

/datum/round_event_control/crystalline_wave
	name = "Catastrophic Crystalline Asteroid Wave"
	typepath = /datum/round_event/crystalline_wave
	min_players = 35
	max_occurrences = 0 //This is only an admin spawn. Ergo, wrath of the gods.
	var/atom/special_target
	category = EVENT_CATEGORY_SPACE

/datum/round_event_control/crystalline_wave/admin_setup()
	if(!check_rights(R_FUN))
		return
	/* No special target for you
	var/aimed = alert("Aimed at current location?","Snipe", "Yes", "No")
	if(aimed == "Yes")
		special_target = get_turf(usr)
	*/
	var/randselect = pick("https://youtu.be/S0HTqqwZq-o","https://youtu.be/Liv4CvpMdRA","https://youtu.be/9XZyQ12qt7w")
	message_admins("A crystalline asteroid wave has been triggered. Maybe you should add some music for the players? Consider this random selection: [randselect]")

/datum/round_event/crystalline_wave
	announce_when = 0
	start_when = 15
	end_when = 60 //45 seconds of pain
	fakeable = FALSE

/datum/round_event/crystalline_wave/announce(fake)
	priority_announce("Several crystalline asteroids have been detected en route with the station. All hands, brace for impact. Organic signals have been detected contained within some of the asteroids.", title = "Priority Alert", sound = 'sound/misc/voyalert.ogg')

/datum/round_event/crystalline_wave/tick()
	if(ISMULTIPLE(activeFor, 3))
		spawn_asteroids(rand(4,5)) // A looooot of asteroids...

/datum/round_event/crystalline_wave/proc/spawn_asteroids(number = 5)
	var/datum/round_event_control/crystalline_reentry/C = control
	for(var/i = 0; i < number; i++)
		var/startside = pick(GLOB.cardinals)
		var/z = pick(SSmapping.levels_by_trait(ZTRAIT_STATION))
		var/turf/startT = spaceDebrisStartLoc(startside, z)
		var/turf/endT = spaceDebrisFinishLoc(startside, z)
		new /obj/effect/crystalline_reentry/notendrilalert(startT, endT, C.special_target)

/obj/effect/crystalline_reentry
	name = "dense ice asteroid"
	desc = "Oh shit."
	icon = 'modular_splurt/icons/obj/meteor.dmi'
	icon_state = "ice"
	throwforce = 100
	move_force = INFINITY
	move_resist = INFINITY
	pull_force = INFINITY
	density = TRUE
	anchored = TRUE
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	var/asteroidhealth = 150
	var/z_original = 0
	var/destination
	var/notify = TRUE
	var/tendrilnotify = TRUE
	var/atom/special_target
	var/dropamt = 5
	var/droptype = list(/obj/item/stack/ore/bluespace_crystal)
	var/meteorsound = 'sound/effects/meteorimpact.ogg'

/obj/effect/crystalline_reentry/New(atom/start, atom/end, aimed_at)
	..()
	SSaugury.register_doom(src, 2000)
	z_original = z
	destination = end
	special_target = aimed_at
	asteroidhealth = rand(150,300)
	if(notify)
		notify_ghosts("\A [src] is inbound!",
			enter_link="<a href=?src=[REF(src)];orbit=1>(Click to orbit)</a>",
			source=src, action=NOTIFY_ORBIT)
	GLOB.poi_list += src

	var/special_target_valid = FALSE
	if(special_target)
		var/turf/T = get_turf(special_target)
		if(T.z == z_original)
			special_target_valid = TRUE
	if(special_target_valid)
		walk_towards(src, special_target, 1)
	else if(end && end.z==z_original)
		walk_towards(src, destination, 1)

/obj/effect/crystalline_reentry/Topic(href, href_list)
	if(href_list["orbit"])
		var/mob/dead/observer/ghost = usr
		if(istype(ghost))
			ghost.ManualFollow(src)

/obj/effect/crystalline_reentry/Destroy()
	GLOB.poi_list -= src
	. = ..()

/obj/effect/crystalline_reentry/Moved()
	if((z != z_original) || (loc == destination))
		qdel(src)
	if(special_target && loc == get_turf(special_target))
		complete_trajectory()
	return ..()

/obj/effect/crystalline_reentry/proc/complete_trajectory()
	//We hit what we wanted to hit, time to go boom!
	collision_effect()

/obj/effect/crystalline_reentry/ex_act(severity, target)
	return 0

/obj/effect/crystalline_reentry/singularity_act()
	return

/obj/effect/crystalline_reentry/singularity_pull()
	return

/obj/effect/crystalline_reentry/Bump(atom/clong)
	if(!special_target)//If it has a special target, THERE ARE NO BRAKES ON THE ADMINBUS, BABY
		asteroidhealth = asteroidhealth - rand(7,14)

	if(prob(10))
		playsound(src, 'sound/effects/bang.ogg', 50, 1)
		audible_message(span_danger("You hear a BONK!"))

	if(clong && prob(25))
		x = clong.x
		y = clong.y

	if(special_target && clong == special_target)
		complete_trajectory()

	if(isturf(clong) || isobj(clong))
		if(clong.density)
			clong.ex_act(EXPLODE_HEAVY)

	else if(isliving(clong))
		penetrate(clong)
	else if(istype(clong, type))
		var/obj/effect/crystalline_reentry/other = clong
		visible_message("<span class='danger'>[src] collides with [other]!\
			</span>")
		var/datum/effect_system/smoke_spread/smoke = new
		smoke.set_up(2, get_turf(src))
		smoke.start()
		qdel(src)
		qdel(other)
	if(asteroidhealth <= 0)
		collision_effect()
	else
		atmos_spawn_air("water_vapor=75;TEMP=0") //brr

/obj/effect/crystalline_reentry/proc/penetrate(mob/living/L)
	L.visible_message(span_danger("[L] is smashed by a crystalline asteroid!") , span_userdanger("The crystalline asteroid smashes you!") , "<span class ='danger'>You hear a BONK!</span>")
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.adjustBruteLoss(160)
	if(special_target && loc == get_turf(special_target)) // just in case. Otherwise the asteroid can stop if it penetrates someone that is standing exactly on that spot and that is bad
		complete_trajectory()

/obj/effect/crystalline_reentry/proc/make_debris()
	for(var/throws = dropamt, throws > 0, throws--)
		var/thing_to_spawn = pick(droptype)
		new thing_to_spawn(get_turf(src))

/obj/effect/crystalline_reentry/proc/collision_effect()
	make_debris()
	explosion(src.loc, 0, 0, 5, 3, 1, 0, 0, 0, 0)
	var/sound/meteor_sound = sound(meteorsound)
	var/random_frequency = get_rand_frequency()
	for(var/mob/M in GLOB.player_list)
		if((M.orbiting) && (SSaugury.watchers[M]))
			continue
		var/turf/T = get_turf(M)
		if(!T || T.z != src.z)
			continue
		var/dist = get_dist(M.loc, src.loc)
		shake_camera(M, dist > 20 ? 2 : 4, dist > 20 ? 1 : 3)
		M.playsound_local(src.loc, null, 50, 1, random_frequency, 10, S = meteor_sound)
	atmos_spawn_air("water_vapor=1250;TEMP=0") //brr
	switch(rand(1,100))
		if(1 to 30)
			var/obj/structure/spawner/crystalline/M = new(src.loc)
			visible_message(span_danger("A [M] emerges from the asteroid's rubble!"))
			if(prob(50) && tendrilnotify)
				priority_announce("Unknown organic entities have been detected in the vincinity of [station_name()]. General caution is advised.", "General Alert")
		if(31 to 99)
			visible_message("The asteroid collapses into nothing...")
		if(100)
			var/mob/living/simple_animal/bot/hugbot/M = new(src.loc)
			visible_message(span_danger("A [M] emerges from the asteroid's rubble! Wait... What?"))
	qdel(src)

/obj/effect/crystalline_reentry/notendrilalert
	tendrilnotify = FALSE

/mob/living/simple_animal/hostile/asteroid/basilisk/tendril
	fromtendril = TRUE

//Crystalline Tendrils, which spawn crystalline monsters
/obj/structure/spawner/crystalline
	name = "crystalline tendril"
	desc = "A vile tendril of corruption, originating from gods know where. Terrible monsters are pouring out of it."
	icon = 'icons/mob/nest.dmi'
	icon_state = "tendril"
	faction = list("mining")
	max_mobs = 3
	max_integrity = 9000 // Don't worry, the value is normalized within Initialize
	obj_integrity = 9000 // Same as above
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/basilisk/tendril)
	move_resist = INFINITY // just killing it tears a massive hole in the ground, let's not move it
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | FIRE_PROOF | LAVA_PROOF
	var/gps = null
	var/obj/effect/light_emitter/tendril/emitted_light

/obj/structure/spawner/crystalline/Initialize()
	. = ..()
	emitted_light = new(loc)
	for(var/F in RANGE_TURFS(1, src))
		if(iswallturf(F))
			var/turf/closed/M = F
			M.ScrapeAway(null, CHANGETURF_IGNORE_AIR)
		if(iscloudturf(F))
			var/turf/open/chasm/cloud/M = F
			M.TerraformTurf(/turf/open/floor/plating/asteroid/layenia, /turf/open/floor/plating/asteroid/layenia)
	gps = new /obj/item/gps/internal(src)
	addtimer(CALLBACK(src, PROC_REF(delayedInitialize)), 4 SECONDS)

/obj/structure/spawner/crystalline/deconstruct(disassembled)
	new /obj/effect/cloud_collapse(loc)
	new /obj/structure/closet/crate/necropolis/tendril(loc)
	return ..()

/obj/structure/spawner/crystalline/Destroy()
	QDEL_NULL(emitted_light)
	QDEL_NULL(gps)
	return ..()

/obj/structure/spawner/crystalline/proc/delayedInitialize()
	//Why is this needed? Simple, because apparently explosion is so slow that it triggers after the spawner spawns and kills it on the spot. This just makes it killable.
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	max_integrity = 225
	obj_integrity = 225

/obj/effect/light_emitter/crystalline
	set_luminosity = 4
	set_cap = 2.5
	light_color = LIGHT_COLOR_LIGHT_CYAN

/obj/effect/cloud_collapse
	name = "collapsing crystalline tendril"
	desc = "Get clear!"
	layer = TABLE_LAYER
	icon = 'icons/mob/nest.dmi'
	icon_state = "tendril"
	anchored = TRUE
	density = TRUE
	var/obj/effect/light_emitter/crystalline/emitted_light

/obj/effect/cloud_collapse/Initialize()
	. = ..()
	emitted_light = new(loc)
	visible_message(span_boldannounce("The tendril writhes in fury as the earth around it begins to crack and break apart! Get back!"))
	visible_message(span_warning("Something falls free of the tendril!"))
	playsound(loc,'sound/effects/tendril_destroyed.ogg', 200, 0, 50, 1, 1)
	addtimer(CALLBACK(src, PROC_REF(collapse)), 50)

/obj/effect/cloud_collapse/Destroy()
	QDEL_NULL(emitted_light)
	return ..()

/obj/effect/cloud_collapse/proc/collapse()
	for(var/mob/M in range(7,src))
		shake_camera(M, 15, 1)
	playsound(get_turf(src),'sound/effects/explosionfar.ogg', 200, 1)
	visible_message(span_boldannounce("The tendril falls into the clouds below!"))
	for(var/turf/T in range(1,src))
		if(!T.density)
			T.TerraformTurf(/turf/open/chasm/cloud, /turf/open/chasm/cloud)
	qdel(src)
