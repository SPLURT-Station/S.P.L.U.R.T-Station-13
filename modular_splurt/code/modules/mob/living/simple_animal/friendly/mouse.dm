/mob/living/simple_animal/mouse/boommouse
	name = "boommouse" //obviously inspired on rimworld
	desc = "A mutated rat with a pack of... Plasma on its back? I wouldn't really touch it if I were you."
	icon = 'modular_splurt/icons/mob/animal.dmi'
	icon_state = "mouse_plasma"
	icon_living = "mouse_plasma"
	icon_dead = "mouse_plasma"
	see_in_dark = 12
	maxHealth = 7
	health = 7
	chew_probability = 0

/mob/living/simple_animal/mouse/boommouse/Initialize()
	. = ..()
	//Force icons because mouse/initialize randomizes them
	icon = 'modular_splurt/icons/mob/animal.dmi'
	icon_state = "mouse_plasma"
	icon_living = "mouse_plasma"
	icon_dead = "mouse_plasma" //No need for a dead sprite since it qdels itself on death

/mob/living/simple_animal/mouse/boommouse/death(gibbed, toast)
	var/turf/T = get_turf(src)
	message_admins("A boommouse explosion was triggered at [ADMIN_VERBOSEJMP(T)].")
	visible_message("<span class='danger'>The boommouse violently explodes!</span>")
	atmos_spawn_air("plasma=15;TEMP=750")
	explosion(src.loc, 0, 0, 2, 0, 1, 0, 2, 0, 0)
	qdel(src)

/mob/living/simple_animal/mouse/boommouse/attackby(obj/item/I, mob/living/user, params)
	var/turf/T = get_turf(src)
	message_admins("[ADMIN_LOOKUPFLW(user)] is attacking a boommouse at [ADMIN_VERBOSEJMP(T)].")
	if(istype(I, /obj/item/weldingtool))
		var/obj/item/weldingtool/W = I
		if(W.welding)
			user.visible_message("<span class='warning'>[user] burns the boommouse with [user.p_their()] [W.name]!</span>", "<span class='userdanger'>That was stupid of you.</span>")
			var/message_admins = "[ADMIN_LOOKUPFLW(user)] triggered a boommouse explosion at [ADMIN_VERBOSEJMP(T)]."
			GLOB.bombers += message_admins
			message_admins(message_admins)
			user.log_message("triggered a boommouse explosion.", LOG_ATTACK)
			death()
	return ..()

	//TODO - look into attacked_by to make this better and less shitcode

/mob/living/simple_animal/hostile/bigmouse
	name = "oversized mouse"
	desc = "The one who makes all the rules. You should probably just let it be."
	icon = 'icons/mob/animal.dmi'
	icon_state = "mouse_gray"
	icon_living = "mouse_gray"
	icon_dead = "mouse_gray_dead"
	speak = list("Skree!","SKREEE!","Squeak?")
	speak_emote = list("squeaks")
	emote_hear = list("Hisses.")
	emote_see = list("runs in a circle.", "stands on its hind legs.")
	melee_damage_lower = 15
	melee_damage_upper = 5
	response_help_simple = "pet"
	response_help_continuous = "pets"
	obj_damage = 9
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	maxHealth = 80
	health = 80
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 1)
	attack_sound = 'sound/weapons/bladeslice.ogg'
	density = FALSE
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SIZE_HUMAN
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	faction = list("neutral", "rat")
	size_multiplier = 2
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/bigmouse/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/ventcrawling, given_tier = VENTCRAWLER_ALWAYS)

/mob/living/simple_animal/hostile/bigmouse/Initialize()
	var/matrix/M = matrix()
	M.Scale(size_multiplier)
	M.Translate(0, 16*(size_multiplier-1)) //translate by 16 * size_multiplier - 1 on Y axis
	src.transform = M
	. = ..()

/mob/living/simple_animal/hostile/bigmouse/attack_hand(mob/living/carbon/M)
	..()
	if(client)
		return
	if(M.a_intent == INTENT_HARM)
		faction = list("hostile", "rat")
	return

/mob/living/simple_animal/hostile/bigmouse/attack_paw(mob/living/carbon/monkey/M)
	return attack_hand(M)

/mob/living/simple_animal/hostile/bigmouse/attack_alien(mob/living/carbon/alien/M)
	return attack_hand(M)

/mob/living/simple_animal/hostile/bigmouse/attack_animal(mob/living/simple_animal/M)
	. = ..()
	faction = list("hostile", "rat")
