// Oshan Map

/turf/open/floor/plating/watersand
	gender = PLURAL
	name = "oceanic sand"
	icon = 'icons/misc/beach.dmi'
	icon_state = "sand"
	baseturfs = /turf/open/floor/plating/watersand
	attachment_holes = FALSE
	initial_gas_mix = OCEAN_ATMOS
	planetary_atmos = TRUE // Air will go back to initial gas mix
	slowdown = 0.8
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/plating/watersand/break_tile()
	return

/turf/open/floor/plating/watersand/acid_act(acidpwr, acid_volume)
	return

/turf/open/floor/plating/watersand/Initialize(mapload)
	. = ..()
	set_light(0.3, 0.1, LIGHT_COLOR_OCEAN)
