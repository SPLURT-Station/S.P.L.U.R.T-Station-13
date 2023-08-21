/mob/living/simple_animal/hostile/asteroid/elite/broodmother/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("punches through the broodmother's womb, ripping out a little goliath which is promptly shoved on their mouth!", "rips off the broodmother's tentacles by hand, then knees their head until it caves in!"), \
		messages_crusher = list("rams the broodmother's torso the hilt of their crusher, which they promptly lift up and let gravity impale the broodmother!"), \
		messages_pka = list("shoots the broodmother's face, exploding it!"), \
		messages_pka_bayonet = list("stabs the broodmother's eye and gouges it out, shoving it into their maw, making them eat it!"), \
		health_given = 50, \
		threshold = (maxHealth/10 * 0.625))
