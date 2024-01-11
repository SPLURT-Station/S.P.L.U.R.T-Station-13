/mob/living/simple_animal/hostile/asteroid/goliath/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("punches violently into the goliath's skull, ripping out what could be described as their brain!", "rips off one of the goliath's tentacles bare-handed, then whips them with it until they die in humiliation!", "stomps their boot hard down on the goliath's jaw, ripping one of its fangs off with their hand and stabbing it in the eye"), \
		messages_pka = list("climbs on top of the goliath, then shoots their skull open in a violent blast with their pka!"), \
		messages_pka_bayonet = list("stabs the goliath's eyes out with their bayonet, then sticks them into the beast's mouth!", "slices off many of the tentacles of the goliath with their bayonet, until it finally gives out!"), \
		messages_crusher = list("crushers the face of the goliath in one swift move with their crusher!"), \
		health_given = 7.5, \
		threshold = (maxHealth/10 * 1.5), \
		crusher_drop_mod = 2)
