// HYPERSTATION TRAITS

/datum/quirk/choke_slut
	name = "Choke Slut"
	desc = "You are aroused by suffocation."
	value = 0
	mob_trait = TRAIT_CHOKE_SLUT
	gain_text = "<span class='notice'>You feel like you want to feel fingers around your neck, choking you until you pass out or make a mess... Maybe both.</span>"
	lose_text = "<span class='notice'>Seems you don't have a kink for suffocation anymore.</span>"

/datum/quirk/pharmacokinesis //Supposed to prevent unwanted organ additions. But i don't think it's really working rn
	name = "Acute hepatic pharmacokinesis" //copypasting dumbo
	desc = "You have a rare genetic disorder that causes Incubus draft and Succubus milk to be absorbed by your liver instead."
	value = 0
	mob_trait = TRAIT_PHARMA
	lose_text = "<span class='notice'>Your liver feels different.</span>"
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
	desc = "You don't seem to show much care for being touched. Whether it's because you're reserved or due to self control, you won't wag your tail outside of your own control should you possess one."
	mob_trait = TRAIT_DISTANT
	value = 0
	medical_record_text = "Patient cares little with or dislikes being touched."

/datum/quirk/headpat_slut
	name = "Headpat Slut"
	desc = "You like headpats, alot, maybe even a little bit too much. Headpats give you a bigger mood boost and cause arousal"
	mob_trait = TRAIT_HEADPAT_SLUT
	value = 0
	medical_record_text = "Patient seems overly affectionate."

/datum/quirk/in_heat
	name = "In Heat"
	desc = "Your system burns with the desire to be bred. Satisfying your lust will make you happy, but ignoring it may cause you to become sad and needy."
	value = 0
	mob_trait = TRAIT_IN_HEAT
	gain_text = "<span class='notice'>You body burns with the desire to be bred.</span>"
	lose_text = "<span class='notice'>You feel more in control of your body and thoughts.</span>"

/datum/quirk/Hypnotic_gaze
	name = "Hypnotic Gaze"
	desc = "Be it through mysterious patterns, flickering colors or a glint of the eye, prolonged eye contact with others will place the Target into a highly suggestible Hypnotic trance."
	value = 0
	mob_trait = TRAIT_HYPNOTIC_GAZE
	gain_text = "<span class='notice'>Your eyes glimmer Hypnotically..</span>"
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
	to_chat(T, "<span class='warning'>[H] stares Intensely into your eyes...</span>")
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
		T.visible_message("<span class='warning>[T] falls into a deep slumber!</span>", "<span class = 'danger'>Your eyelids gently shut as you fall into a deep slumber. All you can hear is [H]'s voice as you commit to following all of their suggestions</span>")

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

			T.visible_message("<span class='warning'>[T] wakes up from their deep slumber!</span>", "<span class ='danger'>Your eyelids gently open as you see [H]'s face staring back at you</span>")
			T.SetSleeping(0)
			T = null
			return

		if(response2 == "Release")
			T.SetSleeping(0)
			return
	else
		T.visible_message("<span class='warning'>[T]'s attention breaks, despite the attempt to hypnotize them! They clearly don't want this</span>", "<span class ='warning'>Your concentration breaks as you realise you have no interest in following [H]'s words!</span>")
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
	desc = "You're particularly fond of food, and join the round being overweight."
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
	name = "Extra productive genitals"
	desc = "Your lower bits produce more and hold more than normal."
	value = 0
	gain_text = "<span class='notice'>You feel pressure in your groin.</span>"
	lose_text = "<span class='notice'>You feel a weight lifted from your groin.</span>"
	medical_record_text = "Patient has greatly increased production of sexual fluids."

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
//hydra code below

/datum/quirk/hydra
	name = "Hydra Heads"
	desc = "You are a tri-headed creature. To use, format name like (Rucks-Sucks-Ducks)"
	value = 0
	mob_trait = TRAIT_HYDRA_HEADS
	gain_text = "<span class='notice'>You hear two other voices inside of your head(s).</span>"
	lose_text = "<span class='danger'>All of your minds become singular.</span>"
	medical_record_text = "There are multiple heads and personalities affixed to one body."

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
	name = "Reset Speech"
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
