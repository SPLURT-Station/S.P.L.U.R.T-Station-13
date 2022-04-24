//Clothing vars and procs
/obj/item/clothing
	var/normalize_size = RESIZE_NORMAL //This number is used as the "normal" height people will be given when wearing one of these accessories
	var/natural_size = null //The value of the wearer's body_size var in prefs. Unused for now.
	var/recorded_size = null //the user's height prior to equipping

//For applying a normalization
/obj/item/clothing/proc/normalize_mob_size(mob/living/carbon/human/H)
	if(H.normalized) //First we make a check to see if they're already normalized, from wearing another article of SynTech jewelry
		to_chat(H, "<span class='warning'>This accessory buzzes, being overwritten by another.</span>")
		playsound(H, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return
	recorded_size = get_size(H) //If not, grab their current size
	playsound(H, 'sound/effects/magic.ogg', 50, 1)
	flash_lighting_fx(3, 3, LIGHT_COLOR_PURPLE)
	H.visible_message("<span class='warning'>A flash of purple light engulfs [H], before they change to normal!</span>","<span class='notice'>You feel warm for a moment, before everything scales to your size...</span>")
	H.update_size(normalize_size) //Then apply the size
	H.normalized = TRUE //And set normalization

//For removing a normalization, and reverting back to normal
/obj/item/clothing/proc/denormalize_mob_size(mob/living/carbon/human/H)
	if(H.normalized) //sanity check
		playsound(H,'sound/weapons/emitter2.ogg', 50, 1)
		flash_lighting_fx(3, 3, LIGHT_COLOR_YELLOW)
		H.visible_message("<span class='warning'>Golden light engulfs [H], and they shoot back to their default height!</span>","<span class='notice'>Energy rushes through your body, and you return to normal.</span>")
		H.update_size(recorded_size)
		H.normalized = FALSE


//For storing normalization on mobs
/mob/living
	var/normalized = FALSE
	//normalized is a check for instances where more than one accessory of jewelry is worn. For all intensive purposes, only the first worn accessory stores the user's size.
	//Anything else is just extra.

//Clothing below. Code could be compressed more, but until I make jewelry slots, this will do. -Dahl

//GLOVE SLOT ITEMS...
//SynTech ring
/obj/item/clothing/gloves/ring/syntech
	name = "normalizer ring"
	desc = "An expensive, shimmering SynTech ring gilded with golden Kinaris markings. It will 'normalize' the size of the user to a specified height approved for work-conditions, as long as it is equipped. The artificial violet gem inside twinkles ominously."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	icon_state = "ring"
	item_state = "sring" //No use in a unique sprite since it's just one pixel
	w_class = WEIGHT_CLASS_TINY
	body_parts_covered = 0
	transfer_prints = TRUE
	strip_delay = 40
	//These are already defined under the parent ring, but I wanna leave em here for reference purposes

//For glove slots
/obj/item/clothing/gloves/ring/syntech/equipped(mob/living/user, slot)
	if(ishuman(user))
		var/mob/living/carbon/human/human_target = user
		if(slot == ITEM_SLOT_GLOVES)

			if(get_size(human_target) != RESIZE_NORMAL)
				normalize_mob_size(human_target)
	. = ..()

/obj/item/clothing/gloves/ring/syntech/dropped(mob/living/user, slot)
	if(ishuman(user))
		var/mob/living/carbon/human/human_target = user

		if(human_target.normalized)
			denormalize_mob_size(human_target)
	. = ..()

//SynTech Wristband
/obj/item/clothing/gloves/ring/syntech/band
	name = "normalizer wristband"
	desc = "An expensive technological wristband cast in SynTech purples with shimmering Kinaris golds. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. There is a small screen buzzing with information."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/hands.dmi'
	icon_state = "wristband"
	item_state = "syntechband"


//NECK SLOT ITEMS...
//Syntech Pendant
/obj/item/clothing/neck/syntech
	name = "normalizer pendant"
	desc = "A vibrant violet jewel cast in silvery-gold metals, sporting the elegance of Kinaris with SynTech prowess. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. The artificial violet gem inside twinkles ominously."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "pendant"
	item_state = "pendant"

//For neck items
/obj/item/clothing/neck/syntech/equipped(mob/living/user, slot)
	if(ishuman(user))
		var/mob/living/carbon/human/human_target = user
		if(slot == ITEM_SLOT_NECK)

			if(get_size(human_target) != RESIZE_NORMAL)
				normalize_mob_size(human_target)
	. = ..()

/obj/item/clothing/neck/syntech/dropped(mob/living/user, slot)
	if(ishuman(user))
		var/mob/living/carbon/human/human_target = user

		if(human_target.normalized)
			denormalize_mob_size(human_target)
	. = ..()

//Syntech Choker
/obj/item/clothing/neck/syntech/choker
	name = "normalizer choker"
	desc = "A sleek, tight-fitting choker embezzled with silver to gold, adorned with vibrant purple studs; combined technology of Kinaris and SynTech. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. There is a small screen buzzing with information."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	icon_state = "choker"
	item_state = "collar"

//Syntech Collar
/obj/item/clothing/neck/syntech/collar
	name = "normalizer collar"
	desc = "A cute pet collar, technologically designed with vibrant purples and smooth silvers. There is a small gem bordered by gold at the front, reading 'SYNTECH' engraved within the metal. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. The artificial violet gem inside twinkles ominously."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar"
	item_state = "collar"
