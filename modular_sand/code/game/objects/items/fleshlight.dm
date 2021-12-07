/**
 * # Hyperstation 13 fleshlight
 *
 * Humbley request this doesnt get ported to other code bases, we strive to make things unique on our server and we dont have a lot of coders
 * but if you absolutely must. please give us some credit~ <3
 * made by quotefox and heavily modified by SandPoot
*/
/obj/item/fleshlight
	name 				= "fleshlight"
	desc				= "A sex toy disguised as a flashlight, used to stimulate someones penis, complete with colour changing sleeve."
	icon 				= 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state 			= "fleshlight_base"
	item_state 			= "fleshlight"
	w_class				= WEIGHT_CLASS_SMALL
	var/style			= "vagina"
	var/sleevecolor 	= "#ffcbd4" //pink
	custom_price 		= 8
	var/mutable_appearance/sleeve
	var/inuse 			= 0

/obj/item/fleshlight/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-Click \the [name] to customize it.</span>"

/obj/item/fleshlight/update_appearance(updates)
	. = ..()
	cut_overlays()
	sleeve = mutable_appearance(icon, style) // Inherits icon for if an admin wants to var edit it, thank me later.
	sleeve.color = sleevecolor
	add_overlay(sleeve)

/obj/item/fleshlight/AltClick(mob/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	customize(user)
	return TRUE

/obj/item/fleshlight/proc/customize(mob/living/user)
	if(src && !user.incapacitated() && in_range(user,src))
		var/new_style = tgui_input_list(usr, "Choose style", "Customize Fleshlight", list("vagina", "anus"))
		if(new_style)
			style = new_style
	update_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		var/new_color = input(user, "Choose color.", "Customize Fleshlight", sleevecolor) as color|null
		if(new_color)
			sleevecolor = new_color
	update_appearance()
	return TRUE

/obj/item/fleshlight/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/possessive_verb = user.p_their()
	var/message = ""
	var/lust_amt = 0
	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				if(M.has_penis(REQUIRE_EXPOSED))
					message = (user == M) ? pick("pumps [src] on [possessive_verb] penis") : pick("pumps \the [src] on [M]'s penis")
					lust_amt = NORMAL_LUST
	if(message)
		user.visible_message("<span class='lewd'>[user] [message].</span>")
		M.handle_post_sex(lust_amt, null, user)
		playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
	else if(user.a_intent == INTENT_HARM)
		return ..()

/**
 * # Hyperstation 13 portal fleshlight
 * kinky!
*/

/obj/item/portallight
	name 				= "portal fleshlight"
	desc 				= "A silver love(TM) fleshlight, used to stimulate someones penis, with bluespace tech that allows lovers to hump at a distance."
	icon 				= 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state 			= "unpaired"
	item_state 			= "fleshlight"
	w_class 			= WEIGHT_CLASS_SMALL
	var/partnercolor 	= "#ffcbd4"
	var/partnerbase 	= "normal"
	var/partnerorgan 	= "portal_vag"
	custom_price 		= 20
	var/mutable_appearance/sleeve
	var/mutable_appearance/organ
	var/obj/item/clothing/underwear/briefs/panties/portalpanties/portalunderwear
	var/useable 		= FALSE

/obj/item/portallight/examine(mob/user)
	. = ..()
	if(!portalunderwear)
		. += "<span class='notice'>The device is unpaired, to pair, swipe against a pair of portal panties.</span>"
	else
		. += "<span class='notice'>The device is paired, and awaiting input. </span>"

/obj/item/portallight/update_appearance(updates)
	. = ..()
	updatesleeve()

/obj/item/portallight/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/message = ""
	var/lust_amt = 0
	var/arouse_only_target = FALSE
	var/obj/item/organ/genital/penis/P
	var/obj/item/organ/genital/vagina/V
	var/target
	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT) && useable) // I promise all those checks are worth it!
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				if(M.has_penis(REQUIRE_EXPOSED))
					message = (user == M) ? pick("fucks into [src]") : pick("forces [M] to fuck into [src]")
					lust_amt = NORMAL_LUST
					P = M.getorganslot(ORGAN_SLOT_PENIS)
					target = P
			if(BODY_ZONE_PRECISE_MOUTH)
				if(M.has_mouth() && !M.is_mouth_covered())
					message = (user == M) ? pick("licks into [src]") : pick("forces [M] to lick into [src]")
					lust_amt = NORMAL_LUST
					arouse_only_target = TRUE
					target = "mouth"
			if(BODY_ZONE_R_ARM)
				if(M.has_hand(REQUIRE_ANY))
					var/can_interact = FALSE
					for(var/obj/item/bodypart/r_arm/R in M.bodyparts)
						can_interact = TRUE
					if(can_interact)
						message = (user == M) ? pick("touches softly against [src]") : pick("forces [M]'s finger on [src]")
						lust_amt = NORMAL_LUST
						arouse_only_target = TRUE
						target = "hand"
			if(BODY_ZONE_L_ARM)
				if(M.has_hand(REQUIRE_ANY))
					var/can_interact = FALSE
					for(var/obj/item/bodypart/l_arm/L in M.bodyparts)
						can_interact = TRUE
					if(can_interact)
						message = (user == M) ? pick("touches softly against [src]") : pick("forces [M]'s finger on [src]")
						lust_amt = NORMAL_LUST
						arouse_only_target = TRUE
						target = "hand"
	if(!useable)
		to_chat(user, "<span class='notice'>It seems the device has failed or your partner is not wearing their device.</span>")
	if(message)
		var/mob/living/carbon/human/portal_target = ishuman(portalunderwear.loc) && portalunderwear.current_equipped_slot == SLOT_W_UNDERWEAR ? portalunderwear.loc : null
		if(portalunderwear.targetting == "vagina")
			V = portal_target.getorganslot(ORGAN_SLOT_VAGINA)
		if(portal_target && (portal_target?.client?.prefs.toggles & VERB_CONSENT || !portal_target.ckey))
			user.visible_message("<span class='lewd'>[user] [message].</span>")
			if(!arouse_only_target)
				if(M.handle_post_sex(lust_amt, null, null))
					if(P)
						to_chat(portal_target, "<span class='userlove'>You feel a [P.shape] penis of [P.length] inches go deep into your [portalunderwear.targetting] and cum!</span>")
			switch(user.zone_selected)
				if(BODY_ZONE_PRECISE_GROIN)
					playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
														'modular_sand/sound/interactions/bang5.ogg',
														'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
				if(BODY_ZONE_PRECISE_MOUTH)
					playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
				if(BODY_ZONE_R_ARM)
					playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
				if(BODY_ZONE_L_ARM)
					playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)

			var/targeted = portalunderwear.targetting
			if(M != user)
				message = replacetext(message, "[M]", "someone")
			message = replacetext(message, "[src]", "your [targeted]")
			to_chat(portal_target, "<span class='lewd'>You feel something on your panties, it [message][P ? ", it is a [P.shape] penis of [P.length] inches" : ""].</span>")
			if(portal_target.handle_post_sex(lust_amt, null, null))
				switch(portalunderwear.targetting)
					if("vagina")
						to_chat(M, "<span class='userlove'>You feel \the [V] squirt over your [target]!</span>")
					if("anus")
						to_chat(M, "<span class='userlove'>You feel the anus constrict on your [target]!</span>")
			portal_target.do_jitter_animation() //make your partner shake too!
		else
			user.visible_message("<span class='warning'>\The [src] beeps and does not let [M] through.</span>")
	else if(user.a_intent == INTENT_HARM)
		return ..()

