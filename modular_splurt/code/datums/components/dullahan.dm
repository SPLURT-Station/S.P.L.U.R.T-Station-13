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
	RegisterSignal(parent, COMSIG_MOB_DEATH, .proc/unlit)
	// RegisterSignal(parent, COMSIG_MOB_LIFE)

/datum/component/neckfire/proc/lit(fire_color)
	var/mob/living/carbon/M = parent

	if(!neck_fire || M.stat == DEAD)
		return

	unlit(M)

	neck_fire.icon_state = "neckfire"
	neck_fire.color = fire_color
	neck_fire.plane = 19 // glowy i hope

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
