/mob/living/simple_animal/hostile/asteroid/elite/herald/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the herald by it's legs and smashes it repeatedly on the ground, bits and pieces of flesh flying off until it dies!"), \
		messages_crusher = list("chops the herald's 'ear' with the crusher, then shoves the hilt of it so hard down their throat that it goes through their whole body and they fucking die!"), \
		messages_pka = list("parries a bolt of the herald with a PKA blast, which comes flying back onto them and slashes off their head!"), \
		messages_pka_bayonet = list("stabs the herald repeatedly in the torso, then into their skull for good measure!"), \
		health_given = 50, \
		threshold = (maxHealth/10 * 0.625))
