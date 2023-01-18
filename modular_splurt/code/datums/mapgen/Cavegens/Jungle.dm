/datum/map_generator/cave_generator/jungle
	initial_closed_chance = 0
	mob_spawn_chance = 1
	flora_spawn_chance = 20
	birth_limit = 1
	death_limit = 4
	smoothing_iterations = 10
	closed_turf_types = list(/turf/closed/mineral = 1)
	open_turf_types =  list(/turf/open/floor/grass = 100)
	mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 6, /mob/living/simple_animal/hostile/poison/giant_spider = 3, /mob/living/simple_animal/hostile/retaliate/poison/snake = 4)
	flora_spawn_list = list(/obj/structure/flora/tree/jungle = 20, /obj/structure/flora/tree/jungle/small = 12, /obj/structure/flora/rock = 2, /obj/structure/flora/rock/jungle = 2, /obj/structure/flora/rock/pile/largejungle = 2, /obj/structure/flora/rock/pile = 2, /obj/structure/flora/grass/jungle = 6, /obj/structure/flora/grass/jungle/b = 6)

/datum/map_generator/cave_generator/jungle/caves
	initial_closed_chance = 45
	flora_spawn_chance = 4
	birth_limit = 4
	death_limit = 4
	smoothing_iterations = 10
	closed_turf_types = list(/turf/closed/mineral = 1)
	open_turf_types =  list(/turf/open/floor/plating/asteroid = 19)
	flora_spawn_list = list(/obj/structure/flora/rock = 6, /obj/structure/flora/rock/pile = 6, /obj/structure/flora/ash = 1)
	mob_spawn_list = list(/mob/living/simple_animal/hostile/poison/giant_spider = 1)
