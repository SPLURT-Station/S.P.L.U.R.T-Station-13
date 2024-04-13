/datum/species/feral
	name = "Feral (THIS SHOULD NOT BE SEEN)"
	id = SPECIES_FERAL

	//The id is the living and standing icon state of the creature.
	//The dead icon state must be "id_d" in the .dmi file
	//The resting icon state must be "id_rest" in the .dmi file
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

//
// start of pokemon
//

/datum/species/feral/pokemon
	roundstart = FALSE
	liked_food = FRUIT | MEAT //berries
	disliked_food = TOXIC | GROSS
	icon_dead_suffix = "_d"
	icon_rest_suffix = "_rest"
	simple_icon_width = 64

/datum/species/feral/pokemon/aerodactyl
	name = "Feral Aerodactyl"
	id = "Aerodactyl"//randomly has a capital letter i guess
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/aerodactyl
	race = /datum/species/feral/pokemon/aerodactyl

/datum/species/feral/pokemon/absol
	name = "Feral Absol"
	id = "absol"
	roundstart = TRUE
/mob/living/carbon/human/species/absol
	race = /datum/species/feral/pokemon/absol

/datum/species/feral/pokemon/megaabsol
	name = "Feral Mega Absol"
	id = "megaabsol"
	roundstart = TRUE
/mob/living/carbon/human/species/megaabsol
	race = /datum/species/feral/pokemon/megaabsol

/datum/species/feral/pokemon/aggron
	name = "Feral Aggron"
	id = "aggron"
	roundstart = TRUE
/mob/living/carbon/human/species/aggron
	race = /datum/species/feral/pokemon/aggron

/datum/species/feral/pokemon/ampharos
	name = "Feral Ampharos"
	id = "ampharos"
	roundstart = TRUE
/mob/living/carbon/human/species/ampharos
	race = /datum/species/feral/pokemon/ampharos

/datum/species/feral/pokemon/articuno
	name = "Feral Articuno"
	id = "articuno"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pokemon96.dmi'
	simple_icon_width = 96
/mob/living/carbon/human/species/articuno
	race = /datum/species/feral/pokemon/articuno

/datum/species/feral/pokemon/arcanine
	name = "Feral Acanine"
	id = "arcanine"
	roundstart = TRUE
/mob/living/carbon/human/species/arcanine
	race = /datum/species/feral/pokemon/arcanine

/datum/species/feral/pokemon/blastoise
	name = "Feral Blastoise"
	id = "blastoise"
	roundstart = TRUE
/mob/living/carbon/human/species/blastoise
	race = /datum/species/feral/pokemon/blastoise

/datum/species/feral/pokemon/braixen
	name = "Feral Braixen"
	id = "braixen"
	roundstart = TRUE
/mob/living/carbon/human/species/braixen
	race = /datum/species/feral/pokemon/braixen

/datum/species/feral/pokemon/celebi
	name = "Feral Celebi"
	id = "celebi"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/celebi
	race = /datum/species/feral/pokemon/celebi

/datum/species/feral/pokemon/charmander
	name = "Feral Charmander"
	id = "charmander"
	roundstart = TRUE
/mob/living/carbon/human/species/charmander
	race = /datum/species/feral/pokemon/charmander

/datum/species/feral/pokemon/charizard
	name = "Feral Charizard"
	id = "charizard"
	roundstart = TRUE
/mob/living/carbon/human/species/charizard
	race = /datum/species/feral/pokemon/charizard

/datum/species/feral/pokemon/cubone
	name = "Feral Cubone"
	id = "cubone"
	roundstart = TRUE
/mob/living/carbon/human/species/cubone
	race = /datum/species/feral/pokemon/cubone

/datum/species/feral/pokemon/ditto
	name = "Feral Ditto"
	id = "ditto"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/ditto
	race = /datum/species/feral/pokemon/ditto

/datum/species/feral/pokemon/dragonair
	name = "Feral Dragonair"
	id = "dragonair"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/dragonair
	race = /datum/species/feral/pokemon/dragonair

/datum/species/feral/pokemon/shinydragonair
	name = "Feral Shiny Dragonair"
	id = "shinydragonair"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/shinydragonair
	race = /datum/species/feral/pokemon/shinydragonair

/datum/species/feral/pokemon/dunsparce
	name = "Feral Dunsparce"
	id = "dunsparce"
	roundstart = TRUE
