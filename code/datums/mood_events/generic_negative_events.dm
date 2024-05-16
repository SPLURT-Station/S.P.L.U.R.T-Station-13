/datum/mood_event/handcuffed
	description = span_warning("I guess my antics have finally caught up with me.\n")
	mood_change = -1

/datum/mood_event/broken_vow //Used for when mimes break their vow of silence
	description = span_boldwarning("I have brought shame upon my name, and betrayed my fellow mimes by breaking our sacred vow...\n")
	mood_change = -8

/datum/mood_event/on_fire
	description = span_boldwarning("I'M ON FIRE!!!\n")
	mood_change = -8

/datum/mood_event/suffocation
	description = span_boldwarning("CAN'T... BREATHE...\n")
	mood_change = -6

/datum/mood_event/burnt_thumb
	description = span_warning("I shouldn't play with lighters...\n")
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/cold
	description = span_warning("It's way too cold in here.\n")
	mood_change = -2

/datum/mood_event/hot
	description = span_warning("It's getting hot in here.\n")
	mood_change = -2

/datum/mood_event/creampie
	description = span_warning("I've been creamed. Tastes like pie flavor.\n")
	mood_change = -2
	timeout = 3 MINUTES

/datum/mood_event/slipped
	description = span_warning("I slipped. I should be more careful next time...\n")
	mood_change = -2
	timeout = 3 MINUTES

/datum/mood_event/eye_stab
	description = span_boldwarning("I used to be an adventurer like you, until I took a screwdriver to the eye.\n")
	mood_change = -4
	timeout = 3 MINUTES

/datum/mood_event/delam //SM delamination
	description = span_boldwarning("Those God damn engineers can't do anything right...\n")
	mood_change = -2
	timeout = 4 MINUTES

/datum/mood_event/depression
	description = span_warning("I feel sad for no particular reason.\n")
	mood_change = -9
	timeout = 2 MINUTES

/datum/mood_event/shameful_suicide //suicide_acts that return SHAME, like sord
	description = span_boldwarning("I can't even end it all!\n")
	mood_change = -10
	timeout = 1 MINUTES

/datum/mood_event/dismembered
	description = span_boldwarning("AHH! I WAS USING THAT LIMB!\n")
	mood_change = -8
	timeout = 4 MINUTES

/datum/mood_event/noshoes
	description = span_warning("I am a disgrace to comedy everywhere!\n")
	mood_change = -5

/datum/mood_event/tased
	description = span_warning("There's no \"z\" in \"taser\". It's in the zap.\n")
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/embedded
	description = span_boldwarning("Pull it out!\n")
	mood_change = -7

/datum/mood_event/table_limbsmash
	description = span_warning("That fucking table, man that hurts...\n")
	mood_change = -3
	timeout = 3 MINUTES

/datum/mood_event/table_limbsmash/add_effects(obj/item/bodypart/banged_limb)
	if(banged_limb)
		description = span_warning("My fucking [banged_limb.name], man that hurts...\n")

/datum/mood_event/table/add_effects()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(iscatperson(H))
			H.dna.species.start_wagging_tail(H)
			addtimer(CALLBACK(H.dna.species, TYPE_PROC_REF(/datum/species, stop_wagging_tail), H), 30)
			description =  span_nicegreen("They want to play on the table!\n")
			mood_change = 2

/datum/mood_event/brain_damage
	mood_change = -3

/datum/mood_event/brain_damage/add_effects()
	var/damage_message = pick_list_replacements(BRAIN_DAMAGE_FILE, "brain_damage")
	description = span_warning("Hurr durr... [damage_message]\n")

/datum/mood_event/hulk //Entire duration of having the hulk mutation
	description = span_warning("HULK SMASH!\n")
	mood_change = -4

/datum/mood_event/epilepsy //Only when the mutation causes a seizure
	description = span_warning("I should have paid attention to the epilepsy warning.\n")
	mood_change = -3
	timeout = 5 MINUTES

/datum/mood_event/nyctophobia
	description = span_warning("It sure is dark around here...\n")
	mood_change = -3

/datum/mood_event/brightlight
	description = span_warning("The light feels unbearable...\n")
	mood_change = -3

/datum/mood_event/family_heirloom_missing
	description = span_warning("I'm missing my family heirloom...\n")
	mood_change = -4

/datum/mood_event/healsbadman
	description = span_warning("I feel a lot better, but wow that was disgusting.\n")
	mood_change = -4
	timeout = 2 MINUTES

/datum/mood_event/jittery
	description = span_warning("I'm nervous and on edge and I can't stand still!!\n")
	mood_change = -2

/datum/mood_event/vomit
	description = span_warning("I just threw up. Gross.\n")
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/vomitself
	description = span_warning("I just threw up all over myself. This is disgusting.\n")
	mood_change = -4
	timeout = 3 MINUTES

/datum/mood_event/painful_medicine
	description = span_warning("Medicine may be good for me but right now it stings like hell.\n")
	mood_change = -5
	timeout = 1 MINUTES

/datum/mood_event/painful_limb_regrowth
	description = span_warning("It's great to have all my limbs back but that was absolutely painful.\n")
	mood_change = -5
	timeout = 1 MINUTES

/datum/mood_event/loud_gong
	description = span_warning("That loud gong noise really hurt my ears!\n")
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/spooked
	description = span_warning("The rattling of those bones...It still haunts me.\n")
	mood_change = -4
	timeout = 4 MINUTES

/datum/mood_event/graverobbing
	description = span_boldwarning("I just desecrated someone's grave... I can't believe I did that...\n")
	mood_change = -8
	timeout = 3 MINUTES

