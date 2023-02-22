/*
 * # get_size(mob/living/target)
 * Grabs the size of your critter, works for any living creature even carbons with dna
 * Now, please don't tell me your creature has a dna but it's very snowflakey, then i say you should rewrite your mob
 * instead of touching this file.
*/
/proc/get_size(mob/living/target)
	if(!target)
		CRASH("get_size(NULL) was called")
	if(!istype(target))
		CRASH("get_size() called with an invalid target, only use this for /mob/living!")
	var/datum/dna/has_dna = target.has_dna()
	if(ishuman(target) && has_dna)
		return has_dna.features["body_size"]
	else
		return target.size_multiplier