/mob/living/carbon/human/species/dunsparce
	race = /datum/species/feral/pokemon/dunsparce

/datum/species/feral/pokemon/dragonite
	name = "Feral Dragonite"
	id = "dragonite"
	roundstart = TRUE
/mob/living/carbon/human/species/dragonite
	race = /datum/species/feral/pokemon/dragonite

/datum/species/feral/pokemon/dratini
	name = "Feral Dratini"
	id = "dratini"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/dratini
	race = /datum/species/feral/pokemon/dratini

/datum/species/feral/pokemon/eevee
	name = "Feral Eevee"
	id = "eevee"
	roundstart = TRUE
/mob/living/carbon/human/species/eevee
	race = /datum/species/feral/pokemon/eevee

/datum/species/feral/pokemon/espeon
	name = "Feral Espeon"
	id = "espeon"
	roundstart = TRUE
/mob/living/carbon/human/species/espeon
	race = /datum/species/feral/pokemon/espeon

/datum/species/feral/pokemon/fennekin
	name = "Feral Fennekin"
	id = "fennekin"
	roundstart = TRUE
/mob/living/carbon/human/species/fennekin
	race = /datum/species/feral/pokemon/fennekin

/datum/species/feral/pokemon/flaaffy
	name = "Feral Flaaffy"
	id = "flaaffy"
	roundstart = TRUE
/mob/living/carbon/human/species/flaaffy
	race = /datum/species/feral/pokemon/flaaffy

/datum/species/feral/pokemon/flareon
	name = "Feral Flareon"
	id = "flareon"
	roundstart = TRUE
/mob/living/carbon/human/species/flareon
	race = /datum/species/feral/pokemon/flareon

/datum/species/feral/pokemon/flygon
	name = "Feral Flygon"
	id = "flygon"
	roundstart = TRUE
/mob/living/carbon/human/species/flygon
	race = /datum/species/feral/pokemon/flygon

/datum/species/feral/pokemon/furret
	name = "Feral Furret"
	id = "furret"
	roundstart = TRUE
/mob/living/carbon/human/species/furret
	race = /datum/species/feral/pokemon/furret

/datum/species/feral/pokemon/furret/shiny
	name = "Feral Shiny Furret"
	id = "furret_shiny"
	roundstart = TRUE
/mob/living/carbon/human/species/furret
	race = /datum/species/feral/pokemon/furret

/datum/species/feral/pokemon/gallade
	name = "Feral Gallade"
	id = "gallade"
	roundstart = TRUE
/mob/living/carbon/human/species/gallade
	race = /datum/species/feral/pokemon/gallade

/datum/species/feral/pokemon/gardevoir
	name = "Feral Gardevoir"
	id = "gardevoir"
	roundstart = TRUE
/mob/living/carbon/human/species/gardevoir
	race = /datum/species/feral/pokemon/gardevoir

/datum/species/feral/pokemon/gastly
	name = "Feral Gastly"
	id = "gastly"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/gastly
	race = /datum/species/feral/pokemon/gastly

/datum/species/feral/pokemon/gengar
	name = "Feral Gengar"
	id = "gengar"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/gengar
	race = /datum/species/feral/pokemon/gengar

/datum/species/feral/pokemon/glaceon
	name = "Feral Glaceon"
	id = "glaceon"
	roundstart = TRUE
/mob/living/carbon/human/species/glaceon
	race = /datum/species/feral/pokemon/glaceon

/datum/species/feral/pokemon/growlithe
	name = "Feral Growlithe"
	id = "growlithe"
	roundstart = TRUE
/mob/living/carbon/human/species/growlithe
	race = /datum/species/feral/pokemon/growlithe

/datum/species/feral/pokemon/haunter
	name = "Feral Haunter"
	id = "haunter"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/haunter
	race = /datum/species/feral/pokemon/haunter

/datum/species/feral/pokemon/jirachi
	name = "Feral Jirachi"
	id = "jirachi"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/jirachi
	race = /datum/species/feral/pokemon/jirachi

/datum/species/feral/pokemon/jolteon
	name = "Feral Jolteon"
	id = "jolteon"
	roundstart = TRUE
/mob/living/carbon/human/species/jolteon
	race = /datum/species/feral/pokemon/jolteon

/datum/species/feral/pokemon/kabuto
	name = "Feral Kabuto"
	id = "Kabuto"
	roundstart = TRUE
