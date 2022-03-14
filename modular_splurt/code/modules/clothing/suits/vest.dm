/obj/item/clothing/suit/brigdoc
	name = "brig physician vest"
	desc = "A dark red vests for brig physicians."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "brigphysicianvest"
	item_state = "brigphysicianvest"
	armor = list("melee" = 20, "bullet" = 0, "laser" = 0, "energy" = 10, "bomb" = 0, "bio" = 50, "rad" = 0, "fire" = 50, "acid" = 50)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/scalpel, /obj/item/surgical_drapes, /obj/item/cautery, /obj/item/hemostat, /obj/item/retractor, /obj/item/analyzer,/obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/hypospray/mkii, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/soap, /obj/item/sensor_device)

/obj/item/clothing/suit/brigdoc/labcoat
	name = "brig physician lab coat"
	desc = "A dark red labcoat for brig physicians."
	icon_state = "secmed_labcoat"
	item_state = "secmed_labcoat"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi' //its in a seperate file

/obj/item/clothing/suit/brigdoc/armor
	name = "brig physician armored coat"
	desc = "A dark red labcoat with armored vest for brig physicians. Used for hostile work enviroments."
	icon_state = "secmed_armor"
	item_state = "secmed_armor"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 0, "bio" = 40, "rad" = 0, "fire" = 50, "acid" = 40)

/obj/item/clothing/suit/armor/vest/bluesheid
	name = "blueshield armored vest"
	desc = "A lightweight vest with a blueshield on it."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "blueshield"
	item_state = "blueshield"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90, "wound" = 10)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/armor/vest/bluesheid/coat
	name = "blueshield armored coat"
	desc = "A fastional piece of armored style."
	icon_state = "blueshieldcoat"
	item_state = "blueshieldcoat"

/obj/item/clothing/suit/fakearmor/press
	name = "press 'armored' vest"
	desc = "A lightweight vest for reporting on security. It makes you feel protected, even if the armor plates are missing."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "press_armor"
	item_state = "press_armor"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/peacekeeper
	name = "peacekeeper armored vest"
	desc = "A Type I armored vest that provides decent protection against most types of damage. This one is used by the peace minded officer"
	icon_state = "peacekeeper_black"
	item_state = "peacekeeper_black"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/metrocop
	name = "civil protection armored vest"
	desc = "You feel like this may not stop a scienctist armed with nothing but a crowbar."
	icon_state = "metrocop_armor"
	item_state = "metrocop_armor"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/warden/peacekeeper
	name = "warden's peacekeeper armored trenchcoat"
	desc = "A heavy trench coat with a armored vest sown into it. Used by the peace minded warden"
	icon_state = "peacekeeper_trench_warden"
	item_state = "peacekeeper_trench_warden"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/armor/hos/peacekeeper
	name = "head of secuirty's peacekeeper armored trenchcoat"
	desc = "A heavy trench coat with a armored vest sown into it. Used by the peace minded head of secuirty"
	icon_state = "peacekeeper_trench_hos"
	item_state = "peacekeeper_trench_hos"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
