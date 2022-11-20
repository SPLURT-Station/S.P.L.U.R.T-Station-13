/datum/reagent/consumable/semen/on_mob_add(mob/living/carbon/M)
	. = ..()
	var/datum/quirk/dumb4cum/d4c = locate() in M.roundstart_quirks
	if(d4c)
		d4c.uncrave()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_add(mob/living/carbon/M)
	. = ..()
	var/datum/quirk/dumb4cum/d4c = locate() in M.roundstart_quirks
	if(d4c)
		d4c.uncrave()

//incubus and succubus additions below
/datum/reagent/consumable/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS)||HAS_TRAIT(M,TRAIT_INCUBUS))
		M.adjust_nutrition(2.5)

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS)||HAS_TRAIT(M,TRAIT_INCUBUS))
		M.adjust_nutrition(0.5)

/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_INCUBUS)||HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(4)

/datum/reagent/blood/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(HAS_TRAIT(C,BLOODFLEDGE))
		C.adjust_nutrition(6) //3/4ed this, felt it was a bit too much
		C.adjust_disgust(-3) //makes the churches effects easily negated

/datum/reagent/water/holywater/on_mob_life(mob/living/carbon/M)//makes holy water slightly disgusting and hungering for vampires
	. = ..()
	if(HAS_TRAIT(M,BLOODFLEDGE))
		M.adjust_disgust(1)
		M.adjust_nutrition(-0.1)