/mob/living/carbon/human/species/kabuto
	race = /datum/species/feral/pokemon/kabuto

/datum/species/feral/pokemon/larvitar
	name = "Feral Larvitar"
	id = "larvitar"
	roundstart = TRUE
/mob/living/carbon/human/species/larvitar
	race = /datum/species/feral/pokemon/larvitar

/datum/species/feral/pokemon/lapras
	name = "Feral Lapras"
	id = "lapras"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/lapras
	race = /datum/species/feral/pokemon/lapras

/datum/species/feral/pokemon/leafeon
	name = "Feral Leafeon"
	id = "leafeon"
	roundstart = TRUE
/mob/living/carbon/human/species/leafeon
	race = /datum/species/feral/pokemon/leafeon

/datum/species/feral/pokemon/liepard
	name = "Feral Liepard"
	id = "liepard"
	roundstart = TRUE
/mob/living/carbon/human/species/liepard
	race = /datum/species/feral/pokemon/liepard

/datum/species/feral/pokemon/lickitung
	name = "Feral Lickitung"
	id = "lickitung"
	roundstart = TRUE
/mob/living/carbon/human/species/lickitung
	race = /datum/species/feral/pokemon/lickitung

/datum/species/feral/pokemon/lugia
	name = "Feral Lugia"
	id = "lugia"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pokemon96.dmi'
	simple_icon_width = 96
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/lugia
	race = /datum/species/feral/pokemon/lugia

/datum/species/feral/pokemon/lycanroc
	name = "Feral Lycanroc"
	id = "lycanroc"
	roundstart = TRUE
/mob/living/carbon/human/species/lycanroc
	race = /datum/species/feral/pokemon/lycanroc

/datum/species/feral/pokemon/magicarp
	name = "Feral Magicarp"
	id = "magicarp"
	roundstart = TRUE
/mob/living/carbon/human/species/magicarp
	race = /datum/species/feral/pokemon/magicarp

/datum/species/feral/pokemon/magmar
	name = "Feral Magmar"
	id = "magmar"
	roundstart = TRUE
/mob/living/carbon/human/species/magmar
	race = /datum/species/feral/pokemon/magmar

/datum/species/feral/pokemon/mareep
	name = "Feral Mareep"
	id = "mareep"
	roundstart = TRUE
/mob/living/carbon/human/species/mareep
	race = /datum/species/feral/pokemon/mareep

/datum/species/feral/pokemon/mew
	name = "Feral Mew"
	id = "mew"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/mew
	race = /datum/species/feral/pokemon/mew

/datum/species/feral/pokemon/mewtwo
	name = "Feral Mewtwo"
	id = "mewtwo"
	roundstart = TRUE
/mob/living/carbon/human/species/mewtwo
	race = /datum/species/feral/pokemon/mewtwo

/datum/species/feral/pokemon/mightyena
	name = "Feral Mightyena"
	id = "mightyena"
	roundstart = TRUE
/mob/living/carbon/human/species/mightyena
	race = /datum/species/feral/pokemon/mightyena

/datum/species/feral/pokemon/miltank
	name = "Feral Miltank"
	id = "miltank"
	roundstart = TRUE
/mob/living/carbon/human/species/miltank
	race = /datum/species/feral/pokemon/miltank

/datum/species/feral/pokemon/ninetales
	name = "Feral ninetales"
	id = "ninetales"
	roundstart = TRUE
/mob/living/carbon/human/species/ninetales
	race = /datum/species/feral/pokemon/ninetales

/datum/species/feral/pokemon/omanyte
	name = "Feral Omanyte"
	id = "omanyte"
	roundstart = TRUE
/mob/living/carbon/human/species/omanyte
	race = /datum/species/feral/pokemon/omanyte

/datum/species/feral/pokemon/pikachu
	name = "Feral Pikachu"
	id = "pikachu"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pmon/pikachu.dmi'
/mob/living/carbon/human/species/pikachu
	race = /datum/species/feral/pokemon/pikachu

/datum/species/feral/pokemon/ponyta
	name = "Feral Ponyta"
	id = "ponyta"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_HOOF
/mob/living/carbon/human/species/ponyta
	race = /datum/species/feral/pokemon/ponyta

/datum/species/feral/pokemon/poochyena
	name = "Feral Poochyena"
	id = "poochyena"
	roundstart = TRUE
