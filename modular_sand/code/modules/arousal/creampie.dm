/mob/living/carbon/human/handle_creampie()
	if(cumdrip_rate < 0)
		cumdrip_rate = 0

	if(bodytemperature >= TCRYO)
		cumdrip_rate = cumdrip_rate - 1
		cumdrip()

/mob/living/carbon/human/proc/cumdrip()
	if(isturf(loc))
		new/obj/effect/decal/cleanable/semendrip(get_turf(src))
