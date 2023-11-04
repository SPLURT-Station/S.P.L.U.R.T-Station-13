/obj/item/gun/ballistic/revolver/detective/Initialize()
	var/list/extra_reskin = list(
						"Fitz Special" = list("icon_state" = "detective_fitz"),
						"Police Positive Special" = list("icon_state" = "detective_police"),
						"Blued Steel" = list("icon_state" = "detective_blued"),
						"Stainless Steel" = list("icon_state" = "detective_stainless"),
						"Deckard Revolver" = list("icon_state" = "detective_bladerunner")
	)
	LAZYADD(unique_reskin, extra_reskin)
	. = ..()

/obj/item/gun/ballistic/revolver/r22lr
	name = "\improper .22 Revolver"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	desc = "A cheap .22LR Revolver. Pray the timing keeps."
	icon_state = "22revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev22lr

/obj/item/gun/ballistic/revolver/r45l
	name = "\improper .45 Long Revolver"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	desc = "A cheap .45 Long Revolver. Pray the timing keeps."
	icon_state = "45revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev45l
	obj_flags = UNIQUE_RENAME

	unique_reskin = list(
		"Default" = list("icon_state" = "45revolver"),
		"Cowboy" = list("icon_state" = "357colt"),
		"Lucky" = list("icon_state" = "lucky") //Well do ya?
	)

/obj/item/gunpart/revolver22frame
	name = ".22 revolver frame"
	desc = "a .22 revolver frame"
	icon_state = "22revolverframe"

/obj/item/gunpart/revolver22cylinder
	name = ".22 revolver cylinder"
	desc = "a .22 revolver cylinder"
	icon_state = "22revolvercylinder"

/datum/crafting_recipe/revolver22assemble
	name = "Assemble .22 revolver"
	result = /obj/item/gun/ballistic/revolver/r22lr
	reqs = list(/obj/item/gunpart/revolver22frame = 1,
				/obj/item/gunpart/revolver22cylinder = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/obj/item/gunpart/revolver45frame
	name = ".45 revolver frame"
	desc = "a .45 revolver frame"
	icon_state = "45revolverframe"

/obj/item/gunpart/revolver45cylinder
	name = ".45 revolver cylinder"
	desc = "a .45 revolver cylinder"
	icon_state = "45revolvercylinder"

/datum/crafting_recipe/revolver45assemble
	name = "Assemble .45 revolver"
	result = /obj/item/gun/ballistic/revolver/r45l
	reqs = list(/obj/item/gunpart/revolver45frame = 1,
				/obj/item/gunpart/revolver45cylinder = 1)
	tools = list(TOOL_SCREWDRIVER)
	time = 50
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

