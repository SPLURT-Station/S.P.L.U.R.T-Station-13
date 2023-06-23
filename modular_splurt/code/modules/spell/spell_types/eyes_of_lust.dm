/datum/atom_hud/data/human/arousal
	hud_icons = list(AROUSAL_HUD)

/mob/living/carbon/human/proc/add_arousal_hud()
	var/datum/atom_hud/data/human/arousal/hud = GLOB.huds[DATA_HUD_AROUSAL]
	hud.add_hud_to(src)
	arousal_hud_update()
	for(var/mob/living/carbon/human/H in view(7, src))
		hud.add_to_hud(H)

/mob/living/carbon/human/proc/remove_arousal_hud()
	var/datum/atom_hud/data/human/arousal/hud = GLOB.huds[DATA_HUD_AROUSAL]
	hud.remove_hud_from(src)

/mob/living/carbon/human/Life()
	. = ..()
	if(has_quirk(/datum/quirk/sex_magician))
		arousal_hud_update()

/mob/living/carbon/human/proc/arousal_hud_update()
	var/image/holder = hud_list[AROUSAL_HUD]
	var/icon/I = icon(icon, icon_state, dir)
	holder.pixel_y = I.Height() - world.icon_size
	var/arousal = getPercentAroused()
	switch(arousal)
		if(0 to 25)
			holder.icon_state = "hudarousal1"
		if(25 to 50)
			holder.icon_state = "hudarousal2"
		if(50 to 75)
			holder.icon_state = "hudarousal3"
		if(75 to INFINITY)
			holder.icon_state = "hudarousal4"

/obj/effect/proc_holder/spell/eyes_of_lust
	name = "Eyes of Lust"
	desc = "Watch the lust."
	charge_max = 1200 //variable
	cooldown_min = 0
	level_max = 1
	clothes_req = NONE
	antimagic_allowed = TRUE
	action_icon_state = "eyes_of_lust"
	action_icon  = 'modular_splurt/icons/effects/sex_spells.dmi'
	var/activated = 0

/obj/effect/proc_holder/spell/eyes_of_lust/cast(list/targets, mob/user = usr)
	if(!ishuman(user))
		return 0
	var/mob/living/carbon/human/H = user
	if(!activated)
		H.add_arousal_hud()
		activated = 1
	else
		H.remove_arousal_hud()
		activated = 0


