/datum/interaction/lewd/bondage_rope_remove
	description = "Remove bondage rope."
	interaction_sound = 'modular_splurt/sound/lewd/rope.ogg'
	interaction_flags =  INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_REQUIRE_BONDAGE

/datum/interaction/lewd/bondage_rope_remove/evaluate_target(mob/living/user, mob/living/target, silent = TRUE)
	if(!istype(target, /mob/living/carbon))
		return FALSE

	var/mob/living/carbon/C = target
	if(!istype(C.handcuffed, /obj/item/restraints/bondage_rope) && !istype(C.legcuffed, /obj/item/restraints/bondage_rope))
		return FALSE

	return ..()

/datum/interaction/lewd/bondage_rope_remove/display_interaction(mob/living/user, mob/living/target)
	if(!istype(target, /mob/living/carbon))
		return
	var/mob/living/carbon/C = target
	if(istype(C.handcuffed, /obj/item/restraints/bondage_rope))
		C.clear_cuffs(C.handcuffed, 0)
	else if(istype(C.legcuffed, /obj/item/restraints/bondage_rope))
		C.clear_cuffs(C.legcuffed, 0)
