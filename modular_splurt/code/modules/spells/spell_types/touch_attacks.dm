/obj/effect/proc_holder/spell/targeted/touch/blessed_hand
	name = "Blessed Touch"
	desc = "Channel the divine power of your deity, allowing you to restore the physical form of other crew. It can even save them from death!"
	hand_path = /obj/item/melee/touch_attack/blessed_hand

	school = "evocation"
	charge_max = 60 MINUTES
	cooldown_min = 20 MINUTES // Reduction per rank
	clothes_req = NONE

	drawmessage = "You channel divine power into your hand."
	dropmessage = "You draw the divine power back out of your hand."

	action_icon = 'modular_splurt/icons/mob/actions/misc_actions.dmi'
	action_icon_state = "blessed_touch_hand"
