/client/verb/spin_view_left()
	set name = "Spin View CCW"
	set category = "OOC"

	if(isnewplayer(mob))
		to_chat(src, "<span class='warning'>You can't spin the view without joining the game.</span>")
		return

	dir = turn(dir, 90)

/client/verb/spin_view_right()
	set name = "Spin View CW"
	set category = "OOC"

	if(isnewplayer(mob))
		to_chat(src, "<span class='warning'>You can't spin the view without joining the game.</span>")
		return

	dir = turn(dir, -90)
