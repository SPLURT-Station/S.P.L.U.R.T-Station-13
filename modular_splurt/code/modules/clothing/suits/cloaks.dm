// Boatcloaks
/obj/item/clothing/neck/cloak/alt/boatcloak
	name = "boatcloak"
	desc = "A simple, short-ish boatcloak."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "boatcloak"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/neck/cloak/alt/boatcloak/command
	name = "command boatcloak"
	desc = "A boatcloak with gold ribbon."
	icon_state = "boatcloak_com"
	body_parts_covered = CHEST|LEGS|ARMS

/obj/item/clothing/neck/cloak/alt/boatcloak/polychromic
	name = "polychromic boatcloak"
	desc = "A polychromic, short-ish boatcloak."
	icon_state = "boatcloak"
	var/list/poly_colors = list("#FCFCFC", "#454F5C", "#CCCEE2")

/obj/item/clothing/neck/cloak/alt/boatcloak/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 3)

/obj/item/clothing/neck/cloak/centcom
	name = "central command's cloak"
	desc = "Worn by High-Ranking Central Command Personnel. I guess they needed one too."
	icon_state = "centcomcloak"
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	armor = list(MELEE = 35, BULLET = 40, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 20, RAD = 20, FIRE = 60, ACID = 60)
	body_parts_covered = CHEST|GROIN|ARMS
	is_edible = 0

/obj/item/clothing/neck/cloak/binary
	name = "Binary cloak"
	icon_state = "binarycloak"
	desc = "A fluffy dark cloak with hexagonal golden patterns covering its right side."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'

/* //doesn't work
/obj/item/clothing/neck/cloak/binary/equipped(mob/user, slot)
	if(slot != ITEM_SLOT_NECK || !isdullahan(user))
		icon_state = "binarycloak"
		return ..()

	icon_state = "binarycloak_dull"

	. = ..()
*/

// Standard Cloaks
/obj/item/clothing/neck/cloak/teshari
	name = "black cloak"
	desc = "It drapes over a Teshari's shoulders and closes at the neck with pockets convienently placed inside."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	icon_state = "tesh_cloak_bn"



/obj/item/clothing/neck/cloak/teshari/standard/black_red
	name = "black and red cloak"
	icon_state = "tesh_cloak_br"

/obj/item/clothing/neck/cloak/teshari/standard/black_orange
	name = "black and orange cloak"
	icon_state = "tesh_cloak_bo"

/obj/item/clothing/neck/cloak/teshari/standard/black_yellow
	name = "black and yellow cloak"
	icon_state = "tesh_cloak_by"

/obj/item/clothing/neck/cloak/teshari/standard/black_green
	name = "black and green cloak"
	icon_state = "tesh_cloak_bgr"

/obj/item/clothing/neck/cloak/teshari/standard/black_blue
	name = "black and blue cloak"
	icon_state = "tesh_cloak_bbl"

/obj/item/clothing/neck/cloak/teshari/standard/black_purple
	name = "black and purple cloak"
	icon_state = "tesh_cloak_bp"

/obj/item/clothing/neck/cloak/teshari/standard/black_pink
	name = "black and pink cloak"
	icon_state = "tesh_cloak_bpi"

/obj/item/clothing/neck/cloak/teshari/standard/black_brown
	name = "black and brown cloak"
	icon_state = "tesh_cloak_bbr"

/obj/item/clothing/neck/cloak/teshari/standard/black_grey
	name = "black and grey cloak"
	icon_state = "tesh_cloak_bg"

/obj/item/clothing/neck/cloak/teshari/standard/black_white
	name = "black and white cloak"
	icon_state = "tesh_cloak_bw"

/obj/item/clothing/neck/cloak/teshari/standard/white
	name = "white cloak"
	icon_state = "tesh_cloak_wn"

/obj/item/clothing/neck/cloak/teshari/standard/white_grey
	name = "white and grey cloak"
	icon_state = "tesh_cloak_wg"

/obj/item/clothing/neck/cloak/teshari/standard/red_grey
	name = "red and grey cloak"
	icon_state = "tesh_cloak_rg"

/obj/item/clothing/neck/cloak/teshari/standard/orange_grey
	name = "orange and grey cloak"
	icon_state = "tesh_cloak_og"

