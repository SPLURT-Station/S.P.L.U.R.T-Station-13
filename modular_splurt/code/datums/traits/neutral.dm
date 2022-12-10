// HYPERSTATION TRAITS

/datum/quirk/choke_slut
	name = "Choke Slut"
	desc = "You are aroused by suffocation."
	value = 0
	mob_trait = TRAIT_CHOKE_SLUT
	gain_text = "<span class='notice'>You feel like you want to feel fingers around your neck, choking you until you pass out or make a mess... Maybe both.</span>"
	lose_text = "<span class='notice'>Seems you don't have a kink for suffocation anymore.</span>"

/datum/quirk/pharmacokinesis //Supposed to prevent unwanted organ additions. But i don't think it's really working rn
	name = "Acute Hepatic Pharmacokinesis" //copypasting dumbo
	desc = "You have a genetic disorder that causes Incubus Draft and Succubus Milk to be absorbed by your liver instead."
	value = 0
	mob_trait = TRAIT_PHARMA
	lose_text = "<span class='notice'>Your liver feels... different, somehow.</span>"
	var/active = FALSE
	var/power = 0
	var/cachedmoveCalc = 1

/datum/quirk/steel_ass
	name = "Buns of Steel"
	desc = "You've never skipped ass day. You are completely immune to all forms of ass slapping and anyone who tries to slap your rock hard ass usually gets a broken hand."
	value = 0
	mob_trait = TRAIT_STEEL_ASS
	gain_text = "<span class='notice'>Your ass rivals those of golems.</span>"
	lose_text = "<span class='notice'>Your butt feels more squishy and slappable.</span>"

/datum/quirk/cursed_blood
	name = "Cursed Blood"
	desc = "Your lineage is cursed with the paleblood curse. Best to stay away from holy water... Hell water, on the other hand..."
	value = 0
	mob_trait = TRAIT_CURSED_BLOOD
	gain_text = "<span class='notice'>A curse from a land where men return as beasts runs deep in your blood.</span>"
	lose_text = "<span class='notice'>You feel the weight of the curse in your blood finally gone.</span>"
	medical_record_text = "Patient suffers from an unknown type of aversion to holy reagents. Keep them away from a chaplain."

/datum/quirk/headpat_hater
	name = "Distant"
	desc = "You don't seem to show much care for being touched. Whether it's because you're reserved or due to self control, others touching your head won't make you wag your tail should you possess one, and the action may even attract your ire."
	mob_trait = TRAIT_DISTANT
	value = 0
	gain_text = "<span class='notice'>Others' touches begin to make your blood boil...</span>"
	lose_text = "<span class='notice'>Having your head pet doesn't sound so bad right about now...</span>"
	medical_record_text = "Patient cares little with or dislikes being touched."

/datum/quirk/headpat_slut
	name = "Headpat Slut"
	desc = "You love the feeling of others touching your head! Maybe a little too much, actually... Others patting your head will provide a bigger mood boost and cause aroused reactions."
	mob_trait = TRAIT_HEADPAT_SLUT
	value = 0
	gain_text = "<span class='notice'>You crave headpats immensely!</span>"
	lose_text = "<span class='notice'>Your headpats addiction wanes.</span>"
	medical_record_text = "Patient seems overly affectionate."

/datum/quirk/headpat_slut/add()
	. = ..()
	quirk_holder.AddElement(/datum/element/wuv/headpat, null, null, /datum/mood_event/pet_animal)

/datum/quirk/headpat_slut/remove()
	. = ..()
	quirk_holder.RemoveElement(/datum/element/wuv/headpat)

/datum/quirk/in_heat
	name = "In Heat"
	desc = "Your system burns with the desire to be bred. Satisfying your lust will make you happy, but ignoring it may cause you to become sad and needy."
	value = 0
	mob_trait = TRAIT_IN_HEAT
	gain_text = "<span class='notice'>You body burns with the desire to be bred.</span>"
	lose_text = "<span class='notice'>You feel more in control of your body and thoughts.</span>"

