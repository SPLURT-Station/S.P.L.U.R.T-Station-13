/mob/Initialize()
	. = ..()
	create_player_panel()

/mob/Destroy()
	QDEL_NULL(mob_panel)
	. = ..()

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