/obj/item/clothing/neck/cloak/teshari/standard/yellow_grey
	name = "yellow and grey cloak"
	icon_state = "tesh_cloak_yg"

/obj/item/clothing/neck/cloak/teshari/standard/green_grey
	name = "green and grey cloak"
	icon_state = "tesh_cloak_gg"

/obj/item/clothing/neck/cloak/teshari/standard/blue_grey
	name = "blue and grey cloak"
	icon_state = "tesh_cloak_blug"

/obj/item/clothing/neck/cloak/teshari/standard/purple_grey
	name = "purple and grey cloak"
	icon_state = "tesh_cloak_pg"

/obj/item/clothing/neck/cloak/teshari/standard/pink_grey
	name = "pink and grey cloak"
	icon_state = "tesh_cloak_pig"

/obj/item/clothing/neck/cloak/teshari/standard/brown_grey
	name = "brown and grey cloak"
	icon_state = "tesh_cloak_brg"

/obj/item/clothing/neck/cloak/teshari/standard/rainbow
	name = "rainbow cloak"
	icon_state = "tesh_cloak_rainbow"

/obj/item/clothing/neck/cloak/teshari/standard/orange
	name = "orange cloak"
	icon_state = "tesh_cloak_on"

/obj/item/clothing/neck/cloak/teshari/standard/dark_retrowave
	name = "dark aesthetic cloak"
	icon_state = "tesh_cloak_dretrowave"

/obj/item/clothing/neck/cloak/teshari/standard/black_glow
	name = "black and glowing cloak"
	icon_state = "tesh_cloak_bglowing"


// Job Cloaks
/obj/item/clothing/neck/cloak/teshari/jobs/cap
	name = "site manager cloak"
	desc = "A soft Teshari cloak made for the Site Manager"
	icon_state = "tesh_cloak_cap"

//Cargo

/obj/item/clothing/neck/cloak/teshari/jobs/qm
	name = "quartermaster cloak"
	desc = "A soft Teshari cloak made for the Quartermaster"
	icon_state = "tesh_cloak_qm"

/obj/item/clothing/neck/cloak/teshari/jobs/cargo
	name = "cargo cloak"
	desc = "A soft Teshari cloak made for the Cargo department"
	icon_state = "tesh_cloak_car"

/obj/item/clothing/neck/cloak/teshari/jobs/mining
	name = "mining cloak"
	desc = "A soft Teshari cloak made for Mining"
	icon_state = "tesh_cloak_mine"

//Engineering

/obj/item/clothing/neck/cloak/teshari/jobs/ce
	name = "cheif engineer cloak"
	desc = "A soft Teshari cloak made the Chief Engineer"
	icon_state = "tesh_cloak_ce"

/obj/item/clothing/neck/cloak/teshari/jobs/engineer
	name = "engineering cloak"
	desc = "A soft Teshari cloak made for the Engineering department"
	icon_state = "tesh_cloak_engie"

/obj/item/clothing/neck/cloak/teshari/jobs/atmos
	name = "atmospherics cloak"
	desc = "A soft Teshari cloak made for the Atmospheric Technician"
	icon_state = "tesh_cloak_atmos"

//Medical

/obj/item/clothing/neck/cloak/teshari/jobs/cmo
	name = "chief medical officer cloak"
	desc = "A soft Teshari cloak made the Cheif Medical Officer"
	icon_state = "tesh_cloak_cmo"

/obj/item/clothing/neck/cloak/teshari/jobs/medical
	name = "medical cloak"
	desc = "A soft Teshari cloak made for the Medical department"
	icon_state = "tesh_cloak_doc"

/obj/item/clothing/neck/cloak/teshari/jobs/chemistry
	name = "chemist cloak"
	desc = "A soft Teshari cloak made for the Chemist"
	icon_state = "tesh_cloak_chem"

/obj/item/clothing/neck/cloak/teshari/jobs/viro
	name = "virologist cloak"
	desc = "A soft Teshari cloak made for the Virologist"
	icon_state = "tesh_cloak_viro"

/obj/item/clothing/neck/cloak/teshari/jobs/para
	name = "paramedic cloak"
	desc = "A soft Teshari cloak made for the Paramedic"
	icon_state = "tesh_cloak_para"

/obj/item/clothing/neck/cloak/teshari/jobs/psych
	name = " psychiatrist cloak"
	desc = "A soft Teshari cloak made for the Psychiatrist"
	icon_state = "tesh_cloak_psych"

