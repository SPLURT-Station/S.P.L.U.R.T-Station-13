//Hyperstation 13 vibrator
//For all them subs/bottoms out there, that wanna give someone the power to make them cum remotely.

/obj/item/electropack/vibrator
	name = "remote vibrator"
	desc = "A remote device that can deliver pleasure at a fair. It has three intensities that can be set by twisting the base."
	icon = 'modular_sand/icons/obj/vibrator.dmi'
	icon_state = "vibe"
	item_state = "vibe"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_DENYPOCKET   //no more pocket shockers
	var/mode = 1
	var/style = "long"
	var/inside = FALSE
	var/last = 0

/obj/item/electropack/vibrator/Initialize() //give the device its own code
	. = ..()
	code = rand(1,30)

/obj/item/electropack/vibrator/small //can go anywhere
	name = "small remote vibrator"
	style = "small"
	icon_state = "vibesmall"
	item_state = "vibesmall"

/obj/item/electropack/vibrator/AltClick(mob/living/user)
	var/dat = {"
<TT>
<B>Frequency/Code</B> for vibrator:<BR>
Frequency:
[format_frequency(src.frequency)]
<A href='byond://?src=[REF(src)];set=freq'>Set</A><BR>

Code:
[src.code]
<A href='byond://?src=[REF(src)];set=code'>Set</A><BR>
</TT>"}
	user << browse(dat, "window=radio")
	onclose(user, "radio")
	return

/obj/item/electropack/vibrator/attack_self(mob/user)
	if(!istype(user))
		return
	if(isliving(user))
		playsound(user, 'sound/effects/clock_tick.ogg', 50, 1, -1)
		switch(mode)
			if(1)
				mode = 2
				to_chat(user, "<span class='notice'>You twist the bottom of [src], setting it to the medium setting.</span>")
				return
			if(2)
				mode = 3
				to_chat(user, "<span class='warning'>You twist the bottom of [src], setting it to the high setting.</span>")
				return
			if(3)
				mode = 1
				to_chat(user, "<span class='notice'>You twist the bottom of [src], setting it to the low setting.</span>")
				return

/obj/item/electropack/vibrator/attack(mob/living/carbon/C, mob/living/user)

	var/obj/item/organ/genital/picked_organ
	var/mob/living/carbon/human/S = user
	var/mob/living/carbon/human/T = C
	picked_organ = S.pick_receiving_organ(T, "Vibrator")
	if(picked_organ)
		C.visible_message("<span class='warning'>[user] is trying to attach [src] to [T]!</span>",\
						"<span class='warning'>[user] is trying to put [src] on you!</span>")
		if(!do_mob(user, C, 5 SECONDS))//warn them and have a delay of 5 seconds to apply.
			return

		if(style == "long" && !(picked_organ.name == "vagina")) //long vibrators dont fit on anything but vaginas, but small ones fit everywhere
			to_chat(user, "<span class='warning'>[src] is too big to fit there, use a smaller version.</span>")
			return

		if(!picked_organ.equipment)
			if(!(style == "long"))
				to_chat(user, "<span class='love'>You attach [src] to [T]'s [picked_organ.name].</span>")
			else
				to_chat(user, "<span class='love'>You insert [src] into [T]'s [picked_organ.name].</span>")
		else
			to_chat(user, "<span class='notice'>They already have a [picked_organ.equipment.name] there.</span>")
			return

		if(!user.transferItemToLoc(src, picked_organ)) //check if you can put it in
			return
		src.inside = TRUE
		picked_organ.equipment = src

	else
		to_chat(user, "<span class='notice'>You don't see anywhere to attach this.</span>")


/obj/item/electropack/vibrator/receive_signal(datum/signal/signal)
	if(!signal || signal.data["code"] != code)
		return

	if(last > world.time)
		return

	last = world.time + 3 SECONDS //lets stop spam.

	if(inside)
		var/obj/item/organ/genital/G = src.loc
		var/mob/living/carbon/U = G.owner

		if(G)
			switch(G.name) //just being fancy
				if("breasts")
					to_chat(U, "<span class='love'>[src] vibrates against your nipples!</span>")
				else
					to_chat(U, "<span class='love'>[src] vibrates against your [G.name]!</span>")

			var/intencity = 6*mode
			U.handle_post_sex(intencity, null, src) //give pleasure
			playsound(U.loc, 'modular_sand/sound/lewd/vibrate.ogg', (intencity+5), 1, -1) //vibe intencity scaled up abit for sound


			switch(mode)
				if(1) //low, setting for RP, it wont force your character to do anything.
					to_chat(U, "<span class='love'>You feel pleasure surge through your [G.name]</span>")
					U.do_jitter_animation() //do animation without heartbeat
				if(2) //med, can make you cum
					to_chat(U, "<span class='love'>You feel intense pleasure surge through your [G.name]</span>")
					U.do_jitter_animation()
				if(3) //high, makes you stun
					to_chat(U, "<span class='userdanger'>You feel overpowering pleasure surge through your [G.name]</span>")
					U.Jitter(3)
					U.Stun(30)
					if(prob(50))
						U.emote("moan")



	playsound(src, 'modular_sand/sound/lewd/vibrate.ogg', 40, 1, -1)
	if(style == "long") //haha vibrator go brrrrrrr
		icon_state = "vibing"

		sleep(30)
		icon_state = "vibe"
	else
		icon_state = "vibingsmall"
		sleep(30)
		icon_state = "vibesmall"
