#define TELESCI_POWER_UNAVAILABLE	0
#define TELESCI_POWER_AVAILABLE		1
#define TELESCI_POWER_SELECTED		2

/obj/machinery/computer/telescience
	name = "\improper Telepad Control Console"
	desc = "Used to teleport objects to and from the telescience telepad."
	icon_screen = "teleport"
	icon_keyboard = "teleport_key"
	circuit = /obj/item/circuitboard/computer/telesci_console
	var/sending = 1
	var/obj/machinery/telepad/telepad
	var/list/temp_msg = list("Telescience control console initialized.", "Welcome.")

	// VARIABLES //
	var/teles_left	// How many teleports left until it becomes uncalibrated
	var/datum/projectile_data/last_tele_data = null
	var/z_co = 1
	var/power_off
	var/rotation_off
	//var/angle_off
	var/last_target
	var/in_use

	var/rotation = 0
	var/angle = 45
	var/power = 5

	// Based on the power used
	var/teleport_cooldown = 0 // every index requires a bluespace crystal
	var/list/power_options = list(5, 10, 20, 25, 30, 40, 50, 80, 100)
	var/teleporting = 0
	var/starting_crystals = 8
	var/max_crystals = 8
	var/crystals = 0
	var/obj/item/gps/inserted_gps

/obj/machinery/computer/telescience/Initialize(mapload)
	recalibrate()
	. = ..()

/obj/machinery/computer/telescience/Destroy()
	eject()
	if(inserted_gps)
		inserted_gps.loc = loc
		inserted_gps = null
	return ..()

/obj/machinery/computer/telescience/examine(mob/user)
	. = ..()
	. += "<span class='notice'>There are [crystals ? crystals : "no"] bluespace crystal\s in the crystal slots.</span>"

/obj/machinery/computer/telescience/Initialize(mapload)
	. = ..()
	if(mapload)
		crystals = starting_crystals

/obj/machinery/computer/telescience/attack_paw(mob/user)
	to_chat(user, "<span class='warning'>You are too primitive to use this computer!</span>")
	return

/obj/machinery/computer/telescience/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/ore/bluespace_crystal))
		var/obj/item/stack/ore/bluespace_crystal/CRYSTAL = W
		if(crystals >= max_crystals)
			to_chat(user, "<span class='warning'>There are not enough crystal slots.</span>")
			return
		if(!user.dropItemToGround(user.get_active_held_item()))
			return
		user.visible_message("[user] inserts [CRYSTAL] into \the [src]'s crystal slot.", "<span class='notice'>You insert [CRYSTAL] into \the [src]'s crystal slot.</span>")
		balloon_alert(user, "inserted bluespace")
		CRYSTAL.use(1)
		crystals++
		if(CRYSTAL.amount >= 1)	//please do not place a deleted item on the player's hand
			user.put_in_active_hand(CRYSTAL, TRUE, TRUE)

	else if(istype(W, /obj/item/gps))
		if(!inserted_gps)
			if(!user.transferItemToLoc(W, src))
				return
			inserted_gps = W
			user.visible_message("[user] inserts [W] into \the [src]'s GPS device slot.", "<span class='notice'>You insert [W] into \the [src]'s GPS device slot.</span>")
			balloon_alert(user, "inserted GPS")
	else if(W.tool_behaviour == TOOL_MULTITOOL)
		if(W.buffer && istype(W.buffer, /obj/machinery/telepad))
			telepad = W.buffer
			W.buffer = null
			to_chat(user, "<span class='caution'>You upload the data from the [W.name]'s buffer.</span>")
			balloon_alert(user, "uploaded buffer data")
	else
		return ..()

/obj/machinery/computer/telescience/attack_ai(mob/user)
	src.attack_hand(user)

/obj/machinery/computer/telescience/attack_hand(mob/user)
	if(..())
		return
	interact(user)

/obj/machinery/computer/telescience/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Telesci", name)
		ui.open()

