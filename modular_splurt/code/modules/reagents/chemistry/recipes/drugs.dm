/datum/chemical_reaction/maint_tar1
	results = list(/datum/reagent/toxin/acid = 1 ,/datum/reagent/drug/maint/tar = 3)
	required_reagents = list(/datum/reagent/consumable/tea = 1, /datum/reagent/phenol = 1 , /datum/reagent/fuel = 1)

/datum/chemical_reaction/maint_tar2
	results = list(/datum/reagent/toxin/acid = 1 ,/datum/reagent/drug/maint/tar = 3)
	required_reagents = list(/datum/reagent/consumable/tea = 1, /datum/reagent/consumable/enzyme = 3 , /datum/reagent/fuel = 1)

/datum/chemical_reaction/copium
	results = list(/datum/reagent/drug/copium = 2)
	required_reagents = list(/datum/reagent/drug/anaphrodisiac = 1, /datum/reagent/drug/aphrodisiac = 1)

// SKYRAT PORT

/datum/chemical_reaction/powder_cocaine
	is_cold_recipe = TRUE
	required_reagents = list(/datum/reagent/drug/cocaine = 10)
	required_temp = 250 //freeze it
	mix_message = "The solution freezes into a powder!"
	id = /datum/reagent/drug/cocaine

/datum/chemical_reaction/powder_cocaine/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/reagent_containers/cocaine(location)

/datum/chemical_reaction/freebase_cocaine
	required_reagents = list(/datum/reagent/drug/cocaine = 10, /datum/reagent/water = 5, /datum/reagent/ash = 10) //mix 20 cocaine, 10 water, 20 ash
	required_temp = 480 //heat it up
	id = /datum/reagent/drug/cocaine/freebase_cocaine

/datum/chemical_reaction/freebase_cocaine/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/reagent_containers/crack(location)

/datum/reagent/drug/cocaine
	name = "Cocaine"
	description = "A powerful stimulant extracted from coca leaves. Reduces stun times, but causes drowsiness and severe brain damage if overdosed."
	reagent_state = LIQUID
	color = "#ffffff"
	overdose_threshold = 20
	pH = 9
	taste_description = "bitterness" //supposedly does taste bitter in real life

/datum/reagent/drug/cocaine/on_mob_metabolize(mob/living/containing_mob)
	..()
	containing_mob.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)

/datum/reagent/drug/cocaine/on_mob_end_metabolize(mob/living/containing_mob)
	containing_mob.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	..()

