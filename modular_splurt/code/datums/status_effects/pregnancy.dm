/**
 * Who is the liar but he who denies that Jesus is the Christ? This is the antichrist, he who denies the Father and the Son.
 * - John 2:22
 */
/atom/movable/screen/alert/status_effect/pregnancy
	name = "Pregnant"
	desc = "Welp, you sure are pregnant."
	icon = 'modular_splurt/icons/mob/screen_alert.dmi'
	icon_state = "baby"

/datum/status_effect/pregnancy
	id = "pregnancy"
	duration = -1
	tick = FALSE
	alert_type = /atom/movable/screen/alert/status_effect/pregnancy

/atom/movable/screen/alert/status_effect/lactation
	name = "Lactation"
	desc = "You're lactating!"
	icon_state = "sweat2"

/datum/status_effect/lactation
	id = "lactation"
	duration = 20 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/lactation
	var/noapply

/datum/status_effect/lactation/on_apply()
	. = ..()
	var/obj/item/organ/genital/breasts/booba = owner.getorganslot(ORGAN_SLOT_BREASTS)
	if(!booba)
		return FALSE
	if(booba.genital_flags & (GENITAL_FUID_PRODUCTION|CAN_CLIMAX_WITH|CAN_MASTURBATE_WITH))
		noapply = TRUE
		return FALSE
	booba.genital_flags |= (GENITAL_FUID_PRODUCTION|CAN_CLIMAX_WITH|CAN_MASTURBATE_WITH)
	return TRUE

/datum/status_effect/lactation/on_remove()
	. = ..()
	var/obj/item/organ/genital/breasts/booba = owner.getorganslot(ORGAN_SLOT_BREASTS)
	if(!booba || noapply)
		return
	booba.genital_flags &= ~ (GENITAL_FUID_PRODUCTION|CAN_CLIMAX_WITH|CAN_MASTURBATE_WITH)

