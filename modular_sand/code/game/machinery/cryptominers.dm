// Configuration defines
/*
 * Some entries are currently unimplemented
 *
#define CRYPTO_POWER_USE		CONFIG_GET(number/crypto_power_use_process)
#define CRYPTO_POWER_IDLE		CONFIG_GET(number/crypto_power_use_idle)
#define CRYPTO_POWER_ACTIVE		CONFIG_GET(number/crypto_power_use_active)
#define CRYPTO_MININGTIME		CONFIG_GET(number/crypto_mining_time)
#define CRYPTO_MININGPOINTS		CONFIG_GET(number/crypto_payout_amount)
*/
#define CRYPTO_TEMP_MIN			CONFIG_GET(number/crypto_heat_threshold_min)
#define CRYPTO_TEMP_MID			CONFIG_GET(number/crypto_heat_threshold_mid)
#define CRYPTO_TEMP_MAX			CONFIG_GET(number/crypto_heat_threshold_max)
#define CRYPTO_MULT_MIN			CONFIG_GET(number/crypto_multiplier_min)
#define CRYPTO_MULT_MID			CONFIG_GET(number/crypto_multiplier_mid)
#define CRYPTO_MULT_MAX			CONFIG_GET(number/crypto_multiplier_max)
#define CRYPTO_HEATING_POWER	CONFIG_GET(number/crypto_heat_power)
#define CRYPTO_IGNORE_ATMOS		CONFIG_GET(flag/crypto_ignore_atmos)

/obj/machinery/cryptominer
	name = "cryptocurrency miner"
	desc = "This handy-dandy machine will produce credits for Cargo's enjoyment."
	icon = 'modular_sand/icons/obj/machines/cryptominer.dmi'
	icon_state = "off"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 20
	active_power_usage = 200
	circuit = /obj/item/circuitboard/machine/cryptominer
	init_process = FALSE // Don't process upon creation
	var/mining = FALSE
	var/miningtime = 3000
	var/miningpoints = 50
	var/datum/bank_account/pay_me = null
	var/obj/item/radio/cargo_radio
	// Should this machine send messages on cargo radio?
	var/radio_snitch = TRUE

/obj/machinery/cryptominer/Initialize(mapload)
	. = ..()

	// Create new radio
	cargo_radio = new /obj/item/radio(src)

	// Prevent radio listening
	cargo_radio.listening = 0

	// Set radio frequency
	cargo_radio.set_frequency(FREQ_SUPPLY)

	// Set default account
	pay_me = SSeconomy.get_dep_account(ACCOUNT_CAR)

/obj/machinery/cryptominer/update_icon()
	. = ..()
	if(!is_operational())
		icon_state = "off"
	else if(mining)
		icon_state = "loop"
	else
		icon_state = "on"

/obj/machinery/cryptominer/Destroy()
	STOP_PROCESSING(SSmachines,src)
	QDEL_NULL(cargo_radio)
	return ..()

/obj/machinery/cryptominer/deconstruct()
	STOP_PROCESSING(SSmachines,src)
	return ..()

