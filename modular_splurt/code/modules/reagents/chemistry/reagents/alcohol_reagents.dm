//SPLURT drinks

/datum/reagent/consumable/ethanol/panty_dropper
	name = "Liquid Panty Dropper"
	description = "You feel it's not named like that for nothing."
	color = "#ce3b01" // rgb: 206, 59, 1
	boozepwr = 70
	quality = DRINK_VERYGOOD
	taste_description = "cloth ripping and tearing"
	glass_name = "Liquid Panty Dropper"
	glass_desc = "You feel it's not named like that for no reason."
	value = 6

// Liquid Panty Dropper drink effect
/datum/reagent/consumable/ethanol/panty_dropper/on_mob_life(mob/living/carbon/C)
	// Praise the funny BYOND dots
	. = ..()

	// Check for client
	if(C.client)
		// Check target pref for ERP
		if(C.client?.prefs.erppref == "No")
			// Return without triggering
			return

		// Check target pref for aphrodisiacs
		if(C.client?.prefs.cit_toggles & NO_APHRO)
			// Return without triggering
			return

	// Perform drink effect
	C.clothing_burst(TRUE)

/datum/reagent/consumable/ethanol/lean
	name = "Lean"
	description = "The choice drink of space-pop stars, composed of soda, cough syrup and candies."
	color =  "#9109ba"
	boozepwr = 0
	metabolization_rate = 1 * REAGENTS_METABOLISM
	quality = DRINK_VERYGOOD
	taste_description = "cough syrup and space-pop music"
	glass_name = "Lean"
	glass_desc = "I LOVE LEAN!!"
	glass_icon_state = "lean" // the icon is not in the modular folder because it's literally impossible to get an icon from the modular folder unless it's an actual obj and not a drink. Go **** yourself.

/datum/reagent/consumable/ethanol/lean/on_mob_life(mob/living/carbon/C)
	var/mob/living/carbon/human/M = C
	var/message = "I LOVE LEAN!!"
	M.Dizzy(40)
	M.Jitter(40)
	M.set_drugginess(50)
	switch(current_cycle)
		if(1)
			M.say(message)
		if(80 to 100)
			M.adjustOrganLoss(ORGAN_SLOT_LIVER, 1)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1) // it's cough syrup what'd you expect?
		if(100 to INFINITY)
			M.adjustOrganLoss(ORGAN_SLOT_LIVER, 2)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
			if(!M.undergoing_cardiac_arrest() && M.can_heartattack() && prob(1))
				M.set_heartattack(TRUE)
				if(M.stat == CONSCIOUS)
					M.visible_message(span_userdanger("[M] clutches at [M.p_their()] chest as if [M.p_their()] heart stopped!")) // too much lean :(
	..()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub
	name = "Cum in the Hot Tub"
	description = "Doesn't really leave it to the imagination, eh?"
	boozepwr = 80
	color = "#D2D7D9"
	quality = DRINK_VERYGOOD
	taste_description = "smooth cream"
	glass_icon_state = "cum_glass"
	shot_glass_icon_state = "cum_shot"	//I'm funny, I know
	glass_name = "Cum in the Hot Tub"
	glass_desc = "Doesn't really leave it to the imagination, eh?"

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen
	boozepwr = 65
	taste_description = "viscous cream"
	description = "The name is probably exactly what it is."
	glass_desc = "The name is probably exactly what it is."

/datum/reagent/consumable/ethanol/mech_rider
	name = "Mech Rider"
	description = "Who would even drink this? "
	boozepwr = 65
	color = rgb(111, 127, 63)
	quality = DRINK_GOOD
	taste_description = "the sweat of a certain Mauler pilot"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "mech_rider_bottle"
	glass_name = "Mech Rider"
	glass_desc = "Who would even drink this?"

/datum/reagent/consumable/ethanol/isloation_cell
	name = "Isolation Cell"
	description = "Ice cubes in a padded Cell."
	color = "#b4b4b4"
	quality = DRINK_FANTASTIC
	taste_description = "cloth dissolved in sulphuric acid."
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "isolationcell"
	glass_name = "Isolation Cell"
	glass_desc = "Ice cubes in a padded Cell"

