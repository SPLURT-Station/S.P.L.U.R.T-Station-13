/datum/gas/copium
	id = GAS_COPIUM
	specific_heat = 50
	name = "Copium"
	breath_reagent = /datum/reagent/drug/copium

/datum/gas/water
	id = LIQUID_H2O
	specific_heat = 75
	name = "Water"
	gas_overlay = "water"
	moles_visible = 0.1
	flags = GAS_FLAG_DANGEROUS
	fusion_power = 0
	powermix = 0
	heat_penalty = 0
	transmit_modifier = 0
	breath_reagent = /datum/reagent/water
	enthalpy = -285830 // J/mol, negative enthalpy of formation
	price = 0 // Water is abundant, no price
