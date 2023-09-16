/obj/effect/mob_spawn/human/ghostcafeVR/special(mob/living/carbon/human/new_spawn)
	if(new_spawn.client)
		new_spawn.client.prefs.copy_to(new_spawn)
		var/datum/outfit/O = new /datum/outfit/ghostcafeVR()
		O.equip(new_spawn, FALSE, new_spawn.client)
		SSjob.equip_loadout(null, new_spawn)
		SSjob.post_equip_loadout(null, new_spawn)
		SSquirks.AssignQuirks(new_spawn, new_spawn.client, TRUE, TRUE, null, FALSE, new_spawn)
		ADD_TRAIT(new_spawn, TRAIT_SIXTHSENSE, GHOSTROLE_TRAIT)
		ADD_TRAIT(new_spawn, TRAIT_EXEMPT_HEALTH_EVENTS, GHOSTROLE_TRAIT)
		ADD_TRAIT(new_spawn, TRAIT_NO_MIDROUND_ANTAG, GHOSTROLE_TRAIT) //The mob can't be made into a random antag, they are still eligible for ghost roles popups.

/datum/outfit/ghostcafeVR
	name = "ID, jumpsuit and shoes"
	uniform = /obj/item/clothing/under/color/random
	shoes = /obj/item/clothing/shoes/sneakers/black

/datum/outfit/ghostcafeVR/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()
	if (isplasmaman(H))
		head = /obj/item/clothing/head/helmet/space/plasmaman
		uniform = /obj/item/clothing/under/plasmaman
		l_hand= /obj/item/tank/internals/plasmaman/belt/full
		mask = /obj/item/clothing/mask/breath
		return

/datum/outfit/ghostcafeVR/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	H.internal = H.get_item_for_held_index(1)
	H.update_internals_hud_icon(1)

/obj/effect/mob_spawn/human/ghostcafeVR
	name = "Ghost Cafe VR Sleeper"
	uses = -1
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	mob_name = "a ghost cafe VR visitor"
	roundstart = FALSE
	anchored = TRUE
	density = FALSE
	death = FALSE
	assignedrole = "Ghost Cafe VR Visitor"
	short_desc = "You are a Ghost Cafe VR Visitor!"
	flavour_text = "You know one thing for sure. You arent actually alive. Are you in a simulation?"
	skip_reentry_check = TRUE
	banType = ROLE_GHOSTCAFE
