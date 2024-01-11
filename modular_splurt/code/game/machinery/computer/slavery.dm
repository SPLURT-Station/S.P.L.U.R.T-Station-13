#define ANNOUNCEMENT_COOLDOWN 6 MINUTES
#define SLAVER_RANSOM_SCALE_VALUE 1000000

/obj/machinery/computer/slavery
	name = "\improper slave management console"
	desc = "Used to track and manage collared slaves. The limited range reaches only as far as the hideout perimeter."
	icon_screen = "explosive"
	icon_keyboard = "security_key"
	clockwork = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	req_access = list(ACCESS_SLAVER)
	light_color = LIGHT_COLOR_RED
	var/obj/item/radio/headset/radio
	var/last_announcement
	var/selected_cat
	/// Dictates if the compact mode of the interface is on or off
	var/compact_mode = FALSE
	/// Possible gear to be dispensed
	var/list/possible_gear

/obj/machinery/computer/slavery/Initialize(mapload)
	. = ..()
	GLOB.tracked_slave_consoles += src
	possible_gear = get_slaver_gear()
	radio = new /obj/item/radio/headset/syndicate(src)

/obj/machinery/computer/slavery/Destroy()
	GLOB.tracked_slave_consoles -= src
	QDEL_NULL(radio)
	return ..()

/obj/machinery/computer/slavery/proc/get_slaver_gear()
	var/list/filtered_modules = list()
	for(var/path in GLOB.slaver_gear)
		var/datum/slaver_gear/SG = new path
		if(!filtered_modules[SG.category])
			filtered_modules[SG.category] = list()
		filtered_modules[SG.category][SG] = SG
	return filtered_modules

/obj/machinery/computer/slavery/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "SlaveConsole", name)
		ui.open()

/obj/machinery/computer/slavery/ui_static_data(mob/user)
	var/list/data = list()

	var/turf/curr = get_turf(src)
	data["currentCoords"] = "[curr.x], [curr.y], [curr.z]"
	data["value_table"] = GLOB.slavers_ransom_values
	data["ransom_scale_value"] = SLAVER_RANSOM_SCALE_VALUE
	data["categories"] = list()
	for(var/category in possible_gear)
		var/list/cat = list(
			"name" = category,
			"items" = (category == selected_cat ? list() : null))
		for(var/gear in possible_gear[category])
			var/datum/slaver_gear/AG = possible_gear[category][gear]
			cat["items"] += list(list(
				"name" = AG.name,
				"cost" = AG.cost,
				"desc" = AG.description,
			))
		data["categories"] += list(cat)

	return data

/obj/machinery/computer/slavery/ui_data(mob/user)
	var/list/data = list()

	if (world.time < last_announcement + ANNOUNCEMENT_COOLDOWN)
		data["intercomrecharging"] = TRUE
	else
		data["intercomrecharging"] = FALSE

	var/datum/bank_account/bank = SSeconomy.get_dep_account(ACCOUNT_CAR)
	data["cargo_credits"] = bank.account_balance
	data["credits"] = GLOB.slavers_credits_balance
	data["compactMode"] = compact_mode
	var/list/slaves = list()
	data["slaves"] = list()

	for(var/tracked_slave in GLOB.tracked_slaves)
		var/obj/item/electropack/shockcollar/slave/C = tracked_slave
		if (!isliving(C.loc))
			continue;

		var/mob/living/L = C.loc
		var/turf/pos = get_turf(L)
		if(!pos || C != L.get_item_by_slot(ITEM_SLOT_NECK))
			continue

		var/list/slave = list()
		slave["id"] = REF(C)
		slave["name"] = L.real_name
		slave["station_rank"] = C.station_rank
		slave["price"] = C.price
		slave["price_change_cooldown"] = round((C.nextPriceChange - world.time) / 10)
		slave["bought"] = C.bought

		var/turf/curr = get_turf(src)
		if(pos.z == curr.z) //Distance/Direction calculations for same z-level only
			slave["coords"] = "[pos.x], [pos.y], [pos.z]"
			slave["dist"] = max(get_dist(curr, pos), 0) //Distance between the machine and slave turfs
			slave["degrees"] = round(Get_Angle(curr, pos)) //0-360 degree directional bearing, for more precision.

			slave["shock_cooldown"] = C.shock_cooldown

			if (C.nextRecruitChance < world.time)
				slave["can_recruit"] = TRUE

			var/area/A = get_area(get_turf(L))
			if (istype(A, /area/slavers/export))
				slave["in_export_bay"] = TRUE

			switch(L.stat)
				if(CONSCIOUS)
					slave["stat"] = "Conscious"
					slave["statstate"] = "good"
				if(SOFT_CRIT)
					slave["stat"] = "Conscious"
					slave["statstate"] = "average"
				if(UNCONSCIOUS)
					slave["stat"] = "Unconscious"
					slave["statstate"] = "average"
				if(DEAD)
					slave["stat"] = "Dead"
					slave["statstate"] = "bad"
		else
			slave["stat"] = "Unknown"
			slave["statstate"] = "grey"

		slaves += list(slave) //Add this slave to the list of slaves
	data["slaves"] = slaves
	return data

