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
	var/prev_size //former cached_size value, to allow update_size() to early return should be there no significant changes.

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

/obj/item/organ/genital/breasts/modify_size(modifier, min = -INFINITY, max = INFINITY)
	var/new_value =  clamp(size + modifier, max(min, min_size ? GLOB.breast_values[min_size] : -INFINITY), min(max_size ? GLOB.breast_values[max_size] : INFINITY, max))
	if(new_value == size)
		return
	prev_size = size
	size = new_value
	update()
	..()

/obj/item/organ/genital/breasts/size_to_state()
	var/rounded = round(size)
	var/str_size
	switch(rounded)
		if(0) //flatchested
			str_size = "flat"
		if(1 to 8) //modest
			str_size = GLOB.breast_values[rounded]
		if(9 to 15) //massive
			str_size = GLOB.breast_values[rounded]
		if(16 to 17) //ridiculous
			str_size = GLOB.breast_values[rounded]
		if(18 to 24) //AWOOOOGAAAAAAA
			str_size = "massive"
		if(25 to 29) //AWOOOOOOGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
			str_size = "giga"
		if(30 to INFINITY) //AWWWWWWWWWWWWWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGAAAAAAAAAAAAAAAAAAAAAA
			str_size = "impossible"
	return str_size

/obj/item/organ/genital/breasts/update_size()//wah
	var/rounded_size = round(size)
	var/size_state = size_to_state()
	if(rounded_size < 0)//I don't actually know what round() does to negative numbers, so to be safe!!fixed
		if(owner)
			to_chat(owner, "<span class='warning'>You feel your breasts shrinking away from your body as your chest flattens out.</span>")
		QDEL_IN(src, 1)
		return

	if((rounded_size < 18 || rounded_size ==  25 || rounded_size == 30) && owner )//Because byond doesn't count from 0, I have to do this.
		var/mob/living/carbon/human/H = owner
		var/r_prev_size = round(prev_size)
		if (rounded_size > r_prev_size)
			to_chat(H, "<span class='warning'>Your breasts [pick("swell up to", "flourish into", "expand into", "burst forth into", "grow eagerly into", "amplify into")] a [uppertext(size_state)]-cup.</span>")
		else if (rounded_size < r_prev_size)
			to_chat(H, "<span class='warning'>Your breasts [pick("shrink down to", "decrease into", "diminish into", "deflate into", "shrivel regretfully into", "contracts into")] a [uppertext(size_state)]-cup.</span>")

/obj/item/organ/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["breasts_color"]]"
	size = GLOB.breast_values[D.features["breasts_size"]]
	max_size = D.features["breasts_max_size"]
	min_size = D.features["breasts_min_size"]
	shape = D.features["breasts_shape"]
	if(!D.features["breasts_producing"])
		genital_flags &= ~ (GENITAL_FUID_PRODUCTION|CAN_CLIMAX_WITH|CAN_MASTURBATE_WITH)
	prev_size = size
	toggle_visibility(D.features["breasts_visibility"], FALSE)
	if(D.features["breasts_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	if(D.features["breasts_accessible"])
		toggle_accessibility(TRUE)

#undef BREASTS_ICON_MIN_SIZE
#undef BREASTS_ICON_MAX_SIZE
