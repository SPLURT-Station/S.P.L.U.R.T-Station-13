/obj/item/clothing/under/tunic
	name = "tunic"
	desc = "A simple tunic."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "tunic"
	can_adjust = FALSE
	mutantrace_variation = NONE

/obj/item/clothing/under/latex
	name = "full latex jumpsuit"
	desc = "A tight fitting jumpsuit made of latex."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "latex_full"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	can_adjust = FALSE

/obj/item/clothing/under/latex/half
	name = "latex bodysuit"
	desc = "A tight fitting outfit made of latex, that covers the wearers torso."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "latex_half"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	body_parts_covered = CHEST
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/under/sexynursesuit
	name = "sexy nurse outfit"
	desc = "A very revealing nurse's outfit. Not very sanitary. Does it even count as clothing?"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "sexynursesuit"
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	can_adjust = FALSE
	mutantrace_variation = NONE

/obj/item/clothing/under/lumberjack
	name = "lumberjack outfit"
	desc = "I am a lumberjack and I am okay, I sleep all night and I work all day."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "lumberjack"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	can_adjust = FALSE
	mutantrace_variation = NONE

/obj/item/clothing/under/bunnysuit
	name = "bunny outfit"
	desc = "A simple black bunny outfit."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "bunnysuit"
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	body_parts_covered = CHEST|GROIN

/obj/item/clothing/under/domina
	name = "Dominatrix Dress"
	desc = "This dress makes you feel like you wanna get on all fours and beg for more!"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "domina"
	item_state = "domina"
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	body_parts_covered = CHEST|GROIN|LEGS

/obj/item/clothing/under/bluedress
	name = "Blue Royal Dress"
	desc = "This dress is made with fine blue silks, it also smells of expensive perfumes and oils."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "bluedress"
	item_state = "bluedress"
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	body_parts_covered = CHEST|GROIN|LEGS

/obj/item/clothing/under/performer
	name = "Performers one piece"
	desc = "This outfit smells a bit like cum and lube."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "performer"
	item_state = "performer"
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	body_parts_covered = CHEST

/obj/item/clothing/under/bunnysuit/white
	name = "white bunny outfit"
	desc = "A simple white bunny outfit."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "whitebunnysuit"
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/under/rank/security/skirt/slut
	name = "slutty security jumpskirt"
	desc = "A \"\"\"tactical\"\"\" security jumpsuit with the legs replaced by a skirt. No matter how you adjust it, it always feels a little too small."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "secslutskirt"
	item_state = "secslutskirt"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30, "wound" = 10)
	can_adjust = FALSE
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/under/rank/security/skirt/slut/pink
	desc = "A \"\"\"tactical\"\"\" security jumpsuit with the legs replaced by a skirt. No matter how you adjust it, it always feels a little too small. This one seems to have an experimental color scheme."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "secslutskirtpink"
	item_state = "secslutskirtpink"
	can_adjust = FALSE
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/under/rank/security/stripper
	name = "security stripper outfit"
	desc = "This can't be dress code compliant, can it?"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "secstripper"
	item_state = "secstripper"
	can_adjust = FALSE
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/brigdoc
	name = "brig physician outfit"
	desc = "The uniform of the Brig Physician. Do know harm."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "brigphys"
	item_state = "brigphys"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 20, "acid" = 30, "wound" = 10)
	can_adjust = FALSE
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = SENSOR_COORDS
	sensor_flags = NONE
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_ALL_TAURIC

/obj/item/clothing/under/rank/brigdoc/skirt
	name = "brig physician skirt"
	desc = "The uniform of the Brig Physician. Do know harm, with a skirt"
	icon_state = "brigphysf"
	item_state = "brigphysf"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/blueshield
	name = "blueshield outfit"
	desc = "The uniform of the Blueshield. It makes you feel protected"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "blueshield"
	item_state = "blueshield"
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 30, "wound" = 10)
	can_adjust = FALSE
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = SENSOR_COORDS
	sensor_flags = NONE
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_ALL_TAURIC

