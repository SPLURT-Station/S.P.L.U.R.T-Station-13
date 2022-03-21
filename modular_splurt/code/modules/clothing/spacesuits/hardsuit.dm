/obj/item/clothing/head/helmet/space/hardsuit/rd/hev
	name = "HEV Suit helmet"
	desc = "A Hazardous Environment Helmet. It fits snug over the suit and has a heads-up display for researchers. The flashlight seems broken, fitting considering this was made before the start of the milennium."
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "hev"
	item_state = "hev"
	resistance_flags = ACID_PROOF | FIRE_PROOF
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 80, "bio" = 100, "rad" = 100, "fire" = 60, "acid" = 60)
	actions_types = list(/datum/action/item_action/toggle_research_scanner)

/obj/item/clothing/head/helmet/space/hardsuit/rd/hev/no_scanner
	actions_types = list()

/obj/item/clothing/suit/space/hardsuit/rd/hev
	name = "HEV Suit"
	desc = "The hazard suit. It was designed to protect scientists from the blunt trauma, radiation, energy discharge that hazardous materials might produce or entail. Fits you like a glove. The automatic medical system seems broken... They're waiting for you, Gordon. In the test chamberrrrrr."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "hev"
	item_state = "hev"
	resistance_flags = ACID_PROOF | FIRE_PROOF
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT //Same as an emergency firesuit. Not ideal for extended exposure.
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/gun/energy/wormhole_projector,
	/obj/item/hand_tele, /obj/item/aicard)
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 80, "bio" = 100, "rad" = 100, "fire" = 60, "acid" = 60)
	mutantrace_variation = STYLE_DIGITIGRADE
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/rd/hev
	var/firstpickup = TRUE
	var/pickupsound = TRUE

/obj/item/clothing/suit/space/hardsuit/rd/hev/no_sound
	pickupsound = FALSE

/obj/item/clothing/suit/space/hardsuit/rd/hev/equipped(mob/user, slot)
	. = ..()
	if(!pickupsound)
		return
	if(!ishuman(user))
		return
	if(slot == ITEM_SLOT_OCLOTHING)
		if(!firstpickup)
			SEND_SOUND(user, sound('modular_splurt/sound/halflife/hevsuit_pickup.ogg', volume = 50))
		else
			firstpickup = FALSE
			SEND_SOUND(user, sound('modular_splurt/sound/halflife/hevsuit_firstpickup.ogg', volume = 50))
			SEND_SOUND(user, sound('modular_splurt/sound/halflife/anomalous_materials.ogg', volume = 50))
	return

/obj/item/clothing/suit/space/hardsuit/shielded/goldenpa
	name = "Nanotrasen Power Armor"
	desc = "An advanced armor with built in energy shielding, developed by Nanotrasen via unknown means. It belongs by only few exclusive members of the corporation."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "golden_pa"
	item_state = "golden_pa"
	max_charges = 4
	current_charges = 4
	recharge_delay = 15
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/goldenpa
	mutantrace_variation = STYLE_MUZZLE | STYLE_ALL_TAURIC
	slowdown = 0

/obj/item/clothing/suit/space/hardsuit/shielded/goldenpa/Initialize()
	jetpack = new /obj/item/tank/jetpack/suit(src)
	. = ..()

/obj/item/clothing/head/helmet/space/hardsuit/shielded/goldenpa
	name = "Nanotrasen Power Helmet"
	desc = "An advanced armor helmet with built in energy shielding, developed by Nanotrasen via unknown means. It belongs by only few exclusive members of the corporation."
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "hardsuit0-goldenpa"
	item_state = "hardsuit0-goldenpa"
	hardsuit_type = "goldenpa"
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/teslapa
	name = "Tesla Power Armor"
	desc = "An advanced power armor, with built-in tesla technology. You're sure this will fry whoever dares attack in close quarters."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "tesla_pa"
	item_state = "tesla_pa"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 90, "energy" = 90, "bomb" = 70, "bio" = 100, "rad" = 40, "fire" = 100, "acid" = 100)
	strip_delay = 300
	equip_delay_self = 300
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/teslapahelmet
	slowdown = 1
	siemens_coefficient = -1
	blood_overlay_type = "armor"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/hit_reaction_chance = 50
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	var/teslapa_cooldown = 20
	var/teslapa_cooldown_duration = 10
	var/tesla_power = 20000
	var/tesla_range = 4
	var/tesla_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE
	var/legacy = FALSE
	var/legacy_dmg = 35

