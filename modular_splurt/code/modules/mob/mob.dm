/mob/Initialize()
	. = ..()
	create_player_panel()

/mob/Destroy()
	QDEL_NULL(mob_panel)
	. = ..()

/mob/verb/tilt_left()
	set hidden = TRUE
	if(!canface() || is_tilted < -45)
		return FALSE
	transform = transform.Turn(-1)
	is_tilted--

/mob/verb/tilt_right()
	set hidden = TRUE
	if(!canface() || is_tilted > 45)
		return FALSE
	transform = transform.Turn(1)
	is_tilted++

/mob/proc/has_spell(spelltype)
	if (!mind)
		return FALSE

	for(var/obj/effect/proc_holder/spell/S in mind.spell_list)
		if(S.type == spelltype)
			return TRUE
	return FALSE

/mob/proc/create_player_panel()
	QDEL_NULL(mob_panel)
	mob_panel = new(src)
