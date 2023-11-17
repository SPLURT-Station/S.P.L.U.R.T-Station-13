/obj/item/choice_beacon/box/plushie/remove_bad_plushies(list/plushies)
	var/list/returned_plushies = ..()
	returned_plushies -= list(/obj/item/toy/plush/goatplushie,
		/obj/item/toy/plush/goatplushie/angry,
		/obj/item/toy/plush/goatplushie/angry/realgoat,
		/obj/item/toy/plush/realgoat,
		/obj/item/toy/plush/goatplushie/angry/kinggoat,
		/obj/item/toy/plush/goatplushie/angry/kinggoat/ascendedkinggoat,
		/obj/item/toy/plush/goatplushie/angry/guardgoat,
		/obj/item/toy/plush/goatplushie/angry/guardgoat/masterguardgoat,
		/obj/item/toy/plush/lizardplushie/saliith,
		/obj/item/toy/plush/mammal/fox/vulp
		)
	return returned_plushies

/obj/item/toy/plush
	obj_flags = UNIQUE_RENAME
	COOLDOWN_DECLARE(petting_heart_cooldown)

/// cube guy thing. beware, very silly
/obj/item/toy/plush/cube
	name = "Cubical plushie"
	desc = "That's one weird looking plushie."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "cube"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	squeak_override = list('sound/effects/footstep/rustystep1.ogg' = 1)

/obj/item/toy/plush/nukeplushie/susplushie
	name = "Suspect Plushie"
	desc = "A stuffed toy that resembles a red space station employee. The tag claims red employee to be purely fictitious."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "plushie_sus"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	attack_verb = list("shot", "eat", "killed")

/obj/item/toy/plush/nukeplushie/minisusplushie
	name = "Mini Suspect Plushie"
	desc = "A stuffed toy that resembles a red space station mini employee. The tag claims red employee to be purely fictitious."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "plushie_minisus"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	attack_verb = list("mini-shot", "mini-eat", "mini-killed")

/obj/item/toy/plush/shark
	name = "shark plushie"
	desc = "A soft shark plushie for soft men. Mostly known as 'Blahaj', but some call it 'The IKEA shark'."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "blahaj"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	attack_verb = list("gnawed", "gnashed", "chewed")
	squeak_override = list('modular_sand/sound/voice/rawr.ogg' = 1)

/obj/item/toy/plush/rouny
	name = "rouny plushie"
	desc = "A plushie depicting a xenomorph runner, made to commemorate the centenary of the Battle of LV-426. Much cuddlier than the real thing."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "rouny"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	attack_verb = list("slashed", "bit", "charged")

/obj/item/toy/plush/ada
	name = "Ada Plushie"
	desc = "Plush toy of a gray cat with bright, emerald-like eyes. The tongue is attached carelessly. Wings are not included."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "ada"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	squeak_override = list('modular_citadel/sound/voice/nya.ogg' = 1)

/obj/item/toy/plush/mammal/fox/vulp
	desc = "An adorable stuffed toy resembling a vulp."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'

/obj/item/toy/plush/mammal/fox/vulp/emma
	name = "Emma Plushie"
	icon_state = "emma"

/obj/item/toy/plush/mammal/fox/vulp/shiro
	name = "shiro plushie"
	icon_state = "shiro"

/obj/item/toy/plush/mammal/fox/vulp/raita
	name = "raita plushie"
	icon_state = "raita"

/obj/item/toy/plush/mammal/fox/vulp/aiko
	name = "Aiko Plushie"
	icon_state = "aiko"

/obj/item/toy/plush/nukeplushie/who
	name = "security officer plushie"
	desc = "A stuffed toy that resembles a Nanotrasen operative. He smells like burnt cotton."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "who"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	squeak_override = list('modular_sand/sound/voice/plush_1.ogg' = 9, 'modular_sand/sound/voice/plush_2.ogg' = 1)

/obj/item/toy/plush/deer/qm
	name = "supply chief plushie"
	desc = "A stuffed toy that resembles a Cargonia Chief. Looks like a fallen economy."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "qm"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'

/obj/item/toy/plush/sergal/judas
	name = "yellow shark plushie"
	desc = "An adorable stuffed plushie that resembles a yellow security shark."
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "judas"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	squeak_override = list('modular_sand/sound/voice/voice_alphys.ogg' = 9)

#define GREEN_NINJA_SKIN "green space ninja plushie"
#define BLUE_NINJA_SKIN "blue space ninja plushie"
#define RED_NINJA_SKIN "red space ninja plushie"

// Little cute Ninja plushie
/obj/item/toy/plush/ninja
	name = GREEN_NINJA_SKIN
	desc = "A protagonist of one of the most popular cartoon series on this side of galaxy. \"運命の忍者矢\""
	icon = 'modular_sand/icons/obj/plushes.dmi'
	icon_state = "ninja_plushie_green"
	lefthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/misc/plushes_righthand.dmi'
	attack_verb = list("shot", "nuked", "detonated")
	squeak_override = list('sound/effects/hit_punch.ogg' = 1)
	always_reskinnable = TRUE
	unique_reskin = list(
		GREEN_NINJA_SKIN = list("icon_state" = "ninja_plushie_green"),
		BLUE_NINJA_SKIN = list("icon_state" = "ninja_plushie_blue"),
		RED_NINJA_SKIN = list("icon_state" = "ninja_plushie_red")
	)
	COOLDOWN_DECLARE(change_ninja_cooldown)

/obj/item/toy/plush/ninja/reskin_obj(mob/user)
	. = ..()
	name = current_skin
	if(COOLDOWN_FINISHED(src, change_ninja_cooldown))
		COOLDOWN_START(src, change_ninja_cooldown, 3 SECONDS)
		switch(current_skin)
			if(BLUE_NINJA_SKIN)
				say("Your simple light won't stop me!")
			if(RED_NINJA_SKIN)
				say("You can run, but you can't hide!")
			else
				say("I am not afraid of the darkness! I am the darkness!")
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()

#undef GREEN_NINJA_SKIN
#undef BLUE_NINJA_SKIN
#undef RED_NINJA_SKIN
