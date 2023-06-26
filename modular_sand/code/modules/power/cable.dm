/obj/structure/cable/attack_hand(mob/user, act_intent, attackchain_flags)
	. = ..()
	shock(user, 50)
