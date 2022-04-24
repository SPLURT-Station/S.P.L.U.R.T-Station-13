/atom/emag_act()
	. = ..()
	if(. && usr)
		balloon_alert(usr, "emagged")
