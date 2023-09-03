/mob/living/simple_animal/hostile/megafauna/colossus/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("grabs the colossus by the leg, and pulls them down! While downed, they climb on his neck and violently rip off their vocal cords!", "goes around the colossus and climbs them by their back, once on top of their shoulder they grab it's arm and aim the blaster at the creature's head, which finishes itself off with a penetrating death bolt that blasts off their head!"), \
		messages_crusher = list("throws their crusher at the colossus' head, which surprisingly works! Humiliated, the angelic creature dies with a big fucking axe stuck on their skull!", "chops off one of the colossus' legs with the crusher, as it falls down they grab the leg and use it as a makeshift club on the creature's head, which explodes in differently-sized giblets on impact!"), \
		messages_pka = list("somehow parries a death bolt with a PKA blast, which goes right back to it's owner's torso, opening a hole on them and killing them!"), \
		messages_pka_bayonet = list("goes around the colossus and climbs on their back, ramming their bayonet on it's spine and falling down holding it, pretty much gruesomely opening the colossus' back!"))
