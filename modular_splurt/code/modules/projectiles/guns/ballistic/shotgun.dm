/obj/item/gun/ballistic/shotgun/hunting
	name = "cheap hunting shotgun"
	desc = "A cheap hunting shotgun."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "hunting"
	item_state = "shotgun"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/shot
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	sawn_desc = "A cheap hunting shotgun that bubba got ahold of."

/obj/item/gun/ballistic/rifle/hunting/on_sawoff(mob/user)
	magazine.max_ammo-- // sawing off drops from 4+1 to 3+1

/obj/item/gun/ballistic/shotgun/shorty //for spawn in the armory
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	name = "super shorty shotgun"
	desc = "A sturdy shotgun with a short magazine, design to be compact and portable at the cost of ammunition capacity."
	icon_state = "shortshotgun"
	fire_delay = 7
	mag_type = /obj/item/ammo_box/magazine/internal/shot/supershort
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	weapon_weight = WEAPON_LIGHT

/obj/item/gun/ballistic/shotgun/doublebarrel/sawn //a dedicated sawn off shotgun for crates and what not
	name = "sawn-off double-barreled shotgun"
	desc = "Omar's coming!"
	icon_state = "sawnshotgun"
	item_state = "sawnshotgun"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	force = 10
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	obj_flags = UNIQUE_RENAME
	unique_reskin = list(
		"Default" = list("icon_state" = "sawnshotgun"),
		"Dark Red Finish" = list("icon_state" = "sawnshotgun-d"),
		"Ash" = list("icon_state" = "sawnshotgun-f"),
		"Faded Grey" = list("icon_state" = "sawnshotgun-g"),
		"Maple" = list("icon_state" = "sawnshotgun-l"),
		"Rosewood" = list("icon_state" = "sawnshotgun-p")
	)

/obj/item/gun/ballistic/automatic/rrcshotgun
	name = "RRC Shotgun"
	desc = "The rapid response combat shotgun is the perfect answer for the old dilema 'how many people can you kill in a corridor using a single burst', ps. shells are cosmetic only."
	icon = 'modular_splurt/icons/obj/guns/vhariik.dmi'
	icon_state = "eshotgunr"
	item_state = "eshotgr"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_delay = 2
	burst_size = 3
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'sound/weapons/gunshotshotgunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/rrcmag

/obj/item/gun/ballistic/shotgun/eshotgun
	name = "Energy Shotgun"
	desc = "Look, the 'energy' part was just to boost sales, but it looks hella cool doesn't?."
	icon = 'modular_splurt/icons/obj/guns/vhariik.dmi'
	icon_state = "eshotgun"
	item_state = "eshotg"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_delay = 3
	mag_type = /obj/item/ammo_box/magazine/internal/shot/eshotty
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'sound/weapons/gunshotshotgunshot.ogg'

/obj/item/gunpart/rifle308sotck
	name = "hunting rifle stock"
	desc = "a hunting rifle stock"
	icon_state = "308stock"

/obj/item/gunpart/rifle308barrel
	name = "hunting rifle barrel assmebly"
	desc = "a hunting rifle barrel and bolt"
	icon_state = "308barrel"

/obj/item/gunpart/riflevarmintsotck
	name = "varmint rifle stock"
	desc = "a varmit rifle stock"
	icon_state = "varmint_riflestock"

/obj/item/gunpart/riflevarmintbarrel
	name = "varmint rifle barrel assebmly"
	desc = "a varmint rifle barrel and bolt"
	icon_state = "308barrel"

/obj/item/gunpart/shotgunstock
	name = "shotgun stock"
	desc = "a shotgun stock for double barrel shotguns"

/obj/item/gunpart/shotgunbarrel
	name = "double barrel shotgun assembly"
	desc = "a double barrel shotgun assembly"
	icon_state = "shotbarrel"

/obj/item/gunpart/shotgunbarrelsawn
	name = "sawn double barrel shotgun assembly"
	desc = "a pre-sawn double barrel shotgun assembly"
	icon_state = "sawnshotbarrel"

/obj/item/gunpart/riflebrush2stock
	name = "brush gun furniture"
	desc = "a brush gun stock and foregrip"
	icon_state = "brushgunstock"

/obj/item/gunpart/riflebrush2barrel
	name = "brush gun assembly"
	desc = "a brush gun barrel and fire control assembly"
	icon_state = "brushgunframe"

/obj/item/gunpart/shotgunhutningstock
	name = "hunting shotgun furniture"
	desc = "a hunting shotgun stock and foregrip"
	icon_state = "huntingstock"

/obj/item/gunpart/shotgunhutningbarrel
	name = "hunting shotgun assembly"
	desc = "a hunting shotgun barrel and fire control assembly"
	icon_state = "huntingframe"

/datum/crafting_recipe/doublebarrelsawnassemble
	name = "Assemble sawn off double barrel shotgun"
	result = /obj/item/gun/ballistic/shotgun/doublebarrel/sawn
	reqs = list(/obj/item/gunpart/shotgunstock = 1,
				/obj/item/gunpart/shotgunbarrelsawn = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/doublebarrelassemble
	name = "Assemble double barrel shotgun"
	result = /obj/item/gun/ballistic/shotgun/doublebarrel
	reqs = list(/obj/item/gunpart/shotgunstock = 1,
				/obj/item/gunpart/shotgunbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/huntingshotgunassemble
	name = "Assemble hunting shogun"
	result = /obj/item/gun/ballistic/rifle/hunting
	reqs = list(/obj/item/gunpart/shotgunhutningstock = 1,
				/obj/item/gunpart/shotgunhutningbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
