/datum/hud/human/New(mob/living/carbon/human/owner)
	. = ..()
	var/atom/movable/screen/using

	using = new/atom/movable/screen/navigate
	using.icon = ui_style_splurt(ui_style)
	using.hud = src
	static_inventory += using

	if(owner.client?.prefs.arousable)
		using = new /atom/movable/screen/arousal(null, owner)
		using.icon_state = "arousal0"
		using.hud = src
		infodisplay += using