/datum/quirk/Hypnotic_gaze
	name = "Hypnotic Gaze"
	desc = "Be it through mysterious patterns, flickering colors, or some genetic oddity, prolonged eye contact with you will place the viewer into a highly-suggestible hypnotic trance."
	value = 0
	mob_trait = TRAIT_HYPNOTIC_GAZE
	gain_text = "<span class='notice'>Your eyes glimmer hypnotically...</span>"
	lose_text = "<span class='notice'>Your eyes return to normal.</span>"
	medical_record_text = "Prolonged exposure to Patient's eyes exhibits soporific effects."

/datum/quirk/Hypnotic_gaze/on_spawn()
	var/mob/living/carbon/human/Hypno_eyes = quirk_holder
	var/datum/action/innate/Hypnotize/spell = new
	spell.Grant(Hypno_eyes)
	spell.owner = Hypno_eyes

/datum/action/innate/Hypnotize
	name = "Hypnotize"
	desc = "Stare deeply into someone's eyes, drawing them into a hypnotic slumber."
	button_icon_state = "Hypno_eye"
	icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
	background_icon_state = "bg_alien"
	var/mob/living/carbon/T //hypnosis target
	var/mob/living/carbon/human/H //Person with the quirk

/datum/action/innate/Hypnotize/Activate()
	var/mob/living/carbon/human/H = owner

	if(!H.pulling || !isliving(H.pulling) || H.grab_state < GRAB_AGGRESSIVE)
		to_chat(H, "<span class='warning'>You need to aggressively grab someone to hypnotize them!</span>")
		return

	var/mob/living/carbon/T = H.pulling

	if(T.IsSleeping())
		to_chat(H, "You can't hypnotize [T] whilst they're asleep!")
		return

	to_chat(H, "<span class='notice'>You stare deeply into [T]'s eyes...</span>")
	to_chat(T, "<span class='warning'>[H] stares intensely into your eyes...</span>")
	if(!do_mob(H, T, 12 SECONDS))
		return

	if(H.pulling !=T || H.grab_state < GRAB_AGGRESSIVE)
		return

	if(!(H in view(1, H.loc)))
		return

	if(!(T.client?.prefs.cit_toggles & HYPNO))
		return

	var/response = alert(T, "Do you wish to fall into a hypnotic sleep?(This will allow [H] to issue hypnotic suggestions)", "Hypnosis", "Yes", "No")

	if(response == "Yes")
		T.visible_message("<span class='warning>[T] falls into a deep slumber!</span>", "<span class = 'danger'>Your eyelids gently shut as you fall into a deep slumber. All you can hear is [H]'s voice as you commit to following all of their suggestions.</span>")

		T.SetSleeping(1200)
		T.drowsyness = max(T.drowsyness, 40)
		T = H.pulling
		var/response2 = alert(H, "Would you like to release your subject or give them a suggestion?", "Hypnosis", "Suggestion", "Release")

		if(response2 == "Suggestion")
			if(get_dist(H, T) > 1)
				to_chat(H, "You must stand in whisper range of [T].")
				return

			var/text = input("What would you like to suggest?", "Hypnotic suggestion", null, null)
			text = sanitize(text)
			if(!text)
				return

			to_chat(H, "You whisper your suggestion in a smooth calming voice to [T]")
			to_chat(T, "<span class='hypnophrase'>...[text]...</span>")

			T.visible_message("<span class='warning'>[T] wakes up from their deep slumber!</span>", "<span class ='danger'>Your eyelids gently open as you see [H]'s face staring back at you.</span>")
			T.SetSleeping(0)
			T = null
			return

		if(response2 == "Release")
			T.SetSleeping(0)
			return
	else
		T.visible_message("<span class='warning'>[T]'s attention breaks, despite the attempt to hypnotize them! They clearly don't want this!</span>", "<span class ='warning'>Your concentration breaks as you realise you have no interest in following [H]'s words!</span>")
		return
