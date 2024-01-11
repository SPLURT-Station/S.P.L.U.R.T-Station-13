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
	unique_reskin = list(
		"Default" = list("icon_state" = "sawnshotgun"),
		"Dark Red Finish" = list("icon_state" = "sawnshotgun-d"),
		"Ash" = list("icon_state" = "sawnshotgun-f"),
		"Faded Grey" = list("icon_state" = "sawnshotgun-g"),
		"Maple" = list("icon_state" = "sawnshotgun-l"),
		"Rosewood" = list("icon_state" = "sawnshotgun-p")
	)

// Rifles

/obj/item/gun/ballistic/shotgun/huntingrifle
	name = "cheap hunting rifle (.308)"
	desc = "A cheap hunting rifle chambered .308."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "308"
	item_state = "308"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound = "sound/weapons/Gunshot4.ogg"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/hunting
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	sawn_desc = "A cheap hunting rifle that bubba got ahold of."
	can_bayonet = TRUE
	bayonet_diagonal = TRUE
	knife_x_offset = 25
	knife_y_offset = 26

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

/obj/item/gun/ballistic/shotgun/leveraction
	sawn_desc = "A short stubby lever gun, like that of a female horse's leg."


/obj/item/gun/ballistic/shotgun/leveraction/attackby(obj/item/A, mob/user, params)
	..()
	if(A.tool_behaviour == TOOL_SAW || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/shotgun/brush
	name = "brush gun (.45-70 GOVT)"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'

/obj/item/gun/ballistic/shotgun/brush2
	name = "brush gun (.45 Long)"
	desc = "While lever-actions have been horribly out of date for hundreds of years now, \
	putting a nicely sized hole in a man-sized target with a .45 Long round has stayed relatively timeless."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "brushgun"
	item_state = "leveraction"
	fire_sound = "sound/weapons/revolvershot.ogg"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/levergun/brush2

/obj/item/gun/ballistic/shotgun/brush2/attack_self(mob/living/user)
	if(recentpump > world.time)
		return
	if(IS_STAMCRIT(user))//CIT CHANGE - makes pumping shotguns impossible in stamina softcrit
		to_chat(user, span_warning("You're too exhausted for that."))//CIT CHANGE - ditto
		return//CIT CHANGE - ditto
	pump(user, TRUE)
	if(HAS_TRAIT(user, TRAIT_FAST_PUMP))
		recentpump = world.time + 2
	else
		if(!user.UseStaminaBuffer(2, warn = TRUE))
			return
		recentpump = world.time + 5

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

/obj/item/gun/ballistic/shotgun/hunting/on_sawoff(mob/user)
	magazine.max_ammo-- // sawing off drops from 4+1 to 3+1

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

/datum/crafting_recipe/brushgunassemble
	name = "Assemble brush gun"
	result = /obj/item/gun/ballistic/shotgun/brush2
	reqs = list(/obj/item/gunpart/riflebrush2stock = 1,
				/obj/item/gunpart/riflebrush2barrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/huntingshotgunassemble
	name = "Assemble hunting shogun"
	result = /obj/item/gun/ballistic/shotgun/hunting
	reqs = list(/obj/item/gunpart/shotgunhutningstock = 1,
				/obj/item/gunpart/shotgunhutningbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
