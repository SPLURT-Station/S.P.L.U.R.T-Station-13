/mob/living/carbon/alien/diona
	name = "diona nymph"
	var/adult_form = /mob/living/carbon/human/species/mammal/diona
	var/can_namepick_as_adult = 1
	var/adult_name = "diona gestalt"
	icon_state = "nymph"
	//race = /datum/species/diona
	var/amount_grown = 0
	var/max_grown = 325
	verb_say = "chirrups"
	initial_language_holder = /datum/language_holder/diona
/*

/mob/living/carbon/alien/diona/Initialize()
	. = ..()
	race = /datum/species/diona
	add_language(LANGUAGE_ROOTGLOBAL)
	add_language(LANGUAGE_GALCOM)
	verbs += /mob/living/carbon/alien/diona/proc/merge

/mob/living/carbon/alien/diona/get_available_emotes()
	return global._nymph_default_emotes.Copy()


/mob/living/carbon/alien/diona/put_in_hands(var/obj/item/W) // No hands.
	W.loc = get_turf(src)
	return 1

/mob/living/carbon/alien/diona/proc/wear_hat(var/obj/item/new_hat)
	if(hat)
		return
	hat = new_hat
	new_hat.loc = src
	update_icons()
*/
/mob/living/carbon/alien/diona/proc/handle_npc(var/mob/living/carbon/alien/diona/D)
	if(D.stat != CONSCIOUS)
		return
	if(prob(33) && isturf(D.loc) && !D.pulledby) //won't move if being pulled
		step(D, pick(NORTH, SOUTH, EAST, WEST))
	if(prob(1))
		D.emote(pick("scratch","jump","chirp","roll"))

/mob/living/carbon/alien/diona/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/mob_holder, worn_state = "diona", inv_slots = ITEM_SLOT_HEAD)

/mob/living/carbon/alien/diona/Life()
	..()
	if(amount_grown < max_grown)
		amount_grown++

/mob/living/carbon/alien/diona/movement_delay()
	return 2

/mob/living/carbon/alien/diona/verb/evolve()

	set name = "Evolve"
	set desc = "Evolve into your adult form."
	set category = "Abilities"

	if(stat != CONSCIOUS)
		return

	if(!adult_form)
		verbs -= /mob/living/carbon/alien/diona/verb/evolve
		return

	if(amount_grown < max_grown)
		to_chat(src, "<font color='red'>You are not fully grown.</font>")
		return
	var/mob/living/carbon/human/adult = new adult_form(get_turf(src))


	if(mind)
		mind.transfer_to(adult)
		if (can_namepick_as_adult)
			var/newname = sanitize(tgui_input_text(adult, "You have become an adult. Choose a name for yourself.", "Adult Name", null, MAX_NAME_LEN), MAX_NAME_LEN)

			if(!newname)
				adult.fully_replace_character_name(name, "[src.adult_name]")
			else
				adult.fully_replace_character_name(name, newname)
	else
		adult.key = src.key

	for (var/obj/item/W in src.contents)
		dropItemToGround(W)

	qdel(src)
