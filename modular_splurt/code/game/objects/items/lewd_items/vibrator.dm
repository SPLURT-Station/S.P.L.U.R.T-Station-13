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

/obj/item/electropack/vibrator/ComponentInitialize()
	. = ..()
	var/list/procs_list = list(
		"before_inserting" = CALLBACK(src, PROC_REF(item_inserting)),
		"after_inserting" = CALLBACK(src, PROC_REF(item_inserted)),
	)
	AddComponent(/datum/component/genital_equipment, list(ORGAN_SLOT_VAGINA, ORGAN_SLOT_ANUS, ORGAN_SLOT_PENIS, ORGAN_SLOT_BREASTS, ORGAN_SLOT_BUTT, ORGAN_SLOT_BELLY), procs_list)

/obj/item/electropack/vibrator/proc/item_inserting(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	if(!(G.owner.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	if(locate(src.type) in G.contents)
		if(user == G.owner)
			to_chat(user, span_notice("You already have a vibrator inside your [G]!"))
		else
			to_chat(user, span_notice("\The <b>[G.owner]</b>'s [G] already has a vibrator inside!"))
		return FALSE

	if(user == G.owner)
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] themselves!"),\
			span_warning("You try to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] yourself!"))
	else
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] \the <b>[G.owner]</b>!"),\
			span_warning("\The <b>[user]</b> is trying to [style == "long" ? "insert" : "attach"] a vibrator [style == "long" ? "inside" : "to"] you!"))

	if(!do_mob(user, G.owner, 5 SECONDS))
		return FALSE

/obj/item/electropack/vibrator/proc/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	to_chat(user, span_userlove("You attach [src] to <b>\The [G.owner]</b>'s [G]."))
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = TRUE

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
