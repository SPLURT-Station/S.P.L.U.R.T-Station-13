
//items designed as melee
/obj/item/weapon/melee
	name = "weapon"
	icon = 'icons/obj/weapons/melee.dmi'
	icon_state = list(
		slot_l_hand_str = 'icons/obj/weapons/items_lefthand_melee.dmi',
		slot_r_hand_str = 'icons/obj/weapons/items_righthand_melee.dmi',
	)
	hitsound = "swing_hit"
	var/load_method = null //codex, defines are below.
	var/self_recharge = FALSE //codex

/obj/item/weapon/melee_attack_chain(mob/user, atom/target, params, rightclick)
	if(target == user && !user.do_self_harm)
		return
	return ..()
