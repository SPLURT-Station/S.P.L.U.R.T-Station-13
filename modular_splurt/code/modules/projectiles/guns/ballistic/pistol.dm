/obj/item/gun/ballistic/automatic/pistol/enforcer
	name = "\improper Mk. 58 Enforcer (.45)"
	desc = "A polymer frame pistol made by Nanotreason. Won't show up on Space port X-rays and cost more then you make in a month."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "enforcer_black"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/e45
	can_suppress = FALSE
	can_flashlight = 1
	flight_x_offset = 18
	flight_y_offset = 14
	obj_flags = UNIQUE_RENAME

	unique_reskin = list(
		"Default" = list("icon_state" = "enforcer_black"),
		"M2611 Enforcer" = list("icon_state" = "cde"),
		"M1911 Enforcer" = list("icon_state" = "m1911"),
		"VP78 Enforcer" = list("icon_state" = "vp78"),
		"USP Enforcer" = list("icon_state" = "usp-m")
	)

/obj/item/gun/ballistic/automatic/pistol/enforcer/update_icon_state()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]["icon_state"]][chambered ? "" : "-e"]"
	else
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/enforcerred
	name = "\improper HOS's Mk. 58 Enforcer (.45)"
	desc = "A polymer frame pistol made by Nanotreason. Won't show up on Space port X-rays and cost more then you make in a month. Respect mah Authorita!"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "enforcer_red"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/e45
	can_suppress = FALSE
	can_flashlight = 1
	flight_x_offset = 18
	flight_y_offset = 14

/obj/item/gun/ballistic/automatic/pistol/enforcerred/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"


/obj/item/gun/ballistic/automatic/pistol/enforcergold
	name = "\improper Gold Mk. 58 Enforcer (.45)"
	desc = "A titianium gold plated Enforcer. A vulger display of power. A show of force in a public execution."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "enforcer_gold"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/e45
	can_suppress = FALSE
	can_flashlight = 1
	flight_x_offset = 18
	flight_y_offset = 14

/obj/item/gun/ballistic/automatic/pistol/enforcergold/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/m9mmpistol
	name = "\improper Cheap 9mm Handgun"
	desc = "An extremly cheap 9mm handgun produced by M&A Firearms."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "ninemil"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m9
	can_suppress = FALSE
	obj_flags = UNIQUE_RENAME
	unique_reskin = list(
		"Default" = list("icon_state" = "ninemil"),
		"Maria" = list("icon_state" = "maria")
	)

/obj/item/gun/ballistic/automatic/pistol/m9mmpistol/update_icon_state()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]["icon_state"]][chambered ? "" : "-e"]"
	else
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/m9mmpistol/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/m22pistol
	name = "\improper Cheap .22 Handgun"
	desc = "An extremly cheap .22 handgun produced by a Martain weapons maker. Great for mouse hunting, not much else."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "silenced22"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m22
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/pistol/m22pistol/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"


/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "\improper Desert Eagle (.50 AE)"


/obj/item/gun/ballistic/automatic/pistol/deagle2
	name = "\improper Desert Eagle (.357)"
	desc = "A robust .357 Magnum handgun."
	icon_state = "deagle"
	force = 14
	mag_type = /obj/item/ammo_box/magazine/m357
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	obj_flags = UNIQUE_RENAME

	unique_reskin = list(
		"Default" = list("icon_state" = "deagle"),
		"Desert Eagle Gold" = list("icon_state" = "deagleg"),
		"Desert Eagle Camo" = list("icon_state" = "deaglecamo")
	)

/obj/item/gun/ballistic/automatic/pistol/deagle2/update_overlays()
	. = ..()
	if(magazine)
		. += "deagle_magazine"

/obj/item/gun/ballistic/automatic/pistol/deagle2/update_icon_state()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]["icon_state"]][chambered ? "" : "-e"]"
	else
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/deagle2/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/luger/mag
	spawnwithmagazine = TRUE

//gun parts

/obj/item/gunpart //the parent
	name = "generic gun part"
	icon_state = "shotstock"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	item_state = "assembly"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "generic gun part is generic."
	force = 3
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 5
	throw_speed = 3
	throw_range = 6
	hitsound = 'sound/weapons/genhit.ogg'
	attack_verb = list("stubbed", "poked")
	resistance_flags = NONE

/obj/item/gunpart/pistol22frame
	name = ".22 pistol frame"
	desc = "a .22 pistol frame"
	icon_state = "silenced22frame"

/obj/item/gunpart/pistol22barrel
	name = ".22 pistol barrel"
	desc = "a .22 pistol barrel"
	icon_state = "silenced22barrel"

/obj/item/gunpart/pistol22bolt
	name = ".22 pistol bolt"
	desc = "a .22 pistol bolt"
	icon_state = "silenced22bolt"

/obj/item/gunpart/pistol9frame
	name = "9mm pistol frame"
	desc = "a 9mm pistol frame"
	icon_state = "ninemilframe"

/obj/item/gunpart/pistol9slide
	name = "9mm pistol slide"
	desc = "a 9mm pistol slide and barrel"
	icon_state = "ninemilslide"

/datum/crafting_recipe/pistol22assemble
	name = "Assemble .22 Pistol"
	result = /obj/item/gun/ballistic/automatic/pistol/m22pistol
	reqs = list(/obj/item/gunpart/pistol22frame = 1,
				/obj/item/gunpart/pistol22barrel = 1,
				/obj/item/gunpart/pistol22bolt = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/pistol9assemble
	name = "Assemble 9mm Pistol"
	result = /obj/item/gun/ballistic/automatic/pistol/m9mmpistol/nomag
	reqs = list(/obj/item/gunpart/pistol9frame = 1,
				/obj/item/gunpart/pistol9slide = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