/datum/quirk/heat
	name = "Estrus Detection"
	desc = "You have a animalistic sense of detecting if someone is in heat."
	value = 0
	mob_trait = TRAIT_HEAT_DETECT
	gain_text = "<span class='notice'>You feel your senses adjust, allowing a animalistic sense of others' fertility.</span>"
	lose_text = "<span class='notice'>You feel your sense of others' fertility fade.</span>"

/datum/quirk/overweight
	name = "Overweight"
	desc = "You're particularly fond of food, and join the shift being overweight."
	value = 0
	gain_text = "<span class='notice'>You feel a bit chubby!</span>"
	//no lose_text cause why would there be?

/datum/quirk/overweight/on_spawn()
	var/mob/living/M = quirk_holder
	M.nutrition = rand(NUTRITION_LEVEL_FAT + NUTRITION_LEVEL_START_MIN, NUTRITION_LEVEL_FAT + NUTRITION_LEVEL_START_MAX)
	M.overeatduration = 100
	ADD_TRAIT(M, TRAIT_FAT, OBESITY)

/datum/quirk/vegetarian
	name = "Vegetarian"
	desc = "You find the idea of eating meat morally and physically repulsive."
	value = 0
	gain_text = "<span class='notice'>You feel repulsion at the idea of eating meat.</span>"
	lose_text = "<span class='notice'>You feel like eating meat isn't that bad.</span>"
	medical_record_text = "Patient reports a vegetarian diet."

/datum/quirk/vegetarian/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food &= ~MEAT
	species.disliked_food |= MEAT

/datum/quirk/vegetarian/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		if(initial(species.liked_food) & MEAT)
			species.liked_food |= MEAT
		if(initial(species.disliked_food) & ~MEAT)
			species.disliked_food &= ~MEAT

/datum/quirk/cum_plus
	name = "Extra-Productive Genitals"
	desc = "Your genitals produce and hold more than normal."
	value = 0
	gain_text = "<span class='notice'>You feel pressure in your groin.</span>"
	lose_text = "<span class='notice'>You feel a weight lifted from your groin.</span>"
	medical_record_text = "Patient exhibits increased production of sexual fluids."

/datum/quirk/cum_plus/add()
	var/mob/living/carbon/M = quirk_holder
	if(M.getorganslot("testicles"))
		var/obj/item/organ/genital/testicles/T = M.getorganslot("testicles")
		T.fluid_mult = 1.5 //Base is 1
		T.fluid_max_volume = 5

/datum/quirk/cum_plus/remove()
	var/mob/living/carbon/M = quirk_holder
	if(!M)
		return
	if(quirk_holder.getorganslot("testicles"))
		var/obj/item/organ/genital/testicles/T = M.getorganslot("testicles")
		T.fluid_mult = 1 //Base is 1
		T.fluid_max_volume = 3 //Base is 3

/datum/quirk/cum_plus/on_process()
	var/mob/living/carbon/M = quirk_holder //If you get balls later, then this will still proc
	if(M.getorganslot("testicles"))
		var/obj/item/organ/genital/testicles/T = M.getorganslot("testicles")
		if(T.fluid_max_volume <= 5 || T.fluid_mult <= 0.2) //INVALID EXPRESSION?
			T.fluid_mult = 1.5 //Base is 0.133
			T.fluid_max_volume = 5

//well-trained moved to neutral to stop the awkward situation of a dom snapping and the 30 trait powergamers fall to the floor.
/datum/quirk/well_trained
	name = "Well-Trained"
	desc = "You absolutely love being dominated. The thought of someone stronger than you is enough to make you act up."
	value = 0
	gain_text = "<span class='notice'>You feel like being someone's pet...</span>"
	lose_text = "<span class='notice'>You no longer feel like being a pet...</span>"
	processing_quirk = TRUE
	var/mood_category = "dom_trained"
	var/notice_delay = 0
	var/mob/living/carbon/human/last_dom

