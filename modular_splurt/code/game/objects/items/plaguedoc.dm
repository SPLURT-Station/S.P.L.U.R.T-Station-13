/obj/item/clothing/mask/gas/plaguedoctor/red
	name = "authentic plague doctor mask"
	desc = "An authentic, modernised version of the classic design, with red lenses. This mask will not only filter out toxins but it can also be connected to an air supply."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "plaguedoctor_red"
	item_state = "plaguedoctor_red"
	armor = list(MELEE = 0, BULLET = 0, LASER = 2,ENERGY = 2, BOMB = 0, BIO = 75, RAD = 0, FIRE = 0, ACID = 0)

/obj/item/retractor/plague
	name = "plague doctor's retractors"
	desc = "A set of copper retractors, still just as useful as any other."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "retractor_plague"
	toolspeed = 1

/obj/item/hemostat/plague
	name = "plague doctor's hemostat"
	desc = "A copper hemostat, just as effective as a regular one."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "hemostat_plague"
	toolspeed = 1

/obj/item/cautery/plague
	name = "plague doctor's cautery"
	desc = "Little more than a piece of red-hot steel. Just as effective as a normal cautery."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "cautery_plague"
	toolspeed = 1

/obj/item/surgicaldrill/plague
	name = "plague doctor's drill"
	desc = "A steel bit with a hand crank, still just as effective."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "drill_plague"
	toolspeed = 1

/obj/item/scalpel/plague
	name = "plague doctor's scalpel"
	desc = "A sharp, curved copper scalpel, just as effective."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "scalpel_plague"
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 18
	toolspeed = 1
	sharpness = SHARP_POINTY

/obj/item/circular_saw/plague
	name = "plague doctor's saw"
	desc = "A small manual saw, just as sharp and effective as a normal surgical saw"
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "saw_plague"
	hitsound = 'sound/weapons/circsawhit.ogg'
	mob_throw_hit_sound =  'sound/weapons/pierce.ogg'
	force = 5
	throwforce = 7
	throw_speed = 3
	throw_range = 7
	toolspeed = 1
	attack_verb_continuous = list("attacks", "slashs", "saws", "cuts")
	attack_verb_simple = list("attack", "slash", "saw", "cut")
	sharpness = SHARP_EDGED

/obj/item/storage/backpack/docbag
	name = "doctor's bag"
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "docbag"
	item_state = "briefcase"
	lefthand_file = 'icons/mob/inhands/equipment/briefcase_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/briefcase_righthand.dmi'
	desc = "A large black leather bag for storing medical tools"
	slot_flags = null

/obj/item/storage/backpack/docbag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 50
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 30
	STR.max_volume = STORAGE_VOLUME_DUFFLEBAG

/obj/item/storage/backpack/docbag/PopulateContents()
	return

/obj/item/storage/backpack/docbag/plague
	name = "plague doctor's bag"
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "docbag"
	desc = "A large black leather bag used by plague doctors to store medical tools"

/obj/item/storage/backpack/docbag/plague/PopulateContents()
	new /obj/item/clothing/neck/stethoscope(src)
	new /obj/item/healthanalyzer(src)
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/bonesetter(src)
	new /obj/item/retractor/plague(src)
	new /obj/item/hemostat/plague(src)
	new /obj/item/cautery/plague(src)
	new /obj/item/surgicaldrill/plague(src)
	new /obj/item/scalpel/plague(src)
	new /obj/item/circular_saw/plague(src)

/obj/item/cane/plague
	name = "plague doctor cane"
	desc = "A cane used by a plague doctor, complete with fancy gold embelishments."
	icon = 'modular_splurt/icons/obj/plaguedoc.dmi'
	icon_state = "cane_plague"
	item_state = "stick"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=50)
	attack_verb_continuous = list("bludgeones", "whacks", "disciplines", "thrashs")
	attack_verb_simple = list("bludgeone", "whack", "discipline", "thrash")