/obj/item/portallight/proc/updatesleeve()
	//get their looks and vagina colour!
	cut_overlays()//remove current overlays

	var/mob/living/carbon/human/H = null
	if(ishuman(portalunderwear.loc) && portalunderwear)
		H = portalunderwear.loc
	else
		useable = FALSE
		return
	var/obj/item/organ/genital/G = H.getorganslot("vagina")
	if(!G && portalunderwear.targetting == "vagina")
		useable = FALSE
		return
	if(H) //if the portal panties are on someone.
		if(portalunderwear.current_equipped_slot != SLOT_W_UNDERWEAR)
			useable = FALSE
			return

		sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_normal")
		if(islizard(H)) // lizard nerd
			sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_lizard")

		if(isslimeperson(H)) // slime nerd
			sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_slime")

		if(H.dna.species.name == "Avian") // bird nerd (obviously bad hyper code)
			sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_avian")

		sleeve.color = "#" + H.dna.features["mcolor"]
		add_overlay(sleeve)

		if(portalunderwear.targetting == "vagina")
			organ = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_vag")
			organ.color = G.color
		else
			organ = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_anus")
			organ.color = "#" + H.dna.features["mcolor"]

		useable = TRUE
		add_overlay(organ)
	else
		useable = FALSE

/obj/item/portallight/Destroy()
	if(portalunderwear)
		portalunderwear.portallight = null
		if(isliving(portalunderwear.loc))
			portalunderwear.audible_message("[icon2html(portalunderwear, hearers(portalunderwear))] *beep* *beep* *beep*")
			playsound(portalunderwear, 'sound/machines/triple_beep.ogg', ASSEMBLY_BEEP_VOLUME, TRUE)
			to_chat(portalunderwear.loc, "<span class='notice'>The panties beep as the link to the [src] is lost.</span>")
	. = ..()

