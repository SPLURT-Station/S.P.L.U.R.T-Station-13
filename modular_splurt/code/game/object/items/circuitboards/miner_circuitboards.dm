// Legitimately putting this here because I want people to be able to build gas miners
// Pretty neat, right?

#define PATH_COPEMINER /obj/machinery/atmospherics/miner/copium
#define PATH_OXYMINER  /obj/machinery/atmospherics/miner/oxygen

/obj/item/circuitboard/machine/gas_miner
	name = "Gas Miner (Machine Board)"
	desc = "You can use a multitool to change between possible gasses to mine."
	icon_state = "engineering"
	build_path = /obj/machinery/atmospherics/miner/copium	// Default to copium
	req_components = list(
		/obj/item/stock_parts/micro_laser = 10,	// I'm evil. Yes, 10.
		/obj/item/stack/cable_coil = 1,
		/obj/item/stock_parts/manipulator = 5,	// Yes, 5 of these.
		/obj/item/stock_parts/scanning_module = 5,	// You hear me last time
	)

/obj/item/circuitboard/machine/gas_miner/Initialize()
	. = ..()
	if (build_path)
		build_path = PATH_COPEMINER

/obj/item/circuitboard/machine/gas_miner/attackby(obj/item/I, mob/user, params)
	if (istype(I, /obj/item/multitool))
		var/obj/item/circuitboard/new_type
		var/new_setting
		switch(build_path)
			if (PATH_COPEMINER)
				new_type = /obj/item/circuitboard/machine/gas_miner/oxygen
				new_setting = "Oxygen"
			if (PATH_OXYMINER)
				new_type = /obj/item/circuitboard/machine/gas_miner/cope
				new_setting = "Copium"
		name = initial(new_type.name)
		build_path = initial(new_type.build_path)
		I.play_tool_sound(src)
		to_chat(user, "<span class='notice'>You tune the miner's scanners to find [new_setting].")
	else
		return ..()

/obj/item/circuitboard/machine/gas_miner/cope
	name = "Copium Gas Miner (Machine Board)"
	build_path = PATH_COPEMINER

/obj/item/circuitboard/machine/gas_miner/oxygen
	name = "Oxygen Gas Miner (Machine Board)"
	build_path = PATH_OXYMINER
