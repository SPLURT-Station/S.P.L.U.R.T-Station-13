//heels
/obj/item/clothing/shoes/latexheels
	name = "latex heels"
	desc = "Your feet hurt just looking at them."
	icon_state = "latexheels"
	item_state = "latexheels"
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/foot/lewd_shoes.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/feet/lewd_shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/lewd_clothing/feet/lewd_shoes_digi.dmi'
	can_be_tied = FALSE
	slowdown = 3
	strip_delay = 120
	mutantrace_variation = STYLE_DIGITIGRADE
	var/seamless = FALSE


//it takes time to put them off, do not touch
/obj/item/clothing/shoes/latexheels/attack_hand(mob/user)
	var/mob/living/carbon/C = user
	if(iscarbon(user) && (user.get_item_by_slot(ITEM_SLOT_FEET) == src))
		if(seamless)
			to_chat(C, span_purple(pick("You slide your heels against eachother in a failed attempt at kicking them off.",
										"The heels refuse to budge no matter how much you tug.",
										"The heels are tight around your ankles and the laces refuse to loosen.")))
			return
		else
			if(!do_after(C, 40, target = src))
				return
	. = ..()

/obj/item/clothing/shoes/latexheels/MouseDrop(atom/over_object)

/obj/item/clothing/shoes/latexheels/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/latex))
		if(seamless != FALSE)
			to_chat(user, span_warning("The heels suddenly loosen!"))
			seamless = FALSE
		else
			to_chat(user, span_warning("The heels suddenly tighten!"))
			seamless = TRUE
	return

/obj/item/clothing/shoes/latexheels/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/lewd/highheel1.ogg' = 1,'modular_splurt/sound/lewd/highheel2.ogg' = 1), 70)

/////////////////
///Latex socks///
/////////////////

/obj/item/clothing/shoes/latex_socks
	name = "latex socks"
	desc = "A pair of shiny, form fitting socks made out of a durable material."
	icon_state = "latexsocks"
	item_state = "latexsocks"
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/foot/lewd_shoes.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/feet/lewd_shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/lewd_clothing/feet/lewd_shoes_digi.dmi'
	w_class = WEIGHT_CLASS_SMALL

//start processing
/obj/item/clothing/shoes/latex_socks/equipped(mob/user, slot)
	. = ..()
	var/mob/living/carbon/human/C = user
	C.update_inv_shoes()
	C.hud_used.hidden_inventory_update()

//////////////////
///Domina heels///
//////////////////

/obj/item/clothing/shoes/dominaheels //added for Kubic request
	name = "dominant heels"
	desc = "A pair of aesthetically pleasing heels."
	icon_state = "dominaheels"
	item_state = "dominaheels"
	icon = 'modular_splurt/icons/obj/clothing/lewd_clothes/foot/lewd_shoes.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/feet/lewd_shoes.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/lewd_clothing/feet/lewd_shoes_digi.dmi'
	equip_delay_other = 60
	strip_delay = 60
	slowdown = 1

//it takes time to put them off, do not touch
/obj/item/clothing/shoes/dominaheels/attack_hand(mob/user)
	var/mob/living/carbon/C = user
	if(iscarbon(user))
		if(src == C.shoes)
			if(!do_after(C, 20, target = src))
				return
	. = ..()
//to make sound when we walking in this
/obj/item/clothing/shoes/dominaheels/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/lewd/highheel1.ogg' = 1,'modular_splurt/sound/lewd/highheel2.ogg' = 1), 70)