/obj/item/clothing/suit/space/hardsuit/teslapa/Initialize()
	jetpack = new /obj/item/tank/jetpack/suit(src)
	. = ..()

/obj/item/clothing/suit/space/hardsuit/teslapa/dropped(mob/user)
	..()
	if(istype(user))
		REMOVE_TRAIT(user, TRAIT_TESLA_SHOCKIMMUNE, "reactive_teslapa_armor")

/obj/item/clothing/suit/space/hardsuit/teslapa/equipped(mob/user, slot)
	..()
	if(slot_flags & slot) //Was equipped to a valid slot for this item?
		ADD_TRAIT(user, TRAIT_TESLA_SHOCKIMMUNE, "reactive_teslapa_armor")

/obj/item/clothing/suit/space/hardsuit/teslapa/run_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = ATTACK_TYPE_MELEE)
	if(prob(hit_reaction_chance))
		if(world.time < teslapa_cooldown_duration)
			var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
			sparks.set_up(1, 1, src)
			sparks.start()
			owner.visible_message("<span class='danger'>The tesla capacitors on [owner]'s Tesla Power Armor are still recharging! The armor merely emits some sparks.</span>")
			return
		owner.visible_message("<span class='danger'>[src] blocks [attack_text], sending out arcs of lightning!</span>")
		if(!legacy)
			tesla_zap(owner, tesla_range, tesla_power, tesla_flags)
		else
			for(var/mob/living/M in view(2, owner))
				if(M == owner)
					continue
				owner.Beam(M,icon_state="purple_lightning",icon='icons/effects/effects.dmi',time=5)
				M.adjustFireLoss(legacy_dmg)
				playsound(M, 'sound/machines/defib_zap.ogg', 50, 1, -1)
		teslapa_cooldown = world.time + teslapa_cooldown_duration
		return TRUE

/obj/item/clothing/head/helmet/space/hardsuit/teslapahelmet
	name = "Tesla Power Armor Helmet"
	desc = "An advanced power armor, with built-in tesla technology. You're sure this will fry whoever dares attack in close quarters."
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "teslaup"
	item_state = "teslaup"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 90, "energy" = 90, "bomb" = 70, "bio" = 100, "rad" = 10, "fire" = 100, "acid" = 100)
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/advancedpa
	name = "Advanced Power Armor"
	desc = "An advanced power armor. You're sure this is near to impossible to penetrate in close quarters."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "advanced_pa"
	item_state = "advanced_pa"
	armor = list("melee" = 95, "bullet" = 95, "laser" = 70, "energy" = 80, "bomb" = 70, "bio" = 100, "rad" = 40, "fire" = 100, "acid" = 100)
	strip_delay = 300 //chonky armor means chonky strip
	equip_delay_self = 300
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/advancedpahelmet
	slowdown = 0
	blood_overlay_type = "armor"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/clothing/suit/space/hardsuit/advancedpa/Initialize()
	jetpack = new /obj/item/tank/jetpack/suit(src)
	. = ..()

/obj/item/clothing/head/helmet/space/hardsuit/advancedpahelmet
	name = "Advanced Power Armor Helmet"
	desc = "An advanced power armor. You're sure this is almost impenetrable in close quarters."
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "adv_pa"
	item_state = "adv_pa"
	armor = list("melee" = 95, "bullet" = 90, "laser" = 70, "energy" = 80, "bomb" = 70, "bio" = 100, "rad" = 40, "fire" = 100, "acid" = 100)
	strip_delay = 300
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
