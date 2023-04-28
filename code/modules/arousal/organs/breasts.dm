#define BREASTS_ICON_MIN_SIZE 1
#define BREASTS_ICON_MAX_SIZE 6

/obj/item/organ/genital/breasts
	name = "breasts"
	desc = "Female milk producing organs."
	icon_state = "breasts"
	icon = 'icons/obj/genitals/breasts.dmi'
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	size = 3
	fluid_id = /datum/reagent/consumable/milk
	fluid_rate = MILK_RATE
	shape = DEF_BREASTS_SHAPE
	genital_flags = CAN_MASTURBATE_WITH|CAN_CLIMAX_WITH|GENITAL_FUID_PRODUCTION|GENITAL_CAN_AROUSE|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	masturbation_verb = "massage"
	arousal_verb = "Your breasts start feeling sensitive"
	unarousal_verb = "Your breasts no longer feel sensitive"
	orgasm_verb = "leaking"
	fluid_transfer_factor = 0.5
	layer_index = BREASTS_LAYER_INDEX
	default_fluid_id = /datum/reagent/consumable/milk

/obj/item/organ/genital/breasts/get_min_size()
	return -1 //Because 0 is flatchested and -1 is used to remove the breasts

/obj/item/organ/genital/breasts/get_max_size()
	return 30

// Return a higher multiplier if the owner is pregnant
/obj/item/organ/genital/breasts/get_fluid_rate_multiplier()
	if(!owner)
		return 1
	if(!owner.has_status_effect(/datum/status_effect/pregnancy))
		return 1
	return 2

/obj/item/organ/genital/breasts/update_appearance()
	. = ..()
	var/lowershape = lowertext(shape)
	var/size_state = size_to_state()
	switch(lowershape)
		if("pair")
			desc = "You see a pair of breasts."
		if("quad")
			desc = "You see two pairs of breast, one just under the other."
		if("sextuple")
			desc = "You see three sets of breasts, running from their chest to their belly."
		else
			desc = "You see some breasts, they seem to be quite exotic."
	if(size_state == "huge")
		desc = "You see [pick("some serious honkers", "a real set of badonkers", "some dobonhonkeros", "massive dohoonkabhankoloos", "two big old tonhongerekoogers", "a couple of giant bonkhonagahoogs", "a pair of humongous hungolomghnonoloughongous")]. Their volume is way beyond cupsize now, measuring in about [round(size*(owner ? get_size(owner) : 1))]cm in diameter."
	else
		if (size_state == "flat")
			desc += " They're very small and flatchested, however."
		else
			desc += " You estimate that they're [uppertext(size_state)]-cups."

	if((genital_flags & GENITAL_FUID_PRODUCTION) && aroused_state)
		var/datum/reagent/R = GLOB.chemical_reagents_list[fluid_id]
		if(R)
			desc += " They're leaking [lowertext(R.name)]."
	var/datum/sprite_accessory/S = GLOB.breasts_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "pair"
	var/icon_size = clamp(GLOB.breast_values[size_state], BREASTS_ICON_MIN_SIZE, BREASTS_ICON_MAX_SIZE)
	icon_state = "breasts_[icon_shape]_[icon_size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["breasts_color"]]"

//Allows breasts to grow and change size, with sprite changes too.
//maximum wah
//Comical sizes slow you down in movement and actions.
//Ridiculous sizes makes you more cumbersome.
//this is far too lewd wah

/obj/item/organ/genital/breasts/size_to_state()
	var/str_size
	switch(size)
		if(0) //flatchested
			str_size = "flat"
		if(1 to 8) //modest
			str_size = GLOB.breast_values[size]
		if(9 to 15) //massive
			str_size = GLOB.breast_values[size]
		if(16 to 17) //ridiculous
			str_size = GLOB.breast_values[size]
		if(18 to 24) //AWOOOOGAAAAAAA
			str_size = "massive"
		if(25 to 29) //AWOOOOOOGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
			str_size = "giga"
		if(30 to INFINITY) //AWWWWWWWWWWWWWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGAAAAAAAAAAAAAAAAAAAAAA
			str_size = "impossible"
	return str_size

/obj/item/organ/genital/breasts/on_size_update(previous_size, new_size)
	var/size_state = size_to_state()
	if(new_size < 0)
		if(owner)
			to_chat(owner, "<span class='warning'>You feel your breasts shrinking away from your body as your chest flattens out.</span>")
		QDEL_IN(src, 1)
		return
	if((new_size < 18 || new_size ==  25 || new_size == 30) && owner )
		if (new_size > previous_size)
			to_chat(owner, "<span class='warning'>Your breasts [pick("swell up to", "flourish into", "expand into", "burst forth into", "grow eagerly into", "amplify into")] a [uppertext(size_state)]-cup.</span>")
		else
			to_chat(owner, "<span class='warning'>Your breasts [pick("shrink down to", "decrease into", "diminish into", "deflate into", "shrivel regretfully into", "contracts into")] a [uppertext(size_state)]-cup.</span>")

/obj/item/organ/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["breasts_color"]]"
	set_breasts_cup(D.features["breasts_size"])
	max_size = D.features["breasts_max_size"]
	min_size = D.features["breasts_min_size"]
	shape = D.features["breasts_shape"]
	if(!D.features["breasts_producing"])
		genital_flags &= ~ (GENITAL_FUID_PRODUCTION|CAN_CLIMAX_WITH|CAN_MASTURBATE_WITH)
	toggle_visibility(D.features["breasts_visibility"], FALSE)
	if(D.features["breasts_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	set_fluid_id(D.features["breasts_fluid"], H, TRUE)

/obj/item/organ/genital/breasts/proc/set_breasts_cup(new_cup)
	var/size_value = GLOB.breast_values[new_cup]
	if(!size_value)
		return
	set_size(size_value)

/obj/item/organ/genital/breasts/climax_modify_size(mob/living/partner, obj/item/organ/genital/source_gen)
	if(!(owner.client?.prefs.cit_toggles & BREAST_ENLARGEMENT))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable(partner)
	if(!fluid_source)
		return

	if(!climax_fluids)
		climax_fluids = new
		climax_fluids.maximum_volume = INFINITY //Just in case

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(climax_fluids, fluid_source.total_volume)

	if(climax_fluids.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		generic_adjust_size_float(climax_fluids.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The <b>[owner]</b>'s [pick(GLOB.breast_nouns)] swell up with the surge of [lowertext(source_gen.get_fluid_name())] from \the <b>[partner]</b>'s [source_gen.name]", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()


#undef BREASTS_ICON_MIN_SIZE
#undef BREASTS_ICON_MAX_SIZE
