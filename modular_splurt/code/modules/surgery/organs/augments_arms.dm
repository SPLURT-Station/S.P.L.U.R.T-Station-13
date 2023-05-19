//Hyper stuff
/obj/item/organ/cyberimp/arm/mblade
	name = "arm-mounted scytheblade"
	desc = "An extremely dangerous implant which can be used in a variety of ways. Mostly killing."
	contents = newlist(/obj/item/melee/mblade)

/obj/item/organ/cyberimp/arm/mblade/l
	zone = BODY_ZONE_L_ARM

/obj/item/melee/mblade
	name = "mounted scytheblade"
	desc = "An extremely dangerous implant which can be used in a variety of ways. Mostly killing."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "mblade"
	item_state = "mblade"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 45
	hitsound = 'sound/weapons/bladeslice.ogg'
	throwforce = 45
	block_chance = 70
	armour_penetration = 80
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_POINTY
	attack_verb = list("slashed", "cut")

// Synth power cord interaction override
/obj/item/apc_powercord/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	// Define user
	var/mob/living/carbon/human/cord_user = user

	// Check for bloodfledge
	if(isbloodfledge(cord_user))
		// Warn user and return
		to_chat(cord_user, span_warning("You try to siphon energy from [target], but a sanguine force prevents you from absorbing any charge!"))
		return

	// Return normally
	. = ..()
