/obj/item/robot_module/cargo
	added_channels = list(RADIO_CHANNEL_SUPPLY = 1)

/obj/item/robot_module/syndicatejack
	added_channels = list(RADIO_CHANNEL_SYNDICATE = 1) // Probably already handled by other code when spawned with pre-set module, but whatever.

/obj/item/robot_module/standard/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/stand_icons
	if(!stand_icons)
		stand_icons = list(
			"Standard" = image(icon = 'icons/mob/robots.dmi', icon_state = "robot"),
			"MissM" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "missm_sd"),
			"Protectron" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "protectron_standard"),
			"Zoomba" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "zoomba_standard"),
			"Marina" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "marinasd"),
			"Heavy" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "heavysd"),
			"Eyebot" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "eyebotsd"),
			"RoboMaid" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "robomaid_sd"),
			"BootyF" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootystandard"),
			"BootyM" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootystandardM"),
			"BootyS" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootystandardS"),
			"Assaultron" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "assaultron_standard")
		)
		stand_icons = sortList(stand_icons)
	var/stand_borg_icon = show_radial_menu(R, R , stand_icons, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE)
	if(!stand_borg_icon)
		return
	switch(stand_borg_icon)
		if("Standard")
			cyborg_base_icon = "robot"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("MissM")
			cyborg_base_icon = "missm_sd"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Protectron")
			cyborg_base_icon = "protectron_standard"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Zoomba")
			cyborg_base_icon = "zoomba_standard"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Marina")
			cyborg_base_icon = "marinasd"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Heavy")
			cyborg_base_icon = "heavysd"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Eyebot")
			cyborg_base_icon = "eyebotsd"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("RoboMaid")
			cyborg_base_icon = "robomaid_sd"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("BootyF")
			cyborg_base_icon = "bootystandard"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("BootyM")
			cyborg_base_icon = "bootystandardM"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("BootyS")
			cyborg_base_icon = "bootystandardS"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Assaultron")
			cyborg_base_icon = "assaultron_standard"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
	return ..()

/obj/item/robot_module/clown/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/clown_icons
	if(!clown_icons)
		clown_icons = list(
			"Standard" = image(icon = 'icons/mob/robots.dmi', icon_state = "clown"),
			"ClownMan" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "clownman"),
			"ClownBot" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "clownbot"),
			"Garish" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "garish"),
			"Clowne" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "clownkeep"),
			"Marina" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "marina_mommy"),
			"BootyF" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootystandard"),
			"BootyM" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootystandardM"),
			"BootyS" = image(icon = 'modular_splurt/icons/mob/robots.dmi', icon_state = "bootystandardS")
		)
		clown_icons = sortList(clown_icons)
	var/clown_borg_icon = show_radial_menu(R, R , clown_icons, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE)
	if(!clown_borg_icon)
		return
	switch(clown_borg_icon)
		if("Standard")
			cyborg_base_icon = "clown"
		if("ClownMan")
			cyborg_base_icon = "clownman"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("ClownBot")
			cyborg_base_icon = "clownbot"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Garish")
			cyborg_base_icon = "garish"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Clowne")
			cyborg_base_icon = "clownkeep"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("Marina")
			cyborg_base_icon = "marina_mommy"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("BootyF")
			cyborg_base_icon = "bootyclown"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("BootyM")
			cyborg_base_icon = "bootyclownM"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
		if("BootyS")
			cyborg_base_icon = "bootyclownS"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots.dmi'
			hat_offset = 3
	return ..()

/// Cargo Borgs! ///
/obj/item/robot_module/cargo
	name="Cargo"
	basic_modules = list(
		/obj/item/stamp,
		/obj/item/stamp/denied,
		/obj/item/pen,
		/obj/item/clipboard/cyborg,
		/obj/item/stack/packageWrap/cyborg,
		/obj/item/stack/wrapping_paper/xmas/cyborg,
		/obj/item/assembly/flash/cyborg,
		/obj/item/hand_labeler/cyborg,
		/obj/item/destTagger,
		/obj/item/crowbar/cyborg,
		/obj/item/extinguisher,
		/obj/item/export_scanner,
		/obj/item/gripper,
		/obj/item/cyborg_clamp
	)
	emag_modules = list(
		/obj/item/stamp/chameleon,
		/obj/item/borg/stun
	)
	cyborg_base_icon = "cargoborg"
	moduleselect_icon = "cargo"
	moduleselect_alternate_icon = 'modular_splurt/icons/mob/screen_cyborg.dmi'
	hat_offset = 3