//Science

/obj/item/clothing/neck/cloak/teshari/jobs/rd
	name = "research director cloak"
	desc = "A soft Teshari cloak made for the Research Director"
	icon_state = "tesh_cloak_rd"

/obj/item/clothing/neck/cloak/teshari/jobs/sci
	name = "scientist cloak"
	desc = "A soft Teshari cloak made for the Science department"
	icon_state = "tesh_cloak_sci"

/obj/item/clothing/neck/cloak/teshari/jobs/robo
	name = "roboticist cloak"
	desc = "A soft Teshari cloak made for the Roboticist"
	icon_state = "tesh_cloak_robo"

//Security

/obj/item/clothing/neck/cloak/teshari/jobs/hos
	name = "head of security cloak"
	desc = "A soft Teshari cloak made for the Head of Security"
	icon_state = "tesh_cloak_hos"

/obj/item/clothing/neck/cloak/teshari/jobs/sec
	name = "security cloak"
	desc = "A soft Teshari cloak made for the Security department"
	icon_state = "tesh_cloak_sec"

/obj/item/clothing/neck/cloak/teshari/jobs/iaa
	name = "internal affairs cloak"
	desc = "A soft Teshari cloak made for the Internal Affairs Agent"
	icon_state = "tesh_cloak_iaa"

//Service

/obj/item/clothing/neck/cloak/teshari/jobs/hop
	name = "head of personnel cloak"
	desc = "A soft Teshari cloak made for the Head of Personnel"
	icon_state = "tesh_cloak_hop"

/obj/item/clothing/neck/cloak/teshari/jobs/service
	name = "service cloak"
	desc = "A soft Teshari cloak made for the Service department"
	icon_state = "tesh_cloak_serv"

//Misc

/obj/item/clothing/suit/hooded/toggle/labcoat/teshari
	name = "Teshari labcoat"
	desc = "A small suit that protects against minor chemical spills. This one is a good fit on Teshari."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	icon_state = "tesh_labcoat"


/obj/item/clothing/suit/hooded/toggle/tesharicoat
	name = "small black coat"
	desc = "A coat that seems too small to fit a human."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	icon_state = "tesharicoat"



/obj/item/clothing/suit/hooded/toggle/tesharicoatwhite
	name = "small coat"
	desc = "A coat that seems too small to fit a human."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	icon_state = "tesharicoatwhite"



//Hooded teshari cloaks
/obj/item/clothing/suit/hooded/teshari
	name = "Hooded Teshari Cloak"
	desc = "A soft teshari cloak with an added hood."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	icon_state = "tesh_hcloak_bo"




	hoodtype = /obj/item/clothing/head/hooded/tesh_hood


/obj/item/clothing/head/hooded/tesh_hood
	name = "Cloak Hood"
	desc = "A hood attached to a teshari cloak."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	//default_worn_icon = 'icons/inventory/suit/mob_teshari.dmi'
	icon_state = "tesh_hood_bo"



	body_parts_covered = HEAD

/obj/item/clothing/suit/hooded/teshari/standard/black_orange
	name = "black and orange hooded cloak"
	icon_state = "tesh_hcloak_bo"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_orange

/obj/item/clothing/suit/hooded/teshari/standard/black_grey
	name = "black and grey hooded cloak"
	icon_state = "tesh_hcloak_bg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_grey

/obj/item/clothing/suit/hooded/teshari/standard/black_midgrey
	name = "black and medium grey hooded cloak"
	icon_state = "tesh_hcloak_bmg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_midgrey

/obj/item/clothing/suit/hooded/teshari/standard/black_lightgrey
	name = "black and light grey hooded cloak"
	icon_state = "tesh_hcloak_blg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_lightgrey

/obj/item/clothing/suit/hooded/teshari/standard/black_white
	name = "black and white hooded cloak"
	icon_state = "tesh_hcloak_bw"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_white

/obj/item/clothing/suit/hooded/teshari/standard/black_red
	name = "black and red hooded cloak"
	icon_state = "tesh_hcloak_br"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_red

/obj/item/clothing/suit/hooded/teshari/standard/black
	name = "black hooded cloak"
	icon_state = "tesh_hcloak_bn"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black

