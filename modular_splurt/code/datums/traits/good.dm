/datum/quirk/tough
	name = "Tough"
	desc = "Your body is abnormally enduring and can take 10% more damage."
	value = 4
	medical_record_text = "Patient has an abnormally high capacity for injury."
	gain_text = span_notice("You feel very sturdy.")
	lose_text = span_notice("You feel less sturdy.")

/datum/quirk/tough/add()
	quirk_holder.maxHealth *= 1.1

/datum/quirk/tough/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 0.909 //close enough

/datum/quirk/ashresistance
	name = "Ashen Resistance"
	desc = "Your body is adapted to the burning sheets of ash that coat volcanic worlds, though the heavy downpours of silt will still tire you."
	value = 2 //Is not actually THAT good. Does not grant breathing and does stamina damage to the point you are unable to attack. Crippling on lavaland, but you'll survive. Is not a replacement for SEVA suits for this reason. Can be adjusted.
	mob_trait = TRAIT_ASHRESISTANCE
	medical_record_text = "Patient has an abnormally thick epidermis."
	gain_text = span_notice("You feel resistant to burning brimstone.")
	lose_text = span_notice("You feel less as if your flesh is more flamamble.")

/* --FALLBACK SYSTEM INCASE THE TRAIT FAILS TO WORK. Do NOT enable this without editing ash_storm.dm to deal stamina damage with ash immunity.
/datum/quirk/ashresistance/add()
	quirk_holder.weather_immunities |= "ash"

/datum/quirk/ashresistance/remove()
	if(!quirk_holder)
		return
	quirk_holder.weather_immunities -= "ash"
*/

/datum/quirk/dominant_aura
	name = "Dominant Aura"
	desc = "Your mere presence is assertive enough to appear as powerful to other people, so much in fact that the weaker kind can't help but throw themselves at your feet at the snap of a finger."
	value = 1
	gain_text = span_notice("You feel like making someone your pet.")
	lose_text = span_notice("You feel less assertive.")

/datum/quirk/dominant_aura/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)
	RegisterSignal(quirk_holder, COMSIG_MOB_EMOTE, .proc/handle_snap)

/datum/quirk/dominant_aura/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)
	UnregisterSignal(quirk_holder, COMSIG_MOB_EMOTE)

/datum/quirk/dominant_aura/proc/on_examine_holder(atom/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/sub = user
	if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
		return

	examine_list += span_lewd("\nYou can't make eye contact with [quirk_holder.p_them()] before flustering away!")
	if(!TIMER_COOLDOWN_CHECK(user, COOLDOWN_DOMINANT_EXAMINE))
		to_chat(quirk_holder, span_notice("\The [user] tries to look at you but immediately turns away with a red face..."))
		TIMER_COOLDOWN_START(user, COOLDOWN_DOMINANT_EXAMINE, 5 SECONDS)
	sub.dir = turn(get_dir(sub, quirk_holder), pick(-90, 90))
	sub.emote("blush")

/datum/quirk/dominant_aura/proc/handle_snap(datum/source, list/emote_args)
	SIGNAL_HANDLER

	. = FALSE
	var/datum/emote/E
	E = E.emote_list[lowertext(emote_args[EMOTE_ACT])]
	if(TIMER_COOLDOWN_CHECK(quirk_holder, COOLDOWN_DOMINANT_SNAP) || !findtext(E?.key, "snap"))
		return
	for(var/mob/living/carbon/human/sub in hearers(DOMINANT_DETECT_RANGE, quirk_holder))
		if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
			continue
		var/good_x = "pet"
		switch(sub.gender)
			if(MALE)
				good_x = "boy"
			if(FEMALE)
				good_x = "girl"
		switch(E?.key)
			if("snap")
				sub.dir = get_dir(sub, quirk_holder)
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_notice("\The <b>[sub]</b> turns shyly towards \the <b>[quirk_holder]</b>."),
									span_lewd("You stare into \the [quirk_holder] submissively."))
			if("snap2")
				sub.dir = get_dir(sub, quirk_holder)
				sub.KnockToFloor()
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_lewd("\The <b>[sub]</b> submissively throws [sub.p_them()]self on the floor."),
									span_lewd("You throw yourself on the floor like a pathetic beast on <b>[quirk_holder]</b>'s command."))
			if("snap3")
				sub.KnockToFloor()
				step(sub, get_dir(sub, quirk_holder))
				sub.emote(pick("blush", "pant"))
				sub.do_jitter_animation(30) //You're being moved anyways
				sub.visible_message(span_lewd("\The <b>[sub]</b> crawls closer to \the <b>[quirk_holder]</b> on all fours, following [quirk_holder.p_their()] command."),
									span_lewd("You get on your hands and knees and crawl towards \the <b>[quirk_holder]</b> like a good [good_x] would."))
		. = TRUE

	if(.)
		TIMER_COOLDOWN_START(quirk_holder, COOLDOWN_DOMINANT_SNAP, DOMINANT_SNAP_COOLDOWN)

/datum/quirk/arachnid
	name = "Arachnid"
	desc = "Your bodily anatomy allows you to spin webs and cocoons, even if you aren't an arachnid! (Note that this quirk does nothing for members of the arachnid species)"
	value = 1
	medical_record_text = "Patient has attempted to cover the room in webs, claiming to be \"making a nest\"."
	mob_trait = TRAIT_ARACHNID
	gain_text = span_notice("You feel a strange sensation near your anus...")
	lose_text = span_notice("You feel like you can't spin webs anymore...")
	processing_quirk = TRUE

/datum/quirk/arachnid/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		to_chat(H, span_warning("As an arachnid, this quirk does nothing for you, as these abilities are innate to your species."))
		return
	var/datum/action/innate/spin_web/SW = new
	var/datum/action/innate/spin_cocoon/SC = new
	SC.Grant(H)
	SW.Grant(H)

/datum/quirk/arachnid/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		return
	var/datum/action/innate/spin_web/SW = locate(/datum/action/innate/spin_web) in H.actions
	var/datum/action/innate/spin_cocoon/SC = locate(/datum/action/innate/spin_cocoon) in H.actions
	SC?.Remove(H)
	SW?.Remove(H)

/datum/quirk/flutter
	name = "Flutter"
	desc = "You are able to move about freely in pressurized low-gravity environments be it through the use of wings, magic, or some other physiological nonsense."
	value = 1
	mob_trait = TRAIT_FLUTTER

/datum/quirk/cloth_eater
	name = "Clothes Eater"
	desc = "You can eat most apparel to gain a boost in mood, and to gain some nutrients. (Insects already have this.)"
	value = 1
	var/mood_category ="cloth_eaten"
	mob_trait = TRAIT_CLOTH_EATER