/obj/machinery/computer/slavery/ui_act(action, params)
	if(..())
		return

	playsound(src, "terminal_type", 25, 0)

	var/collarID = params["id"]
	var/obj/item/electropack/shockcollar/slave/collar

	if(collarID)
		for(var/tracked_slave in GLOB.tracked_slaves)
			var/obj/item/electropack/shockcollar/slave/C = tracked_slave
			if (REF(C) == collarID)
				collar = C;
				break

	switch(action)
		if ("makePriorityAnnouncement")
			if (world.time < last_announcement + ANNOUNCEMENT_COOLDOWN)
				say("Intercomms recharging. Please stand by.")
				return

			var/mob/living/user = usr

			var/input = stripped_input(user, "Please choose a message to announce to the station crew.", "What?")

			if(!input || !user.canUseTopic(src, !issilicon(usr)))
				return
			if(!(user.can_speak())) //No more cheating, mime/random mute guy!
				to_chat(user, span_warning("You find yourself unable to speak."))
				return

			input = user.treat_message(input) //Adds slurs and so on. Someone should make this use languages too.
			priority_announce(input, sender_override = GLOB.slavers_team_name)
			last_announcement = world.time

		if("setPrice")
			var/newPrice = input(usr, "The station will need to pay this to get the slave back.", "Set slave price", collar.price) as num
			if(!newPrice) // Blank input
				return

			if (collar.bought) // The slave has already been pair for as we try to change the price
				say("The station has already paid the ransom, we can't change the price now!")
				return

			if (collar.nextPriceChange - world.time > 0) // Another user changed it already just now
				say("The price has already changed recently. Please wait [round((collar.nextPriceChange - world.time) / 10)] seconds.")
				return

			newPrice = clamp(round(newPrice), 1, 1000000)

			if (newPrice == collar.price) // New price is same as the old price
				return

			collar.setPrice(newPrice)

		if("recruit")
			var/mob/living/M = collar.loc

			if(QDELETED(M) || jobban_isbanned(M, ROLE_SLAVER) || jobban_isbanned(M, ROLE_SYNDICATE))
				radioAnnounce("[M.real_name] has failed the background check and cannot join our cause.")
				collar.nextRecruitChance = INFINITY
				return

			collar.nextRecruitChance = world.time + 10 MINUTES // 10 minutes before we can ask again
			var/recruitResponse = tgui_alert(M, "It has been 15 minutes and your station has not paid your ransom. The slavers are offering for you to join their side.", "Recruitment Offer", list("Accept", "Maybe later", "Decline"))
			switch(recruitResponse)
				if ("Accept")
					radioAnnounce("[M.real_name] has accepted the offer to join our cause!")
					var/datum/antagonist/slaver/antag_datum = new
					antag_datum.send_to_spawnpoint = FALSE
					antag_datum.equip_outfit = FALSE
					M.mind.add_antag_datum(antag_datum)
					message_admins("[key_name_admin(M)] has been recruited as a slaver.")
					log_admin("[key_name(M)] has been recruited as a slaver.")
					qdel(collar)
					return
				if ("Maybe later")
					radioAnnounce("[M.real_name] has declined the offer to join our cause for now.")
					return
				if ("Decline")
					radioAnnounce("[M.real_name] has refused the offer to join our cause.")
					collar.nextRecruitChance = INFINITY
					return

			collar.nextRecruitChance = 0 // If the popup box closes a strange way such as a disconnect, do nothing and re-enable the chance to open it again

		if("export")
			editBalance(collar.price)
			GLOB.slavers_credits_total += collar.price
			GLOB.slavers_slaves_sold++


			new /obj/effect/temp_visual/dir_setting/ninja(get_turf(collar.loc), collar.loc.dir)

			playsound(get_turf(src.loc), 'sound/effects/bamf.ogg', 50, 1)
			visible_message(span_notice("[collar.loc] vanishes into the droppod."), \
			span_notice("You are taken by the droppod."))

			var/area/pod_storage_area = locate(/area/centcom/supplypod/podStorage) in GLOB.sortedAreas
			var/mob/living/M = collar.loc

			priority_announce("[M.real_name] has been returned to the station for [collar.price] credits.", sender_override = GLOB.slavers_team_name)
			var/obj/structure/closet/supplypod/centcompod/exportPod = new(pick(get_area_turfs(pod_storage_area)))
			var/obj/effect/landmark/observer_start/dropzone = locate(/obj/effect/landmark/observer_start) in GLOB.landmarks_list
			M.forceMove(exportPod)

			new /obj/effect/pod_landingzone(dropzone.loc, exportPod)

			qdel(collar)

		if("shock")
			var/datum/signal/signal = new /datum/signal
			signal.data["code"] = -1
			collar.receive_signal(signal)

		if("release")
			var/datum/bank_account/bank = SSeconomy.get_dep_account(ACCOUNT_CAR)
			if (collar.bought && bank) // If the slave was paid for by the station, but we removed their slave collar for some reason, we return the money to the station.
				bank.adjust_money(collar.price)
			qdel(collar)

		if("compact_toggle")
			compact_mode = !compact_mode
			return TRUE

		if("select")
			selected_cat = params["category"]
			return TRUE

		if("buy")
			var/item_name = params["name"]
			var/list/buyable_items = list()
			for(var/category in possible_gear)
				buyable_items += possible_gear[category]
			for(var/key in buyable_items)
				var/datum/slaver_gear/SG = buyable_items[key]
				if(SG.name == item_name)
					if(GLOB.slavers_credits_balance < SG.cost)
						say("Insufficent credits!")
						return

					editBalance(-SG.cost)
					radioAnnounce("Supplies inbound: [SG.name]")

					addtimer(CALLBACK(src, .proc/dropSupplies, SG.build_path), rand(3,6) * 10)

					return TRUE


/obj/machinery/computer/slavery/proc/radioAnnounce(message)
	radio.talk_into(src, message, RADIO_CHANNEL_SYNDICATE)

/obj/machinery/computer/slavery/proc/dropSupplies(item)

	// Pick random drop location somewhere in the export zone.
	var/list/L = list()
	for(var/turf/T in get_area_turfs(/area/slavers/export))
		L+=T
	if(!L || !L.len)
		to_chat(usr, "No dropzone available.")
		return
	var/drop_location = pick(L)

	var/area/pod_storage_area = locate(/area/centcom/supplypod/podStorage) in GLOB.sortedAreas
	var/obj/structure/closet/supplypod/centcompod/exportPod = new(pick(get_area_turfs(pod_storage_area)))

	new item(exportPod)
	new /obj/effect/pod_landingzone(drop_location, exportPod)

/obj/machinery/computer/slavery/proc/editBalance(ammount)
	GLOB.slavers_credits_balance += ammount

#undef ANNOUNCEMENT_COOLDOWN
