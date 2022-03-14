//Edits of main code
/datum/reagent/consumable/milk
	glass_icon_state = "milkglass"

//Own
/datum/reagent/consumable/wockyslush
	name = "Wocky Slush"
	description = "That thang bleedin' to the-... ya know I mean?"
	color = "#7b60c4" // rgb(123, 96, 196)
	quality = DRINK_VERYGOOD
	taste_description = "cold rainbows"
	glass_icon_state = "wockyslush"
	glass_name = "Wocky Slush"
	glass_desc = "That thang bleedin' to the-... ya know I mean?"

/datum/reagent/consumable/wockyslush/on_mob_life(mob/living/carbon/M)
	M.emote(pick("twitch","giggle","stare"))
	M.set_drugginess(75)
	M.apply_status_effect(/datum/status_effect/throat_soothed)
	..()

/datum/reagent/consumable/orange_creamsicle
	name = "Orange Creamsicle"
	description = "A Summer time drink that can be frozen and eaten or drunk from a glass!"
	color = "#ffb46e" // rgb(255, 180, 110)
	taste_description = "ice cream and orange soda"
	glass_icon_state = "orangecreamsicle"
	glass_desc = "A Summer time drink that can be frozen and eaten or Drinked from a glass!"
	glass_name = "Orange Creamsicle"
