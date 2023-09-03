/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner
	deathsound = "bodyfall"

/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the demonic miner's arm, flips their cleaving saw with the other hand, and forcefully makes them chop off their own head with it!", "grabs demonic miner by their PKA, aims it at their head and then shoots, splattering his brains out!", "rips out both of the demonic miner's arms, then kicks their limp torso on the groundd and curbstomps their head in so hard it explodes!"), \
		messages_crusher = list("chops off the demonic miner's cleaving saw arm in one swift move, then grabs the saw and swings it against their head, chopping their skull vertically in half!", "bashes the miner to the ground with the hilt of their crusher, then elbow drops their skull so hard it explodes in gore!", "chops the demonic miner diagonally with their crusher, not quite cutting through but getting their crusher halfway stuck and killing the moaning fiend!"))
