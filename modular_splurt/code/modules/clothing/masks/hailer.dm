/obj/item/clothing/mask/gas/sechailer/slut
	name = "slutcurity hailer"
	desc = "A modified Security gas mask designed for softer apprehension, now with a hot pink paintjob!"
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_masks.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_masks-digi.dmi'
	icon_state = "sluthailer"
	item_state = "sluthailer"
	aggressiveness = 0 //can't have your pets being mean!
	actions_types = list(/datum/action/item_action/halt)

/obj/item/clothing/mask/gas/sechailer/slut/MouseDrop(atom/over_object)

/obj/item/clothing/mask/gas/sechailer/slut/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.wear_mask)
			to_chat(user, "<span class='warning'>The mask is fastened tight! You'll need help taking this off!</span>")
			return
	..()
