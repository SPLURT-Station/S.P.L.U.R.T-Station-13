/obj/item/clothing/suit/hooded/wintercoat/security/pink
	name = "pink security winter coat"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/clothing_righthand.dmi'
	icon_state = "coatsecuritypink"
	item_state = "coatsecuritypink"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security/pink

/obj/item/clothing/head/hooded/winterhood/security/pink
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "winterhood_securitypink"

/obj/item/clothing/suit/toggle/rp_jacket
	name = "Yellow Jacket"
	desc = "A yellow jacket with a fluffy collar."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "jacket_yellow"
	item_state = "jacket_yellow"
	body_parts_covered = CHEST|ARMS
	cold_protection = CHEST|ARMS
	mutantrace_variation = NONE
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/suit/toggle/rp_jacket/orange
	name = "Orange Jacket"
	desc = "A orange jacket with a fluffy collar."
	icon_state = "jacket_orange"
	item_state = "jacket_orange"

/obj/item/clothing/suit/toggle/rp_jacket/red
	name = "Red Jacket"
	desc = "A red jacket with a fluffy collar."
	icon_state = "jacket_red"
	item_state = "jacket_red"

/obj/item/clothing/suit/toggle/rp_jacket/purple
	name = "Purple Jacket"
	desc = "A purple jacket with a fluffy collar."
	icon_state = "jacket_purple"
	item_state = "jacket_purple"

/obj/item/clothing/suit/toggle/rp_jacket/white
	name = "White Jacket"
	desc = "A white jacket with a fluffy collar."
	icon_state = "jacket_white"
	item_state = "jacket_white"

/*
 * Posshim's Corpus atire
 */
/obj/item/clothing/suit/hooded/corpus
	name = "Standard Voidsuit"
	desc = "Standard issue voidsuit in the name of Grofit!"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "corpus"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|FEET|HANDS
	hoodtype = /obj/item/clothing/head/hooded/corpus
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT //"Hide shoes" but digi shoes dont get hidden, too bad!
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	mutantrace_variation = NONE //There is no need for a digi variant, it's a costume

/obj/item/clothing/suit/hooded/corpus/s //sec
	name = "Enforcer Voidsuit"
	desc = "Delux issue grofit voidsuit. Let the middle class know You're in charge."
	icon_state = "corpuss"
	hoodtype = /obj/item/clothing/head/hooded/corpus/s //Enjoy this nice red outfit Nanotrasen! There is NO NEED for a pink one! xoxo -VivI Fanteriso

/obj/item/clothing/suit/hooded/corpus/c //command
	name = "Commander Voidsuit"
	desc = "Premium issue correctional worker attire. Grease the gears of production."
	icon_state = "corpusc"
	hoodtype = /obj/item/clothing/head/hooded/corpus/c

/obj/item/clothing/head/hooded/corpus
	name = "Voidsuit helmet"
	desc = "galvanized reinforced helm to protect against the elements"
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "corpus"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEEARS|HIDEFACIALHAIR|HIDEFACE|HIDEMASK|HIDESNOUT|HIDENECK //hide your ugly face with this one simple trick!
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/head/hooded/corpus/s //sec
	icon_state = "corpuss"

/obj/item/clothing/head/hooded/corpus/c //command
	icon_state = "corpusc"
