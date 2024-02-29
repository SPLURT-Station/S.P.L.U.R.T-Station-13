/datum/status_effect/dripping_cum
	id = "dripping_cum"
	// We only end when we run out!
	duration = -1
	tick_interval = 1 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/dripping_cum
	var/datum/reagents/contents
	var/list/blood_DNA

/datum/status_effect/dripping_cum/on_creation(mob/living/carbon/human/new_owner, datum/reagents/add_or_merge, list/blood_DNA)
	. = ..()
	if(QDELETED(src) || !.)
		return
	if(!istype(new_owner) || !(istype(add_or_merge) && add_or_merge.total_volume > 0))
		qdel(src)
		return
	if(isnull(contents))
		contents = new(300, NO_REACT)
	add_or_merge.trans_to(contents, add_or_merge.total_volume)
	if(blood_DNA)
		LAZYINITLIST(src.blood_DNA)
		src.blood_DNA |= blood_DNA

/datum/status_effect/dripping_cum/on_remove(mob/living/carbon/human/owner)
	qdel(contents)
	blood_DNA = null
	. = ..()

/datum/status_effect/dripping_cum/tick()
	if(contents.total_volume <= 0)
		qdel(src)
		return

	if(!can_drip())
		return

	var/turf/location = get_turf(owner)

	var/obj/effect/decal/cleanable/semen/S = locate(/obj/effect/decal/cleanable/semen) in location
	if(S)
		if(contents.trans_to(S, 1))
			S.blood_DNA |= blood_DNA
			S.update_icon()
			return
		qdel(src)

	var/obj/effect/decal/cleanable/semendrip/drip = (locate(/obj/effect/decal/cleanable/semendrip) in location) || new(location)
	if(contents.trans_to(drip, 1))
		drip.blood_DNA |= blood_DNA
		drip.update_icon()
		if(drip.reagents.total_volume >= 10)
			S = new(location)
			drip.reagents.trans_to(S, drip.reagents.total_volume)
			drip.transfer_blood_dna(S.blood_DNA)
			S.update_icon()
			qdel(drip)
		return
	qdel(src)

/datum/status_effect/dripping_cum/proc/can_drip()
	var/mob/living/carbon/human/human_owner = owner
	var/obj/item/clothing/under/clothes = human_owner.get_item_by_slot(ITEM_SLOT_ICLOTHING)
	// This is completely recyclable.
	if(clothes)
		var/valid = FALSE
		if(is_type_in_typecache(clothes.type, GLOB.skirt_peekable))
			valid = TRUE
		else if(!CHECK_BITFIELD(clothes.body_parts_covered, GROIN))
			valid = TRUE
		if(!valid)
			return FALSE
	var/obj/item/clothing/suit/outer_clothing = human_owner.get_item_by_slot(ITEM_SLOT_OCLOTHING)
	if(outer_clothing && CHECK_MULTIPLE_BITFIELDS(outer_clothing.body_parts_covered, CHEST | GROIN | LEGS | FEET))
		return FALSE
	var/obj/item/clothing/underwear/briefs/underwear = human_owner.get_item_by_slot(ITEM_SLOT_UNDERWEAR)
	if(underwear && CHECK_BITFIELD(underwear.body_parts_covered, GROIN))
		return FALSE
	if(human_owner.stat == DEAD)
		return FALSE
	if(human_owner.bodytemperature < TCRYO)
		return FALSE
	return TRUE

/atom/movable/screen/alert/status_effect/dripping_cum
	name = "Dripping Cum"
	desc = "Your last affairs left you dripping someone's seed."
	icon = 'modular_sand/icons/mob/screen_alert.dmi'
	icon_state = "dripping_cum"

/atom/movable/screen/alert/status_effect/dripping_cum/MouseEntered(location,control,params)
	desc = initial(desc)
	var/datum/status_effect/dripping_cum/dripping_cum = attached_effect
	desc += "<br>You feel like there is about [round(dripping_cum.contents.total_volume, 25)] units inside you."
	if(!dripping_cum.can_drip())
		desc += "<br>For some reason such as your hole being covered, you are no longer dripping and this amount is not decreasing."
	..()
