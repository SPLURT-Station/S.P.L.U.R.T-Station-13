#define ui_hunger_thirst "EAST-1:28,CENTER+1:51"

/atom/movable/screen/hunger
	name = "hunger"
	icon = 'modular_sand/icons/mob/screen_gen.dmi'
	icon_state = "nutrition0"
	screen_loc = ui_hunger_thirst

/atom/movable/screen/thirst
	name = "thirst"
	icon = 'modular_sand/icons/mob/screen_gen.dmi'
	icon_state = "hydration0"
	screen_loc = ui_hunger_thirst

/atom/movable/screen/healthdoll/Click(location, control, params)
	if(hud?.mymob)
		return hud.mymob.Click(arglist(args))

/atom/movable/screen/healthdoll/examine(mob/user)
	if(hud?.mymob)
		return hud.mymob.examine(arglist(args))

/atom/movable/screen/healthdoll/examine_more(mob/user)
	if(hud?.mymob)
		return hud.mymob.examine_more(arglist(args))

/atom/movable/screen/healthdoll/MouseEntered(location, control, params)
	if(hud?.mymob)
		return hud.mymob.MouseEntered(arglist(args))

/atom/movable/screen/healthdoll/MouseExited(location, control, params)
	if(hud?.mymob)
		return hud.mymob.MouseExited(arglist(args))

/atom/movable/screen/healthdoll/MouseDown(location, control, params)
	if(hud?.mymob)
		return hud.mymob.MouseDown(arglist(args))

/atom/movable/screen/healthdoll/MouseUp(location, control, params)
	if(hud?.mymob)
		return hud.mymob.MouseUp(arglist(args))

/atom/movable/screen/healthdoll/MouseDrag(over_object, src_location, over_location, src_control, over_control, params)
	if(hud?.mymob)
		return hud.mymob.MouseDrag(arglist(args))

// Mousedrop won't work, behavior is usually defined on the thing that MouseDrag started on

/atom/movable/screen/sanity
	name = "sanity"
	icon = 'modular_sand/icons/mob/sanity.dmi'
	icon_state = "sanity3"
	screen_loc = ui_mood