/mob/living/carbon/human/species/poochyena
	race = /datum/species/feral/pokemon/poochyena

/datum/species/feral/pokemon/purrloin
	name = "Feral Purrloin"
	id = "purrloin"
	roundstart = TRUE
/mob/living/carbon/human/species/purrloin
	race = /datum/species/feral/pokemon/purrloin

/datum/species/feral/pokemon/raichu
	name = "Feral Raichu"
	id = "raichu"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pmon/raichu.dmi'
/mob/living/carbon/human/species/raichu
	race = /datum/species/feral/pokemon/raichu

/datum/species/feral/pokemon/alolanraichu
	name = "Feral Alolan Raichu"
	id = "alolanraichu"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pmon/raichu.dmi'
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/alolanraichu
	race = /datum/species/feral/pokemon/alolanraichu
/*
/datum/species/feral/pokemon/ralts
	name = "Feral Ralts"
	id = "ralts"
	roundstart = TRUE
	footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/ralts
	race = /datum/species/feral/pokemon/ralts
*/
/datum/species/feral/pokemon/raticate
	name = "Feral Raticate"
	id = "raticate"
	roundstart = TRUE
/mob/living/carbon/human/species/raticate
	race = /datum/species/feral/pokemon/raticate

/datum/species/feral/pokemon/rattata
	name = "Feral Rattata"
	id = "rattata"
	roundstart = TRUE
/mob/living/carbon/human/species/rattata
	race = /datum/species/feral/pokemon/rattata

/datum/species/feral/pokemon/rayquaza
	name = "Feral Rayquaza"
	id = "rayquaza"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pokemon96.dmi'
	simple_icon_width = 96
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/rayquaza
	race = /datum/species/feral/pokemon/rayquaza

/datum/species/feral/pokemon/salazzle
	name = "Feral Salazzle"
	id = "salazzle"
	roundstart = TRUE
	simple_icon = 'modular_splurt/icons/mob/pmon/salazzle.dmi'
/mob/living/carbon/human/species/salazzle
	race = /datum/species/feral/pokemon/salazzle

/datum/species/feral/pokemon/skuntank
	name = "Feral Skuntank"
	id = "skuntank"
	roundstart = TRUE
/mob/living/carbon/human/species/skuntank
	race = /datum/species/feral/pokemon/skuntank

/datum/species/feral/pokemon/snivy
	name = "Feral Snivy"
	id = "snivy"
	roundstart = TRUE
/mob/living/carbon/human/species/snivy
	race = /datum/species/feral/pokemon/snivy

/datum/species/feral/pokemon/snorlax
	name = "Feral Snorlax"
	id = "snorlax"
	roundstart = TRUE
/mob/living/carbon/human/species/snorlax
	race = /datum/species/feral/pokemon/snorlax

/datum/species/feral/pokemon/sprigatito
	name = "Feral Sprigatito"
	id = "sprigatito"
	roundstart = TRUE
/mob/living/carbon/human/species/sprigatito
	race = /datum/species/feral/pokemon/sprigatito

/datum/species/feral/pokemon/sylveon
	name = "Feral Sylveon"
	id = "sylveon"
	roundstart = TRUE
/mob/living/carbon/human/species/sylveon
	race = /datum/species/feral/pokemon/sylveon

/datum/species/feral/pokemon/tentacruel
	name = "Feral Tentacruel"
	id = "tentacruel"
	roundstart = TRUE
/mob/living/carbon/human/species/tentacruel
	race = /datum/species/feral/pokemon/tentacruel

/datum/species/feral/pokemon/thievul
	name = "Feral Thievul"
	id = "thievul"
	roundstart = TRUE
/mob/living/carbon/human/species/thievul
	race = /datum/species/feral/pokemon/thievul

/datum/species/feral/pokemon/umbreon
	name = "Feral Umbreon"
	id = "umbreon"
	roundstart = TRUE
/mob/living/carbon/human/species/umbreon
	race = /datum/species/feral/pokemon/umbreon

/datum/species/feral/pokemon/vulpix
	name = "Feral Vulpix"
	id = "vulpix"
	roundstart = TRUE
/mob/living/carbon/human/species/vulpix
	race = /datum/species/feral/pokemon/vulpix

/datum/species/feral/pokemon/alolanvulpix
	name = "Feral Alolan Vulpix"
	id = "alolanvulpix"
	roundstart = TRUE