/datum/quirk/well_trained/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)

/datum/quirk/well_trained/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

/datum/quirk/well_trained/proc/on_examine_holder(atom/source, mob/living/user, list/examine_list)
	SIGNAL_HANDLER

	if(!istype(user))
		return
	if(!user.has_quirk(/datum/quirk/dominant_aura))
		return
	examine_list += span_lewd("You sense a strong aura of submission from [quirk_holder.p_them()].")

/datum/quirk/well_trained/on_process()
	. = ..()
	if(!quirk_holder)
		return

	var/good_x = "pet"
	switch(quirk_holder.gender)
		if(MALE)
			good_x = "boy"
		if(FEMALE)
			good_x = "girl"

	//Check for possible doms with the dominant_aura quirk, and for the closest one if there is
	. = FALSE
	var/list/mob/living/carbon/human/doms = range(DOMINANT_DETECT_RANGE, quirk_holder)
	var/closest_distance
	for(var/mob/living/carbon/human/dom in doms)
		if(dom != quirk_holder && dom.has_quirk(/datum/quirk/dominant_aura))
			if(!closest_distance || get_dist(quirk_holder, dom) <= closest_distance)
				. = dom
				closest_distance = get_dist(quirk_holder, dom)

	//Return if no dom is found
	if(!.)
		last_dom = null
		return

	//Handle the mood
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(istype(mood.mood_events[mood_category], /datum/mood_event/dominant/good_boy))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, mood_category, /datum/mood_event/dominant/good_boy)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, mood_category, /datum/mood_event/dominant/need)

	//Don't do anything if a previous dom was found
	if(last_dom)
		notice_delay = world.time + 15 SECONDS
		return

	last_dom = .

	if(notice_delay > world.time)
		return

	//Let them know they're near
	var/list/notices = list(
		"You feel someone's presence making you more submissive...",
		"Thoughts of being commanded flood you with lust...",
		"You really want to be called a good [good_x]...",
		"Someone's presence is making you all flustered...",
		"You start getting sweaty and excited..."
	)

	to_chat(quirk_holder, span_lewd(pick(notices)))
	notice_delay = world.time + 15 SECONDS


//hydra code below

/datum/quirk/hydra
	name = "Hydra Heads"
	desc = "You are a tri-headed creature. To use, format your name like (Rucks-Sucks-Ducks)."
	value = 0
	mob_trait = TRAIT_HYDRA_HEADS
	gain_text = "<span class='notice'>You hear two other voices inside of your head(s).</span>"
	lose_text = "<span class='danger'>All of your minds become singular.</span>"
	medical_record_text = "Patient has multiple heads and personalities affixed to their body."

/datum/quirk/hydra/on_spawn()
	var/mob/living/carbon/human/hydra = quirk_holder
	var/datum/action/innate/hydra/spell = new
	var/datum/action/innate/hydrareset/resetspell = new
	spell.Grant(hydra)
	spell.owner = hydra
	resetspell.Grant(hydra)
	resetspell.owner = hydra
	hydra.name_archive = hydra.real_name


/datum/action/innate/hydra
	name = "Switch head"
	desc = "Switch between each of the heads on your body."
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "art_summon"

/datum/action/innate/hydrareset
	name = "Reset speech"
	desc = "Go back to speaking as a whole."
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "art_summon"

/datum/action/innate/hydrareset/Activate()
	var/mob/living/carbon/human/hydra = owner
	hydra.real_name = hydra.name_archive
	hydra.visible_message("<span class='notice'>[hydra.name] pushes all three heads forwards; they seem to be talking as a collective.</span>", \
							"<span class='notice'>You are now talking as [hydra.name_archive]!</span>", ignored_mobs=owner)

