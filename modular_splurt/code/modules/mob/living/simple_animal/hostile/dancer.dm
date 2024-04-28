/mob/living/dancercaptain
	name = "Captain Beats"
	desc = "A captain cursed to dance for all eternity!"
	icon = 'modular_splurt/icons/mobs/dancer/captain.dmi'
	icon_state = "idle"
	var/danceaction = 1
	var/lastaction = 0 //when the last action was!
	var/actiontime = 4
	var/list/dancefloor_turfs
	var/list/dancefloor_turfs_types
	var/dancefloor_exists = FALSE

/mob/living/dancercaptain/Move(atom/newloc, direct)

	if(!danceaction)
		if(!(world.time > lastaction))
			return // no move for you!

	animate(src, pixel_x, pixel_y = pixel_y + 10, time = 0.7, 0)
	. = ..()
	danceaction = 0 //you did your move
	lastaction = world.time+actiontime //next action time
	addtimer(CALLBACK(src, PROC_REF(move_part_2), newloc, direct), 1)

/mob/living/dancercaptain/proc/move_part_2(atom/newloc, direct)
	animate(src, pixel_x, pixel_y = pixel_y - 10, time = 0.7, 0)
	addtimer(CALLBACK(src, PROC_REF(move_part_3), newloc, direct))

/mob/living/dancercaptain/proc/move_part_3(atom/newloc, direct)
	LAZYINITLIST(dancefloor_turfs)
	LAZYINITLIST(dancefloor_turfs_types)

	if(dancefloor_exists) //remove the old one!
		dancefloor_exists = FALSE
		for(var/i in 1 to dancefloor_turfs.len)
			var/turf/T = dancefloor_turfs[i]
			T.ChangeTurf(dancefloor_turfs_types[i])
	var/list/funky_turfs = RANGE_TURFS(2, src)

	dancefloor_exists = TRUE
	var/i = 1
	dancefloor_turfs.len = funky_turfs.len
	dancefloor_turfs_types.len = funky_turfs.len
	for(var/t in funky_turfs)
		if(!(istype(t, /turf/closed))) //dont change walls
			var/turf/T = t
			dancefloor_turfs[i] = T
			dancefloor_turfs_types[i] = T.type
			T.ChangeTurf((i % 2 == 0) ? /turf/open/floor/light/colour_cycle/dancefloor_a : /turf/open/floor/light/colour_cycle/dancefloor_b)
			i++

/mob/living/dancercaptain/Initialize()
	. = ..()

	lastaction = round(world.time) //round to the nearest second! to keep in beat!

/mob/living/dancercaptain/proc/mtimer()
