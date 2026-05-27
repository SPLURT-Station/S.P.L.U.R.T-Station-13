/datum/map_template/ruin/station/biodome/tau_forest
	name = "Tau Forest"
	id = "tau_forest"
	description = "A peaceful forest environment housing the Tau outpost."
	suffix = "tau_forest.dmm"
	cost = 0

/datum/map_template/ruin/station/biodome/tau_beach
	name = "Tau Beach"
	id = "tau_beach"
	description = "A relaxing beach environment housing the Tau outpost."
	suffix = "tau_beach.dmm"
	cost = 0
// Tau Biome Areas
/area/ruin/space/has_grav/powered/tau_forest
	name = "Tau Forest"
	icon_state = "green"

/area/ruin/space/has_grav/powered/tau_beach
	name = "Tau Beach"
	icon_state = "yellow"

/area/ruin/space/has_grav/powered/tau_forest/outpost
	name = "Tau Forest Outpost"
	icon_state = "blue"

/area/ruin/space/has_grav/powered/tau_beach/outpost
	name = "Tau Beach Outpost"
	icon_state = "blue"
// Turfs for Tau biomes
/turf/open/floor/grass/tau_forest
	name = "forest grass"
	desc = "Lush grass from a forest environment."
	icon = 'modular_splurt/icons/turf/floors.dmi'
	icon_state = "grass_forest"

/turf/open/floor/sand/tau_beach
	name = "beach sand"
	desc = "Fine sand from a beach environment."
	icon = 'modular_splurt/icons/turf/floors.dmi'
	icon_state = "sand_beach"

/turf/open/floor/wood/tau_forest
	name = "weathered wood"
	desc = "Wooden planks weathered by the forest climate."

/turf/open/water/beach/tau_beach
	name = "shallow water"
	desc = "Clear shallow water from the beach."
// Hostile mobs for Tau biomes
/mob/living/simple_animal/hostile/tau
	name = "tau creature"
	desc = "A creature native to the Tau environment."
	icon = 'modular_splurt/icons/mob/tau_mobs.dmi'
	icon_state = "tau_creature"
	icon_living = "tau_creature"
	icon_dead = "tau_creature_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat = 2)
	response_help = "pets"
	response_disarm = "shoves"
	response_harm = "hits"
	maxHealth = 75
	health = 75
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = list("tau")

/mob/living/simple_animal/hostile/tau/forest
	name = "forest stalker"
	desc = "A predatory creature that stalks the forests of Tau."
	icon_state = "forest_stalker"
	icon_living = "forest_stalker"
	icon_dead = "forest_stalker_dead"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "mauls"

/mob/living/simple_animal/hostile/tau/beach
	name = "shore crab"
	desc = "An oversized crab that defends its beach territory."
	icon_state = "shore_crab"
	icon_living = "shore_crab"
	icon_dead = "shore_crab_dead"
	maxHealth = 60
	health = 60
	melee_damage_lower = 8
	melee_damage_upper = 12
	attacktext = "pinches"
	attack_sound = 'sound/weapons/pierce.ogg'
// Tau Biome additions
#include "modular_splurt\code\datums\ruins\tau.dm"
#include "modular_splurt\code\game\area\areas\ruins\stationruins.dm"
#include "modular_splurt\code\game\turfs\simulated\floor\fancy_floor.dm"
#include "modular_splurt\code\modules\mob\living\simple_animal\hostile\tau_mobs.dm"