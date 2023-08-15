/mob/living/simple_animal/hostile/asteroid/elite/pandora/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the pandora and closes it for good!"), \
		messages_crusher = list("chops the pandora by their neck, the head flying off!"), \
		messages_pka = list("shoots the pandora's head until it closes for good!"), \
		messages_pka_bayonet = list("stabs through the pandora repeatedly, until it closes itself!"), \
		health_given = 50, \
		threshold = (maxHealth/10 * 0.625))
//at this point i'm legitimately tired i dont care aaaaaaaaaaa // so true