/datum/reagent/drug/cocaine/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(DT_PROB(2.5, delta_time))
		var/high_message = pick("You feel jittery.", "You feel like you gotta go fast.", "You feel like you need to step it up.")
		to_chat(M, span_notice("[high_message]"))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "zoinked", /datum/mood_event/high, name)
	M.AdjustStun(-15 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustKnockdown(-15 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustUnconscious(-15 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustImmobilized(-15 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustParalyzed(-15 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.adjustStaminaLoss(-2 * REAGENTS_EFFECT_MULTIPLIER * delta_time, 0)
	if(DT_PROB(2.5, delta_time))
		M.emote("shiver")
	..()
	. = TRUE

/datum/reagent/drug/cocaine/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("Your heart beats is beating so fast, it hurts..."))

/datum/reagent/drug/cocaine/overdose_process(mob/living/M, delta_time, times_fired)
	M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, (rand(10, 20) / 10) * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.Jitter(2 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	if(DT_PROB(2.5, delta_time))
		M.emote(pick("twitch","drool"))
	. = TRUE

/datum/reagent/drug/cocaine/freebase_cocaine
	name = "freebase cocaine"
	description = "A smokable form of cocaine."
	color = "#f0e6bb"
	value = REAGENT_VALUE_VERY_COMMON

/datum/reagent/drug/cocaine/powder_cocaine
	name = "powder cocaine"
	description = "The powder form of cocaine."
	color = "#ffffff"
	value = REAGENT_VALUE_VERY_COMMON

/obj/item/reagent_containers/crack
	name = "crack"
	desc = "A rock of freebase cocaine, otherwise known as crack."
	icon = 'modular_splurt/icons/obj/crack.dmi'
	icon_state = "crack"
	volume = 10
	possible_transfer_amounts = list()
	list_reagents = list(/datum/reagent/drug/cocaine/freebase_cocaine = 10)

/obj/item/reagent_containers/crackbrick
	name = "crack brick"
	desc = "A brick of crack cocaine."
	icon =	'modular_splurt/icons/obj/crack.dmi'
	icon_state = "crackbrick"
	volume = 40
	possible_transfer_amounts = list()
	list_reagents = list(/datum/reagent/drug/cocaine/freebase_cocaine = 40)

/obj/item/reagent_containers/crackbrick/attackby(obj/item/W, mob/user, params)
	if(W.get_sharpness())
		user.show_message(span_notice("You cut \the [src] into some rocks."), MSG_VISUAL)
		for(var/i = 1 to 4)
			new /obj/item/reagent_containers/crack(user.loc)
		qdel(src)

/datum/crafting_recipe/crackbrick
	name = "Crack brick"
	result = /obj/item/reagent_containers/crackbrick
	reqs = list(/obj/item/reagent_containers/crack = 4)
	parts = list(/obj/item/reagent_containers/crack = 4)
	time = 20
	category = CAT_MISCELLANEOUS //i might just make a crafting category for drugs at some point

// Should probably give this the edible component at some point
/obj/item/reagent_containers/cocaine
	name = "cocaine"
	desc = "Reenact your favorite scenes from Scarface!"
	icon = 'modular_splurt/icons/obj/crack.dmi'
	icon_state = "cocaine"
	volume = 5
	possible_transfer_amounts = list()
	list_reagents = list(/datum/reagent/drug/cocaine = 5)

/obj/item/reagent_containers/cocaine/proc/snort(mob/living/user)
	if(!iscarbon(user))
		return
	var/covered = ""
	if(user.is_mouth_covered(head_only = 1))
		covered = "headgear"
	else if(user.is_mouth_covered(mask_only = 1))
		covered = "mask"
	if(covered)
		to_chat(user, span_warning("You have to remove your [covered] first!"))
		return
	user.visible_message(span_notice("'[user] starts snorting the [src]."))
	if(do_after(user, 30))
		to_chat(user, span_notice("You finish snorting the [src]."))
		if(reagents.total_volume)
			reagents.trans_to(user, reagents.total_volume, INGEST)
		qdel(src)

/obj/item/reagent_containers/cocaine/attack(mob/target, mob/user)
	if(target == user)
		snort(user)

/obj/item/reagent_containers/cocainebrick
	name = "cocaine brick"
	desc = "A brick of cocaine. Good for transport!"
	icon = 'modular_splurt/icons/obj/crack.dmi'
	icon_state = "cocainebrick"
	volume = 25
	possible_transfer_amounts = list()
	list_reagents = list(/datum/reagent/drug/cocaine = 25)


/obj/item/reagent_containers/cocainebrick/attack_self(mob/user)
	user.visible_message(span_notice("[user] starts breaking up the [src]."))
	if(do_after(user,10))
		to_chat(user, span_notice("You finish breaking up the [src]."))
		for(var/i = 1 to 5)
			new /obj/item/reagent_containers/cocaine(user.loc)
		qdel(src)

/datum/crafting_recipe/cocainebrick
	name = "Cocaine brick"
	result = /obj/item/reagent_containers/cocainebrick
	reqs = list(/obj/item/reagent_containers/cocaine = 5)
	tools = null
	time = 20
	category = CAT_MISCELLANEOUS //i might just make a crafting category for drugs at some point
	subcategory = CATEGORY_MISC

//if you want money, convert it into crackbricks
/datum/export/crack
	cost = CARGO_CRATE_VALUE * 0.5
	unit_name = "crack"
	export_types = list(/obj/item/reagent_containers/crack)
	include_subtypes = FALSE

/datum/export/crack/crackbrick
	cost = CARGO_CRATE_VALUE * 2.5
	unit_name = "crack brick"
	export_types = list(/obj/item/reagent_containers/crackbrick)
	include_subtypes = FALSE

/datum/export/cocaine
	cost = CARGO_CRATE_VALUE * 0.4
	unit_name = "cocaine"
	export_types = list(/obj/item/reagent_containers/cocaine)
	include_subtypes = FALSE

/datum/export/cocainebrick
	cost = CARGO_CRATE_VALUE * 2
	unit_name = "cocaine brick"
	export_types = list(/obj/item/reagent_containers/cocainebrick)
	include_subtypes = FALSE

/obj/item/seeds/cocaleaf
	name = "pack of coca leaf seeds"
	desc = "These seeds grow into coca shrubs. They make you feel energized just looking at them..."
	icon = 'modular_splurt/icons/obj/crack.dmi'
	growing_icon = 'modular_splurt/icons/obj/crack.dmi'
	icon_state = "seed-cocoleaf"
	species = "cocoleaf"
	plantname = "Coca Leaves"
	maturation = 8
	potency = 20
	growthstages = 1
	product = /obj/item/reagent_containers/food/snacks/grown/cocaleaf
	mutatelist = list()
	reagents_add = list(/datum/reagent/drug/cocaine = 0.3, /datum/reagent/consumable/nutriment = 0.15)

/obj/item/reagent_containers/food/snacks/grown/cocaleaf
	seed = /obj/item/seeds/cocaleaf
	name = "coca leaf"
	desc = "A leaf of the coca shrub, which contains a potent psychoactive alkaloid known as 'cocaine'."
	icon =	'modular_splurt/icons/obj/crack.dmi'
	icon_state = "cocoleaf"
	foodtype = FRUIT //i guess? i mean it grows on trees...
	tastes = list("leaves" = 1)
	grind_results = list(/datum/reagent/drug/cocaine)
	wine_power = 50
