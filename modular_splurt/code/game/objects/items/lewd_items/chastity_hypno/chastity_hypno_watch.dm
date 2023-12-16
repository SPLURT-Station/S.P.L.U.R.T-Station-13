/obj/item/chastity_hypno/watch
	name = "Hypnotic Chastity Watch"
	icon = 'modular_splurt/icons/obj/silver_pocketwatch.dmi'
	icon_state = "pocketwatch"
	item_state = "pocketwatch"
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 3
	var/mob/living/carbon/subject = null
	var/closed = FALSE

/obj/item/chastity_hypno/watch/ui_status(mob/user)
	if(can_interact(user) && subject)
		if(!subject.IsSleeping())
			to_chat(user, "[subject] is awake and no longer under hypnosis!")
			subject = null
			return UI_CLOSE
		return ..()

	return UI_CLOSE

/obj/item/chastity_hypno/watch/attack(mob/living/carbon/human/H, mob/living/user)
	if(closed)
		return
	if(H.IsSleeping())
		to_chat(user, "You can't hypnotize [H] whilst they're asleep!")
		return

	user.visible_message("<span class='warning'>[user] begins to mesmerizingly wave [src] like a pendulum before [H]'s very eyes!</span>")

	if(!do_mob(user, H, 12 SECONDS))
		return
	if(!(user in view(1, loc)))
		return

	if(!CHECK_BITFIELD(H.client?.prefs.cit_toggles, HYPNO))
		return

	var/response = alert(H, "Do you wish to fall into a hypnotic sleep? (This will allow [user] to issue hypnotic suggestions)", "Hypnosis", "Yes", "No")

	if(response == "Yes")
		H.visible_message("<span class='warning'>[H] falls into a deep slumber!</span>", "<span class ='danger'>Your eyelids gently shut as you fall into a deep slumber. All you can hear is [user]'s voice as you commit to following all of their suggestions</span>")

		H.SetSleeping(1200)
		H.drowsyness = max(H.drowsyness, 40)
		subject = H
		return

	H.visible_message("<span class='warning'>[H]'s attention breaks, despite your attempts to hypnotize them! They clearly don't want this</span>", "<span class ='warning'>Your concentration breaks as you realise you have no interest in following [user]'s words!</span>")

/obj/item/chastity_hypno/watch/attack_self(mob/user)
	if(closed)
		return
	if(!subject)
		return

	. = ..()

/obj/item/chastity_hypno/watch/save()
	. = ..()
	if(!subject)
		return

	subject.visible_message("<span class='warning'>[subject] wakes up from their deep slumber!</span>", "<span class ='danger'>Your eyelids gently open as you see [usr]'s face staring back at you</span>")
	subject.SetSleeping(0)
	hypno(subject)
	subject = null

/obj/item/chastity_hypno/watch/AltClick(mob/user)
	if(icon_state == "pocketwatch")
		icon_state = "pocketwatch_closed"
		item_state = "pocketwatch_closed"
		desc = "An elaborate pocketwatch, with a captivating silver etching. It's closed, however, and you can't see it's face..."
		closed = TRUE
		return

	icon_state = "pocketwatch"
	item_state = "pocketwatch"
	desc = "An elaborate pocketwatch, with a captivating silver etching and an enchanting face..."
	closed = FALSE
