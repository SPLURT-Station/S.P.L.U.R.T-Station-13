/obj/item/armorkit/blueshield
	name = "aegis armor kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing outerwear."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "blueshield_armor_kit" // I'm so sorry I butchered the sprite, Toriate.

/obj/item/armorkit/blueshield/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	// yeah have fun making subtypes and modifying the afterattack if you want to make variants
	// idiot
	// I have no idea what you are talking about.
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_OCLOTHING))
		return

	var/obj/item/clothing/C = target

	if(C.armor.getRating(MELEE) < 30)
		C.armor = C.armor.setRating(MELEE = 30)
		used = TRUE
	if(C.armor.getRating(BULLET) < 30)
		C.armor = C.armor.setRating(BULLET = 30)
		used = TRUE
	if(C.armor.getRating(LASER) < 30)
		C.armor = C.armor.setRating(LASER = 30)
		used = TRUE
	if(C.armor.getRating(ENERGY) < 40)
		C.armor = C.armor.setRating(ENERGY = 40)
		used = TRUE
	if(C.armor.getRating(BOMB) < 25)
		C.armor = C.armor.setRating(BOMB = 25)
		used = TRUE
	if(C.armor.getRating(FIRE) < 70)
		C.armor = C.armor.setRating(FIRE = 70)
		used = TRUE
	if(C.armor.getRating(ACID) < 90)
		C.armor = C.armor.setRating(ACID = 90)
		used = TRUE
	if(C.armor.getRating(WOUND) < 10)
		C.armor = C.armor.setRating(WOUND = 10)
		used = TRUE

	if(used)
		C.allowed = GLOB.security_vest_allowed
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a blueshield armored vest.</span>")
		C.name = "aegis [C.name]"
		C.upgrade_prefix = "aegis" // god i hope this works <-- I'm not sure what this even does.
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/blueshield/helmet
	name = "aegis headgear kit"
	desc = "A nanotrasen armoring kit with armored plates and some nanoglue, for reinforcing hats or other headgear."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "blueshield_helmet_kit" // I'm so sorry I butchered the sprite, Toriate. (x2)

/obj/item/armorkit/blueshield/helmet/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_HEAD))
		return

	var/obj/item/clothing/C = target

	if(C.armor.getRating(MELEE) < 40)
		C.armor = C.armor.setRating(MELEE = 40)
		used = TRUE
	if(C.armor.getRating(BULLET) < 30)
		C.armor = C.armor.setRating(BULLET = 30)
		used = TRUE
	if(C.armor.getRating(LASER) < 25)
		C.armor = C.armor.setRating(LASER = 25)
		used = TRUE
	if(C.armor.getRating(ENERGY) < 10)
		C.armor = C.armor.setRating(ENERGY = 10)
		used = TRUE
	if(C.armor.getRating(BOMB) < 25)
		C.armor = C.armor.setRating(BOMB = 25)
		used = TRUE
	if(C.armor.getRating(BIO) < 10)
		C.armor = C.armor.setRating(BIO = 10)
		used = TRUE
	if(C.armor.getRating(FIRE) < 50)
		C.armor = C.armor.setRating(FIRE = 50)
		used = TRUE
	if(C.armor.getRating(ACID) < 60)
		C.armor = C.armor.setRating(ACID = 60)
		used = TRUE

	if(used)
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a blueshield helmet.</span>")
		C.name = "aegis [C.name]"
		C.upgrade_prefix = "aegis"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/security
	name = "rampart armor kit"
	desc = "A security armoring kit with flexible armored sheets and some nanoglue, for reinforcing outerwear."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit" // I'm so sorry I butchered the sprite, Toriate. (x3)

/obj/item/armorkit/security/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_OCLOTHING))
		return

	var/obj/item/clothing/C = target

	if(C.armor.getRating(MELEE) < 30)
		C.armor = C.armor.setRating(MELEE = 30)
		used = TRUE
	if(C.armor.getRating(BULLET) < 30)
		C.armor = C.armor.setRating(BULLET = 30)
		used = TRUE
	if(C.armor.getRating(LASER) < 30)
		C.armor = C.armor.setRating(LASER = 30)
		used = TRUE
	if(C.armor.getRating(ENERGY) < 10)
		C.armor = C.armor.setRating(ENERGY = 10)
		used = TRUE
	if(C.armor.getRating(BOMB) < 25)
		C.armor = C.armor.setRating(BOMB = 25)
		used = TRUE
	if(C.armor.getRating(FIRE) < 50)
		C.armor = C.armor.setRating(FIRE = 50)
		used = TRUE
	if(C.armor.getRating(ACID) < 50)
		C.armor = C.armor.setRating(ACID = 50)
		used = TRUE
	if(C.armor.getRating(WOUND) < 10)
		C.armor = C.armor.setRating(WOUND = 10)
		used = TRUE

	if(used)
		C.allowed = GLOB.security_vest_allowed
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a security armored vest.</span>")
		C.name = "rampart [C.name]"
		C.upgrade_prefix = "rampart"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/security/helmet
	name = "rampart headgear kit"
	desc = "A security armoring kit with flexible armored sheets and some nanoglue, for reinforcing hats or other headgear."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_helmet_kit" // I'm so sorry I butchered the sprite, Toriate. (x4)

/obj/item/armorkit/security/helmet/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE

	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_HEAD))
		return

	var/obj/item/clothing/C = target

	if(C.armor.getRating(MELEE) < 40)
		C.armor = C.armor.setRating(MELEE = 40)
		used = TRUE
	if(C.armor.getRating(BULLET) < 30)
		C.armor = C.armor.setRating(BULLET = 30)
		used = TRUE
	if(C.armor.getRating(LASER) < 30)
		C.armor = C.armor.setRating(LASER = 30) // Why the fuck does the sec helmet have better laser protection than the blueshield's?
		used = TRUE
	if(C.armor.getRating(ENERGY) < 10)
		C.armor = C.armor.setRating(ENERGY = 10)
		used = TRUE
	if(C.armor.getRating(BOMB) < 25)
		C.armor = C.armor.setRating(BOMB = 25)
		used = TRUE
	if(C.armor.getRating(FIRE) < 50)
		C.armor = C.armor.setRating(FIRE = 50)
		used = TRUE
	if(C.armor.getRating(ACID) < 50)
		C.armor = C.armor.setRating(ACID = 50)
		used = TRUE

	if(used)
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a security helmet.</span>")
		C.name = "rampart [C.name]"
		C.upgrade_prefix = "rampart"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return