/**
 * # Hyperstation 13 portal underwear
 * Wear it, cannot be worn if not pointing to the bits you have.
*/
/obj/item/clothing/underwear/briefs/panties/portalpanties
	name = "portal panties"
	desc = "A silver love(TM) pair of portal underwear, with bluespace tech allows lovers to hump at a distance. Needs to be paired with a portal fleshlight before use."
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "portalpanties"
	item_state = "fleshlight"
	w_class = WEIGHT_CLASS_SMALL
	var/obj/item/portallight/portallight
	var/targetting = "vagina"
	equip_delay_self = 2 SECONDS
	equip_delay_other = 5 SECONDS

/obj/item/clothing/underwear/briefs/panties/portalpanties/attack_self(mob/user)
	. = ..()
	targetting = targetting == "anus" ? "vagina" : "anus"
	to_chat(user, "<span class='notice'>Now when worn the portal will now be facing \an [targetting].</span>")

/obj/item/clothing/underwear/briefs/panties/portalpanties/examine(mob/user)
	. = ..()
	if(!portallight)
		. += "<span class='notice'>The device is unpaired, to pair, swipe the fleshlight against this pair of portal panties(TM). </span>"
	else
		. += "<span class='notice'>The device is paired, and awaiting attachment. </span>"

/obj/item/clothing/underwear/briefs/panties/portalpanties/attackby(obj/item/I, mob/living/user) //pairing
	if(istype(I, /obj/item/portallight))
		var/obj/item/portallight/P = I
		if(!P.portalunderwear) //make sure it aint linked to someone else
			portallight = P //pair the fleshlight
			P.portalunderwear = src //pair the panties on the fleshlight.
			P.icon_state = "paired" //we are paired!
			playsound(src, 'sound/machines/ping.ogg', 50, FALSE)
			to_chat(user, "<span class='notice'>[P] has been linked up successfully.</span>")
		else
			to_chat(user, "<span class='notice'>[P] has already been linked to another pair of underwear.</span>")
	else
		..() //just allows people to hit it with other objects, if they so wished.

/obj/item/clothing/underwear/briefs/panties/portalpanties/mob_can_equip(mob/living/M, slot)
	if(!..())
		return FALSE
	if(ishuman(M))
		switch(targetting)
			if("vagina")
				if(!M.has_vagina(REQUIRE_EXPOSED))
					to_chat(M, "<span class='warning'>The vagina is covered or there is none!</span>")
					return FALSE
			if("anus")
				if(!M.has_anus(REQUIRE_EXPOSED))
					to_chat(M, "<span class='warning'>The anus is covered or there is none!</span>")
					return FALSE
	return TRUE

/obj/item/clothing/underwear/briefs/panties/portalpanties/equipped(mob/user, slot)
	. = ..()
	switch(slot)
		if(SLOT_W_UNDERWEAR)
			if(!portallight)
				audible_message("[icon2html(src, hearers(src))] *beep* *beep* *beep*")
				playsound(src, 'sound/machines/triple_beep.ogg', ASSEMBLY_BEEP_VOLUME, TRUE)
				to_chat(user, "<span class='notice'>The panties are not linked to a portal fleshlight.</span>")
			else
				update_portal()
		else
			update_portal()
	RegisterSignal(user, COMSIG_PARENT_QDELETING, .proc/drop_out)

/obj/item/clothing/underwear/briefs/panties/portalpanties/dropped(mob/user)
	UnregisterSignal(user, COMSIG_PARENT_QDELETING)
	. = ..()
	update_portal()

/obj/item/clothing/underwear/briefs/panties/portalpanties/Destroy()
	if(portallight)
		var/obj/item/portallight/temp = portallight
		moveToNullspace() // loc cannot be human so let's destroy ourselves out of anything
		portallight.portalunderwear = null
		temp.updatesleeve()
	. = ..()

/obj/item/clothing/underwear/briefs/panties/portalpanties/proc/drop_out()
	var/mob/living/carbon/human/deleted
	if(ishuman(loc))
		deleted = loc
	forceMove(get_turf(loc))
	dropped(deleted) // Act like we've been dropped
	plane = initial(plane)
	layer = initial(layer)
	update_portal()

/obj/item/clothing/underwear/briefs/panties/portalpanties/proc/update_portal()
	if(portallight)
		var/obj/item/portallight/P = portallight
		P.updatesleeve()

/obj/item/storage/box/portallight
	name =  "Portal Fleshlight and Underwear"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	desc = "A small silver box with Silver Love Co embossed."
	icon_state = "box"
	custom_price = 15

// portal fleshlight box
/obj/item/storage/box/portallight/PopulateContents()
	new /obj/item/portallight/(src)
	new /obj/item/clothing/underwear/briefs/panties/portalpanties/(src)
	new /obj/item/paper/fluff/portallight(src)

/obj/item/paper/fluff/portallight
	name = "Portal Fleshlight Instructions"
	info = "Thank you for purchasing the Silver Love Portal Fleshlight!<BR>\
	To use, simply register your new portal fleshlight with the provided underwear to link them together. The ask your lover to wear the underwear.<BR>\
	Have fun lovers,<BR>\
	<BR>\
	Wilhelmina Steiner."
