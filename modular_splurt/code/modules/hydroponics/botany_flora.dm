//Lavaland-like structural flora EXCEPT it bases off a seed and simulates most of the genes and more
/obj/structure/flora/botany
	gender = PLURAL
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER //sporangiums up don't shoot
	icon = 'icons/obj/lavaland/ash_flora.dmi'
	icon_state = "l_mushroom"
	name = "large mushrooms"
	desc = "A number of large mushrooms, covered in a faint layer of ash and what can only be spores."
	var/harvested_name = "shortened mushrooms"
	var/harvested_desc = "Some quickly regrowing mushrooms, formerly known to be quite large."
	var/needs_sharp_harvest = FALSE
	var/harvest_amount_low = 1
	var/harvest_amount_high = 3
	var/harvest_time = 60
	var/harvest_message_low = "You pick a mushroom, but fail to collect many shavings from its cap."
	var/harvest_message_med = "You pick a mushroom, carefully collecting the shavings from its cap."
	var/harvest_message_high = "You harvest and collect shavings from several mushroom caps."
	var/harvested = TRUE
	var/base_icon
	var/regrowth_time_low = 8 MINUTES
	var/regrowth_time_high = 16 MINUTES

	//Those exist for coloring overlays and other stuff
	var/biolumi_color
	var/reagent_color

	//If this is on, the structure will light up depending on harvest and biolumi traits
	var/inherits_biolumi = TRUE

	//Produce will drop if someone walks over it
	var/low_hanging = FALSE

	var/obj/item/seeds/myseed
	var/seedtype = /obj/item/seeds/lavaland/polypore

	var/agitate_cooldown = 1200 //60 seconds
	var/can_agitate = FALSE
	var/agitate_range = 0
	var/next_agitate = 0
	var/agitate_sensitivity = 30 //up to 100, in percentages

/obj/structure/flora/botany/Initialize()
	. = ..()
	myseed = new seedtype
	init_seed()

	reagent_color = mix_color_from_reagents_hashtable(myseed.reagents_add)

	base_icon = "[icon_state][rand(1, 4)]"
	//icon_state = base_icon

	if(can_agitate)
		proximity_monitor = new(src, 0)
		proximity_monitor.SetHost(src,src)
		proximity_monitor.SetRange(agitate_range)

	regrow(FALSE)

/obj/structure/flora/botany/proc/handle_biolumi()
	if(inherits_biolumi)
		if(harvested)
			light_range = initial(light_range)
			light_power = initial(light_power)
			light_color = initial(light_color)
		else
			for(var/datum/plant_gene/trait/glow/T in myseed.genes)
				biolumi_color = T.glow_color
				light_color = T.glow_color
				light_range = T.glow_range(myseed)
				light_power = T.glow_power(myseed)
				continue
	else
		light_range = initial(light_range)
		light_power = initial(light_power)
		light_color = initial(light_color)

	update_light()

/obj/structure/flora/botany/proc/init_seed()
	return

/obj/structure/flora/botany/proc/post_harvest()
	icon_state = "[base_icon]p"
	name = harvested_name
	desc = harvested_desc
	harvested = TRUE
	/*
	if(can_agitate)
		proximity_monitor.SetRange(0)
	*/

	handle_biolumi()
	addtimer(CALLBACK(src, PROC_REF(regrow)), rand(regrowth_time_low, regrowth_time_high))

/obj/structure/flora/botany/proc/drop_produce(user)
	var/obj/item/reagent_containers/food/snacks/grown/G = myseed.spawn_product(get_turf(src))
	for(var/datum/plant_gene/trait/T in myseed.genes)
		T.on_flora_harvest(src, user)

	G.audible_message("<span class='notice'>[G] drops down to the ground.</span>")
	post_harvest()

/obj/structure/flora/botany/proc/harvest(user)
	if(harvested)
		return 0

	var/rand_harvested = rand(harvest_amount_low, harvest_amount_high)
	if(rand_harvested)
		if(user)
			var/msg = harvest_message_med
			if(rand_harvested == harvest_amount_low)
				msg = harvest_message_low
			else if(rand_harvested == harvest_amount_high)
				msg = harvest_message_high
			to_chat(user, "<span class='notice'>[msg]</span>")
		for(var/i in 1 to rand_harvested)
			myseed.spawn_product(get_turf(src))

	for(var/datum/plant_gene/trait/T in myseed.genes)
		T.on_flora_harvest(src, user)

	post_harvest()

	return 1

/obj/structure/flora/botany/proc/regrow(proc = TRUE)
	icon_state = base_icon
	name = initial(name)
	desc = initial(desc)
	harvested = FALSE

	handle_biolumi()
	if(proc)
		for(var/datum/plant_gene/trait/T in myseed.genes)
			T.on_flora_grow(src)

	/*
	if(can_agitate && agitate_range)
		proximity_monitor.SetRange(agitate_range)
	*/

/obj/structure/flora/botany/attackby(obj/item/W, mob/user, params)
	if(!harvested && needs_sharp_harvest && W.sharpness)
		user.visible_message("<span class='notice'>[user] starts to harvest from [src] with [W].</span>","<span class='notice'>You begin to harvest from [src] with [W].</span>")
		if(do_after(user, harvest_time, target = src))
			harvest(user)
	else
		sense(user)
		return ..()

/obj/structure/flora/botany/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!harvested && !needs_sharp_harvest)
		user.visible_message("<span class='notice'>[user] starts to harvest from [src].</span>","<span class='notice'>You begin to harvest from [src].</span>")
		if(do_after(user, harvest_time, target = src))
			harvest(user)

/obj/structure/flora/botany/HasProximity(atom/movable/AM as mob|obj)
	if (ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(H.stat == CONSCIOUS)
			if(prob(agitate_sensitivity))
				sense(H)

/obj/structure/flora/botany/proc/sense(mob/M)
	if(next_agitate > world.time || harvested)
		return

	do_agitate(M)
	next_agitate = world.time + agitate_cooldown

/obj/structure/flora/botany/proc/do_agitate(mob/target)
	for(var/datum/plant_gene/trait/T in myseed.genes)
		T.on_flora_agitated(src, target)

/obj/structure/flora/botany/Cross(atom/movable/O)
	. = ..()
	if(. && !harvested && low_hanging)
		if(ishuman(O))
			var/mob/living/carbon/human/H = O
			drop_produce(H)

/*
/obj/structure/flora/botany/test_stuff
	can_agitate = TRUE
	agitate_range = 2
	seedtype = /obj/item/seeds/test
	low_hanging = TRUE
	regrowth_time_low = 1 MINUTES
	regrowth_time_high = 2 MINUTES
/obj/structure/flora/botany/test_stuff/init_seed()
	var/datum/plant_gene/trait/glow/amber/T = new
	myseed.genes += T
*/


