/datum/dna
	var/last_capped_size //For some reason this feels dirty... I suppose it should go somewhere else

/datum/dna/update_body_size(old_size)
	if(!holder || features["body_size"] == old_size)
		return ..()

	holder.remove_movespeed_modifier(/datum/movespeed_modifier/small_stride) //Remove our own modifier

	. = ..()

	//Handle the small icon
	if(!holder.small_sprite)
		holder.small_sprite = new(holder)

	if(get_size(holder) >= (RESIZE_A_BIGNORMAL + RESIZE_NORMAL) / 2)
		holder.small_sprite.Grant(holder)
	else
		holder.small_sprite.Remove(holder)

	if(!iscarbon(holder))
		return

	//Bigger bits
	var/mob/living/carbon/C = holder
	for(var/obj/item/organ/genital/cocc in C.internal_organs)
		if(istype(cocc))
			cocc.update()

	///Penalties start
	if(CONFIG_GET(flag/old_size_penalties))
		return

	//Undo the cit penalties
	var/penalty_threshold = CONFIG_GET(number/threshold_body_size_penalty)
	if(features["body_size"] < penalty_threshold && old_size >= penalty_threshold)
		C.maxHealth  += 10
		holder.remove_movespeed_modifier(/datum/movespeed_modifier/small_stride)
	else if(old_size < penalty_threshold && features["body_size"] >= penalty_threshold)
		C.maxHealth -= 10

	//Calculate new slowdown
	var/new_slowdown = (abs(get_size(holder) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))
	holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/small_stride, TRUE, new_slowdown)

	//New health
	var/size_cap = CONFIG_GET(number/macro_health_cap)
	if((size_cap > 0) && (get_size(holder) > size_cap))
		last_capped_size = (last_capped_size ? last_capped_size : old_size)
		return
	if(last_capped_size)
		old_size = last_capped_size
		last_capped_size = null
	var/healthmod_old = ((old_size * 75) - 75) //Get the old value to see what we must change.
	var/healthmod_new = ((get_size(holder) * 75) - 75) //A size of one would be zero. Big boys get health, small ones lose health.
	var/healthchange = healthmod_new - healthmod_old //Get ready to apply the new value, and subtract the old one. (Negative values become positive)
	holder.maxHealth += healthchange
	holder.health += healthchange

#define TRANSFER_RANDOMIZED(destination, source1, source2) \
	if(prob(50)) { \
		destination = source1; \
	} else { \
		destination = source2; \
	}

/proc/transfer_randomized_list(list/destination, list/list1, list/list2)
	if(list1.len >= list2.len)
		for(var/key1 as anything in list1)
			var/val1 = list1[key1]
			var/val2 = list2[key1]
			if(prob(50) && val1)
				destination[key1] = val1
			else if(val2)
				destination[key1] = val2
	else
		for(var/key2 as anything in list2)
			var/val1 = list1[key2]
			var/val2 = list2[key2]
			if(prob(50) && val1)
				destination[key2] = val1
			else if(val2)
				destination[key2] = val2

/datum/dna/proc/transfer_identity_random(datum/dna/second_set, mob/living/carbon/destination)
	if(!istype(destination))
		return
	var/old_size = destination.dna.features["body_size"]

	TRANSFER_RANDOMIZED(destination.dna.blood_type, blood_type, second_set.blood_type)
	TRANSFER_RANDOMIZED(destination.dna.skin_tone_override, skin_tone_override, second_set.skin_tone_override)
	transfer_randomized_list(destination.dna.features, features, second_set.features)
	transfer_randomized_list(destination.dna.temporary_mutations, temporary_mutations, second_set.temporary_mutations)

	if(prob(50))
		destination.set_species(species.type, FALSE)
		destination.dna.species = new species.type
		destination.dna.species.say_mod = species.say_mod
		destination.dna.custom_species = custom_species
	else
		destination.set_species(second_set.species.type, FALSE)
		destination.dna.species = new second_set.species.type
		destination.dna.species.say_mod = second_set.species.say_mod
		destination.dna.custom_species = second_set.custom_species

	destination.update_size(get_size(destination), old_size)

	destination.dna.update_dna_identity()
	destination.dna.generate_dna_blocks()

	if(ishuman(destination))
		var/mob/living/carbon/human/H = destination
		H.give_genitals(TRUE)//This gives the body the genitals of this DNA. Used for any transformations based on DNA
		H.update_genitals()

	destination.updateappearance(icon_update=TRUE, mutcolor_update=TRUE, mutations_overlay_update=TRUE)

/datum/dna/proc/transfer_identity_random_dna_only(datum/dna/second_set)
	var/datum/dna/destination= new

	TRANSFER_RANDOMIZED(destination.blood_type, blood_type, second_set.blood_type)
	TRANSFER_RANDOMIZED(destination.skin_tone_override, skin_tone_override, second_set.skin_tone_override)
	transfer_randomized_list(destination.features, features, second_set.features)
	transfer_randomized_list(destination.temporary_mutations, temporary_mutations, second_set.temporary_mutations)

	if(prob(50))
		destination.species = new species.type
		destination.species.say_mod = species.say_mod
		destination.custom_species = custom_species
	else
		destination.species = new second_set.species.type
		destination.species.say_mod = second_set.species.say_mod
		destination.custom_species = second_set.custom_species

	destination.update_dna_identity()
	destination.generate_dna_blocks()

	return destination

#undef TRANSFER_RANDOMIZED
