//Hyperstation 13 vibrator
//For all them subs/bottoms out there, that wanna give someone the power to make them cum remotely.

/obj/item/electropack/vibrator
	name = "remote vibrator"
	desc = "A remote device that can deliver pleasure at a fair. It has three intensities that can be set by twisting the base."
	icon = 'modular_splurt/icons/obj/vibrator.dmi'
	icon_state = "vibe"
	item_state = "vibe"
	w_class = WEIGHT_CLASS_SMALL
	//slot_flags = ITEM_SLOT_DENYPOCKET   //no more pocket shockers
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
				to_chat(user, span_notice("You twist the bottom of [src], setting it to the medium setting."))
				return
			if(2)
				mode = 3
				to_chat(user, span_warning("You twist the bottom of [src], setting it to the high setting."))
				return
			if(3)
				mode = 1
				to_chat(user, span_notice("You twist the bottom of [src], setting it to the low setting."))
				return
/*
/obj/item/electropack/vibrator/attack(mob/living/carbon/C, mob/living/user)

	var/obj/item/organ/genital/picked_organ
	var/mob/living/carbon/human/S = user
	var/mob/living/carbon/human/T = C
	picked_organ = S.pick_receiving_organ(T, HAS_EQUIPMENT, "Vibrator", "Where are you putting it in?")
	if(picked_organ)
		C.visible_message(span_warning("<b>\The [user]</b> is trying to attach [src] to <b>\The [T]</b>!"),\
						span_warning("<b>\The [user]</b> is trying to put [src] on you!"))
		if(!do_mob(user, C, 5 SECONDS))//warn them and have a delay of 5 seconds to apply.
			return

		if(style == "long" && !(picked_organ.type == /obj/item/organ/genital/vagina)) //long vibrators dont fit on anything but vaginas, but small ones fit everywhere
			to_chat(user, span_warning("[src] is too big to fit there, use a smaller version."))
			return

		if(!picked_organ.equipment[GENITAL_EQUIPMENT_VIBRATOR])
			if(!(style == "long"))
				to_chat(user, span_love("You attach [src] to <b>\The [T]</b>'s [picked_organ.name]."))
			else
				to_chat(user, span_love("You insert [src] into <b>\The <b>[T]</b>'s [picked_organ.name]."))
		else
			to_chat(user, span_notice("They already have a [picked_organ.equipment[GENITAL_EQUIPMENT_VIBRATOR].name] there."))
			return

		if(!user.transferItemToLoc(src, picked_organ)) //check if you can put it in
			return
		playsound(C, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
		inside = TRUE
		picked_organ.equipment[GENITAL_EQUIPMENT_VIBRATOR] = src
		to_chat(user, span_warning("Done <b>Done</b>")) //Will delete after testing

	else
		to_chat(user, span_notice("You don't see anywhere to attach this."))
*/


/obj/item/electropack/vibrator/receive_signal(datum/signal/signal)
	if(!signal || signal.data["code"] != code)
		return

	if(last > world.time)
		return

	last = world.time + 3 SECONDS //lets stop spam.

	if(inside)
		if(!istype(loc, /obj/item/organ/genital))
			return
		var/obj/item/organ/genital/G = loc
		var/mob/living/carbon/U = G.owner

		if(G)
			switch(G.type) //just being fancy
				if(/obj/item/organ/genital/breasts)
					to_chat(U, span_love("[src] vibrates against your nipples!"))
				else
					to_chat(U, span_love("[src] vibrates against your [G.name]!"))

			var/intensity = 6*mode
			U.handle_post_sex(intensity, null, src, G) //give pleasure
			playsound(U.loc, 'modular_splurt/sound/lewd/vibrate.ogg', (intensity+5), 1, -1) //vibe intensity scaled up abit for sound

			switch(mode)
				if(1) //low, setting for RP, it wont force your character to do anything.
					to_chat(U, span_love("You feel pleasure surge through your [G.name]"))
					U.do_jitter_animation() //do animation without heartbeat
				if(2) //med, can make you cum
					to_chat(U, span_love("You feel intense pleasure surge through your [G.name]"))
					U.do_jitter_animation()
				if(3) //high, makes you stun
					to_chat(U, span_userdanger("You feel overpowering pleasure surge through your [G.name]"))
					U.Jitter(3)
					U.Stun(30)
					if(prob(50))
						U.emote("moan")



	playsound(src, 'modular_splurt/sound/lewd/vibrate.ogg', 40, 1, -1)
	if(style == "long") //haha vibrator go brrrrrrr
		icon_state = "vibing"

		sleep(30)
		icon_state = "vibe"
	else
		icon_state = "vibingsmall"
		sleep(30)
		icon_state = "vibesmall"
