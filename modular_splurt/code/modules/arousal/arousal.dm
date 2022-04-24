/mob/living/carbon/human/mob_climax_partner(obj/item/organ/genital/G, mob/living/L, spillage, mb_time, obj/item/organ/genital/Lgen, forced = FALSE)
	. = ..()
	L.receive_climax(src, Lgen, G, spillage, forced = forced)

/mob/living/receive_climax(mob/living/partner, obj/item/organ/genital/receiver, obj/item/organ/genital/source_gen, spill, forced)
	. = ..()

	if(!receiver || spill || forced)
		return

	receiver.climax_modify_size(partner, source_gen)

/mob/living/carbon/human/do_climax(datum/reagents/R, atom/target, obj/item/organ/genital/G, spill, cover = FALSE)
	if(!G)
		return

	if(istype(G, /obj/item/organ/genital/penis))
		var/obj/item/organ/genital/penis/bepis = G
		if(bepis.equipment[GENITAL_EQUIPMENT_SOUNDING])
			spill = TRUE
			to_chat(src, "<span class='userlove'>You feel your sounding rod being pushed out of your cockhole with the burst of jizz!</span>")
			bepis.equipment.Remove(GENITAL_EQUIPMENT_SOUNDING)
			new /obj/item/genital_equipment/sounding/used_sounding(loc)

	if(cover)
		target.add_cum_overlay()
	. = ..()

/mob/living/carbon/human/mob_fill_container(obj/item/organ/genital/G, obj/item/reagent_containers/container, mb_time, obj/item/milking_machine/M)
	if(!M)
		return ..()

	var/datum/reagents/fluid_source = G.climaxable(src)
	if(!fluid_source)
		return
	var/main_fluid = lowertext(fluid_source.get_master_reagent_name())
	if(mb_time)
		visible_message("<span class='love'>You hear a strong suction sound coming from the [M.name] on [src]'s [G.name].</span>", \
							"<span class='userlove'>The [M.name] pumps faster, trying to get you over the edge.</span>", \
							"<span class='userlove'>Something vacuums your [G.name] with a quiet but powerfull vrrrr.</span>")
		if(!do_after(src, mb_time, target = src) || !in_range(src, container) || !G.climaxable(src, TRUE))
			return
	visible_message("<span class='love'>[src] twitches as [p_their()] [main_fluid] trickles into [container].</span>", \
								"<span class='userlove'>[M] sucks out all the [main_fluid] you had been saving up into [container].</span>", \
								"<span class='userlove'>You feel a vacuum sucking on your [G.name] as you climax</span>")
	do_climax(fluid_source, container, G, FALSE, cover = TRUE)
	emote("moan")

/mob/living/carbon/human/proc/mob_climax_over(obj/item/organ/genital/G, mob/living/L, spillage = TRUE, mb_time = 30)
	var/datum/reagents/fluid_source = G.climaxable(src)
	if(!fluid_source)
		return
	if(mb_time) //Skip warning if this is an instant climax.
		to_chat(src,"<span class='userlove'>You're about to climax over [L]!</span>")
		to_chat(L,"<span class='userlove'>[src] is about to climax over you!</span>")
		if(!do_after(src, mb_time, target = src) || !in_range(src, L) || !G.climaxable(src, TRUE))
			return
	to_chat(src,"<span class='userlove'>You climax all over [L] using your [G.name]!</span>")
	to_chat(L, "<span class='userlove'>[src] climaxes all over you using [p_their()] [G.name]!</span>")
	do_climax(fluid_source, L, G, spillage, cover = TRUE)

/atom/proc/add_cum_overlay() //This can go in a better spot, for now its here.
	cum_splatter_icon = icon(initial(icon), initial(icon_state), dir = 1)
	cum_splatter_icon.Blend("#fff", ICON_ADD)
	cum_splatter_icon.Blend(icon('modular_splurt/icons/effects/cumoverlay.dmi', "cum_obj"), ICON_MULTIPLY)
	add_overlay(cum_splatter_icon)

/atom/proc/wash_cum()
	cut_overlay(mutable_appearance('modular_splurt/icons/effects/cumoverlay.dmi', "cum_normal"))
	cut_overlay(mutable_appearance('modular_splurt/icons/effects/cumoverlay.dmi', "cum_large"))
	if(cum_splatter_icon)
		cut_overlay(cum_splatter_icon)
	return TRUE

