/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("rips out both of the watcher's wings and shoves them aside, then kicks the downed body until it turns into mush!", "violently rips off one of the watcher's spikes, then stabs them repeatedly with it!"), \
		messages_pka = list("bashes the shit out of the watcher with their PKA, gushing blood everywhere!", "shoots both of the watcher's wings off, then sticks their PKA on their face and shoots, showering everything in gore!"), \
		messages_pka_bayonet = list("stabs the watcher's eye repeatedly, turning it into a bloody mess!", "slices one wing after another off the watcher, in swift moves!"), \
		messages_crusher = list("repeatedly chops the watcher with their crusher, turning it into bloody mush!", "mark detonates the watcher in close proximity, showering viscera everywhere!", "flips their Crusher around, ramming the handle up the Watcher's eye, impaling it, before smashing it against the ground brutally!"), \
		health_given = 7.5, \
		threshold = (maxHealth/10 * 1.5), \
		crusher_drop_mod = 2)
