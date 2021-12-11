//Hyper stuff
/obj/item/bdsm_whip
	name = "bdsm whip"
	desc = "A less lethal version of the whip the librarian has. Still hurts, but just the way you like it."
	icon_state = "whip"
	item_state = "crop"
	lefthand_file = 'modular_sand/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	damtype = LUST_DAMAGE
	throwforce = 0
	force = 5
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	hitsound = 'sound/weapons/whip.ogg'

/obj/item/bdsm_whip/ridingcrop
	name = "riding crop"
	icon = 'modular_sand/icons/obj/items_and_weapons.dmi'
	desc = "For teaching a lesson in a more compact fashion."
	icon_state = "ridingcrop"
	force = 10

/obj/item/bdsm_whip/suicide_act(mob/user)
		user.visible_message("<span class='suicide'>[user] is getting just a little too kinky!</span>")
		return (OXYLOSS)

/obj/item/bdsm_whip/attack(mob/M, mob/user)
	if(user.zone_selected == BODY_ZONE_PRECISE_GROIN)
		playsound(loc, 'sound/weapons/whip.ogg', 30)
		M.visible_message("<span class='userdanger'>[user] has [pick(attack_verb)] [M] on the ass!</span>")
	else
		return ..(M, user)

/obj/item/khopesh
	name = "khopesh"
	desc = "An sickle-shaped sword that evolved from battle axes"
	icon_state = "khopesh"
	item_state = "khopesh"
	icon = 'modular_sand/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_sand/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sharpness = SHARP_EDGED
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	total_mass = TOTAL_MASS_MEDIEVAL_WEAPON

/obj/item/khopesh/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is falling on [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(BRUTELOSS)
