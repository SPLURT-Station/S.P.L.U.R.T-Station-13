GLOBAL_LIST_INIT(splurt_mentor_verbs, list(
	/client/proc/spawn_mentor_mouse
))
GLOBAL_PROTECT(splurt_mentor_verbs)

/client/add_mentor_verbs()
	. = ..()
	if(mentor_datum)
		add_verb(src, GLOB.splurt_mentor_verbs)

/client/remove_mentor_verbs()
	. = ..()
	remove_verb(src, GLOB.splurt_mentor_verbs)
