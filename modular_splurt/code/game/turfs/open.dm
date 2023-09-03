/turf/open/floor/grass/layeniasand
	gender = PLURAL
	name = "crimson sand"
	icon = 'modular_splurt/icons/turf/layeniasand.dmi'
	baseturfs = /turf/open/floor/plating/layeniaredder
	heat_capacity = INFINITY
	desc = "Looks cold."
	icon_state = "mapping"
	ore_type = /obj/item/stack/ore/glass/basalt
	planetary_atmos = TRUE
	floor_tile = null
	initial_gas_mix = FROZEN_ATMOS
	slowdown = 0
	bullet_sizzle = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/grass/layeniasand/break_tile()
	return

/turf/open/floor/grass/layeniasand/burn_tile()
	return

/turf/open/floor/grass/layeniasand/acid_act(acidpwr, acid_volume)
	acidpwr = min(acidpwr, 50)
	. = ..()

/turf/closed/mineral/ash_rock/layenia
	name = "crimson rock"
	icon = 'modular_splurt/icons/turf/layeniamining.dmi'
	smooth_icon = 'modular_splurt/icons/turf/layeniarocks.dmi'
	icon_state = "layenia"
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith = list (/turf/closed)
	baseturfs = /turf/open/floor/plating/layeniaredder
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	environment_type = "waste"
	turf_type = /turf/open/floor/plating/layeniaredder
	defer_change = TRUE

/turf/open/floor/plating/layeniaredder
	name = "crimson rock"
	desc = "crimson rocks surround you."
	icon = 'modular_splurt/icons/turf/layenia.dmi'
	icon_state = "layenia"
	heat_capacity = INFINITY
	slowdown = 0
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/plating/layeniaredder/break_tile()
	return

/turf/open/floor/plating/layeniaredder/burn_tile()
	return

/turf/open/floor/plating/layeniaredder/acid_act(acidpwr, acid_volume)
	acidpwr = min(acidpwr, 50)
	. = ..()

/turf/open/openspace
	heat_capacity = INFINITY
