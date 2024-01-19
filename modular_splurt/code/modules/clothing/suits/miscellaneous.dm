//Main code edits
/obj/item/clothing/suit/toggle/jacket
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/toggle/wbreakpoly
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

//Own stuff

/* Already exists
/obj/item/clothing/under/wedding_dress
	name = "wedding dress"
	desc = "A luxurious gown for once-in-a-lifetime occasions."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "wedding_dress"
	body_parts_covered = CHEST|GROIN|LEGS
	flags_cover = HIDESHOES
	mutantrace_variation = NONE
	can_adjust = FALSE
*/

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

/obj/item/clothing/suit/baroness
	name = "Baroness Dress"
	desc = "This dress is stained red due to the bloody history of its previous owner"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "baroness"
	item_state = "baroness"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	flags_inv = HIDESHOES|HIDEUNDERWEAR

/obj/item/clothing/suit/baroness/ladyballat
	name = "Green Ball Dress"
	desc = "This dress looks a bit like the one an estranged aunt would wear."
	icon_state = "ladyballat"
	item_state = "ladyballat"

/obj/item/clothing/suit/flatwoods
	name = "Flatwoods Dress"
	desc = "Despite it's rather simple and cozy look, it seems to be made for someone of at least 10ft."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "flatwoods"
	item_state = "flatwoods"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	flags_inv = HIDESHOES|HIDEUNDERWEAR

/obj/item/clothing/suit/jacket/runner
	name = "Runner Jacket"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	item_state = null

/obj/item/clothing/suit/jacket/runner/engi
	name = "Engineer Runner Jacket"
	icon_state = "runner_engi"

/obj/item/clothing/suit/jacket/runner/syndicate
	name = "Syndicate Runner Jacket"
	icon_state = "runner_syndi"

/obj/item/clothing/suit/jacket/runner/winter
	name = "Winter Runner Jacket"
	icon_state = "runner_winter"

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
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT //"Hide shoes" but digi shoes don't get hidden, too bad!
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	mutantrace_variation = NONE //There is no need for a digi variant, it's a costume

/obj/item/clothing/suit/hooded/corpus/s //sec
	name = "Enforcer Voidsuit"
	desc = "Deluxe issue armored voidsuit. Let the middle class bask in your grofit!"
	icon_state = "corpuss"
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 10)
	hoodtype = /obj/item/clothing/head/hooded/corpus/s //Enjoy this nice red outfit Nanotrasen! There is NO NEED for a pink one! xoxo -VivI Fanteriso

/obj/item/clothing/suit/hooded/corpus/s/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

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

/obj/item/clothing/suit/maid
	name = "Formal maid uniform"
	desc = "A cozy maid uniform for housekeeping."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "maiddress"
	item_state = "maiddress"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	flags_inv = HIDESHOES|HIDEUNDERWEAR

/obj/item/clothing/suit/hooded/pyramidhead
	name = "Pyramid Head apron"
	desc = "This was probably stolen from the kitchen and turned into someone's cosplay project."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "pyramidhead"
	item_state = "apron"
	hoodtype = /obj/item/clothing/head/hooded/pyramidhead
	body_parts_covered = CHEST|GROIN|LEGS
	mutantrace_variation = NONE
	no_t = TRUE

/obj/item/clothing/head/hooded/pyramidhead
	name = "Pyramid Head"
	desc = "Looks like someone stole some plating tiles and let them rust for a while."
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "pyramidhead"
	item_state = "pyramidhead"
	flags_inv = HIDEHAIR|HIDEEARS|HIDEFACIALHAIR|HIDEFACE|HIDEMASK|HIDESNOUT|HIDENECK

// GWTB-inspired stuff wooo
/obj/item/clothing/suit/goner
	name = "trencher coat"
	desc = "A generic trench coat of the boring wars. This one have purple, corporate insignias."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "goner_suit"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	armor = list(MELEE = 25, BULLET = 10, LASER = 25, ENERGY = 10, BOMB = 5, BIO = 5, RAD = 5, FIRE = 5, ACID = 45) // Det's armor value + 5 BOMB&BIO&RAD&FIRE

/obj/item/clothing/suit/goner/Initialize(mapload)
	. = ..()
	allowed = GLOB.detective_vest_allowed + typecacheof(/obj/item/toy) // As per suggestion 1913 (06/07/2022). Now able to hold toys!

/obj/item/clothing/suit/goner/fake
	name = "trencher coat replica"
	desc = "A 90% replica of No Man's Land-type coat."
	armor = 0

/obj/item/clothing/suit/goner/fake/poly
	name = "polychromic trencher coat"
	desc = "A generic, drab olive trench coat with polychromic spots."
	var/list/poly_colors = list("#E6E6E6", "#D6D6D6", "#D6D6D6")

/obj/item/clothing/suit/goner/fake/poly/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 3)

/obj/item/clothing/suit/goner/fake/poly/classic
	name = "classic trencher coat"
	icon_state = "goner_suit_classic"
	desc = "A generic, grey coat with polychromic spots."

/obj/item/clothing/suit/goner/red
	name = "red trencher coat"
	desc = "A trench coat of the boring wars. This one have red insignias."
	icon_state = "goner_suit_r"

/obj/item/clothing/suit/goner/green
	name = "green trencher coat"
	desc = "A trench coat of the boring wars. This one have green insignias."
	icon_state = "goner_suit_g"

/obj/item/clothing/suit/goner/blue
	name = "blue trencher coat"
	desc = "A trench coat of the boring wars. This one have blue insignias."
	icon_state = "goner_suit_b"

/obj/item/clothing/suit/goner/yellow
	name = "yellow trencher coat"
	desc = "A trench coat of the boring wars. This one have yellow insignias."
	icon_state = "goner_suit_y"

/obj/item/clothing/suit/hooded/corpus/jp //It's him! John Prodman!
	name = "Strange Voidsuit"
	desc = "An odd Voidsuit that looks strangely familiar. Has the name 'John' stenciled on it. The shielding module is also intact!"
	icon_state = "corpus_jp"
	armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 0, RAD = 50, FIRE = 50, ACID = 50, WOUND = 50)
	hoodtype = /obj/item/clothing/head/hooded/corpus/jp

/obj/item/clothing/head/hooded/corpus/jp //sec
	icon_state = "corpus_jp"

/obj/item/clothing/suit/invisijacket
	name = "invisifiber jacket"
	desc = "A jacket made of transparent fibers, often used with reinforcement kits."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	// No overlay, because they're invisible!
	icon_state = "jacket_transparent"
	// I feel REALLY bad about doing this, but the default overlay is not transparent (null does not work either).
	item_state = "jacket_transparent"
