/datum/keybinding/client/communication/subtle
	hotkey_keys = list("Ctrl5")

/datum/keybinding/client/communication/subtle_indicator
	hotkey_keys = list("5")
	name = "Subtle_Indicator"
	full_name = "Subtle Emote (with indicator)"
	clientside = "subtle-indicator"

/datum/keybinding/client/communication/subtle_indicator/down(client/user)
	var/mob/living/mob_keybound = user.mob
	mob_keybound.subtle_indicator()
	return TRUE
