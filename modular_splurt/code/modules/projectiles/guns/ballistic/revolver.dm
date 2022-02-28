/obj/item/gun/ballistic/revolver/doublebarrel
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'

/obj/item/gun/ballistic/revolver/detective
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'

/obj/item/gun/ballistic/revolver/detective/Initialize()
	var/list/extra_reskin = list(
						"Fitz Special" = "detective_fitz",
						"Police Positive Special" = "detective_police",
						"Blued Steel" = "detective_blued",
						"Stainless Steel" = "detective_stainless",
						"Deckard Revolver" = "detective_bladerunner"
						)
	LAZYADD(unique_reskin, extra_reskin)
	. = ..()

/obj/item/gun/ballistic/revolver/r22lr
	name = "\improper .22 Revolver"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	desc = "A cheap .22LR Revolver. Pray the timing keeps."
	icon_state = "22revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev22lr

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

