/obj/structure/lavaland/ash_walker/proc/remake_walker(oldname, oldgender, datum/mind/oldmind)
	var/mob/living/carbon/human/M = new /mob/living/carbon/human(get_step(loc, pick(GLOB.alldirs)))
	M.gender = oldgender
	M.set_species(species)
	M.real_name = oldname
	M.underwear = "Nude"
	M.undershirt = "Nude"
	M.socks = "Nude"
	M.update_body()
	M.remove_language(/datum/language/common)
	oldmind.transfer_to(M)
	M.mind.grab_ghost()
	to_chat(M, "<b>You have been pulled back from beyond the grave, with a new body and renewed purpose. Glory to the Tendril!</b>")
	playsound(get_turf(M),'sound/magic/exit_blood.ogg', 100, TRUE)

/obj/structure/lavaland/ash_walker/western
	spawned_obj = /obj/effect/mob_spawn/human/ash_walker/western
	species = /datum/species/lizard/ashwalker/western

/obj/structure/lavaland/ash_walker/eastern
	spawned_obj = /obj/effect/mob_spawn/human/ash_walker/eastern
	species = /datum/species/lizard/ashwalker/eastern
