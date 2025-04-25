/datum/species/feral
	name = "Feral (THIS SHOULD NOT BE SEEN)"
	id = SPECIES_FERAL

	//The id is the living and standing icon state of the creature.
	simple_icon = 'modular_splurt/icons/mob/pokemon64.dmi'
	mutant_bodyparts = list()
	icon_dead_suffix = "_dead"
	icon_rest_suffix = "_rest"
	/// The width of the icon_limbs file. Used to auto-center your sprite.
	simple_icon_width = 64

	species_traits = list(
		FERAL,
		NOZOMBIE,
		NO_UNDERWEAR,
		LIPS,
		NOEYES,
		CAN_SCAR,
		HAS_FLESH,
		HAS_BONE
		)
	inherent_biotypes = MOB_ORGANIC|MOB_BEAST
	allowed_limb_ids = null

	meat = /obj/item/reagent_containers/food/snacks/meat/slab
	gib_types = list(/obj/effect/gibspawner/human/bodypartless)

	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	rotate_on_lying = FALSE

	damage_overlay_type = null
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	tail_type = "mam_tail"
	wagging_type = "mam_waggingtail"
	species_category = SPECIES_CATEGORY_FURRY
	//footstep_type = FOOTSTEP_MOB_CLAW