/datum/action/innate/hydra/Activate() //I hate this but its needed
	var/mob/living/carbon/human/hydra = owner
	var/list/names = splittext(hydra.name_archive,"-")
	var/selhead = input("Who would you like to speak as?","Heads:") in names
	hydra.real_name = selhead
	hydra.visible_message("<span class='notice'>[hydra.name] pulls the rest of their heads back; and puts [selhead]'s forward.</span>", \
							"<span class='notice'>You are now talking as [selhead]!</span>", ignored_mobs=owner)

//Own traits
/datum/quirk/cum_sniff
	name = "Genital Taster"
	desc = "You've built so much experience savoring other people's genitals through your life that you can easily tell what liquids they're full of, besides reagents in their blood that is."
	value = 0
	mob_trait = TRAIT_GFLUID_DETECT
	gain_text = "<span class='notice'>You begin sensing peculiar smells from people's bits...</span>"
	lose_text = "<span class='notice'>People's genitals start smelling all the same to you...</span>"
	medical_record_text = "Patient attempted to get their doctor to drag his balls accross their face."

/datum/quirk/fluid_infuser
	name = "Fluid Infuser"
	desc = "You just couldn't wait to get one of NanoTrasen's new fluid inducers when they first came out, so now you can hop in the station with editable titty milk!"
	value = 0

/datum/quirk/fluid_infuser/on_spawn()
	. = ..()
	var/obj/item/implant/genital_fluid/put_in = new
	put_in.implant(quirk_holder, null, TRUE, TRUE)
//succubus and incubus below
/datum/quirk/incubus
	name = "Incubus"
	desc = "Your seductor-like metabolism can only be sated by milk. (And semen, if you're a Succubus as well.)"
	value = 0
	mob_trait = TRAIT_INCUBUS
	processing_quirk = TRUE

/datum/quirk/incubus/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/incubus/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/incubus/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjust_nutrition(-0.09)//increases their nutrition loss rate to encourage them to gain a partner they can essentially leech off of

/datum/quirk/succubus
	name = "Succubus"
	desc = "Your seductress-like metabolism can only be sated by semen. (And milk, if you're an Incubus as well.)"
	value = 0
	mob_trait = TRAIT_SUCCUBUS
	processing_quirk = TRUE

/datum/quirk/succubus/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/succubus/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/succubus/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjust_nutrition(-0.09)//increases their nutrition loss rate to encourage them to gain a partner they can essentially leech off of

/datum/quirk/vampire//splurt change start
	name = "Bloodsucker Fledgeling"
	desc = "You are a fledgeling of an ancient Bloodsucker bloodline; your skin is incurably pale and your mouth glimmers with vampiric fangs. Only blood will sate your hungers, and holy energies will cause your flesh to char."
	value = 0
	medical_record_text = "this person was partially infected by a bloodsucker"
	mob_trait = BLOODFLEDGE
	gain_text = "<span class='notice'>You feel an otherworldly thirst.</span>"
	lose_text = "<span class='notice'>you feel an otherworldy burden remove itself</span>"
	processing_quirk = TRUE

/datum/quirk/vampire/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_COLDBLOODED,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_NOBREATH,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_QUICKER_CARRY,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_AUTO_CATCH_ITEM,ROUNDSTART_TRAIT)//these two make the vampire fast and enables some sexy "bet you didnt think i could do this" romance
	if(!H.dna.skin_tone_override)
		H.skin_tone = "albino"
	var/datum/action/vbite/B = new
	var/datum/action/vrevive/R = new
	B.Grant(H)
	R.Grant(H)
	H.grant_language(/datum/language/vampiric, TRUE, TRUE, LANGUAGE_BLOODSUCKER)

