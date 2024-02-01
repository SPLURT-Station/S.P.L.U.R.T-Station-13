/datum/species/diona
	name = "Diona"
	id = SPECIES_DIONA
	override_bp_icon = 'modular_splurt/icons/mob/diona.dmi'
	species_language_holder = /datum/language_holder/diona

	species_traits = list(
		NO_UNDERWEAR
		)

	exotic_blood_color = "#004400"
	//flesh_color = "#808D11"

	min_age = 18
	max_age = 300
	say_mod = "chirrups"
	eye_type = "diona"
	allowed_limb_ids = null
	damage_overlay_type = "diona"

/datum/species/diona/check_roundstart_eligible()
	return TRUE

/datum/language_holder/diona
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/diona = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/diona = list(LANGUAGE_ATOM))

/datum/language/diona

/datum/species/diona/on_species_gain(mob/living/carbon/human/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		C.add_movespeed_modifier(/datum/movespeed_modifier/diona)
		C.verbs += /mob/living/carbon/human/proc/regenerate
		C.verbs += /mob/living/carbon/human/proc/diona_split_nymph
	..()

/datum/movespeed_modifier/diona
	multiplicative_slowdown = 2

/datum/species/diona/spec_life(mob/living/carbon/human/H)
	var/turf/T = get_turf(H)
	if(T)
		var/light_amount = T.get_lumcount()*10

		if((H.nutrition + light_amount) < initial(H.nutrition))
			H.adjust_nutrition(light_amount)

		if(light_amount >= 3) //if there's enough light, heal
			H.adjustBruteLoss(-(round(light_amount/2)))
			H.adjustFireLoss(-(round(light_amount/2)))
			H.adjustToxLoss(-(light_amount))
			H.adjustOxyLoss(-(light_amount))
			//TODO: heal wounds, heal broken limbs.
	if(H.nutrition < 200)
		H.take_overall_damage(2,0)

/mob/living/carbon/human
	var/active_regen = FALSE //Used for the regenerate proc in human_powers.dm
	var/active_regen_delay = 300

/mob/living/carbon/human/proc/regenerate()
	set name = "Regenerate"
	set desc = "Allows you to regrow limbs and heal organs after a period of rest."
	set category = "Abilities"

	if(nutrition < 250)
		to_chat(src, span_warning("You lack the biomass to begin regeneration!"))
		return

	if(active_regen)
		to_chat(src, span_warning("You are already regenerating tissue!"))
		return
	else
		active_regen = TRUE
		src.visible_message(span_warning("<B>[src]</B>'s flesh begins to mend..."))

	var/delay_length = round(active_regen_delay * 1)
	if(do_after(src,delay_length))
		adjust_nutrition(-200)

		regenerate_limbs()
		regenerate_organs()
		remove_all_embedded_objects()
		set_heartattack(FALSE)

		handle_organs() // Update everything

		active_regen = FALSE
	else
		to_chat(src, span_userdanger("Your regeneration is interrupted!"))
		adjust_nutrition(-75)
		active_regen = FALSE


/mob/living/carbon/human/proc/diona_split_nymph()
	set name = "Split"
	set desc = "Split your humanoid form into its constituent nymphs."
	set category = "Abilities"
	var/turf/T = get_turf(src)

	var/mob/living/carbon/alien/diona/S = new(T)

	if(mind)
		mind.transfer_to(S)

	for(var/obj/item/W in src)
		dropItemToGround(W)

	visible_message(span_warning("\The [src] quivers slightly, then splits apart with a wet slithering noise."))
	qdel(src)


