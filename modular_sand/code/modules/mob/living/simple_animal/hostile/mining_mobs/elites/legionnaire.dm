/mob/living/simple_animal/hostile/asteroid/elite/legionnaire/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the legionnaire's skull and rips it off, bashing them with it until they break apart and die!"), \
		messages_crusher = list("chops off both of the legionnaire's legs with the crusher in one single move, then stabs through their angry flying head with the hilt of it!"), \
		messages_pka = list("shoots the legionnaire's skull which fucking explodes, and then shoots the ribcage of the angry body which also explodes!"), \
		messages_pka_bayonet = list("stabs through the legionnaire's skull with the bayonet, which they promptly bash the rest of the body into dust with!"), \
		health_given = 50, \
		threshold = (maxHealth/10 * 0.625))
