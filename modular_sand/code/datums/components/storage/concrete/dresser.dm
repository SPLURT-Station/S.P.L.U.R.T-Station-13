/datum/component/storage/concrete/dresser
	max_w_class = WEIGHT_CLASS_SMALL
	storage_flags = STORAGE_LIMIT_MAX_ITEMS | STORAGE_LIMIT_MAX_W_CLASS
	max_items = 20
	drop_all_on_destroy = TRUE
	drop_all_on_break = TRUE
	rustle_sound = FALSE

/datum/component/storage/concrete/dresser/Initialize()
	if(..())
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_ATOM_ATTACK_HAND, PROC_REF(signal_show_attempt), TRUE)
	RegisterSignal(parent, COMSIG_ATOM_ATTACK_PAW, PROC_REF(signal_show_attempt), TRUE)

/datum/component/storage/concrete/dresser/user_show_to_mob(mob/M, force, trigger_on_found)
	. = ..()
	if(isliving(M) && M.stat == CONSCIOUS)
		playsound(parent, "drawer_open", 50, 1, -5)

/datum/component/storage/concrete/dresser/close()
	. = ..()
	if(isliving(usr) && usr.stat == CONSCIOUS)
		playsound(parent, "drawer_close", 50, 1, -5)