/obj/machinery/cryptominer/attackby(obj/item/W, mob/user, params)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, W))
		return
	if(default_deconstruction_crowbar(W))
		return
	if(default_unfasten_wrench(user, W))
		return

	// Check if disabled
	// Check if panel is open
	// Check if user is in HELP intent
	if(!mining && panel_open && user.a_intent == INTENT_HELP)
		// Attempt to locate user's ID
		var/id_card = W.GetID()

		// Check if ID exists
		if(!id_card)
			return

		// Define ID card
		var/obj/item/card/id/CARD = id_card

		// Check if ID card has banking support
		if(CARD.bank_support != ID_FREE_BANK_ACCOUNT)
			// Warn in local chat and return
			say("ERROR: No banking support found on provided ID card.")
			return

		// Check if ID card has a linked account
		if(!CARD.registered_account)
			// Warn in local chat and return
			say("ERROR: No bank account found on provided ID card.")
			return

		// Display message in local chat
		user.visible_message(span_notice("[user] begins setting \the [src] to use \the [CARD]."), span_notice("[user] begins setting \the [src] to use \the [CARD]."))

		// Display alert balloon
		balloon_alert(user, "Configuring new account...")

		// Perform interaction timer
		if(!do_after(user, 5 SECONDS, src))
			// Warn in local chat
			user.visible_message(span_warning("[user] fails to link \the [src] to a new account!"), span_warning("You fail to link \the [src] to a new account!"))

			// Display alert balloon
			balloon_alert(user, "Configuration failed!")

			// Return with no further effects
			return

		// Alert user of linking success
		to_chat(user, span_notice("You link \the [CARD] to \the [src]."))

		// Define previous account
		var/old_account = pay_me

		// Set payment account to ID card's account
		pay_me = CARD.registered_account

		// Say in local chat
		say("Now using [pay_me.account_holder ? "[pay_me.account_holder]s" : span_boldwarning("ERROR")] account.")

		// Log interaction
		log_game("[user] set \the [src] in [get_area(src)] to pay into their personal account. Previous account was [old_account].")

		// Check if old account was cargo
		// Check if this machine should report over radio
		if(radio_snitch && (old_account == SSeconomy.get_dep_account(ACCOUNT_CAR)))
			// Send radio notice
			cargo_radio.talk_into(src, "CRYPTO ALERT: Crew member [user] has set \the [src] in [get_area(src)] to use [pay_me.account_holder]\'s account, instead of Cargo!", FREQ_SUPPLY)

/obj/machinery/cryptominer/AltClick(mob/user)
	// Alert user in chat
	user.visible_message(span_warning("[user] begins resetting \the [src]."), span_warning("You begin resetting \the [src]."))

	// Display alert balloon
	balloon_alert(user, "Resetting account...")

	// Perform interaction timer
	if(!do_after(user, 5 SECONDS, src))
		// Warn in local chat
		user.visible_message(span_warning("[user] fails to reset \the [src]."), span_warning("You fail to reset \the [src]."))

		// Display alert balloon
		balloon_alert(user, "Reset failed!")

		// Return with no further effects
		return

	// Define previous account
	var/old_account = pay_me

	// Reset account to Cargo
	pay_me = SSeconomy.get_dep_account(ACCOUNT_CAR)

	// Say in local chat
	say("Now using [pay_me.account_holder]s account.")

	// Log interaction
	log_game("[user] reset the \the [src] in [get_area(src)] to pay Cargo's departmental account. Previous account was [old_account]")

/obj/machinery/cryptominer/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += span_notice("A little screen on the machine reads: Currently the linked bank account is [pay_me.account_holder ? "[pay_me.account_holder]s" : span_boldwarning("ERROR")].")
		. += "Modify the destination of the credits using your id on it while it is inactive and has its panel open."
		. += "Alt-Click to reset to the Cargo budget.</span>"

/obj/machinery/cryptominer/process()
	// Get turf
	var/turf/T = get_turf(src)
	if(!T)
		return

	// Check for tiles with no conductivity (space)
	if(T.thermal_conductivity == 0)
		// Cheat mode: Skip all atmos code and give points
		// Placed first, as servers are more likely to use it
		if(CRYPTO_IGNORE_ATMOS)
			produce_points(CRYPTO_MULT_MAX)
			return

		// Normal mode: Warn the user and stop processing
		else
			say("Invalid atmospheric conditions detected! Shutting off!")
			playsound(loc, 'sound/machines/beep.ogg', 50, TRUE, -1)
			set_mining(FALSE)
			return

	// Get air
	var/datum/gas_mixture/env = T.return_air()
	if(!env)
		return

	// Get temp
	var/env_temp = env.return_temperature()

	// Define temperature settings
	var/temp_min = CRYPTO_TEMP_MIN // 225K equals approximately -55F or -48C
	var/temp_mid = CRYPTO_TEMP_MID // 273K equals 32F or 0C
	var/temp_max = CRYPTO_TEMP_MAX // 500K equals approximately 440F or 226C

	// Check for temperature effects
	// Minimum (most likely)
	if(env_temp <= temp_min)
		produce_points(CRYPTO_MULT_MAX)
	// Mid
	else if((env_temp <= temp_mid) && (env_temp >= temp_min))
		produce_points(CRYPTO_MULT_MID)
	// Maximum
	else if((env_temp <= temp_max) && (env_temp >= temp_mid))
		produce_points(CRYPTO_MULT_MIN)
	// Overheat
	else if(env_temp >= temp_max)
		say("Critical overheating detected! Shutting off!")
		playsound(loc, 'sound/machines/beep.ogg', 50, TRUE, -1)
		set_mining(FALSE)

	// Increase heat by heating_power
	env.set_temperature(env_temp + CRYPTO_HEATING_POWER)

	// Update air
	air_update_turf()

