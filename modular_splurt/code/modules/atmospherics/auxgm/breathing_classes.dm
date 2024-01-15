/datum/breathing_class/nitrogen
	gases = list(
		GAS_N2 = 1,
	)
	products = list(
		GAS_CO2 = 1,
	)
	low_alert_category = "not_enough_N2"
	low_alert_datum = /atom/movable/screen/alert/not_enough_nitro
	high_alert_category = "too_much_N2"
	high_alert_datum = /atom/movable/screen/alert/too_much_nitro
