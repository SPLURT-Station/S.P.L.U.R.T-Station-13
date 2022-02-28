/obj/item/gun/ballistic/shotgun
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'

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

/obj/item/gun/ballistic/revolver/doublebarrel/sawn //a dedicated sawn off shotgun for crates and what not
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
	unique_reskin = list("Default" = "sawnshotgun",
						"Dark Red Finish" = "sawnshotgun-d",
						"Ash" = "sawnshotgun-f",
						"Faded Grey" = "sawnshotgun-g",
						"Maple" = "sawnshotgun-l",
						"Rosewood" = "sawnshotgun-p"
						)

// Rifles

/obj/item/gun/ballistic/shotgun/huntingrifle
	name = "cheap hunting rifle (7.62mm)"
	desc = "A cheap hunting rifle chambered 7.62mm."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "308"
	item_state = "308"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound = "sound/weapons/Gunshot4.ogg"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	sawn_desc = "A cheap hunting rifle that bubba got ahold of."

/obj/item/gun/ballistic/shotgun/huntingrifle/attackby(obj/item/A, mob/user, params)
	..()
	if(A.tool_behaviour == TOOL_SAW || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/shotgun/varmintrifle
	name = "cheap varmint rifle (.22)"
	desc = "A cheap varmint rifle chambered in .22 Long rifle. It has a nonremovable magazine"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "varmint_rifle"
	item_state = "varmintrifle"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound = "sound/weapons/Gunshot2.ogg"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/varmitrifle
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM

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

/datum/crafting_recipe/riflehuntingassemble
	name = "Assemble hunting rifle"
	result = /obj/item/gun/ballistic/shotgun/huntingrifle
	reqs = list(/obj/item/gunpart/rifle308sotck = 1,
				/obj/item/gunpart/rifle308barrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/riflevarmintassemble
	name = "Assemble varmint rifle"
	result = /obj/item/gun/ballistic/shotgun/varmintrifle
	reqs = list(/obj/item/gunpart/riflevarmintsotck = 1,
				/obj/item/gunpart/riflevarmintbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/doublebarrelsawnassemble
	name = "Assemble sawn off double barrel shotgun"
	result = /obj/item/gun/ballistic/revolver/doublebarrel/sawn
	reqs = list(/obj/item/gunpart/shotgunstock = 1,
				/obj/item/gunpart/shotgunbarrelsawn = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/doublebarrelassemble
	name = "Assemble double barrel shotgun"
	result = /obj/item/gun/ballistic/revolver/doublebarrel
	reqs = list(/obj/item/gunpart/shotgunstock = 1,
				/obj/item/gunpart/shotgunbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