/datum/quirk/vampire/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	var/area/A = get_area(H)
	if(istype(A, /area/service/chapel) && H.mind?.assigned_role != "Chaplain")
		H.adjustStaminaLoss(2)
		H.adjust_nutrition(-0.3)//changed these to be less deadly and more of an inconvinience
		H.adjust_disgust(1)
	if(istype(H.loc, /obj/structure/closet/crate/coffin))//heals the vampire if in a coffin, except burn which fire can be considered holy
		H.heal_overall_damage(4,4)
		H.adjust_disgust(-7)
		H.adjustOxyLoss(-4)
		H.adjustCloneLoss(-4)
		H.adjustBruteLoss(-0.3)
		H.adjustFireLoss(-0.3)
		if(!is_species(H, /datum/species/jelly)) //checks species
			H.adjustToxLoss(-5)//heals toxin if not slime
		else
			H.adjustToxLoss(5)//heals toxin if slime
		return
	if(H.nutrition == 0)
		if(H.staminaloss < 99)//makes them tired but dosent stun them
			H.adjustStaminaLoss(3, FALSE, TRUE)
		else
			H.adjustStaminaLoss(-1,FALSE, FALSE)//this also helps with if someone is stuck in the chapel for way too long, and i tested with a stun sword that stunning for sec is still possible
		if(prob(2)) //2 percent chance (if it was true randome D:<)
			to_chat(H, "<span class='warning'>I need blood NOW!!!</span>")

/datum/quirk/vampire/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/vbite/B = locate() in H.actions
	var/datum/action/vrevive/R = locate() in H.actions
	REMOVE_TRAIT(H, TRAIT_NO_PROCESS_FOOD, ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H, TRAIT_COLDBLOODED, ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H, TRAIT_NOBREATH, ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H, TRAIT_NOTHIRST, ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H,TRAIT_QUICKER_CARRY,ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H,TRAIT_AUTO_CATCH_ITEM,ROUNDSTART_TRAIT)
	B.Remove(H)
	R.Remove(H)
	H.remove_language(/datum/language/vampiric, TRUE, TRUE, LANGUAGE_BLOODSUCKER)

/datum/quirk/vampire/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/card/id/vampire/vcard = new /obj/item/card/id/vampire
	H.equip_to_slot(vcard, ITEM_SLOT_BACKPACK)
	vcard.registered_name = H.real_name
	vcard.update_label(addtext(vcard.registered_name, " the vampire"))
	//var/obj/item/card/id/I = H.get_idcard(FALSE)   maybe later, hop can just give the extra card proper access if needed, as for banking, that can be set on spawn by the player using the card in hand
	//vcard.access = I.access
	H.regenerate_icons()
	. = ..()


/datum/quirk/werewolf //adds the werewolf quirk
	name = "Werewolf"
	desc = "A beastly affliction allows you to shapeshift into a more wolfish appearance at will. This will increase your size (In general and below!) and cause you to behave as though you were an anthropomorphic canine. (This is still being tested. Please send any bugs to nukechicken on discord)"
	value = 0

/datum/quirk/werewolf/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/werewolf/W = new
	W.Grant(H)

/datum/quirk/werewolf/remove()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/werewolf/W = locate() in H.actions
	W.Remove(H)
	. = ..()

/datum/quirk/masked_mook
	name = "Bane Syndrome"
	desc = "For some reason you don't feel... right without wearing some kind of gas mask."
	gain_text = "<span class='danger'>You start feeling unwell without any gas mask on.</span>"
	lose_text = "<span class='notice'>You no longer have a need to wear some gas mask.</span>"
	value = 0
	mood_quirk = TRUE
	medical_record_text = "Patient feels more secure when wearing a gas mask."
	processing_quirk = TRUE
	var/mood_category = "masked_mook"

/datum/quirk/masked_mook/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/mask/gas/gasmask = H.get_item_by_slot(ITEM_SLOT_MASK)
	if(istype(gasmask))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, mood_category, /datum/mood_event/masked_mook)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, mood_category, /datum/mood_event/masked_mook_incomplete)

/datum/quirk/masked_mook/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/mask/gas/cosmetic/gasmask = new(get_turf(quirk_holder)) // Uses a custom gas mask
	H.equip_to_slot(gasmask, ITEM_SLOT_MASK)
	H.regenerate_icons()

/// quirk actions ///

//vampire bite

