/obj/item/storage/pill_bottle/belly_inflation
	name = "Super Bubble Pills"
	desc = "Are you ready to become a blimp?"

/obj/item/storage/pill_bottle/belly_inflation/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/reagent_containers/pill/belly_inflation(src)

/obj/item/storage/hypospraykit/enlarge/PopulateContents()
	if(empty)
		return

	new /obj/item/reagent_containers/glass/bottle/vial/small/bellyreduction(src)
	new /obj/item/reagent_containers/glass/bottle/vial/small/bellyreduction(src)
	new /obj/item/reagent_containers/glass/bottle/vial/small/bellyreduction(src)

	. = ..()

/obj/item/storage/firstaid/tactical/slaver
	name = "advanced combat medical kit"

/obj/item/storage/firstaid/tactical/slaver/PopulateContents()
	if(empty)
		return
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/defibrillator/compact/combat/loaded(src)
	new /obj/item/reagent_containers/hypospray/combat/nanites(src)
	new /obj/item/reagent_containers/medspray/styptic(src)
	new /obj/item/reagent_containers/medspray/silver_sulf(src)
	new /obj/item/healthanalyzer/advanced(src)
	new /obj/item/storage/pill_bottle/charcoal(src)
	new /obj/item/clothing/glasses/hud/health/night/syndicate(src)

/obj/item/storage/pill_bottle/happinesspsych
	name = "happiness pill bottle"
	desc = "Contains pills used as a last resort means to temporarily stabilize depression and anxiety. WARNING: side effects may include slurred speech, drooling, and severe addiction."

/obj/item/storage/pill_bottle/happinesspsych/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/happinesspsych(src)

/obj/item/storage/pill_bottle/lsdpsych
	name = "mindbreaker toxin pill bottle"
	desc = "!FOR THERAPEUTIC USE ONLY! Contains pills used to alleviate the symptoms of Reality Dissociation Syndrome."

/obj/item/storage/pill_bottle/lsdpsych/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/lsdpsych(src)

/obj/item/storage/pill_bottle/paxpsych
	name = "pacification pill"
	desc = "Contains pills used to temporarily pacify patients that are deemed a harm to themselves or others."

/obj/item/storage/pill_bottle/paxpsych/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/paxpsych(src)
