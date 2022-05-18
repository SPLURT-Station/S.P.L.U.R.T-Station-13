/// Toggle admin frozen
/mob/living/proc/toggle_admin_freeze(client/admin)
	admin_frozen = !admin_frozen

	if(admin_frozen)
		SetStun(INFINITY, ignore_canstun = TRUE)
	else
		SetStun(0, ignore_canstun = TRUE)

	if(client && admin)
		to_chat(src, "<span class='userdanger'>An admin has [!admin_frozen ? "un" : ""]frozen you.</span>")
		log_admin("[key_name(admin)] toggled admin-freeze on [key_name(src)].")
		message_admins("[key_name_admin(admin)] toggled admin-freeze on [key_name_admin(src)].")

/// Toggle admin sleeping
/mob/living/proc/toggle_admin_sleep(client/admin)
	admin_sleeping = !admin_sleeping

	if(admin_sleeping)
		SetSleeping(INFINITY, ignore_canstun = TRUE)
	else
		SetSleeping(0, ignore_canstun = TRUE)

	if(client && admin)
		to_chat(src, "<span class='userdanger'>An admin has [!admin_sleeping ? "un": ""]slept you.</span>")
		log_admin("[key_name(admin)] toggled admin-sleep on [key_name(src)].")
		message_admins("[key_name_admin(admin)] toggled admin-sleep on [key_name_admin(src)].")

/// Toggle sleeping
/mob/living/proc/mob_sleep()
	set name = "Sleep"
	set category = "IC"

	if(alert("Are you sure you want to [player_triggered_sleeping ? "wake up?" : "sleep for a while? Use 'sleep' again to wake up."]", "Sleep", "No", "Yes") == "Yes")
		player_triggered_sleeping = !player_triggered_sleeping
		Sleeping()
