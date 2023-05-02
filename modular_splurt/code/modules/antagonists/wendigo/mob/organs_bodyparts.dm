/obj/item/organ/liver/wendigo
	name = "rotten liver"
	desc = "A liver from a wendigo. It looks like a spoiled tomato."
	decay_factor = 0

/obj/item/organ/liver/wendigo/on_life()
	var/mob/living/carbon/C = owner
	if(istype(C))
		damage = initial(maxHealth)

		if(filterToxins && !HAS_TRAIT(owner, TRAIT_TOXINLOVER))
			//handle liver toxin filtration
			for(var/datum/reagent/toxin/T in C.reagents.reagent_list)
				var/thisamount = C.reagents.get_reagent_amount(T.type)
				if (thisamount && thisamount <= toxTolerance)
					C.reagents.remove_reagent(T.type, 1)

		C.reagents.metabolize(C, can_overdose=FALSE)
		if(istype(C, /mob/living/carbon/wendigo))
			var/mob/living/carbon/wendigo/A = C
			A.metabolize_hunger()

/obj/item/organ/eyes/night_vision/wendigo
	sight_flags = SEE_MOBS

/obj/item/bodypart/head/wendigo
	dismemberable = FALSE
	max_damage = INFINITY
	animal_origin = WENDIGO_BODYPART

/obj/item/bodypart/chest/wendigo
	dismemberable = FALSE
	max_damage = INFINITY
	animal_origin = WENDIGO_BODYPART

/obj/item/bodypart/l_arm/wendigo
	dismemberable = FALSE
	max_damage = INFINITY
	attack_verb_continuous = list("slashs", "claws", "mauls")
	attack_verb_simple = list("slash", "claw", "maul")
	animal_origin = WENDIGO_BODYPART

/obj/item/bodypart/r_arm/wendigo
	dismemberable = FALSE
	max_damage = INFINITY
	attack_verb_continuous = list("slashs", "claws", "mauls")
	attack_verb_simple = list("slash", "claw", "maul")
	animal_origin = WENDIGO_BODYPART

/obj/item/bodypart/l_leg/wendigo
	dismemberable = FALSE
	max_damage = INFINITY
	attack_verb_continuous = list("pounds", "stomps", "stamps", "kicks")
	attack_verb_simple = list("pound", "stomp", "stamp", "kick")
	animal_origin = WENDIGO_BODYPART

/obj/item/bodypart/r_leg/wendigo
	dismemberable = FALSE
	max_damage = INFINITY
	attack_verb_continuous = list("pounds", "stomps", "stamps", "kicks")
	attack_verb_simple = list("pound", "stomp", "stamp", "kick")
	animal_origin = WENDIGO_BODYPART
