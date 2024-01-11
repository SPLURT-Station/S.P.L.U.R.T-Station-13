/turf/open/floor/plating/smooth
	name = "grass patch"
	desc = "You can't tell if this is real grass or just cheap plastic imitation."
	icon = 'modular_splurt/icons/turf/smooth/_smooth.dmi'
	icon_state = "grass"
	//broken_states = list("sand")
	flags_1 = NONE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith = null
	layer = 2.1
	attachment_holes = FALSE
	var/smooth_icon = 'modular_splurt/icons/turf/smooth/grass.dmi'
	var/smoothing_groups = list(/turf/closed/indestructible)
	var/smooth_offset = 8

/turf/open/floor/plating/smooth/Initialize()
	if(!canSmoothWith)
		canSmoothWith = smoothing_groups
	var/matrix/M = new
	M.Translate(-smooth_offset, -smooth_offset)
	transform = M
	icon = smooth_icon
	. = ..()

/turf/open/floor/plating/smooth/grass
	name = "grass patch"
	desc = "Lush jungle grass."
	icon_state = "grass"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	layer = 2.1
	smooth_icon = 'modular_splurt/icons/turf/smooth/grass.dmi'
	smoothing_groups = list(/turf/open/floor/plating/smooth/grass, /turf/closed/indestructible)
	smooth_offset = 8

/turf/open/floor/plating/smooth/dirt
	name = "dirt"
	desc = "Upon closer examination, it's still dirt."
	icon_state = "dirt"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	layer = 2.09
	smooth_icon = 'modular_splurt/icons/turf/smooth/dirt.dmi'
	smoothing_groups = list(/turf/open/floor/plating/smooth/dirt, /turf/closed/indestructible)
	smooth_offset = 6

/turf/open/floor/plating/smooth/grass/lavaland_jungle
	baseturfs = /turf/open/lava/smooth/lava_land_surface
	color = "#dbd1b4"
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/floor/plating/smooth/dirt/lavaland_jungle
	baseturfs = /turf/open/lava/smooth/lava_land_surface
	color = "#615c59"
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/water/lavaland_jungle
	baseturfs = /turf/open/lava/smooth/lava_land_surface
	icon = 'modular_splurt/icons/turf/water.dmi'
	icon_state = "shallow"
	color = "#648363"
	slowdown = 3