/obj/item/robot_module/cargo/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/cargo_icons
	if(!cargo_icons)
		cargo_icons = list(
		"Default" = image(icon = 'modular_splurt/icons/mob/robots_cargo.dmi', icon_state = "cargoborg"),
		"Bird" = image(icon = 'modular_splurt/icons/mob/robots_cargo.dmi', icon_state = "bird_cargo"),
		"MissM" = image(icon = 'modular_splurt/icons/mob/robots_cargo.dmi', icon_state = "missm_cargo"),
		"Zoomba" = image(icon = 'modular_splurt/icons/mob/robots_cargo.dmi', icon_state = "zoomba_cargo"),
		"Borgi" = image(icon = 'modular_splurt/icons/mob/widerobots_cargo.dmi', icon_state = "borgi-cargo"),
		"Drake" = image(icon = 'modular_splurt/icons/mob/widerobots_cargo.dmi', icon_state = "drakecargo"),
		"Assaultron" = image(icon = 'modular_splurt/icons/mob/robots_cargo.dmi', icon_state = "assaultron_cargo"),
		"Meka" = image(icon = 'modular_splurt/icons/mob/robots_32x64.dmi', icon_state = "mekacargo"), // SPLURT Addon
		)
		var/list/L = list("Cargohound" = "cargohound", "Cargohound Dark" = "cargohounddark", "Vale" = "valecargo")
		for(var/a in L)
			var/image/wide = image(icon = 'modular_splurt/icons/mob/widerobots_cargo.dmi', icon_state = L[a])
			wide.pixel_x = -16
			cargo_icons[a] = wide
	var/cargo_borg_icon = show_radial_menu(R, R , cargo_icons, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE)
	switch(cargo_borg_icon)
		if("Default")
			cyborg_base_icon = "cargoborg"
		if("Bird")
			cyborg_base_icon = "bird_cargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots_cargo.dmi'
			hat_offset = 4
		if("MissM")
			cyborg_base_icon = "missm_cargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots_cargo.dmi'
			hat_offset = 3
		if("Zoomba")
			cyborg_base_icon = "zoomba_cargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots_cargo.dmi'
			hat_offset = 3
		if("Cargohound")
			cyborg_base_icon = "cargohound"
			cyborg_icon_override = 'modular_splurt/icons/mob/widerobots_cargo.dmi'
			dogborg = TRUE
		if("Cargohound Dark")
			cyborg_base_icon = "cargohounddark"
			cyborg_icon_override = 'modular_splurt/icons/mob/widerobots_cargo.dmi'
			dogborg = TRUE
		if("Vale")
			cyborg_base_icon = "valecargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/widerobots_cargo.dmi'
			dogborg = TRUE
		if("Borgi")
			cyborg_base_icon = "borgi-cargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/widerobots_cargo.dmi'
			dogborg = TRUE
		if("Drake")
			cyborg_base_icon = "drakecargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/widerobots_cargo.dmi'
			dogborg = TRUE
		if("Assaultron")
			cyborg_base_icon = "assaultron_cargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots_cargo.dmi'
			hat_offset = 3
		if("Meka")
			cyborg_base_icon = "mekacargo"
			cyborg_icon_override = 'modular_splurt/icons/mob/robots_32x64.dmi'
			hat_offset = 3
		else
			return FALSE
	return ..()
/// End Cargo Borg ///

/obj/item/robot_module/Initialize()
	basic_modules += /obj/item/milking_machine/pleasuremaw
	. = ..()

/obj/item/robot_module/syndicate_medical/slaver
	name = "Slaver Medical Combat"

/obj/item/robot_module/syndicate_medical/slaver/Initialize()
	var/list/extra_tools = list(
		/obj/item/slaver/gizmo
	)
	LAZYADD(basic_modules, extra_tools)
	. = ..()

/obj/item/robot_module/medical/Initialize()
	var/list/extra = list(
		/obj/item/dogborg/jaws/small,
		/obj/item/storage/bag/borgdelivery,
		/obj/item/analyzer/nose,
		/obj/item/soap/tongue,
		/obj/item/shockpaddles/cyborg/hound
	)
	LAZYADD(basic_modules, extra)
	. = ..()

/obj/item/robot_module/peacekeeper/Initialize()
	var/list/extra = list(
		/obj/item/dogborg/jaws/small,
		/obj/item/storage/bag/borgdelivery,
		/obj/item/analyzer/nose,
		/obj/item/soap/tongue
	)
	LAZYADD(basic_modules, extra)
	. = ..()

/obj/item/robot_module/security/Initialize()
	var/list/extra = list(
		/obj/item/storage/bag/borgdelivery,
		/obj/item/dogborg/jaws/big,
		/obj/item/dogborg/pounce,
		/obj/item/soap/tongue,
		/obj/item/analyzer/nose,
		/obj/item/holosign_creator/security
	)
	LAZYADD(basic_modules, extra)
	. = ..()

/obj/item/robot_module/butler/Initialize()
	var/list/extra = list(
		/obj/item/dogborg/jaws/small,
		/obj/item/analyzer/nose,
		/obj/item/soap/tongue/scrubpup,
		/obj/item/gripper/service,
		/obj/item/kitchen/rollingpin,
		/obj/item/kitchen/unrollingpin,
		/obj/item/kitchen/knife/butcher,
		/obj/item/kitchen/efink,
		/obj/item/kitchen/knife
	)
	LAZYADD(basic_modules, extra)
	. = ..()

/obj/item/robot_module/roleplay/Initialize()
	LAZYREMOVE(basic_modules, /obj/item/extinguisher/mini)
	var/list/extra = list(
		/obj/item/extinguisher,
		/obj/item/lightreplacer/cyborg,
		/obj/item/healthanalyzer/advanced,
		/obj/item/reagent_containers/borghypo
	)
	LAZYADD(basic_modules, extra)
	. = ..()


