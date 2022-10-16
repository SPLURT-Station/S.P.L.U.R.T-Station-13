/datum/interaction/lewd/slide_hand
	description = "Slide your hand under their clothing."
	interaction_sound = null
	require_user_hands = TRUE
	
/datum/interaction/lewd/slide_hand/proc/zone_2_bodypart(zone)
	switch(zone)
		if(BODY_ZONE_PRECISE_GROIN)
			return GROIN
		if(BODY_ZONE_CHEST)
			return CHEST

/datum/interaction/lewd/slide_hand/evaluate_user(mob/living/user, silent, action_check)
	if(!istype(user, /mob/living/carbon))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.hand_slide_target != null)
		return FALSE
	if(user.zone_selected != BODY_ZONE_CHEST && user.zone_selected != BODY_ZONE_PRECISE_GROIN)
		return FALSE
	return ..()

/datum/interaction/lewd/slide_hand/evaluate_target(mob/living/user, mob/living/target, silent = TRUE)
	if(target.get_clothing_blocking_part(zone_2_bodypart(user.zone_selected)) == null)
		return FALSE
	// TODO: pref check?
	return ..()

/datum/interaction/lewd/slide_hand/display_interaction(mob/living/user, mob/living/target)
	var/mob/living/carbon/C = user
	var/dir = C.zone_selected == BODY_ZONE_CHEST ? "up" : "under"
	var/clothing_name = C.get_hand_slide_clothing_name(target, zone_2_bodypart(C.zone_selected))
	C.visible_message("<span class='danger'>[C] is trying to slide their hand [dir] [target]'s [clothing_name]!</span>", \
		"<span class='userdanger'>[C] is trying to slide their hand [dir] [target]'s [clothing_name]!</span>")

	if(do_mob(C, target, 30))
		C.hand_slide_target = target
		C.hand_slide_part = zone_2_bodypart(C.zone_selected)
		to_chat(C, "<span class='notice'>You slide your hand [dir] [target]'s [clothing_name].</span>")
		while(1)
			sleep(2)
			if(!user.Adjacent(target))
				C.hand_slide_target = null
				C.hand_slide_part = null
				return
	else
		to_chat(C, "<span class='warning'>You fail to slide your hand [dir] [target]'s [clothing_name]!</span>")
