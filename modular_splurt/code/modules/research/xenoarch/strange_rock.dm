/obj/item/strangerock
	icon = 'modular_skyrat/code/modules/research/xenoarch/fossil_and_artifact.dmi'
	name = "strange rock"
	desc = "This is a strange rock, it appears to have a relic encased."
	icon_state = "strange"
	item_state = "strange"

	var/chosenitem = null
	var/itemsafedepth = null
	var/itembasedepth = null
	var/itemactualdepth = null
	var/dugdepth = null

	var/tryagain = null

/obj/item/strangerock/Initialize()
	icon_state = pick("strange","strange0","strange1","strange2","strange3")
	roll_item()
	dugdepth = rand(0,10)
	..()

/obj/item/strangerock/proc/roll_item()
	var/randomnumber = rand(1,100)
	switch(randomnumber)
		if(1 to 69)
			roll_low_item()
		if(70 to 99)
			roll_med_item()
		if(100)
			roll_high_item()

/obj/item/strangerock/proc/roll_low_item()
	chosenitem = pickweight(GLOB.bas_artifact)
	itembasedepth = rand(30,70)
	itemsafedepth = rand(3,6)
	itemactualdepth = rand(itembasedepth - itemsafedepth,itembasedepth)

/obj/item/strangerock/proc/roll_med_item()
	chosenitem = pickweight(GLOB.adv_artifact)
	itembasedepth = rand(50,90)
	itemsafedepth = rand(6,12)
	itemactualdepth = rand(itembasedepth - itemsafedepth,itembasedepth)

/obj/item/strangerock/proc/roll_high_item()
	chosenitem = pickweight(GLOB.ult_artifact)
	itembasedepth = rand(70,110)
	itemsafedepth = rand(12,14)
	itemactualdepth = rand(itembasedepth - itemsafedepth,itembasedepth)

/obj/item/strangerock/attackby(obj/item/W, mob/user, params)
	if(istype(W,/obj/item/xenoarch/clean/hammer))
		if(tryagain)
			to_chat(user,"You are already mining this.")
			return
		tryagain = TRUE
		var/obj/item/xenoarch/clean/hammer/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,HM.cleanspeed,target = src))
			to_chat(user,"You must stand still to clean.")
			tryagain = FALSE
			return
		dugdepth += HM.cleandepth
		playsound(loc, HM.usesound, 50, 1, -1)
		if(dugdepth > itemactualdepth)
			to_chat(user,"The strange rock crumbles, destroying anything that could have been recovered.")
			qdel(src)
			return
		tryagain = FALSE
		return
	if(istype(W,/obj/item/xenoarch/clean/brush))
		if(tryagain)
			to_chat(user,"You are already mining this.")
			return
		tryagain = TRUE
		var/obj/item/xenoarch/clean/brush/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,HM.brushspeed,target = src))
			to_chat(user,"You must stand still to clean.")
			tryagain = FALSE
			return
		if(dugdepth < itemactualdepth)
			dugdepth++
			playsound(loc, HM.usesound, 50, 1, -1)
			to_chat(user,"You brush away 1cm of debris.")
			tryagain = FALSE
			return
		if(dugdepth > itemactualdepth)
			to_chat(user,"You somehow managed to destroy a strange rock with a brush... good job?")
			qdel(src)
			return
		if(dugdepth == itemactualdepth)
			new chosenitem(get_turf(src))
			playsound(loc, HM.usesound, 50, 1, -1)
			to_chat(user,"You uncover an artifact!")
			qdel(src)
			return
		return
	if(istype(W,/obj/item/xenoarch/help/scanner))
		var/obj/item/xenoarch/help/scanner/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,30,target = src))
			to_chat(user,"You must stand still to scan.")
			return
		playsound(loc, HM.usesound, 50, 1, -1)
		interact(user, tool_type = 0)
		return
	if(istype(W,/obj/item/xenoarch/help/scanneradv))
		var/obj/item/xenoarch/help/scanneradv/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,10,target = src))
			to_chat(user,"You must stand still to scan.")
			return
		playsound(loc, HM.usesound, 50, 1, -1)
		interact(user, tool_type = 1)
		return
	if(istype(W,/obj/item/xenoarch/help/measuring))
		var/obj/item/xenoarch/help/measuring/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,10,target = src))
			to_chat(user,"You must stand still to measure.")
			return
		if(!dugdepth)
			to_chat(user,"This rock has not been touched.")
			playsound(loc, HM.usesound, 50, 1, -1)
			return
		interact(user, tool_type = 2)
		playsound(loc, HM.usesound, 50, 1, -1)
		return

/obj/item/strangerock/interact(mob/user, tool_type = 0)
	var/dat = ""
	switch(tool_type)
		if(0)
			dat += {"
				<center>
					Base Depth: [itembasedepth] centimeters<br>
					Safe Depth: [itemsafedepth] centimeters
				</center>
				"}
		if(1)
			dat += {"
				<center>
					Base Depth: [itembasedepth] centimeters<br>
					Safe Depth: [itemsafedepth] centimeters<br>
					Item Depth: [itemactualdepth] centimeters
				</center>
				"}
		if(2)
			dat += {"
				<center>
					Current depth dug: [dugdepth] centimeters
				</center>
				"}
	
	var/datum/browser/popup = new(user, "xeno_strangerock", name, 225, 110)
	popup.set_content(dat)
	popup.open()

/turf/closed/mineral/strange
	mineralType = /obj/item/strangerock
	spreadChance = 5
	spread = 1
	mineralAmt = 1
	scan_state = "rock_Strange"

/turf/closed/mineral/strange/ice
	environment_type = "snow_cavern"
	smooth_icon = 'icons/turf/walls/icerock_wall.dmi'
	turf_type = /turf/open/floor/plating/asteroid/snow/ice
	baseturfs = /turf/open/floor/plating/asteroid/snow/ice
	initial_gas_mix = FROZEN_ATMOS
	defer_change = TRUE

/turf/closed/mineral/random/New(loc, ...)
	mineralSpawnChanceList += list(/turf/closed/mineral/strange = 15)
	. = ..()

/turf/closed/mineral/random/volcanic/New()
	mineralSpawnChanceList += list(/turf/closed/mineral/strange = 15)
	. = ..()

/turf/closed/mineral/random/snow/New(loc, ...)
	mineralSpawnChanceList += list(/turf/closed/mineral/strange/ice = 15)
	. = ..()
	
