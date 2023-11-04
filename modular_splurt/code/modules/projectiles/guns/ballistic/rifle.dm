////////////
// RIFLES //
////////////

/obj/item/gun/ballistic/rifle/huntingrifle
	name = "cheap hunting rifle (.308)"
	desc = "A cheap hunting rifle chambered .308."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "308"
	item_state = "308"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound = "sound/weapons/rifleshot.ogg"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/hunting
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	sawn_desc = "A cheap hunting rifle that bubba got ahold of."
	can_bayonet = TRUE
	bayonet_diagonal = TRUE
	knife_x_offset = 25
	knife_y_offset = 26

/obj/item/gun/ballistic/rifle/huntingrifle/attackby(obj/item/A, mob/user, params)
	..()
	if(A.tool_behaviour == TOOL_SAW || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/rifle/varmintrifle
	name = "cheap varmint rifle (.22)"
	desc = "A cheap varmint rifle chambered in .22 Long rifle. It has a nonremovable magazine"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "varmint_rifle"
	item_state = "varmintrifle"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound = "sound/weapons/rifleshot.ogg"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/varmitrifle
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM

/obj/item/gun/ballistic/rifle/leveraction
	sawn_desc = "A short stubby lever gun, like that of a female horse's leg."


/obj/item/gun/ballistic/rifle/leveraction/attackby(obj/item/A, mob/user, params)
	..()
	if(A.tool_behaviour == TOOL_SAW || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/rifle/brush
	name = "brush gun (.45-70 GOVT)"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'

/obj/item/gun/ballistic/rifle/brush2
	name = "brush gun (.45 Long)"
	desc = "While lever-actions have been horribly out of date for hundreds of years now, \
	putting a nicely sized hole in a man-sized target with a .45 Long round has stayed relatively timeless."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "brushgun"
	item_state = "leveraction"
	fire_sound = "sound/weapons/rifleshot.ogg"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/levergun/brush2

/datum/crafting_recipe/riflehuntingassemble
	name = "Assemble hunting rifle"
	result = /obj/item/gun/ballistic/rifle/huntingrifle
	reqs = list(/obj/item/gunpart/rifle308sotck = 1,
				/obj/item/gunpart/rifle308barrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/riflevarmintassemble
	name = "Assemble varmint rifle"
	result = /obj/item/gun/ballistic/rifle/varmintrifle
	reqs = list(/obj/item/gunpart/riflevarmintsotck = 1,
				/obj/item/gunpart/riflevarmintbarrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/brushgunassemble
	name = "Assemble brush gun"
	result = /obj/item/gun/ballistic/rifle/brush2
	reqs = list(/obj/item/gunpart/riflebrush2stock = 1,
				/obj/item/gunpart/riflebrush2barrel = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