#define BLOOD_DRAIN_NUM 50

/datum/action/vbite
	name = "Bite"
	button_icon_state = "power_feed"
	icon_icon = 'icons/mob/actions/bloodsucker.dmi'
	desc = "Sink your vampiric fangs into the person you are grabbing."
	var/drain_cooldown = 0

/datum/action/vbite/Trigger()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/H = owner
		if(H.nutrition >= 500)
			to_chat(H, "<span class='notice'>You are too full to drain any more.</span>")
			return
		if(drain_cooldown >= world.time)
			to_chat(H, "<span class='notice'>You just drained blood, wait a few seconds.</span>")
			return
		if(!H.pulling || !iscarbon(H.pulling))
			if(H.getStaminaLoss() >= 80 && H.nutrition > 20)//prevents being stunlocked in the chapel
				to_chat(H,("<span class='notice'>you use some of your power to energize</span>"))
				H.adjustStaminaLoss(-20)
				H.adjust_nutrition(-20)
				H.resting = TRUE
		if(H.pulling && (iscarbon(H.pulling) || (istype(H.pulling,/obj/structure/arachnid/cocoon) && locate(/mob/living/carbon) in H.pulling.contents)))
			var/mob/living/carbon/victim
			if(iscarbon(H.pulling))
				victim = H.pulling
			else if(istype(H.pulling,/obj/structure/arachnid/cocoon))
				victim = locate(/mob/living/carbon) in H.pulling.contents
			drain_cooldown = world.time + 25
			if(victim.anti_magic_check(FALSE, TRUE, FALSE, 0))
				to_chat(victim, "<span class='warning'>[H] tries to bite you, but stops before touching you!</span>")
				to_chat(H, "<span class='warning'>[victim] is blessed! You stop just in time to avoid catching fire.</span>")
				return
			//Here we check now for both the garlic cloves on the neck and for blood in the victims bloodstream.
			if(!blood_sucking_checks(victim, TRUE, TRUE))
				return
			H.visible_message("<span class='danger'>[H] bites down on [victim]'s neck!</span>")
			victim.add_splatter_floor(get_turf(victim), TRUE)
			to_chat(victim, "<span class='userdanger'>[H] is draining your blood!</span>")
			if(!do_after(H, 30, target = victim))
				return
			var/blood_volume_difference = BLOOD_VOLUME_MAXIMUM - H.blood_volume //How much capacity we have left to absorb blood
			var/drained_blood = min(victim.blood_volume, BLOOD_DRAIN_NUM, blood_volume_difference)
			H.reagents.add_reagent(/datum/reagent/blood/, drained_blood)
			to_chat(victim, "<span class='danger'>[H] has taken some of your blood!</span>")
			to_chat(H, "<span class='notice'>You drain some blood!</span>")
			playsound(H, 'sound/items/drink.ogg', 30, 1, -2)
			victim.blood_volume = clamp(victim.blood_volume - drained_blood, 0, BLOOD_VOLUME_MAXIMUM)
			log_combat(H,victim,"vampire bit")//logs the biting action for admins
			if(!victim.blood_volume)
				to_chat(H, "<span class='warning'>You finish off [victim]'s blood supply!</span>")


/datum/action/vrevive
	name = "Resurrect"
	button_icon_state = "power_strength"
	icon_icon = 'icons/mob/actions/bloodsucker.dmi'
	desc = "Use all your energy to come back to life!"

/datum/action/vrevive/Trigger()
	. = ..()
	var/mob/living/carbon/C = owner
	var/mob/living/carbon/human/H = owner
	if(H.stat == DEAD && istype(C.loc, /obj/structure/closet/crate/coffin))
		H.revive(TRUE, FALSE)
		H.set_nutrition(0)
		H.Daze(20)
		H.drunkenness = 70
	else
		to_chat(H,"<span class='warning'>You need to be dead and in a coffin to revive!</span>")

//splurt change end
//put next quirk action here

