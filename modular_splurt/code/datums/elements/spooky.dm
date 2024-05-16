//A spooky element, this can be added to pretty much anything, take your pick. It is effectively harmless however.
//target.AddElement(/datum/element/spooky) for example.

/datum/element/spooky
	element_flags = ELEMENT_DETACH
	var/datum/C

/datum/element/spooky/Attach(datum/target)
	. = ..()
	/*
	if(!iscarbon(target))
		return ELEMENT_INCOMPATIBLE //keeping this uncommented would make it so it only works with carbons, which is not really needed unless one adds procs that require the user to be a carbon in the future.
	*/
	C = target
	START_PROCESSING(SSobj, src)

/datum/element/spooky/Detach(datum/source, force)
	. = ..()
	STOP_PROCESSING(SSobj, src)

/datum/element/spooky/process()
	var/spookythings = rand(120)
	switch(spookythings)
		if(119 to 120) //Plays a spooky ambient sound as long as one hasn't been played in a while.
			var/sound = pick(SPOOKY)
			for(var/mob/living/carbon/L in view(6, C))
				if(L.client && !L.client.played)
					SEND_SOUND(L, sound(sound, repeat = 0, wait = 0, volume = 35, channel = CHANNEL_AMBIENCE))
					L.client.played = TRUE
					addtimer(CALLBACK(L.client, TYPE_PROC_REF(/client, ResetAmbiencePlayed)), 600)
		if(65 to 70) //Lights flicker.
			var/obj/machinery/light/L = locate(/obj/machinery/light) in view(4, C)
			if(L)
				L.flicker()
		if(1 to 5) //Very small chance to cause an unburnt tile to change to its burnt sprite.
			var/turf/open/floor/T = locate(/turf/open/floor) in view(4, C)
			if(T && prob(5) && !isplatingturf(T) && !istype(T, /turf/open/floor/engine/cult) && !T.burnt)
				T.burn_tile()