/obj/item/clothing/suit/hooded/teshari/standard/black_yellow
	name = "black and yellow hooded cloak"
	icon_state = "tesh_hcloak_by"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_yellow

/obj/item/clothing/suit/hooded/teshari/standard/black_green
	name = "black and green hooded cloak"
	icon_state = "tesh_hcloak_bgr"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_green

/obj/item/clothing/suit/hooded/teshari/standard/black_blue
	name = "black and blue hooded cloak"
	icon_state = "tesh_hcloak_bbl"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_blue

/obj/item/clothing/suit/hooded/teshari/standard/black_purple
	name = "black and purple hooded cloak"
	icon_state = "tesh_hcloak_bp"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_purple

/obj/item/clothing/suit/hooded/teshari/standard/black_pink
	name = "black and pink hooded cloak"
	icon_state = "tesh_hcloak_bpi"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_pink

/obj/item/clothing/suit/hooded/teshari/standard/black_brown
	name = "black and brown hooded cloak"
	icon_state = "tesh_hcloak_bbr"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/black_brown

/obj/item/clothing/suit/hooded/teshari/standard/orange_grey
	name = "orange and grey hooded cloak"
	icon_state = "tesh_hcloak_og"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/orange_grey

///obj/item/clothing/suit/hooded/teshari/standard/rainbow
//	name = "rainbow hooded cloak"
//	icon_state = "tesh_hcloak_rainbow"
//	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/rainbow

/obj/item/clothing/suit/hooded/teshari/standard/lightgrey_grey
	name = "light grey and grey hooded cloak"
	icon_state = "tesh_hcloak_lgg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/lightgrey_grey

/obj/item/clothing/suit/hooded/teshari/standard/white_grey
	name = "white and grey hooded cloak"
	icon_state = "tesh_hcloak_wg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/white_grey

/obj/item/clothing/suit/hooded/teshari/standard/red_grey
	name = "red and grey hooded cloak"
	icon_state = "tesh_hcloak_rg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/red_grey

/obj/item/clothing/suit/hooded/teshari/standard/orange
	name = "orange hooded cloak"
	icon_state = "tesh_hcloak_on"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/orange

/obj/item/clothing/suit/hooded/teshari/standard/yellow_grey
	name = "yellow and grey hooded cloak"
	icon_state = "tesh_hcloak_yg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/yellow_grey

/obj/item/clothing/suit/hooded/teshari/standard/green_grey
	name = "green and grey hooded cloak"
	icon_state = "tesh_hcloak_gg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/green_grey

/obj/item/clothing/suit/hooded/teshari/standard/blue_grey
	name = "blue and grey hooded cloak"
	icon_state = "tesh_hcloak_blug"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/blue_grey

/obj/item/clothing/suit/hooded/teshari/standard/purple_grey
	name = "purple and grey hooded cloak"
	icon_state = "tesh_hcloak_pg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/purple_grey

/obj/item/clothing/suit/hooded/teshari/standard/pink_grey
	name = "pink and grey hooded cloak"
	icon_state = "tesh_hcloak_pig"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/pink_grey

/obj/item/clothing/suit/hooded/teshari/standard/brown_grey
	name = "brown and grey hooded cloak"
	icon_state = "tesh_hcloak_brg"
	hoodtype = /obj/item/clothing/head/hooded/tesh_hood/standard/brown_grey

//The actual hoods
/obj/item/clothing/head/hooded/tesh_hood/standard/black_orange
	name = "black and orange cloak hood"
	icon_state = "tesh_hood_bo"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_grey
	name = "black and grey cloak hood"
	icon_state = "tesh_hood_bg"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_midgrey
	name = "black and medium grey cloak hood"
	icon_state = "tesh_hood_bmg"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_lightgrey
	name = "black and light grey cloak hood"
	icon_state = "tesh_hood_blg"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_white
	name = "black and white cloak hood"
	icon_state = "tesh_hood_bw"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_red
	name = "black and red cloak hood"
	icon_state = "tesh_hood_br"

/obj/item/clothing/head/hooded/tesh_hood/standard/black
	name = "black cloak hood"
	icon_state = "tesh_hood_bn"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_yellow
	name = "black and yellow cloak hood"
	icon_state = "tesh_hood_by"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_green
	name = "black and green cloak hood"
	icon_state = "tesh_hood_bgr"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_blue
	name = "black and blue cloak hood"
	icon_state = "tesh_hood_bbl"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_purple
	name = "black and purple cloak hood"
	icon_state = "tesh_hood_bp"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_pink
	name = "black and pink cloak hood"
	icon_state = "tesh_hood_bpi"

