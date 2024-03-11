// Ocean atmosphere (Oshan map)

/datum/atmosphere/ocean
	id = OCEAN_ATMOS

	base_gases = list(
		GAS_LIQUID_H2O=50

	)
	normal_gases = list(
		GAS_LIQUID_H2O=50
		GAS_O2=1,
		GAS_N2=1,
		GAS_CO2=0.5

	)
	restricted_gases = list(
		GAS_H2O=0.1

	)

	minimum_pressure = 1000 // 100 atm, about 1000 meters deep
	maximum_pressure = 1100

	minimum_temp = 277 // 4°C, about average for deep ocean water
	maximum_temp = 283