/obj/machinery/computer/telescience/ui_data(mob/user)
	var/list/data = list()
	data["telepad"] = telepad ? TRUE : FALSE
	data["inserted_gps"] = inserted_gps ? TRUE : FALSE
	data["temp_msg"] = temp_msg
	data["rotation"] = rotation
	data["angle"] = angle

	var/list/power_possible = list()
	for(var/i = 1; i <= length(power_options); i++)
		var/list/add = list()
		if(crystals + telepad.efficiency < i)
			add += power_options[i]
			add += TELESCI_POWER_UNAVAILABLE
			power_possible += list(add)
			continue
		if(power == power_options[i])
			add += power_options[i]
			add += TELESCI_POWER_SELECTED
			power_possible += list(add)
			continue
		add += power_options[i]
		add += TELESCI_POWER_AVAILABLE
		power_possible += list(add)

	data["crystals"] = crystals
	data["power_possible"] = power_possible
	data["z_coord"] = z_co
	data["last_tele_data"] = last_tele_data ? list("Source Location: ([last_tele_data.src_x], [last_tele_data.src_y])", "Time: [round(last_tele_data.time, 0.1)] secs") : null

	return data

/obj/machinery/computer/telescience/ui_act(action, params)
	if(..())
		return
	if(telepad.panel_open)
		temp_msg = list("ERROR:", "Telepad undergoing physical maintenance operations.")
		return
	switch(action)
		if("set_power")
			var/amount = text2num(params["power"])
			power = amount
		if("eject_gps")
			if(inserted_gps)
				inserted_gps.loc = loc
				inserted_gps = null
		if("setRotation")
			rotation = round(params["ref"], 0.01)
		if("setAngle")
			angle = round(params["ref"], 0.1)
		if("setPower")
			power = round(params["ref"], 1)
		if("setSector")
			z_co = round(params["ref"], 1)
		if("send")
			sending = TRUE
			teleport(usr)
		if("receive")
			sending = FALSE
			teleport(usr)
		if("recalibrate")
			temp_msg = list("NOTICE:", "Calibration successful.")
			recalibrate()
			sparks()
		if("eject")
			if(eject())
				temp_msg = list("NOTICE:", "Bluespace crystals ejected.")
			else
				temp_msg = list("ERROR:", "There are no crystals on the machine")

/obj/machinery/computer/telescience/proc/sparks()
	if(telepad)
		do_sparks(5, TRUE, get_turf(telepad))

/obj/machinery/computer/telescience/proc/telefail()
	sparks()
	visible_message("<span class='warning'>The telepad weakly fizzles.</span>")

