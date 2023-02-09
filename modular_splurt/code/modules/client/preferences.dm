/datum/preferences
	max_save_slots = DEFAULT_SAVE_SLOTS
	var/unholypref = "No" //Goin 2 hell fo dis one
	var/list/gfluid_blacklist = list() //Stuff you don't want people to cum into you

/datum/preferences/New(client/C)
	if(!GLOB.genital_fluids_list)
		build_genital_fluids_list() //I DON'T KNOW where else to put it, ok??

	//Extra saves for donators
	max_save_slots = CONFIG_GET(number/base_save_slots)
	if(istype(C))
		var/extra_slots = (IS_CKEY_DONATOR_GROUP(C.key, DONATOR_GROUP_TIER_1) + IS_CKEY_DONATOR_GROUP(C.key, DONATOR_GROUP_TIER_2) + IS_CKEY_DONATOR_GROUP(C.key, DONATOR_GROUP_TIER_3)) * 10
		max_save_slots += extra_slots

	. = ..()

/proc/build_genital_fluids_list()

	var/list/blacklisted = list( //Nonos
		//Ethanol
		/datum/reagent/consumable/ethanol,
		/datum/reagent/consumable/ethanol/thirteenloko,
		/datum/reagent/consumable/ethanol/threemileisland,
		/datum/reagent/consumable/ethanol/absinthe,
		/datum/reagent/consumable/ethanol/hooch,
		/datum/reagent/consumable/ethanol/cuba_libre,
		/datum/reagent/consumable/ethanol/screwdrivercocktail,
		/datum/reagent/consumable/ethanol/bloody_mary,
		/datum/reagent/consumable/ethanol/brave_bull,
		/datum/reagent/consumable/ethanol/tequila_sunrise,
		/datum/reagent/consumable/ethanol/toxins_special,
		/datum/reagent/consumable/ethanol/beepsky_smash,
		/datum/reagent/consumable/ethanol/manly_dorf,
		/datum/reagent/consumable/ethanol/manhattan_proj,
		/datum/reagent/consumable/ethanol/antifreeze,
		/datum/reagent/consumable/ethanol/barefoot,
		/datum/reagent/consumable/ethanol/barefoot,
		/datum/reagent/consumable/ethanol/sbiten,
		/datum/reagent/consumable/ethanol/iced_beer,
		/datum/reagent/consumable/ethanol/changelingsting,
		/datum/reagent/consumable/ethanol/syndicatebomb,
		/datum/reagent/consumable/ethanol/bananahonk,
		/datum/reagent/consumable/ethanol/silencer,
		/datum/reagent/consumable/ethanol/fetching_fizz,
		/datum/reagent/consumable/ethanol/hearty_punch,
		/datum/reagent/consumable/ethanol/atomicbomb,
		/datum/reagent/consumable/ethanol/gargle_blaster,
		/datum/reagent/consumable/ethanol/neurotoxin,
		/datum/reagent/consumable/ethanol/neuroweak,
		/datum/reagent/consumable/ethanol/hippies_delight,
		/datum/reagent/consumable/ethanol/narsour,
		/datum/reagent/consumable/ethanol/cogchamp,
		/datum/reagent/consumable/ethanol/pinotmort,
		/datum/reagent/consumable/ethanol/quadruple_sec,
		/datum/reagent/consumable/ethanol/quintuple_sec,
		/datum/reagent/consumable/ethanol/bastion_bourbon,
		/datum/reagent/consumable/ethanol/squirt_cider,
		/datum/reagent/consumable/ethanol/sugar_rush,
		/datum/reagent/consumable/ethanol/crevice_spike,
		/datum/reagent/consumable/ethanol/peppermint_patty,
		/datum/reagent/consumable/ethanol/alexander,
		/datum/reagent/consumable/ethanol/between_the_sheets,
		/datum/reagent/consumable/ethanol/fernet,
		/datum/reagent/consumable/ethanol/fernet_cola,
		/datum/reagent/consumable/ethanol/fanciulli,
		/datum/reagent/consumable/ethanol/branca_menta,
		/datum/reagent/consumable/ethanol/blank_paper,
		/datum/reagent/consumable/ethanol/wizz_fizz,
		/datum/reagent/consumable/ethanol/bug_spray,
		/datum/reagent/consumable/ethanol/turbo,
		/datum/reagent/consumable/ethanol/old_timer,
		/datum/reagent/consumable/ethanol/trappist,
		/datum/reagent/consumable/ethanol/blazaam,
		/datum/reagent/consumable/ethanol/mauna_loa,
		/datum/reagent/consumable/ethanol/commander_and_chief,
		/datum/reagent/consumable/ethanol/hellfire,
		//Drink reagents
		/datum/reagent/consumable/laughter,
		/datum/reagent/consumable/superlaughter,
		/datum/reagent/consumable/soymilk, //No soy shall come from any titty
		/datum/reagent/consumable/soy_latte,
		//Normal reagents
		/datum/reagent/consumable/capsaicin,
		/datum/reagent/consumable/frostoil,
		/datum/reagent/consumable/condensedcapsaicin,
		/datum/reagent/consumable/garlic,
		/datum/reagent/consumable/sprinkles,
		/datum/reagent/consumable/enzyme,
		/datum/reagent/consumable/hot_ramen,
		/datum/reagent/consumable/hell_ramen,
		/datum/reagent/consumable/tearjuice,
		/datum/reagent/consumable/entpoly,
		/datum/reagent/consumable/vitfro,
		/datum/reagent/consumable/liquidelectricity,
		/datum/reagent/consumable/char,
		/datum/reagent/consumable/laughsyrup,
		/datum/reagent/consumable/honey, //zad
	)

	GLOB.genital_fluids_list = list()

	var/list/paths = subtypesof(/datum/reagent/consumable)
	LAZYADD(paths, list(
		/datum/reagent/water,
		/datum/reagent/drug/aphrodisiac,
		/datum/reagent/drug/copium,
		/datum/reagent/blood
	))

	for(var/path in paths)
		var/datum/reagent/instance = find_reagent_object_from_type(path)

		if(!instance)
			continue
		if(path in blacklisted)
			continue
		if(istype(instance, /datum/reagent/consumable/ethanol))
			var/datum/reagent/consumable/ethanol/drink = instance
			if(drink.boozepwr > 80)
				continue
		if(instance.reagent_state != LIQUID)
			continue

		LAZYADD(GLOB.genital_fluids_list, instance)

/proc/allowed_gfluid_paths()
	if(!GLOB.genital_fluids_list)
		build_genital_fluids_list()

	var/list/allowed
	for(var/datum/reagent/fluid in GLOB.genital_fluids_list)
		LAZYADD(allowed, fluid.type)

	return allowed
