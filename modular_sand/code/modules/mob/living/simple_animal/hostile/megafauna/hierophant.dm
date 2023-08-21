/mob/living/simple_animal/hostile/megafauna/hierophant
	loot = list(/obj/item/hierophant_club, /obj/item/borg/upgrade/modkit/wall)
	crusher_loot = list(/obj/item/hierophant_club, /obj/item/borg/upgrade/modkit/wall)

/mob/living/simple_animal/hostile/megafauna/hierophant/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the floating club by the hilt, and violently smashes it onto the ground, killing it!", "jumps onto the hierophant and rips off their beacon with one hand as it crackles and explodes!"), \
		messages_crusher = list("violently chops the floating club with seemingly no effect, until it falls onto the ground limply!"), \
		messages_pka = list("shoots at the floating club in the middle of it's 'face', which seemingly overloads it until it explodes!"), \
		messages_pka_bayonet = list("jumps on the hierophant and stabs it's beacon, the bizarre creature seemingly screaming until it crackles and explodes!"))