/obj/machinery/computer/telescience/proc/doteleport(mob/user)

	if(teleport_cooldown > world.time)
		temp_msg = list("Telepad is recharging power.", "Please wait [round((teleport_cooldown - world.time) / 10)] seconds.")
		return

	if(teleporting)
		temp_msg = list("Telepad is in use.", "Please wait.")
		return

	if(telepad)

		var/truePower = clamp(power + power_off, 1, 1000)
		var/trueRotation = rotation + rotation_off
		var/trueAngle = clamp(angle, 1, 90)

		var/datum/projectile_data/proj_data = projectile_trajectory(telepad.x, telepad.y, trueRotation, trueAngle, truePower)
		last_tele_data = proj_data

		var/trueX = clamp(round(proj_data.dest_x, 1), 1, world.maxx)
		var/trueY = clamp(round(proj_data.dest_y, 1), 1, world.maxy)
		var/spawn_time = round(proj_data.time) * 10

		var/turf/target = locate(trueX, trueY, z_co)
		last_target = target
		var/area/A = get_area(target)
		flick("pad-beam", telepad)

		if(spawn_time > 15) // 1.5 seconds
			playsound(telepad.loc, 'sound/weapons/flash.ogg', 25, 1)
			// Wait depending on the time the projectile took to get there
			teleporting = 1
			temp_msg = list("Powering up bluespace crystals.", "Please wait.")


		spawn(round(proj_data.time) * 10) // in seconds
			if(!telepad)
				return
			if(telepad.stat & NOPOWER)
				return
			teleporting = 0
			teleport_cooldown = world.time + (power * 2)
			teles_left -= 1

			// use a lot of power
			use_power(power * 10)

			do_sparks(5, TRUE, get_turf(telepad))

			temp_msg = list("Teleport successful.")
			if(teles_left < 10)
				temp_msg += "Calibration required soon."
			temp_msg += "Data printed below."

			do_sparks(5, TRUE, get_turf(target))

			var/turf/source = target
			var/turf/dest = get_turf(telepad)
			var/log_msg = ""
			log_msg += ": [key_name(user)] has teleported "

			if(sending)
				source = dest
				dest = target

			flick("pad-beam", telepad)
			playsound(telepad.loc, 'sound/weapons/emitter2.ogg', 25, 1, extrarange = 3, falloff_exponent = 5)
			for(var/atom/movable/ROI in source)
				// if is anchored, don't let through
				if(ROI.anchored)
					if(isliving(ROI))
						var/mob/living/L = ROI
						if(L.buckled)
							// TP people on office chairs
							if(L.buckled.anchored)
								continue

							log_msg += "[key_name(L)] (on a chair), "
						else
							continue
					else if(!isobserver(ROI))
						continue
				if(ismob(ROI))
					var/mob/T = ROI
					log_msg += "[key_name(T)], "
				else
					log_msg += "[ROI.name]"
					if (istype(ROI, /obj/structure/closet))
						var/obj/structure/closet/C = ROI
						log_msg += " ("
						for(var/atom/movable/Q as mob|obj in C)
							if(ismob(Q))
								log_msg += "[key_name(Q)], "
							else
								log_msg += "[Q.name], "
						if (dd_hassuffix(log_msg, "("))
							log_msg += "empty)"
						else
							log_msg = dd_limittext(log_msg, length(log_msg) - 2)
							log_msg += ")"
					log_msg += ", "
				do_teleport(ROI, dest)

			if (dd_hassuffix(log_msg, ", "))
				log_msg = dd_limittext(log_msg, length(log_msg) - 2)
			else
				log_msg += "nothing"
			log_msg += " [sending ? "to" : "from"] [trueX], [trueY], [z_co] ([A ? A.name : "null area"])"
			investigate_log(log_msg, "telesci")

/obj/machinery/computer/telescience/proc/teleport(mob/user)
	if(crystals <= 0)
		temp_msg = list("ERROR!", "No crystals detected!", "The machine cannot operate without any crystals!")
		return
	if(rotation == null || angle == null || z_co == null)
		temp_msg = list("ERROR!", "Set a angle, rotation and sector.")
		return
	if(angle < 1 || angle > 90)
		telefail()
		temp_msg = list("ERROR!", "Elevation is less than 1 or greater than 90.")
		return
	if(z_co == 1 /*Centcom*/ || z_co == 6 /*City of Cogs*/ || z_co < 1 || z_co > 13 /*Space max*/)
		telefail()
		temp_msg = list("ERROR!", "Sector is outside known time and space!")
		return
	if(teles_left > 0)
		doteleport(user)
	else
		telefail()
		temp_msg = list("ERROR!", "Calibration required.")
		return
	return

/obj/machinery/computer/telescience/proc/eject()
	if(crystals)
		for(var/i = 1; i <= crystals; i++)
			new /obj/item/stack/ore/bluespace_crystal(src.loc)
		crystals = 0
		return TRUE
	else
		return FALSE

/obj/machinery/computer/telescience/proc/recalibrate()
	teles_left = rand(30, 40)
	//angle_off = rand(-25, 25)
	power_off = rand(-4, 0)
	rotation_off = rand(-10, 10)
