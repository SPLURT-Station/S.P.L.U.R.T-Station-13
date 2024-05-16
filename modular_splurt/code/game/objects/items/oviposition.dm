
GLOBAL_LIST_INIT(egg_skins, list( \
	"xenomorph",		\
	"badrecipe",  	\
	"chocolate",  	\
	"pellet",     	\
	"rock",       	\
	"chicken",    	\
	"slimeglob",  	\
	"synthetic",  	\
	"escapepod",  	\
	"cocoon",     	\
	"bugcocoon",  	\
	"yellow",     	\
	"blue",       	\
	"green",      	\
	"orange",     	\
	"purple",     	\
	"red",        	\
	"rainbow",    	\
	"pink",       	\
	"honeycomb",  	\
	"floppy",     	\
	"file",       	\
	"cd",         	\
	"spidercluster",	\
	"dragon",     	\
	"corrupteddemon",	\
	"holy",       	\
	"fish",       	\
	"insectoid",  	\
	"ashwalker",  	\
	"void",       	\
	"polychrome", 	\
	"ratvar",     	\
	"hybrid"	    \
))
//Oviposition egg, logic is at the pregnancy component
/obj/item/oviposition_egg
	name = "egg"
	desc = "An egg, this one looks suspiciously large though."
	icon_state = "egg_chicken"
	icon = 'modular_splurt/icons/obj/lewd_items/egg.dmi'
	integrity_failure = 0.9
	obj_flags = UNIQUE_RENAME

/obj/item/oviposition_egg/ComponentInitialize()
	. = ..()
	var/list/procs_list = list(
		"before_inserting" = CALLBACK(src, PROC_REF(item_inserting)),
		"after_inserting" = CALLBACK(src, PROC_REF(item_inserted)),
	)
	AddComponent(/datum/component/organ_inflation, 0)
	AddComponent(/datum/component/genital_equipment, list(ORGAN_SLOT_PENIS, ORGAN_SLOT_WOMB, ORGAN_SLOT_VAGINA, ORGAN_SLOT_TESTICLES, ORGAN_SLOT_BREASTS, ORGAN_SLOT_BELLY, ORGAN_SLOT_BELLY, ORGAN_SLOT_ANUS), procs_list)

/obj/item/oviposition_egg/obj_break(damage_flag)
	. = ..()
	icon = 'modular_splurt/icons/obj/lewd_items/egg_broken.dmi'
	update_appearance()

/obj/item/oviposition_egg/proc/item_inserting(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	if(!(G.owner.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	if(!(CHECK_BITFIELD(G.genital_flags, GENITAL_CAN_STUFF)))
		to_chat(user, span_warning("This genital can't be stuffed!"))
		return FALSE

	if(user == G.owner)
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert an egg inside themselves!"),\
					span_warning("You try to insert an egg inside yourself!"))
	else
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert an egg inside \the <b>[G.owner]</b>!"),\
					span_warning("\The <b>[user]</b> is trying to insert an egg inside you!"))

	if(!do_mob(user, G.owner, 5 SECONDS))
		return FALSE

/obj/item/oviposition_egg/proc/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	to_chat(G.owner, span_userlove("Your [G] feels stuffed and stretched!"))
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
