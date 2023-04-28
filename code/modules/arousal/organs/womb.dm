/obj/item/organ/genital/womb
	name = "womb"
	desc = "A female reproductive organ."
	icon = 'icons/obj/genitals/vagina.dmi'
	icon_state = "womb"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_WOMB
	genital_flags = GENITAL_INTERNAL|GENITAL_FUID_PRODUCTION|HAS_EQUIPMENT
	fluid_id = /datum/reagent/consumable/semen/femcum
	default_fluid_id = /datum/reagent/consumable/semen/femcum
	linked_organ_slot = ORGAN_SLOT_VAGINA

/obj/item/organ/genital/womb/get_min_size()
	return 1

/obj/item/organ/genital/womb/get_max_size()
	return 1

/obj/item/organ/genital/womb/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["inert_eggs"])
		AddComponent(/datum/component/ovipositor)
	set_fluid_id(D.features["womb_fluid"], H, TRUE)

/obj/item/organ/genital/womb/get_fluid()
	if(linked_organ)
		return clamp(linked_organ.fluid_rate * ((world.time - linked_organ.last_orgasmed) / (10 SECONDS)), 0, linked_organ.fluid_max_volume)
	else
		return 0

/obj/item/organ/genital/womb/get_fluid_fraction()
	if(linked_organ)
		return get_fluid() / linked_organ.fluid_max_volume
	else
		return 0
