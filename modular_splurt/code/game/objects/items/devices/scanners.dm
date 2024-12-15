/obj/item/memoryscanner
	name = "handheld memory scanner"
	icon = 'modular_splurt/icons/obj/device.dmi'
	icon_state = "memoryscanner"
	item_state = "inducer-sci"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	desc = "A hand-held mind scanner able to penetrate the surface mind of a target."
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	custom_materials = list(/datum/material/iron=400, /datum/material/plasma=180)

/obj/item/memoryscanner/Initialize(mapload)
	. = ..()
	register_item_context()

/obj/item/memoryscanner/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins to wipe [user.p_their()] mind with the [src]!</span>")
	return OXYLOSS

/obj/item/memoryscanner/attack(mob/living/M, mob/living/carbon/human/user)
	if (HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		memory_scan(user, user)
		to_chat(user, "<span class='warning'>Uh... how does this doohickey work?!</span>")
		user.visible_message("<span class='danger'>[user] clumsily zaps his head with the [src]!</span>")
		var/obj/item/organ/brain/E
		E = user.getorganslot(ORGAN_SLOT_BRAIN)
		E.applyOrganDamage(15)
	else
		user.visible_message("<span class='danger'>[user] is trying to scan [M]'s mind with the [src]!</span>")
		if (do_mob(user, M, 15))
			user.visible_message("<span class='danger'>[user] scans [M]'s mind with the [src]!</span>")
			memory_scan(user, M)

proc/memory_scan(mob/user, mob/living/T)
	var/msg = "<span class='info'>Analyzing results for [T]'s memory.</span>"
	if (!isliving(T) || !T.mind)
		msg += "\n<span class='alert'>[T]'s mind is non-compliant! Scan failed.</span>"
		return
	else
		msg += "\n<span class='info'>Memory scan complete. \n Mind Contents: \n [T.mind] \n [T.mind.show_memory()] \n </span>"
		to_chat(user, examine_block(msg))
		return
