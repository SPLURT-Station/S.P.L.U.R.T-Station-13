#define HEAD_ACCESSORIES_PATHS list(\
							/obj/item/clothing/head = 'icons/mob/clothing/head.dmi',\
							/obj/item/clothing/glasses = 'icons/mob/clothing/eyes.dmi',\
							/obj/item/reagent_containers/glass/bucket = 'icons/mob/clothing/head.dmi',\
							/obj/item/reagent_containers/rag/towel = 'icons/mob/clothing/head.dmi',\
							/obj/item/paper = 'icons/mob/clothing/head.dmi',\
							/obj/item/nullrod/fedora = 'icons/mob/clothing/head.dmi',\
							)

/obj/item/organ/eyes/dullahan
	tint = 0

/datum/component/neckfire
	var/mutable_appearance/neck_fire

	var/color

	var/obj/effect/dummy/luminescent_glow/glowth //shamelessly copied from glowy which copied luminescents

	var/light = 1
	var/is_glowing = FALSE

/datum/component/neckfire/Initialize(fire_color)
	. = ..()
	if(!HAS_TRAIT(parent, TRAIT_DULLAHAN))
		return COMPONENT_INCOMPATIBLE
	neck_fire = mutable_appearance('modular_splurt/icons/mob/dullahan_neckfire.dmi')
	neck_fire.icon_state = "neckfire"

	src.color = "#[fire_color]"
	lit(color)
	RegisterSignal(parent, COMSIG_MOB_DEATH, PROC_REF(unlit))
	// RegisterSignal(parent, COMSIG_MOB_LIFE)

/datum/component/neckfire/proc/lit(fire_color)
	var/mob/living/carbon/M = parent

	if(!neck_fire || M.stat == DEAD)
		return

	unlit(M)

	neck_fire.icon_state = "neckfire"
	neck_fire.color = fire_color
	//neck_fire.plane = 19 // glowy i hope

	var/datum/action/neckfire/A = new /datum/action/neckfire(src)
	A.Grant(M)

	M.add_overlay(neck_fire)

/datum/component/neckfire/proc/unlit(mob/living/carbon/M)
	if(M)
		M.cut_overlay(neck_fire)
	qdel(glowth)
	is_glowing = FALSE

/datum/component/neckfire/Destroy(force=FALSE, silent=FALSE)
	. = ..()
	unlit(parent)
	UnregisterSignal(parent, COMSIG_MOB_DEATH)


/datum/action/neckfire
	name = "Toggle Neckfire Glow"
	icon_icon = 'modular_splurt/icons/mob/dullahan_neckfire.dmi'
	button_icon_state = "neckfire_action"

/datum/action/neckfire/Trigger()
	. = ..()
	var/datum/component/neckfire/N = target
	if(!N.neck_fire)
		return
	if(!N.is_glowing)
		N.glowth = new(N.parent)
		N.glowth.set_light(N.light, N.light, N.color)
		N.is_glowing = TRUE
	else
		qdel(N.glowth)
		N.is_glowing = FALSE

/datum/quirk/dullahan/post_add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(H.dna.features["neckfire"] && !istype(H, /mob/living/carbon/human/dummy))
		H.AddComponent(/datum/component/neckfire, H.dna.features["neckfire_color"])

/datum/component/dullahan
	var/obj/item/clothing/head_accessory
	var/mutable_appearance/head_accessory_MA

/datum/component/dullahan/Initialize()
	. = ..()
	RegisterSignal(dullahan_head, COMSIG_MOUSEDROPPED_ONTO, PROC_REF(on_mouse_dropped))
	RegisterSignal(dullahan_head, COMSIG_MOUSEDROP_ONTO, PROC_REF(on_mouse_drop))

/datum/component/dullahan/proc/add_head_accessory(obj/item/clothing/I, item_path)
	head_accessory_MA = mutable_appearance(I.mob_overlay_icon || HEAD_ACCESSORIES_PATHS[item_path])
	head_accessory_MA.icon_state = I.icon_state
	I.forceMove(dullahan_head)

	dullahan_head.add_overlay(head_accessory_MA)
	head_accessory = I

/datum/component/dullahan/proc/remove_head_accessory(obj/item/clothing/I)
	dullahan_head.cut_overlay(head_accessory_MA)
	head_accessory = null

/datum/component/dullahan/proc/on_mouse_dropped(datum/source, obj/item/I, mob/living/user)
	var/mob/living/carbon/owner = dullahan_head.owner
	var/item_path

	for(var/type in HEAD_ACCESSORIES_PATHS)
		if(istype(I, type))
			item_path = type
			break

	if(item_path && !head_accessory)
		if(istype(I, /obj/item/clothing))
			var/obj/item/organ/eyes/dullahan/eyes = owner.getorganslot(ORGAN_SLOT_EYES)
			var/obj/item/clothing/clothing = I

			eyes.flash_protect = clothing.flash_protect
			eyes.tint = clothing.tint
			owner.update_tint()

		add_head_accessory(I, item_path)
	else
		to_chat(user, span_notice("You can't put \the [I.name] on the head of \the [owner.name]"))
		return

/datum/component/dullahan/proc/on_mouse_drop(datum/source, atom/A, mob/living/user)
	var/mob/living/carbon/owner = dullahan_head.owner

	if(head_accessory)
		if(istype(A, /turf/open))
			head_accessory.forceMove(A)
		else if(istype(A, /atom/movable/screen/inventory/hand))
			var/atom/movable/screen/inventory/hand/H = A

			user.put_in_hand(head_accessory, H.held_index)
		else
			return

		var/obj/item/organ/eyes/dullahan/eyes = owner.getorganslot(ORGAN_SLOT_EYES)
		eyes.flash_protect = 0
		eyes.tint = 0
		owner.update_tint()

		remove_head_accessory(head_accessory)

/datum/action/item_action/organ_action/dullahan/proc/toggle_monochromacy()
	var/obj/item/organ/eyes/eyes = owner.getorganslot(ORGAN_SLOT_EYES)

	if(eyes.monochromacy_on)
		owner.remove_client_colour(/datum/client_colour/monochrome)
	else
		owner.add_client_colour(/datum/client_colour/monochrome)

	eyes.monochromacy_on = !eyes.monochromacy_on

/obj/item/organ/eyes
	var/monochromacy_on = FALSE

/datum/action/item_action/organ_action/dullahan/Grant(mob/M)
	. = ..()
	toggle_monochromacy()
