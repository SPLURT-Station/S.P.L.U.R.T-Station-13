/// CRYPTOMINERS ///
// Should cryptominers work in non-atmos turf
/datum/config_entry/flag/crypto_ignore_atmos

// Cryptominer point multipliers
/datum/config_entry/number/crypto_multiplier_min
	default = 0.20
	integer = FALSE

/datum/config_entry/number/crypto_multiplier_mid
	default = 1
	integer = FALSE

/datum/config_entry/number/crypto_multiplier_max
	default = 3
	integer = FALSE

// Cryptominer heat thresholds
/datum/config_entry/number/crypto_heat_threshold_min
	default = 225

/datum/config_entry/number/crypto_heat_threshold_mid
	default = 273

/datum/config_entry/number/crypto_heat_threshold_max
	default = 500

// Cryptominer heat produced
/datum/config_entry/number/crypto_heat_power
	default = 100

/*
 * The contained configuration values are currently unimplemented
 *
// Cryptominer processing time
/datum/config_entry/number/crypto_mining_time
	default = 3000

// Cryptominer base payout
/datum/config_entry/number/crypto_payout_amount
	default = 50

// Cryptominer power use
/datum/config_entry/number/crypto_power_use_idle
	default = 20

/datum/config_entry/number/crypto_power_use_active
	default = 200

/datum/config_entry/number/crypto_power_use_process
	default = 20
*/

/// AUTODOC ///
// Autodoc processing time
/datum/config_entry/number/autodoc_time_surgery_base
	default = 350

/// BLUESPACE MINER ///
// BSM production output multiplier
/datum/config_entry/number/bluespaceminer_mult_output
	default = 1

// BSM minimum tier for bluespace crystals
/datum/config_entry/number/bluespaceminer_crystal_tier
	default = 5

/// TETRIS ARCADE MACHINE ///
// If the machine should skip producing science points
/datum/config_entry/flag/tetris_no_science

// Points required per prize vended
/datum/config_entry/number/tetris_reward_divisor
	default = 1000

// Points required per prize vended
/datum/config_entry/number/tetris_prizes_max
	default = 5

// Minimum score required to message admins
/datum/config_entry/number/tetris_score_high
	default = 10000

// Maximum research points that can be generated
/datum/config_entry/number/tetris_score_max
	default = 100000

// Maximum research points that can be generated
/datum/config_entry/number/tetris_score_max_sci
	default = 10000

// Minimum time between giving rewards
/datum/config_entry/number/tetris_time_cooldown
	default = 600

/// R&D Machinery ///
// Should production machinery be restricted for skeleton crews?
/datum/config_entry/flag/protolock_during_lowpop
