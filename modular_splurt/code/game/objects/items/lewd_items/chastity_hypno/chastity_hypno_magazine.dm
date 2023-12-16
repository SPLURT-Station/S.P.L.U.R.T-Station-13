
/obj/item/chastity_hypno/magazine
	name = "Hypnotic Chastity Magazine"
	desc = "A fascinating magazine filled with mesmerizing patterns and articles on the art of hypnotic chastity..."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "pamphlet"
	color = COLOR_STRONG_MAGENTA
	var/used = FALSE

/obj/item/chastity_hypno/magazine/attack_self(mob/user)
	if(used)
		read(user)
		return

	. = ..()

/obj/item/chastity_hypno/magazine/proc/read(mob/reader)
	if(!choices)
		return

	to_chat(reader, "<span class='notice'>You start reading the magazine...</span>")
	if(!do_after(reader, 5 SECONDS, target = src))
		return

	if(!CHECK_BITFIELD(reader.client?.prefs.cit_toggles, HYPNO))
		to_chat(reader, "<span class='notice'>You skim the magazine, but the images seem oddly covered by twisting spirals that cover the <i>most interesting</i> bits. You were only reading it for the articles anyways...</span>")
		return

	hypno(reader)

/obj/item/chastity_hypno/magazine/save()
	. = ..()
	var/user_input = stripped_input(usr, "Choose what to name the magazine:", max_length = MAX_NAME_LEN)
	if(!user_input)
		return

	name = user_input
	used = TRUE
	color = null

/obj/item/chastity_hypno/magazine/ui_status(mob/user)
	if(can_interact(user) && !used)
		return ..()
	return UI_CLOSE