/obj/machinery/cryptominer/proc/produce_points(number)
	if(pay_me)
		pay_me.adjust_money(FLOOR(miningpoints * number,1))

/obj/machinery/cryptominer/attack_hand(mob/living/user)
	. = ..()
	if(!is_operational())
		to_chat(user, span_warning("[src] has to be on to do this!"))
		balloon_alert(user, "no power!")
		return FALSE
	if(mining)
		set_mining(FALSE)
		visible_message(span_warning("[src] slowly comes to a halt."),
						span_warning("You turn off [src]."))
		balloon_alert(user, "turned off")
		return
	balloon_alert(user, "turned on")
	set_mining(TRUE)

/obj/machinery/cryptominer/proc/set_mining(new_value)
	// Check if status changed
	if(new_value == mining)
		return //No changes

	// Set status new value
	mining = new_value

	// Check if mining should run
	if(mining)
		// Start processing
		START_PROCESSING(SSmachines, src)

	// Mining should not run
	else
		// Stop processing
		STOP_PROCESSING(SSmachines, src)

	// Update machine icon
	update_icon()

/obj/machinery/cryptominer/syndie
	name = "syndicate cryptocurrency miner"
	desc = "This handy-dandy machine will produce credits for your own personal enjoyment. This one won't snitch on you to Cargo."
	icon_state = "off_syndie"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 100
	circuit = /obj/item/circuitboard/machine/cryptominer/syndie
	miningtime = 6000
	miningpoints = 100
	radio_snitch = FALSE // Illegal tech!

/obj/machinery/cryptominer/syndie/update_icon()
	. = ..()
	if(!is_operational())
		icon_state = "off_syndie"
	else if(mining)
		icon_state = "loop_syndie"
	else
		icon_state = "on_syndie"

/obj/machinery/cryptominer/nanotrasen
	name = "nanotrasen cryptocurrency miner"
	desc = "This handy-dandy machine will produce credits for your enjoyment. This doesn't turn off easily."
	icon_state = "off_nano"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 1
	active_power_usage = 1
	miningtime = 600000
	miningpoints = 1000
	radio_snitch = FALSE // None of cargo's business!

/obj/machinery/cryptominer/nanotrasen/update_icon()
	. = ..()
	if(!is_operational())
		icon_state = "off_nano"
	else if(mining)
		icon_state = "loop_nano"
	else
		icon_state = "on_nano"

/*
 * Some entries are currently unimplemented
 *
#undef CRYPTO_POWER_USE
#undef CRYPTO_POWER_IDLE
#undef CRYPTO_POWER_ACTIVE
#undef CRYPTO_MININGTIME
#undef CRYPTO_MININGPOINTS
*/
#undef CRYPTO_TEMP_MIN
#undef CRYPTO_TEMP_MID
#undef CRYPTO_TEMP_MAX
#undef CRYPTO_MULT_MIN
#undef CRYPTO_MULT_MID
#undef CRYPTO_MULT_MAX
#undef CRYPTO_HEATING_POWER
#undef CRYPTO_IGNORE_ATMOS
