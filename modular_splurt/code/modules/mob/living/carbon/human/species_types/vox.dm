/datum/species/vox
	name = "Vox"
	id = SPECIES_VOX
	override_bp_icon = 'modular_splurt/icons/mob/vox.dmi'
	species_language_holder = /datum/language_holder/vox


	breathid = "tox"

	mutantlungs = /obj/item/organ/lungs/vox

	species_traits = list(MUTCOLORS,
		EYECOLOR,
		NO_UNDERWEAR,
		HAIR,
		FACEHAIR,
		MARKINGS
		)

	exotic_blood_color = "#9066BD"
	//flesh_color = "#808D11"


	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	say_mod = "shrieks"
	eye_type = "vox"
	mutant_bodyparts = list("mcolor" = "FFFFFF", "mcolor2" = "FFFFFF", "mcolor3" = "FFFFFF", "mam_tail" = "teshari tail, colorable", "mam_ears" = "None", "mam_body_markings" = list())
	allowed_limb_ids = null
	damage_overlay_type = "vox"

/datum/species/vox/before_equip_job(datum/job/J, mob/living/carbon/human/H, visualsOnly = FALSE)
	var/datum/outfit/vox/O = new /datum/outfit/vox
	H.equipOutfit(O, visualsOnly)
	H.internal = H.get_item_for_held_index(2)
	H.update_internals_hud_icon(1)
	return 0

/datum/species/vox/on_species_gain(mob/living/carbon/human/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		C.add_movespeed_modifier(/datum/movespeed_modifier/vox)
	..()

/datum/movespeed_modifier/vox
	multiplicative_slowdown = -0.2


/datum/language_holder/vox
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/schechi = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/schechi = list(LANGUAGE_ATOM))

/datum/language/vox

/datum/emote/sound/vox
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/audio/vox/shriek
	key = "shriek"
	key_third_person = "shrieks"
	message = "shrieks!"
	message_mime = "lets out an <b>inaudible</b> shriek!"
	emote_sound = 'modular_splurt/sound/voice/shriek1.ogg' // Copyright CC BY 3.0 InspectorJ (freesound.org) for the source audio.
	emote_cooldown = 2.1 SECONDS

/datum/emote/living/audio/vox/shriek/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	if(D.species.name != "Vox")
		return
	// Return normally
	. = ..()
