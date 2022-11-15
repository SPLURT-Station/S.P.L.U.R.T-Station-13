/turf/open/chasm/cloud
	name = "clouds"
	gender = PLURAL
	desc = "Clouds as far as the eye can see... Watch your step."
	icon = 'modular_splurt/icons/turf/space.dmi'
	icon_state = "clouds"
	plane = PLANE_SPACE
	tiled_dirt = FALSE
	baseturfs = /turf/open/chasm/cloud
	smooth = SMOOTH_FALSE
	planetary_atmos = TRUE
	initial_gas_mix = FROZEN_ATMOS
	density = FALSE

/turf/open/chasm/cloud/Initialize()
	. = ..()
	icon_state = SPACE_ICON_STATE

/turf/open/chasm/cloud/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/turf/space.dmi'
	underlay_appearance.icon_state = SPACE_ICON_STATE
	underlay_appearance.plane = PLANE_SPACE
	return TRUE

/turf/open/chasm/icemoon/snaxi
	initial_gas_mix = FROZEN_ATMOS