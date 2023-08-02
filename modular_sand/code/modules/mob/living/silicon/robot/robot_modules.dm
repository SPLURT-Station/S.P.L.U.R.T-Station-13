/obj/item/robot_module/proc/add_module(obj/item/I, nonstandard, requires_rebuild)
	rad_flags |= RAD_NO_CONTAMINATE
	if(istype(I, /obj/item/stack))
		var/obj/item/stack/S = I

		if(is_type_in_list(S, list(/obj/item/stack/sheet/metal, /obj/item/stack/rods, /obj/item/stack/tile/plasteel)))
			if(S.custom_materials?.len && S.custom_materials[SSmaterials.GetMaterialRef(/datum/material/iron)])
				S.cost = S.custom_materials[SSmaterials.GetMaterialRef(/datum/material/iron)] * 0.25
			S.source = get_or_create_estorage(/datum/robot_energy_storage/metal)

		else if(istype(S, /obj/item/stack/sheet/glass))
			S.cost = 500
			S.source = get_or_create_estorage(/datum/robot_energy_storage/glass)

		else if(istype(S, /obj/item/stack/sheet/rglass/cyborg))
			var/obj/item/stack/sheet/rglass/cyborg/G = S
			G.source = get_or_create_estorage(/datum/robot_energy_storage/metal)
			G.glasource = get_or_create_estorage(/datum/robot_energy_storage/glass)

		else if(istype(S, /obj/item/stack/sheet/plasmaglass/cyborg))
			//var/obj/item/stack/sheet/plasmaglass/cyborg/G = S
			//G.plasource = get_or_create_estorage(/datum/robot_energy_storage/plasma)
			//G.glasource = get_or_create_estorage(/datum/robot_energy_storage/glass)
			S.cost = 500
			S.source = get_or_create_estorage(/datum/robot_energy_storage/plasma)

		else if(istype(S, /obj/item/stack/sheet/plasmarglass/cyborg))
			//var/obj/item/stack/sheet/plasmarglass/cyborg/G = S
			//G.plasource = get_or_create_estorage(/datum/robot_energy_storage/plasma)
			//G.glasource = get_or_create_estorage(/datum/robot_energy_storage/glass)
			S.cost = 1000
			S.source = get_or_create_estorage(/datum/robot_energy_storage/plasma)

		else if(istype(S, /obj/item/stack/sheet/plasteel/cyborg))
			//var/obj/item/stack/sheet/plasteel/cyborg/G = S
			//G.source = get_or_create_estorage(/datum/robot_energy_storage/metal)
			//G.plasource = get_or_create_estorage(/datum/robot_energy_storage/plasma)
			S.cost = 500
			S.source = get_or_create_estorage(/datum/robot_energy_storage/plasma)

		else if(istype(S, /obj/item/stack/sheet/mineral/plasma/cyborg))
			S.cost = 500
			S.source = get_or_create_estorage(/datum/robot_energy_storage/plasma)

		else if(istype(S, /obj/item/stack/medical))
			S.cost = 250
			S.source = get_or_create_estorage(/datum/robot_energy_storage/medical)

		else if(istype(S, /obj/item/stack/cable_coil))
			S.cost = 1
			S.source = get_or_create_estorage(/datum/robot_energy_storage/wire)

		else if(istype(S, /obj/item/stack/marker_beacon))
			S.cost = 1
			S.source = get_or_create_estorage(/datum/robot_energy_storage/beacon)

		else if(istype(S, /obj/item/stack/packageWrap))
			S.cost = 1
			S.source = get_or_create_estorage(/datum/robot_energy_storage/wrapping_paper)

		if(S && S.source)
			S.custom_materials = null
			S.is_cyborg = 1

	if(I.loc != src)
		I.forceMove(src)
	modules += I
	ADD_TRAIT(I, TRAIT_NODROP, CYBORG_ITEM_TRAIT)
	I.mouse_opacity = MOUSE_OPACITY_OPAQUE
	if(nonstandard)
		added_modules += I
	if(requires_rebuild)
		rebuild_modules()
	return I

/obj/item/robot_module/engineering/Initialize(mapload)
	basic_modules += /obj/item/pen
	basic_modules += /obj/item/stack/sheet/plasmaglass/cyborg
	basic_modules += /obj/item/stack/sheet/plasmarglass/cyborg
	basic_modules += /obj/item/stack/sheet/plasteel/cyborg
	basic_modules += /obj/item/stack/sheet/mineral/plasma/cyborg
	. = ..()

/obj/item/robot_module/butler/Initialize(mapload)
	basic_modules -= /obj/item/reagent_containers/borghypo/borgshaker
	basic_modules += /obj/item/reagent_containers/borghypo/borgshaker/beershaker
	basic_modules += /obj/item/reagent_containers/borghypo/borgshaker/juiceshaker
	basic_modules += /obj/item/reagent_containers/borghypo/borgshaker/sodashaker
	basic_modules += /obj/item/reagent_containers/borghypo/borgshaker/miscshaker
	. = ..()

/datum/robot_energy_storage/plasma
	name = "Plasma Buffer Container"
	recharge_rate = 0

