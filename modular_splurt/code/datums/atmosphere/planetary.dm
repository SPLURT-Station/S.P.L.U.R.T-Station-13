/datum/atmosphere/ocean
	id = OCEAN_ATMOS

	base_gases = list(
		GAS_WATER=50

	)
	normal_gases = list(
		GAS_WATER=50

	)
	restricted_gases = list(
		GAS_H2O=0.1

	)

	minimum_pressure = HAZARD_LOW_PRESSURE + 10
	maximum_pressure = LAVALAND_EQUIPMENT_EFFECT_PRESSURE - 1

	minimum_temp = 40
	maximum_temp = 320
