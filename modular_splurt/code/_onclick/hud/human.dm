/datum/hud/human/New(mob/living/carbon/human/owner)
	. = ..()
	var/atom/movable/screen/using

	using = new/atom/movable/screen/navigate
	using.icon = ui_style_splurt(ui_style)
	using.hud = src
	static_inventory += using

	arousal = new /atom/movable/screen/arousal()
	arousal.icon_state = (owner.client?.prefs.arousable == 1 ? "arousal0" : "")
	arousal.hud = src
	infodisplay += arousal