/obj/item/robot_module/syndicatejack
	name = "Syndicate"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/borg/sight/thermal,
		/obj/item/extinguisher,
		/obj/item/weldingtool/experimental,
		/obj/item/screwdriver/nuke,
		/obj/item/wrench/cyborg,
		/obj/item/crowbar/cyborg,
		/obj/item/wirecutters/cyborg,
		/obj/item/multitool/cyborg,
		/obj/item/gripper,
		/obj/item/cyborg_clamp,
		/obj/item/lightreplacer/cyborg,
		/obj/item/stack/sheet/metal/cyborg,
		/obj/item/stack/sheet/glass/cyborg,
		/obj/item/stack/sheet/rglass/cyborg,
		/obj/item/stack/rods/cyborg,
		/obj/item/stack/tile/plasteel/cyborg,
		/obj/item/destTagger/borg,
		/obj/item/stack/cable_coil/cyborg,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/stack/medical/gauze/cyborg,
		/obj/item/shockpaddles/cyborg,
		/obj/item/healthanalyzer/advanced,
		/obj/item/surgical_drapes/advanced,
		/obj/item/retractor/advanced,
		/obj/item/surgicaldrill/advanced,
		/obj/item/scalpel/advanced,
		/obj/item/gun/medbeam,
		/obj/item/reagent_containers/borghypo/syndicate,
		/obj/item/borg/lollipop,
		/obj/item/holosign_creator/cyborg,
		/obj/item/stamp/chameleon,
		/obj/item/borg_shapeshifter
		)

	ratvar_modules = list(
	/obj/item/clockwork/slab/cyborg/medical,
	/obj/item/clockwork/slab/cyborg/engineer,
	/obj/item/clockwork/replica_fabricator/cyborg)

	cyborg_base_icon = "synd_engi"
	moduleselect_icon = "malf"
	magpulsing = TRUE
	hat_offset = INFINITY
	canDispose = TRUE

/obj/item/robot_module/syndicatejack/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/syndicatejack_icons = sortList(list(
		"Saboteur" = image(icon = 'icons/mob/robots.dmi', icon_state = "synd_engi"),
		"Medical" = image(icon = 'icons/mob/robots.dmi', icon_state = "synd_medical"),
		"Assault" = image(icon = 'icons/mob/robots.dmi', icon_state = "synd_sec"),
		"MissM" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "missm_syndie"), // SPLURT Addon (Skyrat Port)
		"Heavy" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "syndieheavy"), // SPLURT Addon (Skyrat Port)
		"Spider" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "spidersyndi"), // SPLURT Addon (Skyrat Port)
		"Chesty" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "chesty"), // SPLURT Addon (Skyrat Port)
		"RoboMaid" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "robomaid_synd"), // SPLURT Addon (Old Skyrat Port)
		"BootyNukie" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootynukie"), // SPLURT Addon (Hyper Port)
		"BootyGorlex" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootygorlex") // SPLURT Addon (Hyper Port)
		))
	var/syndiejack_icon = show_radial_menu(R, R , syndicatejack_icons, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE)
	switch(syndiejack_icon)
		if("Saboteur")
			cyborg_base_icon = "synd_engi"
			cyborg_icon_override = 'icons/mob/robots.dmi'
		if("Medical")
			cyborg_base_icon = "synd_medical"
			cyborg_icon_override = 'icons/mob/robots.dmi'
		if("Assault")
			cyborg_base_icon = "synd_sec"
			cyborg_icon_override = 'icons/mob/robots.dmi'
		if("MissM") // SPLURT Addon (Skyrat Port)
			cyborg_base_icon = "missm_syndie"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		if("Heavy") // SPLURT Addon (Skyrat Port)
			cyborg_base_icon = "syndieheavy"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		if("Spider") // SPLURT Addon (Skyrat Port)
			cyborg_base_icon = "spidersyndi"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		if("Chesty") // SPLURT Addon (Skyrat Port)
			cyborg_base_icon = "chesty"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		if("RoboMaid") // SPLURT Addon (Old Skyrat Port)
			cyborg_base_icon = "robomaid_synd"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		if("BootyNukie") // SPLURT Addon (Hyper Port)
			cyborg_base_icon = "bootynukie"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		if("BootyGorlex") // SPLURT Addon (Hyper Port)
			cyborg_base_icon = "bootygorlex"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
		else
			return FALSE
	return ..()

/obj/item/robot_module/syndicatejack/rebuild_modules()
    ..()
    var/mob/living/silicon/robot/syndicatejack = loc
    syndicatejack.scrambledcodes = TRUE // We're rouge now

/obj/item/robot_module/syndicatejack/remove_module(obj/item/I, delete_after)
    ..()
    var/mob/living/silicon/robot/syndicatejack = loc
    syndicatejack.scrambledcodes = FALSE // Friends with the AI again

/obj/item/robot_module/roleplay
	name = "Roleplay"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/extinguisher/mini,
		/obj/item/weldingtool/largetank/cyborg,
		/obj/item/screwdriver/cyborg,
		/obj/item/wrench/cyborg,
		/obj/item/crowbar/cyborg,
		/obj/item/wirecutters/cyborg,
		/obj/item/multitool/cyborg,
		/obj/item/stack/sheet/metal/cyborg,
		/obj/item/stack/sheet/glass/cyborg,
		/obj/item/stack/sheet/rglass/cyborg,
		/obj/item/stack/rods/cyborg,
		/obj/item/stack/tile/plasteel/cyborg,
		/obj/item/stack/cable_coil/cyborg,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/rsf/cyborg,
		/obj/item/reagent_containers/food/drinks/drinkingglass,
		/obj/item/reagent_containers/borghypo/borgshaker/beershaker,
		/obj/item/reagent_containers/borghypo/borgshaker/juiceshaker,
		/obj/item/reagent_containers/borghypo/borgshaker/sodashaker,
		/obj/item/reagent_containers/borghypo/borgshaker/miscshaker,
		/obj/item/soap/nanotrasen,
		/obj/item/borg/cyborghug,
		/obj/item/dogborg_nose,
		/obj/item/dogborg_tongue,
		/obj/item/borg_shapeshifter/stable)
	moduleselect_icon = "standard"
	hat_offset = -3

/obj/item/robot_module/Initialize(mapload)
	basic_modules += /obj/item/dildo/custom
	. = ..()