/obj/item/clothing/under/rank/blueshield/formal
	name = "blueshield formal outfit"
	desc = "The formal uniform of the Blueshield. It makes you feel protected while looking great."
	icon_state = "blueformal"
	item_state = "blueformal"

/obj/item/clothing/under/rank/blueshield/formal/skirt
	name = "blueshield formal skirt"
	desc = "The formal uniform of the Blueshield. It makes you feel protected while looking great. A lot better than the stuffy pants."
	icon_state = "blueshieldskirt"
	item_state = "blueshieldskirt"

/obj/item/clothing/under/rank/blueshield/skirt
	name = "blueshield skirt"
	desc = "The uniform of the Blueshield. It makes you feel protected, even with a bit of a breeze."
	icon_state = "blueshieldf"
	item_state = "blueshieldf"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/plasmaman/security/blueshield
	name = "security plasma envirosuit"
	desc = "A slick black and blue  plasmaman containment suit designed for the Blueshield."
	icon_state = "bs_envirosuit"
	item_state = "bs_envirosuit"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 30, "wound" = 10)

/obj/item/clothing/head/helmet/space/plasmaman/security/blueshield
	name = "head of security's plasma envirosuit helmet"
	desc = "A plasmaman containment helmet designed for the Blueshield, menacing black with blue stripes."
	icon_state = "bs_envirohelm"
	item_state = "bs_envirohelm"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/head.dmi'
	armor = list("melee" = 40, "bullet" = 30, "laser" = 25, "energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 50, "acid" = 60)

/obj/item/clothing/under/rank/bridgeofficer
	name = "bridge officer outfit"
	desc = "The uniform of a bridge officer. It makes you feel extremely important, even if you are not."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "bridgesec"
	item_state = "bridgesec"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 5,"energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)
	can_adjust = FALSE
	strip_delay = 25
	alt_covers_chest = TRUE
	sensor_mode = SENSOR_COORDS
	sensor_flags = NONE
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_ALL_TAURIC

/obj/item/clothing/under/rank/bridgeofficer/skirt
	name = "bridge officer skirt"
	icon_state = "bridgesecf"
	item_state = "bridgesecf"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/bridgeofficer/formal
	name = "bridge officer formal outfit"
	desc = "The uniform of a bridge officer. Its a formal variant."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "bridgesecformal"
	item_state = "bridgesecformal"

/obj/item/clothing/under/cyberpunksleek
	name = "modern sweater"
	desc = "A modern-styled sweater typically worn on more urban planets, made with a neo-laminated fiber lining."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	icon_state = "cyberpunksleek"
	item_state = "cyberpunksleek"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	can_adjust = FALSE

/obj/item/clothing/under/costume/cyberpunksleek/long
	name = "long modern sweater"
	desc = "A long modern-styled sweater typically worn on more urban planets, made with a neo-laminated fiber lining."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	icon_state = "cyberpunksleek_long"
	item_state = "cyberpunksleek_long"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	can_adjust = FALSE

/obj/item/clothing/under/pentatop
	name = "pentagram crop top"
	desc = "For those goth girls with lots of chest to show."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "pentatop"
	item_state = "pentatop"
	body_parts_covered = CHEST
	can_adjust = FALSE

// GWTB-inspired stuff wooo
/obj/item/clothing/under/goner
	name = "trencher uniform"
	desc = "An utilitarian uniform of rugged warfare. This one have purple-colored, corporate insignias."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	icon_state = "goner_uniform"
	can_adjust = FALSE
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 5, RAD = 5, FIRE = 30, ACID = 30, WOUND = 10) // Security uniform's + BIO&RAD

/obj/item/clothing/under/goner/fake
	name = "trencher uniform replica"
	desc = "A 90% replica of No Man's Land-type uniform."
	armor = 0

/obj/item/clothing/under/goner/fake/poly
	name = "polychromic trencher uniform"
	desc = "An utilitarian uniform with polychromic spots."
	var/list/poly_colors = list("#E6E6E6")

