//Hyper's mesmetron

/obj/item/mesmetron
	name = "Mesmetron"
	desc = "An elaborate pocketwatch, with a captivating gold etching and an enchanting face..."
	icon = 'modular_splurt/icons/obj/pocketwatch.dmi'
	icon_state = "pocketwatch"
	item_state = "pocketwatch"
	w_class = WEIGHT_CLASS_SMALL
	throw_range = 7
	throw_speed = 3
	var/mob/living/carbon/subject = null
	var/closed = FALSE


//Hypnotize someone
/obj/item/mesmetron/attack(mob/living/carbon/human/H, mob/living/user)
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

	var/response = alert(H, "Do you wish to fall into a hypnotic sleep? (This will allow [user] to issue hypnotic suggestions)", "Hypnosis", "Yes", "No")

	if(response == "Yes")
		H.visible_message("<span class='warning'>[H] falls into a deep slumber!</span>", "<span class ='danger'>Your eyelids gently shut as you fall into a deep slumber. All you can hear is [user]'s voice as you commit to following all of their suggestions</span>")

		H.SetSleeping(1200)
		H.drowsyness = max(H.drowsyness, 40)
		subject = H
		return

	//No
	H.visible_message("<span class='warning'>[H]'s attention breaks, despite your attempts to hypnotize them! They clearly don't want this</span>", "<span class ='warning'>Your concentration breaks as you realise you have no interest in following [user]'s words!</span>")



//If there's a subject, open the suggestion interface
/obj/item/mesmetron/attack_self(mob/user)
	if(closed)
		return
	if(!subject)
		return
	if(!subject.IsSleeping())
		to_chat(user, "[subject] is awake and no longer under hypnosis!")
		subject = null
		return

	var/response = alert(user, "Would you like to release your subject or give them a suggestion?", "Mesmetron", "Suggestion", "Release")
	if(response == "Suggestion")
		if(get_dist(user, subject) > 1)
			to_chat(user, "You must stand in whisper range of [subject].")
			return

		text = input("What would you like to suggest?", "Hypnotic suggestion", null, null)
		text = sanitize(text)
		if(!text)
			return

		to_chat(user, "You whisper your suggestion in a smooth calming voice to [subject]")
		to_chat(subject, "<span class='hypnophrase'>...[text]...</span>")
		return
	//Release
	subject.visible_message("<span class='warning'>[subject] wakes up from their deep slumber!</span>", "<span class ='danger'>Your eyelids gently open as you see [user]'s face staring back at you</span>")
	subject.SetSleeping(0)
	subject = null



//Toggle open/close
/obj/item/mesmetron/AltClick(mob/user)
	//Close it
	if(icon_state == "pocketwatch")
		icon_state = "pocketwatch_closed"
		item_state = "pocketwatch_closed"
		desc = "An elaborate pocketwatch, with a captivating gold etching. It's closed however and you can't see it's face"
		closed = TRUE
		return
	//Open it
	icon_state = "pocketwatch"
	item_state = "pocketwatch"
	desc = "An elaborate pocketwatch, with a captivating gold etching and an enchanting face..."
	closed = FALSE