//werewolf tf

/datum/action/werewolf
	name = "Transform"
	desc = "Transform into your wolf form."
	icon_icon = 'modular_splurt/icons/mob/actions/misc_actions.dmi'
	button_icon_state = "Transform"
	var/transformed = FALSE
	var/list/old_features = list("species" = SPECIES_HUMAN, "legs" = "Plantigrade", "size" = 1, "bark")

/datum/action/werewolf/Trigger()
	. = ..()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/genital/penis/P = H.getorganslot(ORGAN_SLOT_PENIS)
	var/obj/item/organ/genital/breasts/B = H.getorganslot(ORGAN_SLOT_BREASTS)
	var/obj/item/organ/genital/vagina/V = H.getorganslot(ORGAN_SLOT_VAGINA)
	H.shake_animation(2)
	if(!transformed) // transform them
		H.visible_message(span_danger("[H] shivers, their flesh bursting with a sudden growth of thick fur and their features contorting to that of a beast's, fully transforming them into a werewolf!"))
		H.set_species(/datum/species/mammal, 1)
		H.dna.species.mutant_bodyparts["mam_tail"] = "Wolf"
		H.dna.species.mutant_bodyparts["legs"] = "Digitigrade"
		H.Digitigrade_Leg_Swap(FALSE)
		H.dna.species.mutant_bodyparts["mam_snouts"] = "Mammal, Thick"
		H.dna.features["mam_ears"] = "Wolf"
		H.dna.features["mam_tail"] = "Wolf"
		H.dna.features["mam_snouts"] = "Mammal, Thick"
		H.dna.features["legs"] = "Digitigrade"
		H.update_size(get_size(H) + 0.5)
		H.set_bark("bark")
		H.custom_species = "Werewolf"
		if(!(H.dna.species.species_traits.Find(DIGITIGRADE)))
			H.dna.species.species_traits += DIGITIGRADE
		H.update_body()
		H.update_body_parts()
		if(B)
			B.color = "#[H.dna.features["mcolor"]]"
			B.update()
		if(P)
			P.shape = "Knotted"
			P.color = "#ff7c80"
			P.update()
			P.modify_size(6)
		if(V)
			V.shape = "Furred"
			V.color = "#[H.dna.features["mcolor"]]"
			V.update()
	else // untransform them
		H.visible_message(span_danger("[H] shrinks, their wolfish features quickly receding."))
		H.set_species(old_features["species"], TRUE)
		H.set_bark(old_features["bark"])
		H.dna.features["mam_ears"] = old_features["mam_ears"]
		H.dna.features["mam_snouts"] = old_features["mam_snouts"]
		H.dna.features["mam_tail"] = old_features["mam_tail"]
		H.dna.features["legs"] = old_features["legs"] //i hate legs i hate legs i hate legs i hate legs i hate legs i hate legs i hate legs
		if(old_features["legs"] == "Plantigrade")
			H.dna.species.species_traits -= DIGITIGRADE
			H.Digitigrade_Leg_Swap(TRUE)
			H.dna.species.mutant_bodyparts["legs"] = old_features["legs"]
		H.update_body()
		H.update_body_parts()
		H.update_size(get_size(H) - 0.5)
		if(B)
			B.color = "#[old_features["breasts_color"]]"
			B.update()
		if(H.has_penis())
			P.shape = old_features["cock_shape"]
			P.color = "#[old_features["cock_color"]]"
			P.update()
			P.modify_size(-6)
		if(H.has_vagina())
			V.shape = old_features["vag_shape"]
			V.color = "#[old_features["vag_color"]]"
			V.update()
			V.update_size()
	transformed = !transformed

/datum/action/werewolf/Grant()// on grant sets some variables
	. = ..()
	var/mob/living/carbon/human/H = owner
	old_features = H.dna.features.Copy()
	old_features["species"] = H.dna.species.type
	old_features["size"] = get_size(H)
	old_features["bark"] = H.vocal_bark_id