/obj/item/clothing/under/goner/fake/poly/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)

/obj/item/clothing/under/goner/red
	name = "red trencher uniform"
	desc = "An utilitarian uniform of rugged warfare, with red insignias."
	icon_state = "goner_uniform_r"

/obj/item/clothing/under/goner/green
	name = "green trencher uniform"
	desc = "An utilitarian uniform of rugged warfare, with green insignias."
	icon_state = "goner_uniform_g"

/obj/item/clothing/under/goner/blue
	name = "blue trencher uniform"
	desc = "An utilitarian uniform of rugged warfare, with blue insignias."
	icon_state = "goner_uniform_b"

/obj/item/clothing/under/goner/yellow
	name = "yellow trencher uniform"
	desc = "An utilitarian uniform of rugged warfare, with yellow insignias."
	icon_state = "goner_uniform_y"

/obj/item/clothing/under/misc/gear_harness
	body_parts_covered = NONE

/obj/item/clothing/under/misc/leia_outfit
	name = "space princess outfit"
	desc = "Chain for your Master's erotic asphyxiation not included."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "leia"
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/misc/leia_outfit/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#C61818", "#D4AF37"), 2)

/obj/item/clothing/under/performer/polychromic
	name = "polychromic performers one piece"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "poly_performer"

/obj/item/clothing/under/performer/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#ffffff"), 1)

/obj/item/clothing/under/rank/cargo/miner/lavaland/stripper
	name = "explorer stripper outfit"
	desc = "This can't be dress code compliant, can it?"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "explorerstripper"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

// Prison Jumpsuit/Jumpskirt override to allow reskins
/obj/item/clothing/under/rank/prisoner
	reskin_binding = COMSIG_CLICK_CTRL
	unique_reskin = list(
		"max-sec"			= list("icon_state" = "maxprisoner", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi', "anthro_mob_worn_overlay" = 'modular_splurt/icons/mobs/clothing/uniform_digi.dmi'),
		"high-sec"			= list("icon_state" = "highprisoner", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi', "anthro_mob_worn_overlay" = 'modular_splurt/icons/mobs/clothing/uniform_digi.dmi'),
		"med-sec"			= list("icon_state" = "prisoner", "icon" = 'icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = null, "anthro_mob_worn_overlay" = null),
		"low-sec"			= list("icon_state" = "lowprisoner", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi', "anthro_mob_worn_overlay" = 'modular_splurt/icons/mobs/clothing/uniform_digi.dmi'),
		"prot-sec"			= list("icon_state" = "protprisoner", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi', "anthro_mob_worn_overlay" = 'modular_splurt/icons/mobs/clothing/uniform_digi.dmi'),
		"vampire"			= list("icon_state" = "blackprisoner", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi', "anthro_mob_worn_overlay" = 'modular_splurt/icons/mobs/clothing/uniform_digi.dmi')
	)

/obj/item/clothing/under/rank/prisoner/reskin_obj(mob/M)
	. = ..()
	name = "prison [current_skin] jumpsuit"

/obj/item/clothing/under/rank/prisoner/skirt
	unique_reskin = list(
		"max-sec"			= list("icon_state" = "maxprisoner_skirt", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi'),
		"high-sec"			= list("icon_state" = "highprisoner_skirt", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi'),
		"med-sec"			= list("icon_state" = "prisoner_skirt",  "icon" = 'icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = null),
		"low-sec"			= list("icon_state" = "lowprisoner_skirt", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi'),
		"prot-sec"			= list("icon_state" = "protprisoner_skirt", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi'),
		"vampire"			= list("icon_state" = "blackprisoner_skirt", "icon" = 'modular_splurt/icons/obj/clothing/uniforms.dmi', "mob_overlay_icon" = 'modular_splurt/icons/mobs/clothing/uniform.dmi')
	)

/obj/item/clothing/under/rank/prisoner/skirt/reskin_obj(mob/M)
	. = ..()
	name = "prison [current_skin] jumpskirt"
