/turf/open/floor/plating/asteroid/layenia
	gender = MALE //fuck you, you're a massive noonot
	name = "crimson Rock"
	desc = "A cold rock, rusted scarlet in color."
	icon = 'modular_splurt/icons/turf/floors.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/layenia
	icon_state = "layenia"
	icon_plating = "layenia"
	initial_gas_mix = FROZEN_ATMOS
	slowdown = 1
	environment_type = "layenia"
	flags_1 = NONE
	heat_capacity = INFINITY //Makes it so no matter the heat, it will not burn out.
	planetary_atmos = TRUE
	burnt_states = null
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	digResult = /obj/item/stack/ore/glass/basalt
	floor_variance = 50 //This means 50% chance of variating from the default tile.
	//light_range = 2
	//light_power = 0.15
	//light_color = LIGHT_COLOR_WHITE

/turf/open/floor/plating/asteroid/layenia/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	if(prob(floor_variance))
		icon_state = "[environment_type][rand(0,4)]"
	set_layenia_light(src)

/turf/open/floor/plating/asteroid/layenia/garden
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE

/proc/set_layenia_light(turf/open/floor/B)
	switch(B.icon_state)
		if("layenia3", "layenia4")
			B.set_light(2, 0.6, LIGHT_COLOR_BLUE) //more light

/turf/open/floor/plating/asteroid/snow/ice/icemoon/snaxi
	name = "iced snow"
	initial_gas_mix = FROZEN_ATMOS

/turf/open/lava/plasma/ice_moon/snaxi
	name = "liquid plasma"
	initial_gas_mix = FROZEN_ATMOS

/turf/open/floor/plating/asteroid/snow/icemoon/snaxi
	name = "snow"
	initial_gas_mix = FROZEN_ATMOS