/datum/reagent/consumable/ethanol/isloation_cell/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 2)

/datum/reagent/consumable/ethanol/isloation_cell/morphine
	description = "It has a distinct, sour smell, much like morphine."
	taste_description = "cloth dissolved in sulphuric acid. Something feels off about it."
	glass_desc = "It has a distinct, sour smell, much like morphine."

/datum/reagent/consumable/ethanol/isloation_cell/morphine/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent_list(list(/datum/reagent/medicine/morphine = 2, /datum/reagent/consumable/ethanol/hippies_delight = 1))

/datum/reagent/consumable/ethanol/chemical_ex
	name = "Chemical Ex"
	description = "Date rape in a glass, a mixture courtesy of the Chief Witchdoctor. The stench of cigar smoke permeates the air wherever it goes."
	color = rgb(14, 14, 14)
	quality = DRINK_FANTASTIC
	taste_description = "ghost peppers, carbonated water and oil. Burns your tongue."
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "chemicalex"
	glass_name = "Chemical Ex"
	glass_desc = "Date rape in a glass, a mixture courtesy of the Chief Witchdoctor. The stench of cigar smoke permeates the air wherever it goes."

/datum/reagent/consumable/ethanol/chemical_ex/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent_list(list(/datum/reagent/drug/aphrodisiacplus = 2, /datum/reagent/medicine/morphine = 4, /datum/reagent/fermi/enthrall = 1))

/datum/reagent/consumable/ethanol/heart_of_gold
	name = "Heart Of Gold"
	description = "The Captain's Ambrosia. Something about it just feels divine."
	boozepwr = 15
	color = "#fc56e6"
	quality = DRINK_FANTASTIC
	taste_description = "a fruit punch-like blend with a little fruity kick at the back of your throat, with an aftertaste of pineapple."
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "heartofgold"
	glass_name = "Heart Of Gold"
	glass_desc = "The Captain's Ambrosia. Something about it just feels divine."

/datum/reagent/consumable/ethanol/moth_in_chief
	name = "Moth in Chief"
	description = "A simple yet elegant drink, inspires confidence in even the most pessimistic of men. The mantle rests well upon your shoulders."
	boozepwr = 50
	color = "#0919be"
	quality = DRINK_FANTASTIC
	value = REAGENT_VALUE_AMAZING
	taste_description = "fuzz, warmth and comfort"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "mothinchief"
	glass_name = "Moth in Chief"
	glass_desc = "A simple yet elegant drink, inspires confidence in even the most pessimistic of men. The mantle rests well upon your shoulders."
	can_synth = FALSE;

