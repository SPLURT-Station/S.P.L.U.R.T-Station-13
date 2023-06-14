/datum/keybinding/mob/tilt_right
	hotkey_keys = list("AltCtrlEast", "AltCtrlD")
	name = "pixel_tilt_east"
	full_name = "Pixel Tilt Right"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/tilt_right/down(client/user)
	var/mob/M = user.mob
	M.tilt_right()
	return TRUE

/datum/keybinding/mob/tilt_left
	hotkey_keys = list("AltCtrlWest", "AltCtrlA")
	name = "pixel_tilt_west"
	full_name = "Pixel Tilt Left"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/tilt_left/down(client/user)
	var/mob/M = user.mob
	M.tilt_left()
	return TRUE