/obj/item/clothing/head/hooded/tesh_hood/standard/black_brown
	name = "black and brown cloak hood"
	icon_state = "tesh_hood_bbr"

/obj/item/clothing/head/hooded/tesh_hood/standard/orange_grey
	name = "orange and grey cloak hood"
	icon_state = "tesh_hood_og"

/obj/item/clothing/head/hooded/tesh_hood/standard/rainbow
	name = "rainbow cloak hood"
	icon_state = "tesh_hood_rainbow"

/obj/item/clothing/head/hooded/tesh_hood/standard/lightgrey_grey
	name = "light grey and grey cloak hood"
	icon_state = "tesh_hood_lgg"

/obj/item/clothing/head/hooded/tesh_hood/standard/white_grey
	name = "white and grey cloak hood"
	icon_state = "tesh_hood_wg"

/obj/item/clothing/head/hooded/tesh_hood/standard/red_grey
	name = "red and grey cloak hood"
	icon_state = "tesh_hood_rg"

/obj/item/clothing/head/hooded/tesh_hood/standard/orange
	name = "orange cloak hood"
	icon_state = "tesh_hood_on"

/obj/item/clothing/head/hooded/tesh_hood/standard/yellow_grey
	name = "yellow and grey cloak hood"
	icon_state = "tesh_hood_yg"

/obj/item/clothing/head/hooded/tesh_hood/standard/green_grey
	name = "green and grey cloak hood"
	icon_state = "tesh_hood_gg"

/obj/item/clothing/head/hooded/tesh_hood/standard/blue_grey
	name = "blue and grey cloak hood"
	icon_state = "tesh_hood_blug"

/obj/item/clothing/head/hooded/tesh_hood/standard/purple_grey
	name = "purple and grey cloak hood"
	icon_state = "tesh_hood_pg"

/obj/item/clothing/head/hooded/tesh_hood/standard/pink_grey
	name = "pink and grey cloak hood"
	icon_state = "tesh_hood_pig"

/obj/item/clothing/head/hooded/tesh_hood/standard/brown_grey
	name = "brown and grey cloak hood"
	icon_state = "tesh_hood_brg"

//Belted cloaks
/obj/item/clothing/suit/hooded/teshari/beltcloak
	name = "belted cloak"
	desc = "A more ridged and stylized Teshari cloak."
	icon = 'modular_splurt/icons/mob/clothing/species/teshari/tesh_items.dmi'
	icon_state = "tesh_beltcloak_bo"



/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_orange
	name = "black belted cloak (orange)"
	icon_state = "tesh_beltcloak_bo"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_grey
	name = "black belted cloak"
	icon_state = "tesh_beltcloak_bg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_midgrey
	name = "black belted cloak (medium grey)"
	icon_state = "tesh_beltcloak_bmg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_lightgrey
	name = "black belted cloak (light grey)"
	icon_state = "tesh_beltcloak_blg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_white
	name = "black belted cloak (white)"
	icon_state = "tesh_beltcloak_bw"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_red
	name = "black belted cloak (red)"
	icon_state = "tesh_beltcloak_br"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black
	name = "black simple belted cloak"
	icon_state = "tesh_beltcloak_bn"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_yellow
	name = "black belted cloak (yellow)"
	icon_state = "tesh_beltcloak_by"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_green
	name = "black belted cloak (green)"
	icon_state = "tesh_beltcloak_bgr"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_blue
	name = "black belted cloak (blue)"
	icon_state = "tesh_beltcloak_bbl"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_purple
	name = "black belted cloak (purple)"
	icon_state = "tesh_beltcloak_bp"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_pink
	name = "black belted cloak (pink)"
	icon_state = "tesh_beltcloak_bpi"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/black_brown
	name = "black belted cloak (brown)"
	icon_state = "tesh_beltcloak_bbr"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/orange_grey
	name = "orange belted cloak"
	icon_state = "tesh_beltcloak_og"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/rainbow
	name = "rainbow belted cloak"
	icon_state = "tesh_beltcloak_rainbow"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/lightgrey_grey
	name = "light grey belted cloak"
	icon_state = "tesh_beltcloak_lgg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/white_grey
	name = "white belted cloak"
	icon_state = "tesh_beltcloak_wg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/red_grey
	name = "red belted cloak"
	icon_state = "tesh_beltcloak_rg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/orange
	name = "orange simple belted cloak"
	icon_state = "tesh_beltcloak_on"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/yellow_grey
	name = "yellow belted cloak"
	icon_state = "tesh_beltcloak_yg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/green_grey
	name = "green belted cloak"
	icon_state = "tesh_beltcloak_gg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/blue_grey
	name = "blue belted cloak"
	icon_state = "tesh_beltcloak_blug"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/purple_grey
	name = "purple belted cloak"
	icon_state = "tesh_beltcloak_pg"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/pink_grey
	name = "pink belted cloak"
	icon_state = "tesh_beltcloak_pig"

