/obj/item/hierophant_club/coolbird
	icon = 'modular_splurt/icons/obj/hierobird/hierophant_bird_club.dmi'
	desc = "The strange technology of this large club allows various nigh-magical feats. Smells of Bymoridth; comes from a cool bird."
	lefthand_file = 'modular_splurt/icons/obj/hierobird/hierophant_bird_club_inhand_left.dmi'
	righthand_file = 'modular_splurt/icons/obj/hierobird/hierophant_bird_club_inhand_right.dmi'

/turf/closed/indestructible/riveted/hierophant/coolbird
	icon = 'modular_splurt/icons/obj/hierobird/hierophant_bird_walls.dmi'

/turf/open/indestructible/hierophant/coolbird
	icon = 'modular_splurt/icons/obj/hierobird/hierophant_bird_floors.dmi'
	baseturfs = /turf/open/indestructible/hierophant/coolbird

/turf/open/indestructible/hierophant/coolbird/two

/mob/living/simple_animal/hostile/megafauna/hierophant/coolbird
	icon = 'modular_splurt/icons/obj/hierobird/hierophant_bird.dmi'
	name = "Hierophant"
	desc = "A penguin-like entity, he's holding what appears to be a scepter of some sort..."

/obj/item/hierophant_club/coolbird/ui_action_click(mob/user, action)
	..()
	if (beacon)
		beacon.icon = 'modular_splurt/icons/obj/hierobird/hierophant_bird_club.dmi'

/*
/datum/map_template/ruin/lavaland/hierophantbird
	name = "Hierophant Bird's Arena"
	id = "birdophant"
	description = "A strange, square chunk of gold of massive size. Inside awaits only death and many, many squares."
	prefix = "modular_splurt/_maps/RandomRuins/LavaRuins"
	suffix = "lavaland_surface_hierophant_birdie.dmm"
	allow_duplicates = FALSE
	placement_weight = 1

/datum/map_template/ruin/lavaland/hierophant
	always_place = TRUE
	never_spawn_with = list(/datum/map_template/ruin/lavaland/hierophantbird)
*/
