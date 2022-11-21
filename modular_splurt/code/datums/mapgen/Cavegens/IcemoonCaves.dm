/datum/map_generator/cave_generator/icemoon/snaxi
	flora_spawn_chance = 4
	mob_spawn_list = null
	initial_closed_chance = 53
	birth_limit = 5
	death_limit = 4
	smoothing_iterations = 10
	open_turf_types =  list(/turf/open/floor/plating/asteroid/snow/icemoon/snaxi = 19, /turf/open/floor/plating/ice/colder = 1)
	closed_turf_types =  list(/turf/closed/mineral/random/snow/snaxi = 1)


	mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 50, /obj/structure/spawner/ice_moon = 3, \
						  /mob/living/simple_animal/hostile/asteroid/polarbear = 30, /obj/structure/spawner/ice_moon/polarbear = 3, \
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50, /mob/living/simple_animal/hostile/asteroid/goldgrub = 10, \
						  /mob/living/simple_animal/hostile/asteroid/lobstrosity = 15, /obj/structure/spawner/lavaland/shamblingminer = 2)
	flora_spawn_list = list(/obj/structure/flora/tree/pine = 2, /obj/structure/flora/rock/icy = 2, /obj/structure/flora/rock/pile/icy = 2, /obj/structure/flora/grass/both = 6, /obj/structure/flora/ash = 2)
	feature_spawn_list = list(/obj/structure/geyser/random = 1)

/datum/map_generator/cave_generator/icemoon/snaxi/deep
	initial_closed_chance = 53
	flora_spawn_chance = 4
	birth_limit = 5
	death_limit = 4
	smoothing_iterations = 10
	closed_turf_types = list(/turf/closed/mineral/random/snow/snaxi/underground = 1)
	open_turf_types =  list(/turf/open/floor/plating/asteroid/snow/icemoon/snaxi = 19, /turf/open/floor/plating/ice/colder = 1)
	mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/ice_demon = 50, /obj/structure/spawner/ice_moon/demonic_portal = 3, \
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 30, /obj/structure/spawner/ice_moon/demonic_portal/ice_whelp = 3, \
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50, /obj/structure/spawner/ice_moon/demonic_portal/snowlegion = 3, \
						  SPAWN_MEGAFAUNA = 2, /obj/structure/spawner/lavaland/shamblingminer = 2)
	megafauna_spawn_list = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1)
	flora_spawn_list = list(/obj/structure/flora/rock/icy = 6, /obj/structure/flora/rock/pile/icy = 6, /obj/structure/flora/ash = 1)
