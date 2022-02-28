//latex gloves
/obj/item/clothing/gloves/latex_gloves
	name = "Latex gloves"
	desc = "Awesome looking gloves that are satisfying to the touch."
	icon_state = "latexgloves"
	item_state = "latexgloves"
	w_class = WEIGHT_CLASS_SMALL
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/gloves/lewd_gloves.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/gloves/lewd_gloves.dmi'
	var/seamless = FALSE


/obj/item/clothing/gloves/latex_gloves/attack_hand(mob/living/carbon/human/user)
	var/mob/living/carbon/human/C = user
	if(iscarbon(user) && seamless && (user.get_item_by_slot(ITEM_SLOT_GLOVES) == src))
		to_chat(C, span_purple(pick("You rub your gloved fingers together as you search for some sort of escape.",
									"You can't find any leverage to remove these gloves!",
									"Your pointless clawing seems to only make things more skin tight")))
		return
	. = ..()

/obj/item/clothing/gloves/latex_gloves/MouseDrop(atom/over_object)

/obj/item/clothing/gloves/latex_gloves/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/latex))
		if(seamless != FALSE)
			to_chat(user, span_warning("The gloves suddenly loosen!"))
			seamless = FALSE
		else
			to_chat(user, span_warning("The gloves suddenly tighten!"))
			seamless = TRUE
	return