/mob/living/carbon/human/species/alolanvulpix
	race = /datum/species/feral/pokemon/alolanvulpix

/datum/species/feral/pokemon/vaporeon
	name = "Feral Vaporeon"
	id = "vaporeon"
	roundstart = TRUE
/mob/living/carbon/human/species/vaporeon
	race = /datum/species/feral/pokemon/vaporeon

/datum/species/feral/pokemon/zigzagoon
	name = "Feral Zigzagoon"
	id = "zigzagoon"
	roundstart = TRUE
/mob/living/carbon/human/species/zigzagoon
	race = /datum/species/feral/pokemon/zigzagoon

/datum/species/feral/pokemon/zorua
	name = "Feral Zorua"
	id = "zorua"
	roundstart = TRUE
/mob/living/carbon/human/species/zorua
	race = /datum/species/feral/pokemon/zorua

/datum/species/feral/pokemon/zorua_hisuian
	name = "Feral Hisuian Zorua"
	id = "zorua_hisuian"
	roundstart = TRUE
/mob/living/carbon/human/species/zorua_hisuian
	race = /datum/species/feral/pokemon/zorua_hisuian

/datum/species/feral/pokemon/zoroark
	name = "Feral Zoroark"
	id = "zoroark"
	roundstart = TRUE
/mob/living/carbon/human/species/zoroark
	race = /datum/species/feral/pokemon/zoroark

/datum/species/feral/pokemon/zubat
	name = "Feral Zubat"
	id = "zubat"
	roundstart = TRUE
	//footstep_type = FOOTSTEP_MOB_CRAWL
/mob/living/carbon/human/species/zubat
	race = /datum/species/feral/pokemon/zubat

//
// start of everything else
//

/datum/species/feral/nightstalker
	name = "Feral Nightstalker"
	id = "nightstalker"
	simple_icon = 'modular_splurt/icons/mob/nightstalker.dmi'
	simple_icon_width = 64
	icon_dead_suffix = "-dead"
	icon_rest_suffix = "_rest"
	roundstart = TRUE
	liked_food = MEAT | RAW
/mob/living/carbon/human/species/nightstalker
	race = /datum/species/feral/nightstalker

/datum/species/feral/cat
	name = "Feral Cat"
	id = "cat2"
	simple_icon = 'icons/mob/pets.dmi'
	simple_icon_width = 32
	icon_dead_suffix = "_dead"
	icon_rest_suffix = "_rest"
	roundstart = TRUE
	liked_food = MEAT | RAW
/mob/living/carbon/human/species/cat
	race = /datum/species/feral/cat

/datum/species/feral/black_cat
	name = "Feral Black Cat"
	id = "cat"
	simple_icon = 'icons/mob/pets.dmi'
	simple_icon_width = 32
	icon_dead_suffix = "_dead"
	icon_rest_suffix = "_rest"
	roundstart = TRUE
	liked_food = MEAT | RAW
/mob/living/carbon/human/species/black_cat
	race = /datum/species/feral/black_cat

/datum/species/feral/space_cat
	name = "Feral Space Cat"
	id = "spacecat"
	simple_icon = 'icons/mob/pets.dmi'
	simple_icon_width = 32
	icon_dead_suffix = "_dead"
	icon_rest_suffix = "_rest"
	roundstart = TRUE
	liked_food = MEAT | RAW
/mob/living/carbon/human/species/space_cat
	race = /datum/species/feral/space_cat

/datum/species/feral/wolf
	name = "Feral Wolf"
	id = "wolf"
	simple_icon = 'modular_splurt/icons/mob/dogs.dmi'
	simple_icon_width = 32
	icon_dead_suffix = "_dead"
	icon_rest_suffix = "_rest"
	rotate_on_lying = TRUE
	roundstart = TRUE
	liked_food = MEAT | RAW
/mob/living/carbon/human/species/wolf
	race = /datum/species/feral/wolf

/datum/species/feral/dog
	name = "Feral Dog"
	id = "dog_feral"
	simple_icon = 'modular_splurt/icons/mob/dogs.dmi'
	simple_icon_width = 32
	icon_dead_suffix = "_dead"
	icon_rest_suffix = "_rest"
	rotate_on_lying = TRUE
	roundstart = TRUE
	liked_food = MEAT | RAW
/mob/living/carbon/human/species/dog
	race = /datum/species/feral/dog
