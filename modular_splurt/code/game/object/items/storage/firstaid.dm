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
