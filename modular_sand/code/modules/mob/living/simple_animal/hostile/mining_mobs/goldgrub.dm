/mob/living/simple_animal/hostile/asteroid/goldgrub/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("rips out the goldgrub's eyes, and sticks them into his mouth hole!", "violently opens the goldgrub's mouth open, then sticks one hand inside and rips out their ore-filled stomach!"), \
		messages_pka = list("bashes the shit out of the golgrub with their PKA, gushing green blood everywhere!", "sticks their pka into the goldgrub's mouth and shoots, exploding it and showering everything in ore and gore!"), \
		messages_pka_bayonet = list("grabs the goldgrub with one hand and slices their stomach with the pka's bayonet, spilling ore and guts everywhere!", "climbs on the goldgrub, and repeatedly stabs it's head with the bayonet, spilling green blood on the ground, until it stops moving!"), \
		messages_crusher = list("chops the goldgrub's head off with their crusher!", "chops the goldgrub repeatedly with their crusher, until all that is left is a bunch of golden and green pieces of meat, as well as some ore."), \
		health_given = 7.5, \
		threshold = (maxHealth/10 * 1.5), \
		crusher_drop_mod = 2)