//This drink gives the combined benefits of Stimulants, Regenerative Jelly, and Commander and Chief, and a mood buff similar to Copium; at least to an extent.
/datum/reagent/consumable/ethanol/commander_and_chief/on_mob_life(mob/living/carbon/M)
	if(M.mind && HAS_TRAIT(M.mind, TRAIT_CAPTAIN_METABOLISM))
		M.heal_bodypart_damage(2,2,2)
		M.adjustBruteLoss(-5,0)
		M.adjustOxyLoss(-5,0)
		M.adjustFireLoss(-5,0)
		M.adjustToxLoss(-5,0,TRUE) //Heals Toxin Lovers
		M.radiation = max(M.radiation - 25, 0)
		. = 1
	else
		//Commander and Chief Effects, no need to be captain to receive the effect
		M.heal_bodypart_damage(2,2,2)
		M.adjustBruteLoss(-3.5,0)
		M.adjustOxyLoss(-3.5,0)
		M.adjustFireLoss(-3.5,0)
		M.adjustToxLoss(-3.5,0,TRUE) //Heals Toxin Lovers
		M.radiation = max(M.radiation - 25, 0)

	//Stimulant Effects
	M.AdjustAllImmobility(-60, FALSE)
	M.AdjustUnconscious(-60, FALSE)
	M.adjustStaminaLoss(-20*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	..()
	. = 1

/datum/reagent/medicine/stimulants/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	ADD_TRAIT(L, TRAIT_TASED_RESISTANCE, type)

/datum/reagent/medicine/stimulants/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	REMOVE_TRAIT(L, TRAIT_TASED_RESISTANCE, type)
	..()

// ~( Ported from TG )~
/datum/reagent/consumable/ethanol/curacao
	name = "Curaçao"
	description = "Made with laraha oranges, for an aromatic finish."
	boozepwr = 30
	color = "#1a5fa1"
	quality = DRINK_NICE
	taste_description = "blue orange"
	glass_icon_state = "curacao"
	glass_name = "glass of curaçao"
	glass_desc = "It's blue, da ba dee."

/datum/reagent/consumable/ethanol/navy_rum
	name = "Navy Rum"
	description = "Rum as the finest sailors drink."
	boozepwr = 90
	color = "#d8e8f0"
	quality = DRINK_NICE
	taste_description = "a life on the waves"
	glass_icon_state = "ginvodkaglass"
	glass_name = "glass of navy rum"
	glass_desc = "Splice the mainbrace, and God save the King."

/datum/reagent/consumable/ethanol/bitters
	name = "Andromeda Bitters"
	description = "A bartender's best friend, often used to lend a delicate spiciness to any drink. Produced in New Trinidad, now and forever."
	boozepwr = 70
	color = "#1c0000"
	quality = DRINK_NICE
	taste_description = "spiced alcohol"
	glass_icon_state = "bitters"
	glass_name = "glass of bitters"
	glass_desc = "Typically you'd want to mix this with something- but you do you."

/datum/reagent/consumable/ethanol/admiralty
	name = "Admiralty"
	description = "A refined, bitter drink made with navy rum, vermouth and fernet."
	boozepwr = 100
	color = "#1F0001"
	quality = DRINK_VERYGOOD
	taste_description = "haughty arrogance"
	glass_icon_state = "admiralty"
	glass_name = "Admiralty"
	glass_desc = "Hail to the Admiral, for he brings fair tidings, and rum too."

/datum/reagent/consumable/ethanol/dark_and_stormy
	name = "Dark and Stormy"
	description = "A classic drink arriving to thunderous applause."
	boozepwr = 50
	color = "#8c5046"
	quality = DRINK_GOOD
	taste_description = "ginger and rum"
	glass_icon_state = "dark_and_stormy"
	glass_name = "Dark and Stormy"
	glass_desc = "Thunder and lightning, very very frightening."

/datum/reagent/consumable/ethanol/long_john_silver
	name = "Long John Silver"
	description = "A long drink of navy rum, bitters, and lemonade. Particularly popular aboard the Mothic Fleet as it's light on ration credits and heavy on flavour."
	boozepwr = 50
	color = "#c4b35c"
	quality = DRINK_VERYGOOD
	taste_description = "rum and spices"
	glass_icon_state = "long_john_silver"
	glass_name = "Long John Silver"
	glass_desc = "Named for a famous pirate, who may or may not have been fictional. But hey, why let the truth get in the way of a good yarn?"

/datum/reagent/consumable/ethanol/long_haul
	name = "Long Haul"
	description = "A favourite amongst freighter pilots, unscrupulous smugglers, and nerf herders."
	boozepwr = 35
	color = "#003153"
	quality = DRINK_VERYGOOD
	taste_description = "companionship"
	glass_icon_state = "long_haul"
	glass_name = "Long Haul"
	glass_desc = "A perfect companion for a lonely long haul flight."

/datum/reagent/consumable/ethanol/salt_and_swell
	name = "Salt and Swell"
	description = "A bracing sour with an interesting salty taste."
	boozepwr = 60
	color = "#b4abd0"
	quality = DRINK_FANTASTIC
	taste_description = "salt and spice"
	glass_icon_state = "salt_and_swell"
	glass_name = "Salt and Swell"
	glass_desc = "Ah, I do like to be beside the seaside."

/datum/reagent/consumable/ethanol/tich_toch
	name = "Tich Toch"
	description = "A mix of Tiltällen, Töchtaüse Syrup, and vodka. It's not exactly to everyones' tastes."
	boozepwr = 75
	color = "#b4abd0"
	quality = DRINK_VERYGOOD
	taste_description = "spicy sour cheesy yoghurt"
	glass_icon_state = "tich_toch"
	glass_name = "Tich Toch"
	glass_desc = "Oh god."

/datum/reagent/consumable/ethanol/tiltaellen
	name = "Tiltällen"
	description = "A lightly fermented yoghurt drink with salt and a light dash of vinegar. Has a distinct sour cheesy flavour."
	boozepwr = 10
	color = "#F4EFE2"
	quality = DRINK_NICE
	taste_description = "sour cheesy yoghurt"
	glass_icon_state = "tiltaellen"
	glass_name = "glass of tiltällen"
	glass_desc = "Eww... it's curdled."

/datum/reagent/consumable/ethanol/tropical_storm
	name = "Tropical Storm"
	description = "A taste of the Caribbean in one glass."
	boozepwr = 40
	color = "#00bfa3"
	quality = DRINK_VERYGOOD
	taste_description = "the tropics"
	glass_icon_state = "tropical_storm"
	glass_name = "Tropical Storm"
	glass_desc = "Less destructive than the real thing."

/datum/reagent/consumable/ethanol/skullfucker_deluxe
	name = "Skullfucker Deluxe"
	description = "The Rosewater secret to becoming psychotically retarded. It has many warning labels."
	boozepwr = 75
	color = "#cb4d8b"
	quality = DRINK_VERYGOOD
	taste_description = "being violated by a tiny fish with crayons"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "skullfucker"
	glass_name = "Skullfucker Deluxe"
	glass_desc = "It has many warning labels, you might want to read them."
	overdose_threshold = 25

/datum/reagent/consumable/ethanol/skullfucker_deluxe/on_mob_life(mob/living/carbon/C)
	. = ..()
	//Do nothing if they haven't metabolized enough
	if(!current_cycle >= 15)
		return
	//Make them giggle
	if(prob(40))
		C.emote("giggle")
	//Make them jitter
	if(prob(20))
		C.jitteriness = max(C.jitteriness, 30)

/datum/reagent/consumable/ethanol/skullfucker_deluxe/overdose_process(mob/living/M)
	. = ..()
	//Do nothing if they're already fwuffy OwO
	var/obj/item/organ/tongue/T = M.getorganslot(ORGAN_SLOT_TONGUE)
	if(istype(T, /obj/item/organ/tongue/fluffy))
		return

	//Replace their tongue with a fwuffy one
	var/obj/item/organ/tongue/nT = new /obj/item/organ/tongue/fluffy
	T.Remove()
	nT.Insert(M)
	T.moveToNullspace()//To valhalla
	to_chat(M, span_big_warning("Your tongue feels... weally fwuffy!!"))

/datum/reagent/consumable/ethanol/ionstorm
	name = "Ion Storm"
	description = "A highly chaotic mixture that looks like it may react violently at any moment, but is surprisingly stable"
	color = "#3fd2ff"
	taste_description = "a scorching taste of strong alcohol and good brew going down your throat, making you feel warm inside"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "ionstorm"
	glass_name = "glass of Ion Storm"
	glass_desc = "You're not sure how this mixture is stable or even if it's drinkable, but it does remind you of a hot cup of apple cider on a cold winter morning"
	pH = 6.5
	value = REAGENT_VALUE_UNCOMMON
	boozepwr = 30
	quality = DRINK_FANTASTIC

/datum/reagent/consumable/ethanol/ionstorm/on_mob_life(mob/living/carbon/C)
	C.adjustBruteLoss(-0.5,0)
	C.adjustFireLoss(-0.5,0)
	if (C.reagents.has_reagent(/datum/reagent/medicine/epinephrine))
		C.adjustToxLoss(0.25)
	else
		C.adjustOxyLoss(0.25)
	. = 1
	return ..()

/datum/reagent/consumable/ethanol/twinkjuice
	name = "Twink Juice"
	description = "A long slender fruity drink with a green thick liquid inside. It smells nice and, and probably tastes fruity."
	color = "#3fd2ff"
	taste_description = "a concoction of dubious origins, and dubious purposes"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "twinkdrink"
	glass_name = "glass of Boy Kisser"
	glass_desc = "Looking at this, you think about backyards"
	pH = 6.5
	value = REAGENT_VALUE_UNCOMMON
	boozepwr = 5
	quality = DRINK_FANTASTIC
	var/drinkerWasAlreadySubmissive = FALSE

/datum/reagent/consumable/ethanol/twinkjuice/on_mob_metabolize(mob/living/L)
	..()
	if (ishuman(L))
		var/mob/living/carbon/human/M = L
		if(M.client?.prefs.cit_toggles & NO_APHRO)
			M.log_message("drank [src], but ignored it due to aphrodisiac preference.", LOG_EMOTE)
			return

		if(!M.has_quirk(/datum/quirk/well_trained))
			M.log_message("is now under the effect of [src].", LOG_EMOTE)
			M.add_quirk(/datum/quirk/well_trained, APHRO_TRAIT)
		else
			drinkerWasAlreadySubmissive = TRUE

/datum/reagent/consumable/ethanol/twinkjuice/on_mob_end_metabolize(mob/living/L)
	if (ishuman(L))
		var/mob/living/carbon/human/M = L
		if(M.has_quirk(/datum/quirk/well_trained) && !drinkerWasAlreadySubmissive)
			M.log_message("is no longer under the effect of [src].", LOG_EMOTE)
			M.remove_quirk(/datum/quirk/well_trained, APHRO_TRAIT)


/datum/reagent/consumable/ethanol/midnight_tears
	name = "Midnight Tears"
	description = "A reflection of what your Heart feels a weak call for love.\n-Leo Oxto"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "midnight_tears"
	glass_name = "glass of Midnight Tears"
	taste_description = "the warm feeling of a hug"
	color = "#005DE9"

/datum/reagent/consumable/ethanol/midnight_tears/on_mob_life(mob/living/carbon/C)
	..()
	if ishuman(C)
		var/mob/living/carbon/human/H = C
		if(!H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
			return
		if(!H.dna.species.is_wagging_tail())
			H.dna.species.start_wagging_tail(H)

/datum/reagent/consumable/ethanol/midnight_sky
	name = "Midnight Sky"
	description = "An escape from all your troubles, may it help you find love and joy.\n-Leo Oxto"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "midnight_sky"
	glass_name = "glass of Midnight Sky"
	taste_description = "a calm taste like the calm night"
	color = "#060709"

/datum/reagent/consumable/ethanol/midnight_sky/on_mob_life(mob/living/carbon/C)
	..()
	C.adjustBruteLoss(-0.5)
	C.adjustFireLoss(-0.5)
	. = TRUE

/datum/reagent/consumable/ethanol/midnight_joy
	name = "Midnight Joy"
	description = " Be sure to spread this feeling, for some lack it in their life, be the reason they have a smile on their face.\n-Leo Oxto"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'
	glass_icon_state = "midnight_joy"
	glass_name = "glass of Midnight Joy"
	taste_description = "sweet joy"
	color = "#FFF393"

/datum/reagent/consumable/ethanol/midnight_joy/on_mob_life(mob/living/carbon/C)
	..()
	if (prob(7))
		C.emote("giggle")

/obj/item/storage/box/drinkingglasses/midnight
	name = "Midnight Drinking Box"
	desc = "A box containing two glasses of each of the three midnight drinks."

/obj/item/storage/box/drinkingglasses/midnight/PopulateContents()
	new /obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_joy(src)
	new /obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_joy(src)
	new /obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_sky(src)
	new /obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_sky(src)
	new /obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_tears(src)
	new /obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_tears(src)

/obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_joy
	name = "Midnight Joy"
	list_reagents = list(/datum/reagent/consumable/ethanol/midnight_joy = 50)

/obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_sky
	name = "Midnight Sky"
	list_reagents = list(/datum/reagent/consumable/ethanol/midnight_sky = 50)

/obj/item/reagent_containers/food/drinks/drinkingglass/filled/midnight_tears
	name = "Midnight Tears"
	list_reagents = list(/datum/reagent/consumable/ethanol/midnight_tears = 50)