/datum/mood_event/gates_of_mansus
	description = span_boldwarning("I HAD A GLIMPSE OF THE HORROR BEYOND THIS WORLD. REALITY UNCOILED BEFORE MY EYES!\n")
	mood_change = -25
	timeout = 4 MINUTES

// These are unused so far but I want to remember them to use them later

/datum/mood_event/cloned_corpse
	description = span_boldwarning("I recently saw my own corpse...\n")
	mood_change = -6

/datum/mood_event/surgery
	description = span_boldwarning("HE'S CUTTING ME OPEN!!\n")
	mood_change = -8

// End unused

/datum/mood_event/sad_empath
	description = span_warning("Someone seems upset...\n")
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/sad_empath/add_effects(mob/sadtarget)
	description = span_warning("[sadtarget.name] seems upset...\n")

/datum/mood_event/revenant_blight
	description = span_umbra("Just give up, honk...\n")
	mood_change = -5

/datum/mood_event/revenant_blight/add_effects()
	description = span_umbra("Just give up, [pick("no one will miss you", "there is nothing you can do to help", "even a clown would be more useful than you", "does it even matter in the end?")]...\n")

/datum/mood_event/plushjack
	description = span_warning("I have butchered a plush recently.\n")
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/plush_nostuffing
	description = span_warning("A plush I tried to pet had no stuffing...\n")
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/plush_bite
	description = span_warning("IT BIT ME!! OW!\n")
	mood_change = -3
	timeout = 2 MINUTES

// Cursed stuff below

/datum/mood_event/emptypred
	description = span_nicegreen("I had to let someone out.\n")
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/emptyprey
	description = span_nicegreen("It feels quite cold out here.\n")
	mood_change = -2
	timeout = 1 MINUTES

// Cursed stuff end.

/datum/mood_event/vampcandle
	description = span_umbra("Something is making your mind feel... loose...\n")
	mood_change = -15
	timeout = 1 MINUTES

/datum/mood_event/drankblood_bad
	description = span_boldwarning("I drank the blood of a lesser creature. Disgusting.\n")
	mood_change = -4
	timeout = 8 MINUTES

/datum/mood_event/drankblood_dead
	description = span_boldwarning("I drank dead blood. I am better than this.\n")
	mood_change = -7
	timeout = 10 MINUTES

/datum/mood_event/drankblood_synth
	description = span_boldwarning("I drank synthetic blood. What is wrong with me?\n")
	mood_change = -7
	timeout = 15 MINUTES

/datum/mood_event/drankkilled
	description = span_boldwarning("I drank from my victim until they died. I feel...less human.\n")
	mood_change = -12
	timeout = 25 MINUTES

/datum/mood_event/madevamp
	description = span_boldwarning("A soul has been cursed to undeath by my own hand.\n")
	mood_change = -10
	timeout = 30 MINUTES

/datum/mood_event/vampatefood
	description = span_boldwarning("Mortal nourishment no longer sustains me. I feel unwell.\n")
	mood_change = -6
	timeout = 10 MINUTES

/datum/mood_event/daylight_1
	description = span_boldwarning("I slept poorly in a makeshift coffin during the day.\n")
	mood_change = -3
	timeout = 10 MINUTES

/datum/mood_event/daylight_2
	description = span_boldwarning("I have been scorched by the unforgiving rays of the sun.\n")
	mood_change = -6
	timeout = 15 MINUTES

/datum/mood_event/bloodsucker_disgust
	description = span_boldwarning("Something I recently ate was horrifyingly disgusting.\n")
	mood_change = -5
	timeout = 5 MINUTES

/datum/mood_event/nanite_sadness
	description = span_warning("+++++++HAPPINESS SUPPRESSION+++++++\n")
	mood_change = -7

/datum/mood_event/nanite_sadness/add_effects(message)
	description = span_warning("+++++++[message]+++++++\n")

/datum/mood_event/artbad
	description = span_warning("I've produced better art than that from my ass.\n")
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/tripped
	description = span_boldwarning("I can't believe I fell for the oldest trick in the book!\n")
	mood_change = -6
	timeout = 2 MINUTES

/datum/mood_event/untied
	description = span_boldwarning("I hate when my shoes come untied!\n")
	mood_change = -3
	timeout = 1 MINUTES

/datum/mood_event/high_five_alone
	description = span_boldwarning("I tried getting a high-five with no one around, how embarrassing!\n")
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/high_five_full_hand
	description = span_boldwarning("Oh God, I don't even know how to high-five correctly...\n")
	mood_change = -1
	timeout = 45 SECONDS

/datum/mood_event/left_hanging
	description = span_boldwarning("But everyone loves high fives! Maybe people just... hate me?\n")
	mood_change = -2
	timeout = 1.5 MINUTES

/datum/mood_event/too_slow
	description = span_boldwarning("NO! HOW COULD I BE.... TOO SLOW???\n")
	mood_change = -2 // multiplied by how many people saw it happen, up to 8, so potentially massive. the ULTIMATE prank carries a lot of weight
	timeout = 2 MINUTES

/datum/mood_event/too_slow/add_effects(param)
	var/people_laughing_at_you = 1 // start with 1 in case they're on the same tile or something
	for(var/mob/living/carbon/iter_carbon in oview(owner, 7))
		if(iter_carbon.stat == CONSCIOUS)
			people_laughing_at_you++
			if(people_laughing_at_you > 7)
				break

	mood_change *= people_laughing_at_you
	return ..()

/datum/mood_event/sacrifice_bad
	description = span_warning("Those darn savages!\n")
	mood_change = -5
	timeout = 2 MINUTES
