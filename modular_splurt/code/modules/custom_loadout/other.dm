/obj/item/lewd_spellbook
	name = "Lewd Spellbook"
	desc = "A book with knowledge of spells so lewd it could get you expelled from any wizard academy."
	icon = 'icons/obj/library.dmi'
	icon_state ="book"
	throw_speed = 2
	throw_range = 5
	attack_verb = list("bashed", "whacked", "educated")
	w_class = WEIGHT_CLASS_TINY
	var/obj/effect/proc_holder/spell/targeted/lewd_chems/spell = /obj/effect/proc_holder/spell/targeted/lewd_chems

/obj/item/lewd_spellbook/equipped(mob/user, slot, initial)
	. = ..()
	if(!istype(user, /mob/living/carbon/human) || slot != ITEM_SLOT_HANDS)
		return

	var/mob/living/carbon/human/H = user
	H.mind.AddSpell(new spell(H))

/obj/item/lewd_spellbook/dropped(mob/user, silent)
	. = ..()
	if(!istype(user, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = user
	H.mind.RemoveSpell(spell)