/obj/item/clothing/suit/hooded/teshari/beltcloak/standard/brown_grey
	name = "brown belted cloak"
	icon_state = "tesh_beltcloak_brg"

//Belted job cloaks
/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/cargo
	name = "cargo belted cloak"
	desc = "A soft Teshari cloak made for the Cargo department"
	icon_state = "tesh_beltcloak_car"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/mining
	name = "mining belted cloak"
	desc = "A soft Teshari cloak made for Mining"
	icon_state = "tesh_beltcloak_mine"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/command
	name = "command belted cloak"
	desc = "A soft Teshari cloak made for the Command department"
	icon_state = "tesh_beltcloak_comm"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/ce
	name = "chief engineer belted cloak"
	desc = "A soft Teshari cloak made the Chief Engineer"
	icon_state = "tesh_beltcloak_ce"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/engineer
	name = "engineering belted cloak"
	desc = "A soft Teshari cloak made for the Engineering department"
	icon_state = "tesh_beltcloak_engie"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/atmos
	name = "atmospherics belted cloak"
	desc = "A soft Teshari cloak made for the Atmospheric Technician"
	icon_state = "tesh_beltcloak_atmos"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/cmo
	name = "chief medical officer belted  cloak"
	desc = "A soft Teshari cloak made the Chief Medical Officer"
	icon_state = "tesh_beltcloak_cmo"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/medical
	name = "medical belted cloak"
	desc = "A soft Teshari cloak made for the Medical department"
	icon_state = "tesh_beltcloak_doc"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/chemistry
	name = "chemist belted cloak"
	desc = "A soft Teshari cloak made for the Chemist"
	icon_state = "tesh_beltcloak_chem"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/viro
	name = "virologist belted cloak"
	desc = "A soft Teshari cloak made for the Virologist"
	icon_state = "tesh_beltcloak_viro"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/para
	name = "paramedic belted cloak"
	desc = "A soft Teshari cloak made for the Paramedic"
	icon_state = "tesh_beltcloak_para"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/sci
	name = "scientist belted cloak"
	desc = "A soft Teshari cloak made for the Science department"
	icon_state = "tesh_beltcloak_sci"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/robo
	name = "roboticist belted cloak"
	desc = "A soft Teshari cloak made for the Roboticist"
	icon_state = "tesh_beltcloak_robo"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/sec
	name = "security belted cloak"
	desc = "A soft Teshari cloak made for the Security department"
	icon_state = "tesh_beltcloak_sec"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/qm
	name = "quartermaster belted cloak"
	desc = "A soft Teshari cloak made for the Quartermaster"
	icon_state = "tesh_beltcloak_qm"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/service
	name = "service belted cloak"
	desc = "A soft Teshari cloak made for the Service department"
	icon_state = "tesh_beltcloak_serv"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/iaa
	name = "internal affairs belted cloak"
	desc = "A soft Teshari cloak made for the Internal Affairs Agent"
	icon_state = "tesh_beltcloak_iaa"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/wrdn
	name = "warden belted cloak"
	desc = "A soft Teshari cloak made for the Warden"
	icon_state = "tesh_beltcloak_wrdn"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/hos
	name = "security chief belted cloak"
	desc = "A soft Teshari cloak made for the Head of Security"
	icon_state = "tesh_beltcloak_hos"

/obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/jani
	name = "janitor belted cloak"
	desc = "A soft Teshari cloak made for the Janitor"
	icon_state = "tesh_beltcloak_jani"

